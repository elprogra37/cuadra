import 'package:cuadra/core/theme/estado_sello.dart';
import 'package:cuadra/core/theme/estado_sello_animado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _sello = EstadoSello(
  variante: SelloVariante.resuelto,
  titulo: 'Resuelto',
);

void main() {
  testWidgets('el estampado dura 150 ms y termina en escala 1', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: EstadoSelloAnimado(sello: _sello)),
        ),
      ),
    );

    // A mitad de la caída el sello está más grande que su tamaño final.
    await tester.pump(const Duration(milliseconds: 40));
    final escalaMedio = tester
        .widget<ScaleTransition>(
          find.descendant(
            of: find.byType(EstadoSelloAnimado),
            matching: find.byType(ScaleTransition),
          ),
        )
        .scale
        .value;
    expect(escalaMedio, greaterThan(1.0));

    // Al terminar (150 ms) queda estampado en escala exacta 1.
    await tester.pumpAndSettle();
    final escalaFinal = tester
        .widget<ScaleTransition>(
          find.descendant(
            of: find.byType(EstadoSelloAnimado),
            matching: find.byType(ScaleTransition),
          ),
        )
        .scale
        .value;
    expect(escalaFinal, 1.0);
  });

  testWidgets('con animar=false aparece ya estampado', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: EstadoSelloAnimado(sello: _sello, animar: false)),
        ),
      ),
    );
    final escala = tester
        .widget<ScaleTransition>(
          find.descendant(
            of: find.byType(EstadoSelloAnimado),
            matching: find.byType(ScaleTransition),
          ),
        )
        .scale
        .value;
    expect(escala, 1.0);
  });

  testWidgets('respeta prefers-reduced-motion (§5)', (tester) async {
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(disableAnimations: true),
        child: MaterialApp(
          home: Scaffold(
            body: Center(child: EstadoSelloAnimado(sello: _sello)),
          ),
        ),
      ),
    );
    await tester.pump();
    final escala = tester
        .widget<ScaleTransition>(
          find.descendant(
            of: find.byType(EstadoSelloAnimado),
            matching: find.byType(ScaleTransition),
          ),
        )
        .scale
        .value;
    expect(escala, 1.0, reason: 'sin animación: aparece estampado directo');
  });
}
