import 'dart:ui';

import 'package:cuadra/core/theme/tokens.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('la paleta es exactamente la del documento maestro (§5)', () {
    expect(TokensCuadra.asfalto, const Color(0xFF1C1C1A));
    expect(TokensCuadra.cal, const Color(0xFFF2F0E9));
    expect(TokensCuadra.vial, const Color(0xFFF2B705));
    expect(TokensCuadra.sello, const Color(0xFF1F5C3A));
    expect(TokensCuadra.vencido, const Color(0xFFB33A1A));
    expect(TokensCuadra.tiza, const Color(0xFF8C8A82));
  });

  test(
    'la escala tipográfica es 32/24/20/16/14/12 y los pesos 400/600/800',
    () {
      expect(
        [
          TokensCuadra.cuerpo32,
          TokensCuadra.cuerpo24,
          TokensCuadra.cuerpo20,
          TokensCuadra.cuerpo16,
          TokensCuadra.cuerpo14,
          TokensCuadra.cuerpo12,
        ],
        [32, 24, 20, 16, 14, 12],
      );
      expect(
        [TokensCuadra.peso400, TokensCuadra.peso600, TokensCuadra.peso800],
        [400, 600, 800],
      );
    },
  );

  test('el objetivo táctil mínimo cumple accesibilidad (≥48 dp)', () {
    expect(TokensCuadra.objetivoTactilMin, greaterThanOrEqualTo(48));
  });
}
