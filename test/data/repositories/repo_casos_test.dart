import 'package:cuadra/data/local/base_datos.dart';
import 'package:cuadra/data/models/enums.dart';
import 'package:cuadra/data/repositories/repo_casos.dart';
import 'package:cuadra/data/sync/cliente_remoto.dart';
import 'package:cuadra/data/sync/cola_sync.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BaseDatos db;
  late RepoCasos repo;
  final reloj = DateTime.utc(2026, 7, 23, 15);

  setUp(() async {
    db = BaseDatos(NativeDatabase.memory());
    final cola = ColaSync(db, const ClienteRemotoNulo(), ahora: () => reloj);
    repo = RepoCasos(db, cola, ahora: () => reloj);
    await db
        .into(db.neighborhoods)
        .insert(
          NeighborhoodsCompanion.insert(
            id: 'b1',
            cityId: 'c1',
            name: 'Villa Crespo',
            nameNormalized: 'villa crespo',
            polygon:
                '[[-34.59,-58.45],[-34.59,-58.43],[-34.61,-58.43],[-34.61,-58.45]]',
            centroidLat: -34.6,
            centroidLng: -58.44,
            areaKm2: 2.5,
            status: NeighborhoodStatus.activo,
            createdAt: reloj,
            clientUuid: 'b1',
            updatedAt: reloj,
          ),
        );
  });

  tearDown(() async => db.close());

  Future<String> crear({
    double lat = -34.6,
    double lng = -58.44,
    String? usuario,
  }) async {
    final r = await repo.crearCaso(
      neighborhoodId: 'b1',
      categoryId: 'alumbrado',
      subtypeId: 'luminaria_apagada',
      guidedAnswers: {'desde_cuando': 'mas_3_meses'},
      lat: lat,
      lng: lng,
      createdBy: usuario ?? 'u1',
    );
    expect(r.isOk, isTrue, reason: r.failureOrNull?.message);
    return r.valueOrNull!.id;
  }

  test(
    'crearCaso deja el caso abierto, con geohash y pendiente de sync',
    () async {
      final id = await crear();
      final caso = await (db.select(
        db.cases,
      )..where((t) => t.id.equals(id))).getSingle();

      expect(caso.status, CaseStatus.abierto);
      expect(caso.geohash.length, 9);
      expect(caso.syncStatus, SyncStatus.pendiente);
      expect(caso.clientUuid, id);

      final ops = await db.select(db.syncOps).get();
      expect(ops.single.entity, 'case');
      expect(ops.single.entityId, id);
    },
  );

  test(
    'rate limit local: el sexto caso del día se rechaza con explicación',
    () async {
      for (var i = 0; i < RepoCasos.maxCasosPorDia; i++) {
        await crear(lat: -34.6 + i * 0.002); // separados: sin dedup
      }
      final r = await repo.crearCaso(
        neighborhoodId: 'b1',
        categoryId: 'alumbrado',
        subtypeId: 'luminaria_apagada',
        guidedAnswers: {},
        lat: -34.59,
        lng: -58.43,
        createdBy: 'u1',
      );
      expect(r.isOk, isFalse);
      expect(r.failureOrNull!.message, contains('5 casos por día'));
    },
  );

  test('similaresCerca detecta duplicado a <80 m, misma categoría', () async {
    await crear();
    // ~40 m al norte.
    final cerca = await repo.similaresCerca(
      lat: -34.60036,
      lng: -58.44,
      categoryId: 'alumbrado',
    );
    expect(cerca, hasLength(1));

    // Otra categoría: no es duplicado.
    final otraCategoria = await repo.similaresCerca(
      lat: -34.60036,
      lng: -58.44,
      categoryId: 'residuos',
    );
    expect(otraCategoria, isEmpty);

    // A ~500 m: no es duplicado.
    final lejos = await repo.similaresCerca(
      lat: -34.6045,
      lng: -58.44,
      categoryId: 'alumbrado',
    );
    expect(lejos, isEmpty);
  });

  test('adherir suma una vez y actualiza el contador optimista', () async {
    final id = await crear();

    final r1 = await repo.adherir(caseId: id, userId: 'u2', esResidente: true);
    expect(r1.isOk, isTrue);

    final r2 = await repo.adherir(caseId: id, userId: 'u2');
    expect(
      r2.isOk,
      isFalse,
      reason: 'la segunda adhesión del mismo usuario se rechaza',
    );

    final caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    expect(caso.endorsementCount, 1);
    expect(caso.verifiedEndorsementCount, 0);
  });

  test(
    'la firma formal de un verificado suma al contador de verificadas',
    () async {
      final id = await crear();
      await repo.adherir(
        caseId: id,
        userId: 'u3',
        esResidente: true,
        firmaFormal: true,
      );

      final caso = await (db.select(
        db.cases,
      )..where((t) => t.id.equals(id))).getSingle();
      expect(caso.verifiedEndorsementCount, 1);
    },
  );

  test('el feed del barrio excluye estados no visibles', () async {
    final id = await crear();
    await crear(lat: -34.605); // segundo caso
    await db.customStatement(
      "UPDATE cases SET status = 'rechazado' WHERE id = ?",
      [id],
    );

    final feed = await repo.watchCasosDeBarrio('b1').first;
    expect(feed, hasLength(1));
    expect(feed.single.status, CaseStatus.abierto);
  });
}
