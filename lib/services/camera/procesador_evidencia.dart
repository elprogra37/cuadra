import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:image/image.dart' as img;

/// Resultado del procesamiento de una foto de evidencia (§10.2).
class EvidenciaProcesada {
  const EvidenciaProcesada({
    required this.jpeg,
    required this.sha256,
    required this.ancho,
    required this.alto,
  });

  /// JPEG re-encodeado: sin EXIF, máx. 1600 px de lado largo, calidad 82.
  final Uint8List jpeg;

  /// Hash del archivo FINAL (el que se almacena y se cita en el escrito).
  final String sha256;
  final int ancho;
  final int alto;
}

/// Pipeline de evidencia en cliente (§10.2, §25.6):
/// decodificar → reescalar → re-encodear JPEG (el re-encode descarta TODO el
/// EXIF: GPS, serie de cámara, fecha del dispositivo) → hashear.
/// Los metadatos útiles viajan por separado en la fila de `evidences`.
abstract final class ProcesadorEvidencia {
  static const ladoMaximo = 1600;
  static const calidad = 82;

  static EvidenciaProcesada procesar(Uint8List original) {
    img.Image? decodificada;
    try {
      decodificada = img.decodeImage(original);
    } catch (_) {
      // Algunos decodificadores tiran RangeError con basura: mismo trato.
      decodificada = null;
    }
    if (decodificada == null) {
      throw const FormatException('La imagen no se pudo decodificar.');
    }

    var lienzo = decodificada;
    // La orientación EXIF se aplica ANTES de descartar los metadatos, si no
    // las fotos verticales quedan acostadas.
    lienzo = img.bakeOrientation(lienzo);

    if (lienzo.width > ladoMaximo || lienzo.height > ladoMaximo) {
      lienzo = lienzo.width >= lienzo.height
          ? img.copyResize(lienzo, width: ladoMaximo)
          : img.copyResize(lienzo, height: ladoMaximo);
    }

    // El encoder CONSERVA el EXIF del objeto Image: hay que vaciarlo a mano
    // o el GPS y la serie de la cámara viajan al servidor (§10.2).
    lienzo.exif = img.ExifData();

    final jpeg = Uint8List.fromList(img.encodeJpg(lienzo, quality: calidad));
    return EvidenciaProcesada(
      jpeg: jpeg,
      sha256: sha256.convert(jpeg).toString(),
      ancho: lienzo.width,
      alto: lienzo.height,
    );
  }
}
