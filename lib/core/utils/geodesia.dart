import 'dart:math' as math;

/// Utilidades geodésicas puras (sin dependencias de mapa).
abstract final class Geodesia {
  static const _radioTierraM = 6371000.0;

  /// Distancia haversine en metros entre dos puntos.
  ///
  /// Uso principal: deduplicación de casos (§10.3) — 80 m + misma categoría
  /// + 30 días se ofrece sumarse al existente, no crear otro.
  static double distanciaMetros(
    double lat1,
    double lng1,
    double lat2,
    double lng2,
  ) {
    final dLat = _rad(lat2 - lat1);
    final dLng = _rad(lng2 - lng1);
    final a =
        math.pow(math.sin(dLat / 2), 2) +
        math.cos(_rad(lat1)) *
            math.cos(_rad(lat2)) *
            math.pow(math.sin(dLng / 2), 2);
    return 2 * _radioTierraM * math.asin(math.sqrt(a.toDouble()));
  }

  /// ¿El punto cae dentro del polígono? (ray casting).
  ///
  /// Uso: ubicación forzada (§10.3) — solo se reporta dentro del polígono
  /// donde el usuario está verificado.
  static bool puntoEnPoligono(
    double lat,
    double lng,
    List<({double lat, double lng})> poligono,
  ) {
    if (poligono.length < 3) return false;
    var dentro = false;
    for (var i = 0, j = poligono.length - 1; i < poligono.length; j = i++) {
      final a = poligono[i];
      final b = poligono[j];
      final cruza =
          (a.lng > lng) != (b.lng > lng) &&
          lat < (b.lat - a.lat) * (lng - a.lng) / (b.lng - a.lng) + a.lat;
      if (cruza) dentro = !dentro;
    }
    return dentro;
  }

  /// Desplaza un punto hasta [maxMetros] en dirección pseudoaleatoria pero
  /// determinista por [semilla] (§19: pines sobre domicilios particulares se
  /// desplazan hasta 25 m — siempre igual para el mismo caso, así el pin no
  /// "baila" entre renders).
  static ({double lat, double lng}) desplazar(
    double lat,
    double lng, {
    required int semilla,
    double maxMetros = 25,
  }) {
    final rand = math.Random(semilla);
    final distancia = rand.nextDouble() * maxMetros;
    final rumbo = rand.nextDouble() * 2 * math.pi;
    final dLat = distancia * math.cos(rumbo) / 111320.0;
    final dLng = distancia * math.sin(rumbo) / (111320.0 * math.cos(_rad(lat)));
    return (lat: lat + dLat, lng: lng + dLng);
  }

  /// Fracción aproximada del polígono [candidato] que cae dentro de alguno
  /// de los [contenedores], por muestreo en grilla (§6.2: rechazo si solapa
  /// >40% con un barrio activo). La verificación exacta la hace PostGIS al
  /// sincronizar; esto evita el viaje cuando el conflicto es obvio.
  static double fraccionSolapada(
    List<({double lat, double lng})> candidato,
    List<List<({double lat, double lng})>> contenedores, {
    int resolucion = 24,
  }) {
    if (candidato.length < 3 || contenedores.isEmpty) return 0;
    var latMin = candidato.first.lat, latMax = candidato.first.lat;
    var lngMin = candidato.first.lng, lngMax = candidato.first.lng;
    for (final p in candidato) {
      latMin = math.min(latMin, p.lat);
      latMax = math.max(latMax, p.lat);
      lngMin = math.min(lngMin, p.lng);
      lngMax = math.max(lngMax, p.lng);
    }

    var dentroCandidato = 0;
    var solapados = 0;
    for (var i = 0; i < resolucion; i++) {
      for (var j = 0; j < resolucion; j++) {
        final lat = latMin + (latMax - latMin) * (i + 0.5) / resolucion;
        final lng = lngMin + (lngMax - lngMin) * (j + 0.5) / resolucion;
        if (!puntoEnPoligono(lat, lng, candidato)) continue;
        dentroCandidato++;
        for (final c in contenedores) {
          if (puntoEnPoligono(lat, lng, c)) {
            solapados++;
            break;
          }
        }
      }
    }
    return dentroCandidato == 0 ? 0 : solapados / dentroCandidato;
  }

  static double _rad(double grados) => grados * math.pi / 180;
}
