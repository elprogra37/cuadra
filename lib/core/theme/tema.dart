import 'package:flutter/material.dart';

import 'tipografia.dart';
import 'tokens.dart';

/// Temas de la app: claro (papel de expediente) y oscuro (asfalto).
///
/// La estética es funcional, no decorativa (§5): cuando el producto parece un
/// trámite oficial y no una red social, la gente se comporta como en una mesa
/// de entradas.
abstract final class TemaCuadra {
  static ThemeData get claro => _base(
    brightness: Brightness.light,
    fondo: TokensCuadra.cal,
    tinta: TokensCuadra.asfalto,
  );

  static ThemeData get oscuro => _base(
    brightness: Brightness.dark,
    fondo: TokensCuadra.asfalto,
    tinta: TokensCuadra.cal,
  );

  static ThemeData _base({
    required Brightness brightness,
    required Color fondo,
    required Color tinta,
  }) {
    final esquema = ColorScheme(
      brightness: brightness,
      // `vial` es acento de acción pendiente, no marca (§5): primary queda
      // en tinta para que los componentes Material no pinten amarillo solos.
      primary: tinta,
      onPrimary: fondo,
      secondary: TokensCuadra.tiza,
      onSecondary: fondo,
      error: TokensCuadra.vencido,
      onError: TokensCuadra.cal,
      surface: fondo,
      onSurface: tinta,
      outline: TokensCuadra.tiza,
    );

    final textos = TextTheme(
      // Display: SOLO títulos de caso y contador de días.
      displayLarge: TipografiaCuadra.display(
        TokensCuadra.cuerpo32,
        peso: TokensCuadra.peso800,
        color: tinta,
      ),
      displayMedium: TipografiaCuadra.display(
        TokensCuadra.cuerpo24,
        color: tinta,
      ),
      displaySmall: TipografiaCuadra.display(
        TokensCuadra.cuerpo20,
        color: tinta,
      ),
      // Títulos de sección en cuerpo, no en display.
      titleLarge: TipografiaCuadra.cuerpo(
        TokensCuadra.cuerpo20,
        peso: TokensCuadra.peso600,
        color: tinta,
      ),
      titleMedium: TipografiaCuadra.cuerpo(
        TokensCuadra.cuerpo16,
        peso: TokensCuadra.peso600,
        color: tinta,
      ),
      bodyLarge: TipografiaCuadra.cuerpo(TokensCuadra.cuerpo16, color: tinta),
      bodyMedium: TipografiaCuadra.cuerpo(TokensCuadra.cuerpo14, color: tinta),
      // Metadatos.
      bodySmall: TipografiaCuadra.cuerpo(
        TokensCuadra.cuerpo12,
        color: TokensCuadra.tiza,
      ),
      labelLarge: TipografiaCuadra.cuerpo(
        TokensCuadra.cuerpo16,
        peso: TokensCuadra.peso600,
        color: tinta,
      ),
      // Datos: expedientes, fechas, contadores.
      labelMedium: TipografiaCuadra.datos(TokensCuadra.cuerpo14, color: tinta),
      labelSmall: TipografiaCuadra.datos(
        TokensCuadra.cuerpo12,
        color: TokensCuadra.tiza,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: esquema,
      scaffoldBackgroundColor: fondo,
      fontFamily: 'Inter',
      textTheme: textos,
      appBarTheme: AppBarTheme(
        backgroundColor: fondo,
        foregroundColor: tinta,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textos.titleLarge,
      ),
      // Sin bordes redondeados amables: esquinas de formulario municipal.
      cardTheme: CardThemeData(
        color: fondo,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: TokensCuadra.tiza.withValues(alpha: 0.45)),
          borderRadius: BorderRadius.circular(2),
        ),
        margin: EdgeInsets.zero,
      ),
      // CTA primario: amarillo vial SOLO en acciones pendientes. El botón
      // primario del tema es tinta sobre fondo; el amarillo lo aplica cada
      // pantalla cuando corresponde (regla del amarillo, tokens.dart).
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: tinta,
          foregroundColor: fondo,
          minimumSize: const Size(
            TokensCuadra.objetivoTactilMin,
            TokensCuadra.objetivoTactilMin,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          textStyle: textos.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: tinta,
          side: BorderSide(color: tinta, width: 1.5),
          minimumSize: const Size(
            TokensCuadra.objetivoTactilMin,
            TokensCuadra.objetivoTactilMin,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          textStyle: textos.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: tinta,
          minimumSize: const Size(
            TokensCuadra.objetivoTactilMin,
            TokensCuadra.objetivoTactilMin,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: TokensCuadra.tiza.withValues(alpha: 0.35),
        thickness: 1,
        space: 1,
      ),
      // Movimiento: casi nada (§5). Transiciones de página sobrias.
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
