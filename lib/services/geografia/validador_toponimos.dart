import 'package:dio/dio.dart';

import '../../core/errors/failures.dart';
import '../../core/errors/result.dart';

/// Resultado de validar un topónimo contra una fuente externa (§6.2).
class ValidacionToponimo {
  const ValidacionToponimo({
    required this.encontrado,
    this.fuente,
    this.nombreCanonico,
    this.lat,
    this.lng,
    this.payload,
  });

  /// ¿El topónimo existe en esas coordenadas como barrio/localidad?
  final bool encontrado;

  /// osm | google_places (§19 validation_source).
  final String? fuente;
  final String? nombreCanonico;
  final double? lat;
  final double? lng;

  /// Respuesta cruda para auditoría (validation_payload).
  final Map<String, dynamic>? payload;

  static const noEncontrado = ValidacionToponimo(encontrado: false);
}

/// Valida que el nombre de barrio exista en esas coordenadas.
abstract class ValidadorToponimos {
  Future<Result<ValidacionToponimo>> validar({
    required String nombre,
    required double lat,
    required double lng,
  });
}

/// Nominatim (OSM) como fuente primaria y gratuita (§24 riesgos: Places solo
/// como fallback, con caché agresiva — el fallback llega cuando haya API key).
class NominatimValidador implements ValidadorToponimos {
  NominatimValidador(
    this._dio, {
    this.baseUrl = 'https://nominatim.openstreetmap.org',
  });

  final Dio _dio;
  final String baseUrl;

  /// Caché agresiva en memoria: mismo nombre+zona, misma respuesta.
  final _cache = <String, ValidacionToponimo>{};

  /// Tipos OSM que cuentan como barrio (§6.2).
  static const _tiposBarrio = {
    'suburb',
    'neighbourhood',
    'quarter',
    'city_district',
    'residential',
  };

  /// Radio de tolerancia: el topónimo tiene que estar cerca de donde el
  /// usuario dice que está su barrio (~15 km, área metropolitana).
  static const _toleranciaGrados = 0.15;

  @override
  Future<Result<ValidacionToponimo>> validar({
    required String nombre,
    required double lat,
    required double lng,
  }) async {
    final clave =
        '${nombre.toLowerCase()}|${lat.toStringAsFixed(1)}|${lng.toStringAsFixed(1)}';
    final cacheado = _cache[clave];
    if (cacheado != null) return Ok(cacheado);

    try {
      final respuesta = await _dio.get<List<dynamic>>(
        '$baseUrl/search',
        queryParameters: {
          'q': nombre,
          'format': 'jsonv2',
          'limit': 10,
          // Sesgo hacia la zona del usuario sin excluir el resto.
          'viewbox':
              '${lng - _toleranciaGrados},${lat - _toleranciaGrados},'
              '${lng + _toleranciaGrados},${lat + _toleranciaGrados}',
        },
        options: Options(
          headers: {
            // Nominatim exige identificarse.
            'User-Agent': 'cuadra-app/0.1 (plataforma de accion vecinal)',
          },
        ),
      );

      final resultado = interpretarRespuesta(
        respuesta.data ?? const [],
        lat: lat,
        lng: lng,
      );
      _cache[clave] = resultado;
      return Ok(resultado);
    } on DioException {
      // Sin red no se bloquea el alta: el barrio queda como validación manual
      // y el servidor revalida al sincronizar (§6.2: nada frena al vecino).
      return const Err(NetworkFailure());
    }
  }

  /// Lógica pura de interpretación, testeable sin red.
  static ValidacionToponimo interpretarRespuesta(
    List<dynamic> resultados, {
    required double lat,
    required double lng,
  }) {
    for (final crudo in resultados) {
      final r = crudo as Map<String, dynamic>;
      final tipo = r['type'] as String? ?? '';
      final categoria = r['category'] as String? ?? r['class'] as String? ?? '';
      final rLat = double.tryParse(r['lat'] as String? ?? '');
      final rLng = double.tryParse(r['lon'] as String? ?? '');
      if (rLat == null || rLng == null) continue;

      final esBarrio = categoria == 'place' && _tiposBarrio.contains(tipo);
      final cerca =
          (rLat - lat).abs() <= _toleranciaGrados &&
          (rLng - lng).abs() <= _toleranciaGrados;
      if (esBarrio && cerca) {
        return ValidacionToponimo(
          encontrado: true,
          fuente: 'osm',
          nombreCanonico: (r['display_name'] as String?)
              ?.split(',')
              .first
              .trim(),
          lat: rLat,
          lng: rLng,
          payload: r,
        );
      }
    }
    return ValidacionToponimo.noEncontrado;
  }
}
