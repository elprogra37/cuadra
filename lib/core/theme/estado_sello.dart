import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'tipografia.dart';
import 'tokens.dart';

/// Variantes del sello de estado. Cada una fija su color de tinta.
///
/// REGLA DEL AMARILLO (§5): `vial` aparece solo donde hay algo abierto que
/// espera acción. `esperaAccion` es la fuente de verdad de esa regla y el
/// test del sistema de diseño la verifica.
enum SelloVariante {
  /// Caso abierto, todavía sin presentar: espera acción del barrio.
  abierto(TokensCuadra.vial, esperaAccion: true),

  /// Presentado ante el organismo: espera respuesta, el reloj corre.
  presentado(TokensCuadra.vial, esperaAccion: true),

  /// Plazo vencido sin respuesta oficial.
  sinRespuesta(TokensCuadra.vencido, esperaAccion: false),

  /// Resuelto y verificado.
  resuelto(TokensCuadra.sello, esperaAccion: false),

  /// Archivado sin adhesiones.
  archivado(TokensCuadra.tiza, esperaAccion: false);

  const SelloVariante(this.tinta, {required this.esperaAccion});

  /// Color de tinta del sello.
  final Color tinta;

  /// Si el estado espera una acción del usuario o del barrio.
  final bool esperaAccion;
}

/// Sello de mesa de entradas (§5): rectángulo rotado 1.5–3°, borde de 2 px,
/// tinta con textura desgastada, tipografía monoespaciada.
///
/// Es lo único memorable de la interfaz; todo lo demás se mantiene callado
/// alrededor. También es la unidad compartible (estampado sobre la foto).
///
/// ```
/// ┌────────────────────────┐
/// │  SIN RESPUESTA · 47 D  │
/// │  vencido 12·06·26      │
/// └────────────────────────┘
/// ```
class EstadoSello extends StatelessWidget {
  const EstadoSello({
    super.key,
    required this.variante,
    required this.titulo,
    this.subtitulo,
    this.rotacionGrados,
    this.colorPapel,
  });

  final SelloVariante variante;

  /// Línea principal, ya localizada (p. ej. `Textos.of(context).selloResuelto`).
  final String titulo;

  /// Segunda línea: fecha, número de expediente, "verificado".
  final String? subtitulo;

  /// Rotación en grados. Si es null se deriva del [titulo] de forma estable,
  /// dentro de ±[1.5, 3]. Exponerla permite fijarla en tests y en la tarjeta
  /// compartible.
  final double? rotacionGrados;

  /// Color del "papel" sobre el que se estampa; alimenta la textura de tinta
  /// desgastada. Default: fondo del Scaffold del tema.
  final Color? colorPapel;

  /// Borde del sello (§5): 2 px exactos.
  static const grosorBorde = 2.0;

  /// Rotación estable derivada del texto: mismo caso, mismo sello, siempre.
  static double rotacionPara(String titulo) {
    final h = titulo.hashCode;
    final magnitud = 1.5 + (h.abs() % 151) / 100; // [1.5, 3.0]
    return h.isEven ? magnitud : -magnitud;
  }

  @override
  Widget build(BuildContext context) {
    final papel = colorPapel ?? Theme.of(context).scaffoldBackgroundColor;
    final grados = rotacionGrados ?? rotacionPara(titulo);
    final tinta = variante.tinta;

    final contenido = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TokensCuadra.esp12,
        vertical: TokensCuadra.esp8,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: tinta, width: grosorBorde),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo.toUpperCase(),
            style: TipografiaCuadra.datos(
              TokensCuadra.cuerpo16,
              peso: TokensCuadra.peso800,
              color: tinta,
              espaciado: 1.2,
            ),
          ),
          if (subtitulo != null)
            Text(
              subtitulo!,
              style: TipografiaCuadra.datos(
                TokensCuadra.cuerpo12,
                peso: TokensCuadra.peso600,
                color: tinta,
                espaciado: 0.6,
              ),
            ),
        ],
      ),
    );

    return Semantics(
      label: subtitulo == null ? titulo : '$titulo, $subtitulo',
      child: ExcludeSemantics(
        child: Transform.rotate(
          angle: grados * math.pi / 180,
          child: CustomPaint(
            // La textura va POR ENCIMA de la tinta: pinta motas del color del
            // papel que "comen" borde y letras, como un sello gastado.
            foregroundPainter: _TexturaTintaDesgastada(
              papel: papel,
              semilla: titulo.hashCode,
            ),
            child: contenido,
          ),
        ),
      ),
    );
  }
}

/// Motas deterministas del color del papel sobre el sello: tinta desgastada.
/// Semilla fija por título → el mismo sello se ve igual en cada build.
class _TexturaTintaDesgastada extends CustomPainter {
  const _TexturaTintaDesgastada({required this.papel, required this.semilla});

  final Color papel;
  final int semilla;

  @override
  void paint(Canvas canvas, Size size) {
    final rand = math.Random(semilla);
    final pintura = Paint();
    final motas = (size.width * size.height / 55).clamp(30, 140).toInt();
    for (var i = 0; i < motas; i++) {
      pintura.color = papel.withValues(alpha: 0.35 + rand.nextDouble() * 0.5);
      canvas.drawCircle(
        Offset(rand.nextDouble() * size.width, rand.nextDouble() * size.height),
        0.4 + rand.nextDouble() * 1.1,
        pintura,
      );
    }
  }

  @override
  bool shouldRepaint(_TexturaTintaDesgastada old) =>
      old.papel != papel || old.semilla != semilla;
}
