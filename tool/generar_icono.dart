// Genera el ícono de la app: el sello de mesa de entradas de Cuadra (§5).
// Fondo asfalto, marco de tinta vial rotado, la marca "C" de expediente.
// Correr: dart run tool/generar_icono.dart  → escribe assets/icon/cuadra.png
// Regenerar íconos de plataforma: dart run flutter_launcher_icons
import 'dart:io';
import 'dart:math' as math;

import 'package:image/image.dart' as img;

void main() {
  const lado = 1024;
  final asfalto = img.ColorRgb8(0x1C, 0x1C, 0x1A);
  final vial = img.ColorRgb8(0xF2, 0xB7, 0x05);
  final cal = img.ColorRgb8(0xF2, 0xF0, 0xE9);

  final lienzo = img.Image(width: lado, height: lado);
  img.fill(lienzo, color: asfalto);

  // Marco del sello, rotado ~ -3°, como una chapa estampada.
  final capa = img.Image(width: lado, height: lado, numChannels: 4);
  const margen = 190;
  const grosor = 34;
  img.drawRect(
    capa,
    x1: margen,
    y1: margen + 40,
    x2: lado - margen,
    y2: lado - margen - 40,
    color: vial,
    thickness: grosor.toDouble(),
  );

  // La "C" de Cuadra / constancia, tinta cal, dentro del marco.
  _dibujarC(capa, lado, cal);

  final rotada = img.copyRotate(
    capa,
    angle: -3,
    interpolation: img.Interpolation.cubic,
  );
  img.compositeImage(lienzo, rotada);

  // Textura de tinta desgastada: motas del color de fondo sobre el amarillo.
  final rand = math.Random(4417);
  for (var i = 0; i < 900; i++) {
    final x = margen + rand.nextInt(lado - margen * 2);
    final y = margen + rand.nextInt(lado - margen * 2);
    img.drawCircle(lienzo, x: x, y: y, radius: rand.nextInt(3), color: asfalto);
  }

  final dir = Directory('assets/icon')..createSync(recursive: true);
  File('${dir.path}/cuadra.png').writeAsBytesSync(img.encodePng(lienzo));
  // Foreground para el ícono adaptativo de Android (solo la marca, sin fondo).
  final fg = img.Image(width: lado, height: lado, numChannels: 4);
  _dibujarC(fg, lado, vial);
  File('${dir.path}/cuadra_foreground.png').writeAsBytesSync(img.encodePng(fg));
  stdout.writeln('Ícono generado en ${dir.path}/cuadra.png');
}

/// Traza una "C" gruesa centrada, dejando un hueco a la derecha.
void _dibujarC(img.Image destino, int lado, img.Color color) {
  final cx = lado / 2;
  final cy = lado / 2;
  final radioExt = lado * 0.26;
  final radioInt = lado * 0.15;
  for (var y = 0; y < lado; y++) {
    for (var x = 0; x < lado; x++) {
      final dx = x - cx;
      final dy = y - cy;
      final d = math.sqrt(dx * dx + dy * dy);
      if (d <= radioExt && d >= radioInt) {
        final ang = math.atan2(dy, dx); // -pi..pi; hueco entre -35° y 35°
        if (ang.abs() > 35 * math.pi / 180) {
          destino.setPixel(x, y, color);
        }
      }
    }
  }
}
