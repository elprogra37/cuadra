import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../core/errors/failures.dart';
import '../../core/errors/result.dart';
import '../../core/utils/geodesia.dart';
import '../../core/utils/geohash.dart';
import '../local/base_datos.dart';
import '../models/enums.dart';
import '../sync/cola_sync.dart';

/// Repositorio de casos, offline-first (§20.2): escribe en Drift y encola la
/// sincronización; la UI lee siempre streams locales.
class RepoCasos {
  RepoCasos(this._db, this._cola, {DateTime Function()? ahora})
    : _ahora = ahora ?? DateTime.now;

  final BaseDatos _db;
  final ColaSync _cola;
  final DateTime Function() _ahora;
  static const _uuid = Uuid();

  /// Radio y ventana de deduplicación (§10.3).
  static const dedupRadioMetros = 80.0;
  static const dedupVentana = Duration(days: 30);

  /// Rate limit local (§10.3): 5 casos nuevos por día por usuario.
  static const maxCasosPorDia = 5;

  /// Crea un caso local en estado abierto y lo encola para sincronizar.
  Future<Result<Case>> crearCaso({
    required String neighborhoodId,
    required String categoryId,
    required String subtypeId,
    required Map<String, dynamic> guidedAnswers,
    required double lat,
    required double lng,
    String? freeText,
    String? occurredSince,
    String? createdBy,
    String? addressText,
    String generatedBody = '',
    bool pinSobreDomicilio = false,
  }) async {
    final creadosHoy = await _casosCreadosDesde(
      _ahora().subtract(const Duration(days: 1)),
      createdBy,
    );
    if (creadosHoy >= maxCasosPorDia) {
      return const Err(
        ValidationFailure(
          'Llegaste al máximo de 5 casos por día. Los reportes existentes '
          'se fortalecen con adhesiones y evidencia.',
        ),
      );
    }

    var latFinal = lat;
    var lngFinal = lng;
    final id = _uuid.v4();
    if (pinSobreDomicilio) {
      // Desplazamiento aleatorio pero estable hasta 25 m (§19).
      final d = Geodesia.desplazar(lat, lng, semilla: id.hashCode);
      latFinal = d.lat;
      lngFinal = d.lng;
    }

    final ahora = _ahora();
    final fila = CasesCompanion.insert(
      id: id,
      neighborhoodId: neighborhoodId,
      categoryId: categoryId,
      subtypeId: subtypeId,
      guidedAnswers: jsonEncode(guidedAnswers),
      freeText: Value(freeText),
      generatedBody: Value(generatedBody),
      occurredSince: Value(occurredSince),
      status: CaseStatus.abierto,
      lat: latFinal,
      lng: lngFinal,
      geohash: Geohash.codificar(latFinal, lngFinal, precision: 9),
      addressText: Value(addressText),
      pinOffsetApplied: Value(pinSobreDomicilio),
      createdBy: Value(createdBy),
      createdAt: ahora,
      clientUuid: id,
      updatedAt: ahora,
    );

    await _db.transaction(() async {
      await _db.into(_db.cases).insert(fila);
      await _cola.encolar(
        entity: 'case',
        entityId: id,
        operation: 'crear',
        payload: {
          'id': id,
          'neighborhood_id': neighborhoodId,
          'category_id': categoryId,
          'subtype_id': subtypeId,
          'guided_answers': guidedAnswers,
          'free_text': freeText,
          'occurred_since': occurredSince,
          'lat': latFinal,
          'lng': lngFinal,
          'address_text': addressText,
          'generated_body': generatedBody,
          'pin_offset_applied': pinSobreDomicilio,
          'created_at': ahora.toIso8601String(),
        },
      );
    });

    final creado = await (_db.select(
      _db.cases,
    )..where((t) => t.id.equals(id))).getSingle();
    return Ok(creado);
  }

  /// Casos abiertos cerca de un punto, misma categoría, últimos 30 días:
  /// la app ofrece sumarse en vez de duplicar (§10.3). Se filtra primero por
  /// prefijo de geohash (celda ~±600 m) y después por distancia real.
  Future<List<Case>> similaresCerca({
    required double lat,
    required double lng,
    required String categoryId,
  }) async {
    final prefijo = Geohash.codificar(lat, lng, precision: 6);
    final desde = _ahora().subtract(dedupVentana);
    final candidatos =
        await (_db.select(_db.cases)..where(
              (t) =>
                  t.categoryId.equals(categoryId) &
                  t.geohash.like('$prefijo%') &
                  t.createdAt.isBiggerOrEqualValue(desde) &
                  t.status.isNotIn([
                    CaseStatus.archivado.name,
                    CaseStatus.rechazado.name,
                    CaseStatus.fusionado.name,
                  ]),
            ))
            .get();
    return candidatos
        .where(
          (c) =>
              Geodesia.distanciaMetros(lat, lng, c.lat, c.lng) <=
              dedupRadioMetros,
        )
        .toList();
  }

  /// Feed de la cuadra: casos visibles del barrio, los que esperan acción
  /// primero, después por fecha. El orden se explica en una frase (§25.6).
  Stream<List<Case>> watchCasosDeBarrio(String neighborhoodId) {
    final q = _db.select(_db.cases)
      ..where((t) => t.neighborhoodId.equals(neighborhoodId))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);
    return q.watch().map(
      (casos) => casos.where((c) => c.status.visibleEnFeed).toList(),
    );
  }

  Stream<Case?> watchCaso(String id) => (_db.select(
    _db.cases,
  )..where((t) => t.id.equals(id))).watchSingleOrNull();

  /// Adhesión (§11): un toque. El contador local es caché optimista; la
  /// autoridad del número es el servidor (§20.2).
  Future<Result<void>> adherir({
    required String caseId,
    required String userId,
    List<ImpactTag> impacto = const [],
    bool esResidente = false,
    bool firmaFormal = false,
  }) async {
    final existente =
        await (_db.select(_db.endorsements)
              ..where((t) => t.caseId.equals(caseId) & t.userId.equals(userId)))
            .getSingleOrNull();
    if (existente != null) {
      return const Err(ValidationFailure('Ya adheriste a este caso.'));
    }

    final id = _uuid.v4();
    final ahora = _ahora();
    await _db.transaction(() async {
      await _db
          .into(_db.endorsements)
          .insert(
            EndorsementsCompanion.insert(
              id: id,
              caseId: caseId,
              userId: userId,
              createdAt: ahora,
              impactTags: Value(jsonEncode([for (final t in impacto) t.name])),
              countsAsFormalSignature: Value(firmaFormal),
              isResident: Value(esResidente),
              clientUuid: id,
              updatedAt: ahora,
            ),
          );
      await _db.customStatement(
        'UPDATE cases SET endorsement_count = endorsement_count + 1 '
        'WHERE id = ?',
        [caseId],
      );
      if (firmaFormal) {
        await _db.customStatement(
          'UPDATE cases SET verified_endorsement_count = '
          'verified_endorsement_count + 1 WHERE id = ?',
          [caseId],
        );
      }
      await _cola.encolar(
        entity: 'endorsement',
        entityId: id,
        operation: 'crear',
        payload: {
          'id': id,
          'case_id': caseId,
          'user_id': userId,
          'impact_tags': [for (final t in impacto) t.name],
          'is_resident': esResidente,
          'created_at': ahora.toIso8601String(),
        },
      );
    });
    return const Ok(null);
  }

  /// Registra la evidencia principal ya procesada (sin EXIF, hasheada §10.2)
  /// y la encola. El archivo vive en [localPath] hasta que Storage la reciba.
  Future<Result<void>> agregarEvidencia({
    required String caseId,
    required String localPath,
    required String sha256,
    double? lat,
    double? lng,
    String? uploadedBy,
  }) async {
    final id = _uuid.v4();
    final ahora = _ahora();
    await _db.transaction(() async {
      await _db
          .into(_db.evidences)
          .insert(
            EvidencesCompanion.insert(
              id: id,
              caseId: caseId,
              type: EvidenceType.foto,
              localPath: Value(localPath),
              sha256: sha256,
              capturedAt: ahora,
              lat: Value(lat),
              lng: Value(lng),
              uploadedBy: Value(uploadedBy),
              exifStripped: const Value(true),
              clientUuid: id,
              updatedAt: ahora,
            ),
          );
      await _db.customStatement(
        'UPDATE cases SET evidence_count = evidence_count + 1 WHERE id = ?',
        [caseId],
      );
      await _cola.encolar(
        entity: 'evidence',
        entityId: id,
        operation: 'crear',
        payload: {
          'id': id,
          'case_id': caseId,
          'sha256': sha256,
          'lat': lat,
          'lng': lng,
          'captured_at': ahora.toIso8601String(),
          'exif_stripped': true,
        },
      );
    });
    return const Ok(null);
  }

  Future<int> _casosCreadosDesde(DateTime desde, String? usuario) async {
    final cuenta = _db.cases.id.count();
    final q = _db.selectOnly(_db.cases)
      ..addColumns([cuenta])
      ..where(_db.cases.createdAt.isBiggerOrEqualValue(desde));
    if (usuario != null) {
      q.where(_db.cases.createdBy.equals(usuario));
    }
    final fila = await q.getSingle();
    return fila.read(cuenta) ?? 0;
  }
}
