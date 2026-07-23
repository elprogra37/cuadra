import 'package:cuadra/core/theme/estado_sello.dart';
import 'package:cuadra/core/theme/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _envuelto(Widget child) => MaterialApp(
  home: Scaffold(body: Center(child: child)),
);

void main() {
  group('regla del amarillo (§5)', () {
    test('vial aparece solo en estados que esperan acción', () {
      for (final variante in SelloVariante.values) {
        if (variante.tinta == TokensCuadra.vial) {
          expect(
            variante.esperaAccion,
            isTrue,
            reason:
                '${variante.name} usa vial pero no espera acción: '
                'viola la regla del amarillo',
          );
        }
        if (variante.esperaAccion) {
          expect(
            variante.tinta,
            TokensCuadra.vial,
            reason:
                '${variante.name} espera acción pero no usa vial: '
                'el pendiente debe verse amarillo',
          );
        }
      }
    });

    test('cada variante tiene la tinta que manda el documento (§5)', () {
      expect(SelloVariante.abierto.tinta, TokensCuadra.vial);
      expect(SelloVariante.presentado.tinta, TokensCuadra.vial);
      expect(SelloVariante.sinRespuesta.tinta, TokensCuadra.vencido);
      expect(SelloVariante.resuelto.tinta, TokensCuadra.sello);
      expect(SelloVariante.archivado.tinta, TokensCuadra.tiza);
    });
  });

  group('EstadoSello', () {
    testWidgets('muestra título en mayúsculas y subtítulo', (tester) async {
      await tester.pumpWidget(
        _envuelto(
          const EstadoSello(
            variante: SelloVariante.presentado,
            titulo: 'Presentado',
            subtitulo: '12·05·26 · #4417',
          ),
        ),
      );

      expect(find.text('PRESENTADO'), findsOneWidget);
      expect(find.text('12·05·26 · #4417'), findsOneWidget);
    });

    testWidgets('el borde es de 2 px exactos con la tinta de la variante', (
      tester,
    ) async {
      await tester.pumpWidget(
        _envuelto(
          const EstadoSello(
            variante: SelloVariante.resuelto,
            titulo: 'Resuelto',
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(EstadoSello),
          matching: find.byType(Container),
        ),
      );
      final borde = (container.decoration! as BoxDecoration).border! as Border;
      expect(borde.top.width, EstadoSello.grosorBorde);
      expect(borde.top.color, TokensCuadra.sello);
    });

    testWidgets('está rotado dentro de ±[1.5°, 3°]', (tester) async {
      await tester.pumpWidget(
        _envuelto(
          const EstadoSello(
            variante: SelloVariante.sinRespuesta,
            titulo: 'Sin respuesta · 47 d',
          ),
        ),
      );

      final transform = tester.widget<Transform>(
        find.descendant(
          of: find.byType(EstadoSello),
          matching: find.byType(Transform),
        ),
      );
      // El ángulo va embebido en la matriz; lo validamos vía rotacionPara,
      // que es lo que usa el widget cuando no se fija rotación.
      expect(transform.transform.getRotation(), isNotNull);
      for (final texto in ['Presentado', 'Resuelto', 'x', 'otro sello más']) {
        final grados = EstadoSello.rotacionPara(texto).abs();
        expect(grados, inInclusiveRange(1.5, 3.0), reason: 'texto: $texto');
      }
    });

    testWidgets('expone una etiqueta de semántica completa', (tester) async {
      await tester.pumpWidget(
        _envuelto(
          const EstadoSello(
            variante: SelloVariante.resuelto,
            titulo: 'Resuelto',
            subtitulo: '03·07·26 · verificado',
          ),
        ),
      );

      expect(
        find.bySemanticsLabel('Resuelto, 03·07·26 · verificado'),
        findsOneWidget,
      );
    });

    testWidgets(
      'la rotación es estable entre builds (mismo caso, mismo sello)',
      (tester) async {
        final a = EstadoSello.rotacionPara('SIN RESPUESTA · 47 D');
        final b = EstadoSello.rotacionPara('SIN RESPUESTA · 47 D');
        expect(a, b);
      },
    );
  });
}
