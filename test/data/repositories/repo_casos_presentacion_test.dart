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
  var reloj = DateTime.utc(2026, 7, 23, 12);

  setUp(() async {
    db = BaseDatos(NativeDatabase.memory());
    reloj = DateTime.utc(2026, 7, 23, 12);
    final cola = ColaSync(db, const ClienteRemotoNulo(), ahora: () => reloj);
    repo = RepoCasos(db, cola, ahora: () => reloj);
    await db
        .into(db.neighborhoods)
        .insert(
          NeighborhoodsCompanion.insert(
            id: 'b1',
            cityId: 'AR-C-CABA',
            name: 'Prueba',
            nameNormalized: 'prueba',
            polygon: '[[0,0],[0,1],[1,1],[1,0]]',
            centroidLat: 0.5,
            centroidLng: 0.5,
            areaKm2: 1,
            status: NeighborhoodStatus.activo,
            createdAt: reloj,
            clientUuid: 'b1',
            updatedAt: reloj,
          ),
        );
  });

  tearDown(() async => db.close());

  Future<String> crear() async {
    final r = await repo.crearCaso(
      neighborhoodId: 'b1',
      categoryId: 'alumbrado',
      subtypeId: 'luminaria_apagada',
      guidedAnswers: {},
      lat: 0.5,
      lng: 0.5,
      createdBy: 'u1',
    );
    return r.valueOrNull!.id;
  }

  test('presentar arranca el reloj legal y registra la acción', () async {
    final id = await crear();
    final r = await repo.presentar(
      caseId: id,
      jurisdictionId: 'AR-C-CABA',
      organismId: 'demo',
      responseDays: 30,
      generatedBody: 'escrito final',
    );
    expect(r.isOk, isTrue);

    final caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    expect(caso.status, CaseStatus.presentado);
    expect(caso.submittedAt!.toUtc(), reloj);
    expect(caso.deadlineAt!.toUtc(), reloj.add(const Duration(days: 30)));
    expect(caso.generatedBody, 'escrito final');

    final acciones = await repo.watchAcciones(id).first;
    expect(acciones.single.type, CaseActionType.presentar);

    final ops = await db.select(db.syncOps).get();
    expect(ops.map((o) => o.entity), contains('case_action'));
  });

  test('marcarVencidos pasa presentado → sinRespuesta al vencer', () async {
    final id = await crear();
    await repo.presentar(
      caseId: id,
      jurisdictionId: 'AR-C-CABA',
      organismId: 'demo',
      responseDays: 30,
      generatedBody: '',
    );

    // A los 29 días no pasa nada.
    reloj = reloj.add(const Duration(days: 29));
    expect(await repo.marcarVencidos(), 0);

    // A los 31, vence.
    reloj = reloj.add(const Duration(days: 2));
    expect(await repo.marcarVencidos(), 1);
    final caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    expect(caso.status, CaseStatus.sinRespuesta);
  });

  test('reiterar renueva el plazo y vuelve a presentado', () async {
    final id = await crear();
    await repo.presentar(
      caseId: id,
      jurisdictionId: 'AR-C-CABA',
      organismId: 'demo',
      responseDays: 30,
      generatedBody: '',
    );
    reloj = reloj.add(const Duration(days: 31));
    await repo.marcarVencidos();

    final r = await repo.escalar(caseId: id, tipo: CaseActionType.reiterar);
    expect(r.isOk, isTrue);

    final caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    expect(caso.status, CaseStatus.presentado);
    expect(caso.deadlineAt!.toUtc(), reloj.add(const Duration(days: 15)));
  });

  test('resolución: reclamo + 2 confirmaciones de OTROS vecinos', () async {
    final id = await crear();

    final reclamo = await repo.reclamarResuelto(caseId: id, userId: 'u1');
    expect(reclamo.isOk, isTrue);
    var caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    expect(caso.status, CaseStatus.enEjecucion);

    // El que reclamó no puede confirmar.
    final propia = await repo.confirmarResuelto(caseId: id, userId: 'u1');
    expect(propia.isOk, isFalse);

    // Primer vecino confirma: todavía en ejecución.
    expect(
      (await repo.confirmarResuelto(caseId: id, userId: 'u2')).isOk,
      isTrue,
    );
    caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    expect(caso.status, CaseStatus.enEjecucion);

    // El mismo vecino no confirma dos veces.
    expect(
      (await repo.confirmarResuelto(caseId: id, userId: 'u2')).isOk,
      isFalse,
    );

    // Segundo vecino: RESUELTO, con fecha (la recompensa del producto).
    expect(
      (await repo.confirmarResuelto(caseId: id, userId: 'u3')).isOk,
      isTrue,
    );
    caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    expect(caso.status, CaseStatus.resuelto);
    expect(caso.resolvedAt, isNotNull);
  });

  test('no se puede reclamar resuelto dos veces', () async {
    final id = await crear();
    await repo.reclamarResuelto(caseId: id, userId: 'u1');
    final segundo = await repo.reclamarResuelto(caseId: id, userId: 'u2');
    expect(segundo.isOk, isFalse);
  });

  test(
    'archivarSinAdhesiones archiva casos abiertos sin firmas a 7 días',
    () async {
      final id = await crear();
      // Todavía es de hoy: no se archiva.
      expect(await repo.archivarSinAdhesiones(), 0);

      // Ocho días después, sin adhesiones: se archiva.
      reloj = reloj.add(const Duration(days: 8));
      expect(await repo.archivarSinAdhesiones(), 1);
      final caso = await (db.select(
        db.cases,
      )..where((t) => t.id.equals(id))).getSingle();
      expect(caso.status, CaseStatus.archivado);
    },
  );

  test('un caso con adhesión no se archiva aunque pasen 7 días', () async {
    final id = await crear();
    await repo.adherir(caseId: id, userId: 'u2', esResidente: true);
    reloj = reloj.add(const Duration(days: 10));
    expect(await repo.archivarSinAdhesiones(), 0);
  });

  test('3 disputas de vecinos distintos mandan el caso a revisión', () async {
    final id = await crear();
    expect(
      (await repo.disputar(
        caseId: id,
        userId: 'u1',
        motivo: DisputeReason.yaResuelto,
      )).isOk,
      isTrue,
    );
    // El mismo no puede disputar dos veces.
    expect(
      (await repo.disputar(
        caseId: id,
        userId: 'u1',
        motivo: DisputeReason.yaResuelto,
      )).isOk,
      isFalse,
    );
    expect(
      (await repo.disputar(
        caseId: id,
        userId: 'u2',
        motivo: DisputeReason.noCorresponde,
      )).isOk,
      isTrue,
    );
    var caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    expect(caso.status, isNot(CaseStatus.enRevision));

    expect(
      (await repo.disputar(
        caseId: id,
        userId: 'u3',
        motivo: DisputeReason.ubicacionIncorrecta,
      )).isOk,
      isTrue,
    );
    caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    expect(caso.status, CaseStatus.enRevision);
    expect(caso.disputeCount, 3);
  });
}
