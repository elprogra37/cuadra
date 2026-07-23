/// Codificador de geohash (base32) puro, sin dependencias.
///
/// Uso en Cuadra (§19, reglas de privacidad): el domicilio del usuario se
/// guarda como geohash de 7 caracteres (~150 m), nunca como dirección exacta.
/// También indexa casos para búsquedas por proximidad en la base local.
abstract final class Geohash {
  static const _base32 = '0123456789bcdefghjkmnpqrstuvwxyz';

  /// Precisión que protege el domicilio (§19): ~150 m.
  static const precisionDomicilio = 7;

  static String codificar(double lat, double lng, {int precision = 9}) {
    assert(precision > 0 && precision <= 12, 'precisión fuera de rango');
    assert(lat >= -90 && lat <= 90, 'latitud inválida');
    assert(lng >= -180 && lng <= 180, 'longitud inválida');

    var latMin = -90.0, latMax = 90.0;
    var lngMin = -180.0, lngMax = 180.0;
    final resultado = StringBuffer();
    var bit = 0, ch = 0;
    var esLng = true;

    while (resultado.length < precision) {
      if (esLng) {
        final medio = (lngMin + lngMax) / 2;
        if (lng >= medio) {
          ch = (ch << 1) | 1;
          lngMin = medio;
        } else {
          ch = ch << 1;
          lngMax = medio;
        }
      } else {
        final medio = (latMin + latMax) / 2;
        if (lat >= medio) {
          ch = (ch << 1) | 1;
          latMin = medio;
        } else {
          ch = ch << 1;
          latMax = medio;
        }
      }
      esLng = !esLng;
      if (++bit == 5) {
        resultado.write(_base32[ch]);
        bit = 0;
        ch = 0;
      }
    }
    return resultado.toString();
  }

  /// Centro aproximado de la celda de un geohash.
  static ({double lat, double lng}) decodificar(String geohash) {
    var latMin = -90.0, latMax = 90.0;
    var lngMin = -180.0, lngMax = 180.0;
    var esLng = true;

    for (final c in geohash.toLowerCase().split('')) {
      final valor = _base32.indexOf(c);
      if (valor < 0) {
        throw ArgumentError('carácter inválido en geohash: $c');
      }
      for (var mascara = 16; mascara > 0; mascara >>= 1) {
        final bitActivo = valor & mascara != 0;
        if (esLng) {
          final medio = (lngMin + lngMax) / 2;
          if (bitActivo) {
            lngMin = medio;
          } else {
            lngMax = medio;
          }
        } else {
          final medio = (latMin + latMax) / 2;
          if (bitActivo) {
            latMin = medio;
          } else {
            latMax = medio;
          }
        }
        esLng = !esLng;
      }
    }
    return (lat: (latMin + latMax) / 2, lng: (lngMin + lngMax) / 2);
  }
}
