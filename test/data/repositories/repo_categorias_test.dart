import 'package:cuadra/data/models/texto_i18n.dart';
import 'package:cuadra/data/repositories/repo_categorias.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late RepoCategorias repo;

  setUp(() => repo = RepoCategorias(rootBundle));

  test('carga las 12 categorías del núcleo global, ordenadas', () async {
    final r = await repo.todas();
    expect(r.isOk, isTrue, reason: r.failureOrNull?.message);

    final categorias = r.valueOrNull!;
    expect(categorias.map((c) => c.id).toList(), [
      'alumbrado',
      'calzada',
      'residuos',
      'agua',
      'arbolado',
      'transito',
      'espacios_verdes',
      'transporte',
      'ruido',
      'obra',
      'anegamiento',
      'otro',
    ]);
  });

  test(
    'todas las categorías cumplen las reglas del árbol guiado (§9)',
    () async {
      final categorias = (await repo.todas()).valueOrNull!;
      for (final c in categorias) {
        expect(c.subtipos, isNotEmpty, reason: c.id);
        // 3 a 5 preguntas, todas de opción (§9.2).
        expect(c.preguntas.length, inInclusiveRange(3, 5), reason: c.id);
        for (final p in c.preguntas) {
          expect(
            ['opcion', 'multiple'],
            contains(p.tipo),
            reason: '${c.id}/${p.id}',
          );
          expect(
            p.opciones.length,
            greaterThanOrEqualTo(2),
            reason: '${c.id}/${p.id}',
          );
          expect(p.texto.resolver('es'), isNotEmpty);
        }
        // Los tres idiomas mínimos presentes en el nombre.
        for (final idioma in ['es', 'en', 'pt']) {
          expect(c.nombre[idioma], isNotNull, reason: '${c.id} sin $idioma');
        }
        // Cada subtipo aporta su fragmento para el escrito.
        for (final s in c.subtipos) {
          expect(
            s.fragmento.resolver('es'),
            isNotEmpty,
            reason: '${c.id}/${s.id}',
          );
        }
      }
    },
  );

  test('porId encuentra y falla con NotFound cuando no existe', () async {
    final ok = await repo.porId('alumbrado');
    expect(ok.valueOrNull?.icono, '💡');

    final falla = await repo.porId('inexistente');
    expect(falla.isOk, isFalse);
  });
}
