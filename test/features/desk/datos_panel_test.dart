import 'package:cuadra/data/local/base_datos.dart';
import 'package:cuadra/data/models/enums.dart';
import 'package:cuadra/features/desk/datos_panel.dart';
import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BaseDatos db;
  late DatosPanel panel;
  final reloj = DateTime.utc(2026, 7, 1);

  setUp(() async {
    db = BaseDatos(NativeDatabase.memory());
    panel = DatosPanel(db);
    await db
        .into(db.neighborhoods)
        .insert(
          NeighborhoodsCompanion.insert(
            id: 'b1',
            cityId: 'c1',
            name: 'X',
            nameNormalized: 'x',
            polygon: '[]',
            centroidLat: 0,
            centroidLng: 0,
            areaKm2: 1,
            status: NeighborhoodStatus.activo,
            createdAt: reloj,
            clientUuid: 'b1',
            updatedAt: reloj,
          ),
        );
  });

  tearDown(() async => db.close());

  Future<void> insertar(
    String id,
    CaseStatus status, {
    String categoria = 'alumbrado',
    DateTime? submitted,
    DateTime? resolved,
  }) => db
      .into(db.cases)
      .insert(
        CasesCompanion.insert(
          id: id,
          neighborhoodId: 'b1',
          categoryId: categoria,
          subtypeId: 's',
          guidedAnswers: '{}',
          status: status,
          lat: 0,
          lng: 0,
          geohash: 's000000',
          createdAt: reloj,
          submittedAt: Value(submitted),
          resolvedAt: Value(resolved),
          clientUuid: id,
          updatedAt: reloj,
        ),
      );

  test('el embudo cuenta cada etapa y la tasa de resolución', () async {
    await insertar('a', CaseStatus.abierto);
    await insertar('b', CaseStatus.presentado, submitted: reloj);
    await insertar(
      'c',
      CaseStatus.resuelto,
      categoria: 'residuos',
      submitted: reloj,
      resolved: reloj.add(const Duration(days: 10)),
    );
    await insertar('d', CaseStatus.sinRespuesta, submitted: reloj);

    final datos = await panel.deBarrio('b1');
    expect(datos.reportes, 4);
    expect(datos.presentados, 3); // b, c, d tienen submittedAt
    expect(datos.resueltos, 1);
    expect(datos.sinRespuesta, 1);
    expect(datos.tasaResolucion, closeTo(1 / 3, 0.001));
    expect(datos.diasPromedioRespuesta, 10);
    expect(datos.porCategoria['alumbrado'], 3);
    expect(datos.porCategoria['residuos'], 1);
  });

  test('sin casos resueltos, los días de respuesta son nulos', () async {
    await insertar('a', CaseStatus.presentado, submitted: reloj);
    final datos = await panel.deBarrio('b1');
    expect(datos.diasPromedioRespuesta, isNull);
    expect(datos.tasaResolucion, 0);
  });
}
