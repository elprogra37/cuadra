import 'package:cuadra/data/local/base_datos.dart';
import 'package:cuadra/data/models/enums.dart';
import 'package:cuadra/data/repositories/repo_geografia.dart';
import 'package:cuadra/data/sync/cliente_remoto.dart';
import 'package:cuadra/data/sync/cola_sync.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BaseDatos db;
  late RepoGeografia repo;
  final reloj = DateTime.utc(2026, 7, 23);

  // Cuadrado de ~2×2 km en Buenos Aires.
  final poligonoValido = [
    (lat: -34.59, lng: -58.45),
    (lat: -34.59, lng: -58.43),
    (lat: -34.61, lng: -58.43),
    (lat: -34.61, lng: -58.45),
  ];

  setUp(() {
    db = BaseDatos(NativeDatabase.memory());
    final cola = ColaSync(db, const ClienteRemotoNulo(), ahora: () => reloj);
    repo = RepoGeografia(db, cola, ahora: () => reloj);
  });

  tearDown(() async => db.close());

  test('crea un barrio propuesto y lo encola para sincronizar', () async {
    final r = await repo.crearBarrio(
      cityId: 'c1',
      nombre: 'Villa Crespo',
      poligono: poligonoValido,
      createdBy: 'u1',
    );

    expect(r.isOk, isTrue, reason: r.failureOrNull?.message);
    final barrio = r.valueOrNull!;
    expect(barrio.status, NeighborhoodStatus.propuesto);
    expect(barrio.nameNormalized, 'villa crespo');
    expect(barrio.areaKm2, closeTo(4.1, 0.5));

    final ops = await db.select(db.syncOps).get();
    expect(ops.single.entity, 'neighborhood');
  });

  test('rechaza polígonos de menos de 4 vértices', () async {
    final r = await repo.crearBarrio(
      cityId: 'c1',
      nombre: 'Triángulo',
      poligono: poligonoValido.sublist(0, 3),
    );
    expect(r.isOk, isFalse);
    expect(r.failureOrNull!.message, contains('4 vértices'));
  });

  test('rechaza áreas mayores a 25 km²', () async {
    final gigante = [
      (lat: -34.50, lng: -58.50),
      (lat: -34.50, lng: -58.40),
      (lat: -34.60, lng: -58.40),
      (lat: -34.60, lng: -58.50),
    ]; // ~100 km²
    final r = await repo.crearBarrio(
      cityId: 'c1',
      nombre: 'Demasiado grande',
      poligono: gigante,
    );
    expect(r.isOk, isFalse);
    expect(r.failureOrNull!.message, contains('25 km²'));
  });

  test('normalizar tolera tildes y espacios (para fusión §6.4)', () {
    expect(RepoGeografia.normalizar('  Villa   Crespo '), 'villa crespo');
    expect(RepoGeografia.normalizar('Ñuñoa'), 'nunoa');
    expect(RepoGeografia.normalizar('Agronomía'), 'agronomia');
  });

  test('buscarBarrios encuentra por nombre normalizado', () async {
    await repo.crearBarrio(
      cityId: 'c1',
      nombre: 'Agronomía',
      poligono: poligonoValido,
    );
    final resultados = await repo.buscarBarrios('agrono');
    expect(resultados, hasLength(1));
    expect(resultados.single.name, 'Agronomía');
  });

  test('resolver encuentra el barrio que contiene un punto', () async {
    await repo.crearBarrio(
      cityId: 'c1',
      nombre: 'Villa Crespo',
      poligono: poligonoValido,
    );
    final dentro = await repo.resolver(-34.60, -58.44);
    expect(dentro?.name, 'Villa Crespo');

    final fuera = await repo.resolver(-34.58, -58.44);
    expect(fuera, isNull);
  });
}
