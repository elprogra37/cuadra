import 'package:cuadra/core/errors/failures.dart';
import 'package:cuadra/core/errors/result.dart';
import 'package:cuadra/data/local/base_datos.dart';
import 'package:cuadra/data/models/enums.dart';
import 'package:cuadra/data/sync/cliente_remoto.dart';
import 'package:cuadra/data/sync/cola_sync.dart';
import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

/// Remoto de prueba: falla o acepta según se configure, y registra lo enviado.
class RemotoFake implements ClienteRemoto {
  bool aceptar = false;
  final enviadas = <OperacionSync>[];

  @override
  Future<Result<void>> enviar(OperacionSync op) async {
    enviadas.add(op);
    return aceptar ? const Ok(null) : const Err(NetworkFailure());
  }
}

void main() {
  group('backoffPara', () {
    test('es exponencial con base 30 s y techo 1 h', () {
      expect(ColaSync.backoffPara(0), const Duration(seconds: 30));
      expect(ColaSync.backoffPara(1), const Duration(minutes: 1));
      expect(ColaSync.backoffPara(2), const Duration(minutes: 2));
      expect(ColaSync.backoffPara(4), const Duration(minutes: 8));
      expect(ColaSync.backoffPara(7), const Duration(hours: 1));
      expect(ColaSync.backoffPara(20), const Duration(hours: 1));
    });
  });

  group('Conflictos (LWW salvo contadores)', () {
    final viejo = DateTime.utc(2026, 7, 1);
    final nuevo = DateTime.utc(2026, 7, 20);

    test('un campo normal más nuevo local gana', () {
      expect(
        Conflictos.gananLocales(
          campo: 'free_text',
          actualizadoLocal: nuevo,
          actualizadoRemoto: viejo,
        ),
        isTrue,
      );
      expect(
        Conflictos.gananLocales(
          campo: 'free_text',
          actualizadoLocal: viejo,
          actualizadoRemoto: nuevo,
        ),
        isFalse,
      );
    });

    test('en contadores la autoridad es SIEMPRE el servidor', () {
      for (final campo in Conflictos.contadores) {
        expect(
          Conflictos.gananLocales(
            campo: campo,
            actualizadoLocal: nuevo,
            actualizadoRemoto: viejo,
          ),
          isFalse,
          reason: campo,
        );
      }
    });
  });

  group('ColaSync contra base en memoria', () {
    late BaseDatos db;
    late RemotoFake remoto;
    late ColaSync cola;
    var reloj = DateTime.utc(2026, 7, 23, 12);

    setUp(() {
      db = BaseDatos(NativeDatabase.memory());
      remoto = RemotoFake();
      reloj = DateTime.utc(2026, 7, 23, 12);
      cola = ColaSync(db, remoto, ahora: () => reloj);
    });

    tearDown(() async => db.close());

    Future<void> insertarCaso(String id) async {
      await db
          .into(db.neighborhoods)
          .insert(
            NeighborhoodsCompanion.insert(
              id: 'b1',
              cityId: 'c1',
              name: 'Prueba',
              nameNormalized: 'prueba',
              polygon: '[[0,0],[0,1],[1,1],[1,0]]',
              centroidLat: 0.5,
              centroidLng: 0.5,
              areaKm2: 1,
              status: NeighborhoodStatus.propuesto,
              createdAt: reloj,
              clientUuid: 'b1',
              updatedAt: reloj,
            ),
            mode: InsertMode.insertOrIgnore,
          );
      await db
          .into(db.cases)
          .insert(
            CasesCompanion.insert(
              id: id,
              neighborhoodId: 'b1',
              categoryId: 'alumbrado',
              subtypeId: 'luminaria_apagada',
              guidedAnswers: '{}',
              status: CaseStatus.abierto,
              lat: 0.5,
              lng: 0.5,
              geohash: 's000000',
              createdAt: reloj,
              clientUuid: id,
              updatedAt: reloj,
            ),
          );
    }

    test(
      'con el remoto caído la operación queda en error con backoff',
      () async {
        await insertarCaso('k1');
        await cola.encolar(
          entity: 'case',
          entityId: 'k1',
          operation: 'crear',
          payload: {'id': 'k1'},
        );

        final exitosas = await cola.procesarPendientes();
        expect(exitosas, 0);

        final op = await db.select(db.syncOps).getSingle();
        expect(op.status, SyncStatus.error);
        expect(op.attempts, 1);
        // Drift devuelve la fecha en hora local: se compara en UTC.
        expect(op.nextAttemptAt.toUtc(), reloj.add(const Duration(minutes: 1)));

        final caso = await (db.select(
          db.cases,
        )..where((t) => t.id.equals('k1'))).getSingle();
        expect(caso.syncStatus, SyncStatus.error);
      },
    );

    test('una operación con backoff no se reintenta antes de tiempo', () async {
      await insertarCaso('k1');
      await cola.encolar(
        entity: 'case',
        entityId: 'k1',
        operation: 'crear',
        payload: {'id': 'k1'},
      );
      await cola.procesarPendientes(); // falla, agenda +1 min

      remoto.enviadas.clear();
      await cola.procesarPendientes(); // demasiado pronto
      expect(remoto.enviadas, isEmpty);

      reloj = reloj.add(const Duration(minutes: 2));
      remoto.aceptar = true;
      final exitosas = await cola.procesarPendientes();
      expect(exitosas, 1);
    });

    test(
      'al sincronizar, la operación se borra y la entidad queda marcada',
      () async {
        await insertarCaso('k1');
        remoto.aceptar = true;
        await cola.encolar(
          entity: 'case',
          entityId: 'k1',
          operation: 'crear',
          payload: {'id': 'k1'},
        );

        final exitosas = await cola.procesarPendientes();
        expect(exitosas, 1);
        expect(await db.select(db.syncOps).get(), isEmpty);

        final caso = await (db.select(
          db.cases,
        )..where((t) => t.id.equals('k1'))).getSingle();
        expect(caso.syncStatus, SyncStatus.sincronizado);
      },
    );

    test(
      'procesa en orden de creación: el caso viaja antes que su adhesión',
      () async {
        await insertarCaso('k1');
        remoto.aceptar = true;
        await cola.encolar(
          entity: 'case',
          entityId: 'k1',
          operation: 'crear',
          payload: {},
        );
        await cola.encolar(
          entity: 'endorsement',
          entityId: 'e1',
          operation: 'crear',
          payload: {},
        );

        await cola.procesarPendientes();
        expect(remoto.enviadas.map((o) => o.entity), ['case', 'endorsement']);
      },
    );

    test('cada operación lleva un client_uuid único (idempotencia)', () async {
      await cola.encolar(
        entity: 'case',
        entityId: 'a',
        operation: 'crear',
        payload: {},
      );
      await cola.encolar(
        entity: 'case',
        entityId: 'b',
        operation: 'crear',
        payload: {},
      );
      final ops = await db.select(db.syncOps).get();
      expect(ops.map((o) => o.clientUuid).toSet().length, 2);
    });
  });
}
