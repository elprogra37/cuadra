import 'dart:typed_data';

import 'package:cuadra/services/camera/procesador_evidencia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

Uint8List _fotoDePrueba({int ancho = 2400, int alto = 1200}) {
  final imagen = img.Image(width: ancho, height: alto);
  img.fill(imagen, color: img.ColorRgb8(120, 120, 40));
  // EXIF con GPS: exactamente lo que NO puede sobrevivir (§10.2).
  imagen.exif.gpsIfd['GPSLatitude'] = img.IfdValueRational(34, 1);
  imagen.exif.imageIfd['Make'] = 'CamaraDePrueba';
  return Uint8List.fromList(img.encodeJpg(imagen));
}

void main() {
  test('reescala a 1600 px de lado largo manteniendo proporción', () {
    final r = ProcesadorEvidencia.procesar(_fotoDePrueba());
    expect(r.ancho, 1600);
    expect(r.alto, 800);
  });

  test('no agranda fotos chicas', () {
    final r = ProcesadorEvidencia.procesar(
      _fotoDePrueba(ancho: 800, alto: 600),
    );
    expect(r.ancho, 800);
    expect(r.alto, 600);
  });

  test('elimina TODO el EXIF del archivo final', () {
    final r = ProcesadorEvidencia.procesar(_fotoDePrueba());
    final decodificada = img.decodeJpg(r.jpeg)!;
    expect(decodificada.exif.gpsIfd.isEmpty, isTrue, reason: 'GPS en EXIF');
    expect(
      decodificada.exif.imageIfd['Make'],
      isNull,
      reason: 'marca de cámara',
    );
  });

  test('el hash corresponde al archivo final y es estable', () {
    final foto = _fotoDePrueba();
    final a = ProcesadorEvidencia.procesar(foto);
    final b = ProcesadorEvidencia.procesar(foto);
    expect(a.sha256, b.sha256);
    expect(a.sha256, hasLength(64));
  });

  test('rechaza bytes que no son una imagen', () {
    expect(
      () => ProcesadorEvidencia.procesar(Uint8List.fromList([1, 2, 3])),
      throwsFormatException,
    );
  });
}
