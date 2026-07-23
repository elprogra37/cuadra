import 'dart:convert';
import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../core/errors/failures.dart';
import '../../core/errors/result.dart';
import '../../core/utils/geodesia.dart';
import '../local/base_datos.dart';
import '../models/enums.dart';
import '../sync/cola_sync.dart';

/// Geografía colaborativa (§6), lado local. La validación externa
/// (Nominatim/Places) y la máquina de estados de barrios llegan en la
/// etapa 5; acá está la persistencia offline-first y las reglas puras.
class RepoGeografia {
  RepoGeografia(this._db, this._cola, {DateTime Function()? ahora})
    : _ahora = ahora ?? DateTime.now;

  final BaseDatos _db;
  final ColaSync _cola;
  final DateTime Function() _ahora;
  static const _uuid = Uuid();

  /// Límites de un polígono de barrio (§6.2).
  static const minVertices = 4;
  static const maxAreaKm2 = 25.0;

  /// Crea un barrio PROPUESTO local (§6.3) y lo encola. Ningún barrio
  /// propuesto bloquea a nadie: se puede reportar desde el momento cero.
  Future<Result<Neighborhood>> crearBarrio({
    required String cityId,
    required String nombre,
    required List<({double lat, double lng})> poligono,
    String? createdBy,
    String? validationSource,
    Map<String, dynamic>? validationPayload,
  }) async {
    if (poligono.length < minVertices) {
      return const Err(
        ValidationFailure(
          'El polígono necesita al menos 4 vértices. Marcá las esquinas '
          'de tu barrio en el mapa.',
        ),
      );
    }
    final area = areaKm2(poligono);
    if (area > maxAreaKm2) {
      return Err(
        ValidationFailure(
          'El área marcada (${area.toStringAsFixed(1)} km²) supera el máximo '
          'de 25 km². Un barrio es más chico: ajustá el polígono.',
        ),
      );
    }

    final id = _uuid.v4();
    final ahora = _ahora();
    final centroide = _centroide(poligono);
    await _db.transaction(() async {
      await _db
          .into(_db.neighborhoods)
          .insert(
            NeighborhoodsCompanion.insert(
              id: id,
              cityId: cityId,
              name: nombre,
              nameNormalized: normalizar(nombre),
              polygon: jsonEncode([
                for (final p in poligono) [p.lat, p.lng],
              ]),
              centroidLat: centroide.lat,
              centroidLng: centroide.lng,
              areaKm2: area,
              status: NeighborhoodStatus.propuesto,
              createdBy: Value(createdBy),
              createdAt: ahora,
              validationSource: Value(validationSource),
              validationPayload: Value(
                validationPayload == null
                    ? null
                    : jsonEncode(validationPayload),
              ),
              clientUuid: id,
              updatedAt: ahora,
            ),
          );
      await _cola.encolar(
        entity: 'neighborhood',
        entityId: id,
        operation: 'crear',
        payload: {
          'id': id,
          'city_id': cityId,
          'name': nombre,
          'polygon': [
            for (final p in poligono) [p.lat, p.lng],
          ],
          'validation_source': validationSource,
          'validation_payload': validationPayload,
          'created_at': ahora.toIso8601String(),
        },
      );
    });

    final creado = await (_db.select(
      _db.neighborhoods,
    )..where((t) => t.id.equals(id))).getSingle();
    return Ok(creado);
  }

  /// Búsqueda local por nombre (el buscador jerárquico completo, con
  /// autocompletado remoto, llega en la etapa 5).
  Future<List<Neighborhood>> buscarBarrios(String consulta) {
    final q = normalizar(consulta);
    return (_db.select(_db.neighborhoods)
          ..where(
            (t) =>
                t.nameNormalized.like('%$q%') &
                t.status.isNotIn([
                  NeighborhoodStatus.rechazado.name,
                  NeighborhoodStatus.fusionado.name,
                ]),
          )
          ..orderBy([(t) => OrderingTerm.desc(t.verifiedUserCount)]))
        .get();
  }

  /// ¿Qué barrio local contiene este punto? (resolve local; el endpoint
  /// remoto /geo/resolve llega con el backend).
  Future<Neighborhood?> resolver(double lat, double lng) async {
    final todos = await _db.select(_db.neighborhoods).get();
    for (final b in todos) {
      final crudo = (jsonDecode(b.polygon) as List<dynamic>)
          .cast<List<dynamic>>();
      final poligono = [
        for (final par in crudo)
          (lat: (par[0] as num).toDouble(), lng: (par[1] as num).toDouble()),
      ];
      if (Geodesia.puntoEnPoligono(lat, lng, poligono)) return b;
    }
    return null;
  }

  Stream<Neighborhood?> watchBarrio(String id) => (_db.select(
    _db.neighborhoods,
  )..where((t) => t.id.equals(id))).watchSingleOrNull();

  /// Normalización para búsqueda y detección de duplicados (§6.4).
  static String normalizar(String nombre) => nombre
      .toLowerCase()
      .trim()
      .replaceAll(RegExp('[áàä]'), 'a')
      .replaceAll(RegExp('[éèë]'), 'e')
      .replaceAll(RegExp('[íìï]'), 'i')
      .replaceAll(RegExp('[óòö]'), 'o')
      .replaceAll(RegExp('[úùü]'), 'u')
      .replaceAll('ñ', 'n')
      .replaceAll(RegExp(r'\s+'), ' ');

  /// Área aproximada del polígono en km² (fórmula del zapato de cordones
  /// sobre proyección local — suficiente para el límite de 25 km²).
  static double areaKm2(List<({double lat, double lng})> poligono) {
    if (poligono.length < 3) return 0;
    final latRef = poligono.first.lat;
    const mPorGradoLat = 111320.0;
    final mPorGradoLng = 111320.0 * math.cos(latRef * math.pi / 180).abs();
    var suma = 0.0;
    for (var i = 0; i < poligono.length; i++) {
      final a = poligono[i];
      final b = poligono[(i + 1) % poligono.length];
      final xa = a.lng * mPorGradoLng, ya = a.lat * mPorGradoLat;
      final xb = b.lng * mPorGradoLng, yb = b.lat * mPorGradoLat;
      suma += xa * yb - xb * ya;
    }
    return (suma.abs() / 2) / 1e6;
  }

  static ({double lat, double lng}) _centroide(
    List<({double lat, double lng})> poligono,
  ) {
    var lat = 0.0, lng = 0.0;
    for (final p in poligono) {
      lat += p.lat;
      lng += p.lng;
    }
    return (lat: lat / poligono.length, lng: lng / poligono.length);
  }
}
