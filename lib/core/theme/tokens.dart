import 'dart:ui';

/// Tokens del sistema de diseño (documento maestro §5).
///
/// El vocabulario visual sale del mundo real del producto: señalética urbana,
/// pintura vial, chapas de calle, formularios municipales, sellos de mesa de
/// entradas. Nada de gradientes ni estética de app de bienestar.
abstract final class TokensCuadra {
  // ── Paleta ────────────────────────────────────────────────────────────
  /// Fondo oscuro, tipografía sobre claro.
  static const asfalto = Color(0xFF1C1C1A);

  /// Fondo claro, papel de expediente.
  static const cal = Color(0xFFF2F0E9);

  /// Amarillo de pintura vial. Acento primario, estado abierto, CTA.
  ///
  /// REGLA DEL AMARILLO: aparece SOLO donde hay algo abierto que espera
  /// acción. Si una pantalla no tiene amarillo, no hay nada pendiente.
  /// Es información, no marca. (Verificado por test en
  /// `test/core/theme/estado_sello_test.dart`.)
  static const vial = Color(0xFFF2B705);

  /// Verde tinta. Resuelto, verificado.
  static const sello = Color(0xFF1F5C3A);

  /// Rojo óxido. Plazo vencido, sin respuesta.
  static const vencido = Color(0xFFB33A1A);

  /// Metadatos, texto secundario.
  static const tiza = Color(0xFF8C8A82);

  // ── Escala tipográfica (§5): 32/24/20/16/14/12. Sin excepciones. ──────
  static const cuerpo32 = 32.0;
  static const cuerpo24 = 24.0;
  static const cuerpo20 = 20.0;
  static const cuerpo16 = 16.0;
  static const cuerpo14 = 14.0;
  static const cuerpo12 = 12.0;

  // ── Pesos (§5): 400, 600, 800. Sin excepciones. ───────────────────────
  static const peso400 = 400.0;
  static const peso600 = 600.0;
  static const peso800 = 800.0;

  // ── Espaciado (múltiplos de 4, sobrio) ────────────────────────────────
  static const esp4 = 4.0;
  static const esp8 = 8.0;
  static const esp12 = 12.0;
  static const esp16 = 16.0;
  static const esp24 = 24.0;
  static const esp32 = 32.0;

  /// Objetivo táctil mínimo (accesibilidad, §25 definición de terminado).
  static const objetivoTactilMin = 48.0;
}
