import 'package:cuadra/data/local/base_datos.dart';
import 'package:cuadra/data/models/enums.dart';
import 'package:cuadra/data/repositories/repo_casos.dart';
import 'package:cuadra/data/repositories/repo_categorias.dart';
import 'package:cuadra/data/repositories/repo_geografia.dart';
import 'package:cuadra/data/sync/cliente_remoto.dart';
import 'package:cuadra/data/sync/cola_sync.dart';
import 'package:cuadra/services/documents/generador_escrito.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Prueba de extremo a extremo del camino feliz completo, contra la base local
/// real: crear barrio → reportar (con escrito generado) → presentar → vencer
/// el plazo → escalar → resolver con 2 confirmaciones. Es la validación de que
/// las piezas de las 4 fases encajan.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BaseDatos db;
  late RepoGeografia geo;
  late RepoCasos casos;
  late RepoCategorias categorias;
  var reloj = DateTime.utc(2026, 7, 23, 10);

  setUp(() {
    db = BaseDatos(NativeDatabase.memory());
    reloj = DateTime.utc(2026, 7, 23, 10);
    final cola = ColaSync(db, const ClienteRemotoNulo(), ahora: () => reloj);
    geo = RepoGeografia(db, cola, ahora: () => reloj);
    casos = RepoCasos(db, cola, ahora: () => reloj);
    categorias = RepoCategorias(rootBundle);
  });

  tearDown(() async => db.close());

  test('camino completo del vecino, de reclamo a resuelto', () async {
    // 1. Crear el barrio (cae dentro de un polígono conocido).
    final poligono = [
      (lat: -34.59, lng: -58.45),
      (lat: -34.59, lng: -58.43),
      (lat: -34.61, lng: -58.43),
      (lat: -34.61, lng: -58.45),
    ];
    final rBarrio = await geo.crearBarrio(
      cityId: 'AR-C-CABA',
      nombre: 'Mi Barrio',
      poligono: poligono,
    );
    expect(rBarrio.isOk, isTrue, reason: rBarrio.failureOrNull?.message);
    final barrio = rBarrio.valueOrNull!;

    // 2. El punto se resuelve a ese barrio (ubicación forzada §10.3).
    final resuelto = await geo.resolver(-34.60, -58.44);
    expect(resuelto?.id, barrio.id);

    // 3. Generar el escrito desde la categoría real (assets) y reportar.
    final cat = (await categorias.porId('alumbrado')).valueOrNull!;
    final escrito = GeneradorEscrito.generar(
      categoria: cat,
      subtipoId: 'luminaria_apagada',
      respuestas: {'desde_cuando': 'mas_3_meses'},
      ctx: ContextoEscrito(
        idioma: 'es',
        lat: -34.60,
        lng: -58.44,
        fechaCaptura: reloj,
      ),
    );
    expect(escrito, contains('noventa (90) días'));

    final rCaso = await casos.crearCaso(
      neighborhoodId: barrio.id,
      categoryId: 'alumbrado',
      subtypeId: 'luminaria_apagada',
      guidedAnswers: {'desde_cuando': 'mas_3_meses'},
      lat: -34.60,
      lng: -58.44,
      generatedBody: escrito,
    );
    expect(rCaso.isOk, isTrue, reason: rCaso.failureOrNull?.message);
    final caso = rCaso.valueOrNull!;
    expect(caso.status, CaseStatus.abierto);

    // 4. Aparece en el feed del barrio.
    final feed = await casos.watchCasosDeBarrio(barrio.id).first;
    expect(feed.map((c) => c.id), contains(caso.id));

    // 5. Presentar: arranca el reloj (30 días).
    await casos.presentar(
      caseId: caso.id,
      jurisdictionId: 'AR-C-CABA',
      organismId: 'demo',
      responseDays: 30,
      generatedBody: escrito,
    );
    var actual = await casos.watchCaso(caso.id).first;
    expect(actual!.status, CaseStatus.presentado);

    // 6. Vence el plazo → sin respuesta.
    reloj = reloj.add(const Duration(days: 31));
    await casos.marcarVencidos();
    actual = await casos.watchCaso(caso.id).first;
    expect(actual!.status, CaseStatus.sinRespuesta);

    // 7. Reiterar renueva el plazo.
    await casos.escalar(caseId: caso.id, tipo: CaseActionType.reiterar);
    actual = await casos.watchCaso(caso.id).first;
    expect(actual!.status, CaseStatus.presentado);

    // 8. Resolver: reclamo + 2 confirmaciones de otros vecinos.
    await casos.reclamarResuelto(caseId: caso.id, userId: 'u-vecino');
    await casos.confirmarResuelto(caseId: caso.id, userId: 'u-otro-1');
    await casos.confirmarResuelto(caseId: caso.id, userId: 'u-otro-2');
    actual = await casos.watchCaso(caso.id).first;
    expect(actual!.status, CaseStatus.resuelto);
    expect(actual.resolvedAt, isNotNull);
  });
}
