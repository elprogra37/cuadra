import 'package:cuadra/data/local/base_datos.dart';
import 'package:cuadra/data/models/enums.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BaseDatos db;

  setUp(() {
    db = BaseDatos(NativeDatabase.memory());
  });

  tearDown(() async => db.close());

  test('el esquema v1 se crea y acepta un caso completo', () async {
    await db
        .into(db.neighborhoods)
        .insert(
          NeighborhoodsCompanion.insert(
            id: 'b1',
            cityId: 'c1',
            name: 'Villa Crespo',
            nameNormalized: 'villa crespo',
            polygon:
                '[[-34.59,-58.44],[-34.60,-58.43],[-34.61,-58.45],[-34.60,-58.46]]',
            centroidLat: -34.599,
            centroidLng: -58.44,
            areaKm2: 2.4,
            status: NeighborhoodStatus.propuesto,
            createdAt: DateTime.utc(2026, 7, 23),
            clientUuid: 'uuid-b1',
            updatedAt: DateTime.utc(2026, 7, 23),
          ),
        );

    await db
        .into(db.cases)
        .insert(
          CasesCompanion.insert(
            id: 'k1',
            neighborhoodId: 'b1',
            categoryId: 'alumbrado',
            subtypeId: 'luminaria_apagada',
            guidedAnswers: '{"desde_cuando":"mas_3_meses"}',
            status: CaseStatus.abierto,
            lat: -34.6,
            lng: -58.44,
            geohash: '69y7pkx',
            createdAt: DateTime.utc(2026, 7, 23),
            clientUuid: 'uuid-k1',
            updatedAt: DateTime.utc(2026, 7, 23),
          ),
        );

    final caso = await (db.select(
      db.cases,
    )..where((t) => t.id.equals('k1'))).getSingle();
    expect(caso.status, CaseStatus.abierto);
    expect(caso.syncStatus, SyncStatus.pendiente);
    expect(caso.endorsementCount, 0);
  });

  test('los índices locales existen', () async {
    final filas = await db
        .customSelect(
          "SELECT name FROM sqlite_master WHERE type = 'index' AND name LIKE 'idx_%'",
        )
        .get();
    final nombres = filas.map((f) => f.read<String>('name')).toSet();
    expect(
      nombres,
      containsAll({
        'idx_cases_neighborhood',
        'idx_cases_geohash',
        'idx_sync_ops_due',
      }),
    );
  });
}
