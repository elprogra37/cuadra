import 'package:flutter/material.dart';

import 'tokens.dart';

/// Tres familias, tres roles (§5). Fuentes variables: el peso se aplica con
/// `fontVariations`, no con `fontWeight` (que las variables ignoran).
///
/// - Display (Oswald): títulos de caso y contador de días. Nada más.
/// - Cuerpo (Inter): todo el texto.
/// - Datos (JetBrainsMono): números de expediente, fechas, contadores, sellos.
abstract final class TipografiaCuadra {
  static const _oswald = 'Oswald';
  static const _inter = 'Inter';
  static const _mono = 'JetBrainsMono';

  static TextStyle display(
    double tamano, {
    double peso = TokensCuadra.peso600,
    Color? color,
  }) => TextStyle(
    fontFamily: _oswald,
    fontSize: tamano,
    fontVariations: [FontVariation('wght', peso)],
    // fontWeight espejado para que los tests y los fallbacks sin fuente
    // variable respeten el peso.
    fontWeight: _espejo(peso),
    color: color,
    height: 1.1,
  );

  static TextStyle cuerpo(
    double tamano, {
    double peso = TokensCuadra.peso400,
    Color? color,
  }) => TextStyle(
    fontFamily: _inter,
    fontSize: tamano,
    fontVariations: [FontVariation('wght', peso)],
    fontWeight: _espejo(peso),
    color: color,
    height: 1.4,
  );

  static TextStyle datos(
    double tamano, {
    double peso = TokensCuadra.peso400,
    Color? color,
    double? espaciado,
  }) => TextStyle(
    fontFamily: _mono,
    fontSize: tamano,
    fontVariations: [FontVariation('wght', peso)],
    fontWeight: _espejo(peso),
    color: color,
    letterSpacing: espaciado,
    height: 1.2,
  );

  static FontWeight _espejo(double peso) => switch (peso) {
    >= 800 => FontWeight.w800,
    >= 600 => FontWeight.w600,
    _ => FontWeight.w400,
  };
}
