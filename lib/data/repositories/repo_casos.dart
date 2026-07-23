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
  /// primero, después por fecha. El orden se explica en una frase (§25.6):
  /// "lo pendiente arriba, lo más nuevo primero".
  Stream<List<Case>> watchCasosDeBarrio(String neighborhoodId) {
    final q = _db.select(_db.cases)
      ..where((t) => t.neighborhoodId.equals(neighborhoodId));
    return q.watch().map((casos) => ordenarFeed(casos));
  }

  /// Orden del feed, puro y testeable.
  static List<Case> ordenarFeed(List<Case> casos) {
    final visibles = casos.where((c) => c.status.visibleEnFeed).toList()
      ..sort((a, b) {
        if (a.status.esperaAccion != b.status.esperaAccion) {
          return a.status.esperaAccion ? -1 : 1;
        }
        return b.createdAt.compareTo(a.createdAt);
      });
    return visibles;
  }

  Stream<Case?> watchCaso(String id) => (_db.select(
    _db.cases,
  )..where((t) => t.id.equals(id))).watchSingleOrNull();

  Stream<List<Evidence>> watchEvidencias(String caseId) =>
      (_db.select(_db.evidences)
            ..where((t) => t.caseId.equals(caseId))
            ..orderBy([(t) => OrderingTerm.asc(t.capturedAt)]))
          .watch();

  /// ¿Este usuario ya adhirió? (para el botón de acción siguiente).
  Future<bool> yaAdhirio({required String caseId, required String userId}) =>
      (_db.select(_db.endorsements)
            ..where((t) => t.caseId.equals(caseId) & t.userId.equals(userId)))
          .getSingleOrNull()
          .then((e) => e != null);

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

  Stream<List<CaseAction>> watchAcciones(String caseId) =>
      (_db.select(_db.caseActions)
            ..where((t) => t.caseId.equals(caseId))
            ..orderBy([(t) => OrderingTerm.asc(t.performedAt)]))
          .watch();

  /// Presenta el caso ante el organismo (§14): arranca el reloj legal.
  Future<Result<void>> presentar({
    required String caseId,
    required String jurisdictionId,
    required String organismId,
    required int responseDays,
    required String generatedBody,
    String channel = 'pdf',
    String? documentUrl,
    String? performedBy,
  }) async {
    final ahora = _ahora();
    final id = _uuid.v4();
    await _db.transaction(() async {
      await (_db.update(_db.cases)..where((t) => t.id.equals(caseId))).write(
        CasesCompanion(
          status: const Value(CaseStatus.presentado),
          submittedAt: Value(ahora),
          deadlineAt: Value(ahora.add(Duration(days: responseDays))),
          organismId: Value(organismId),
          jurisdictionId: Value(jurisdictionId),
          generatedBody: Value(generatedBody),
          updatedAt: Value(ahora),
          syncStatus: const Value(SyncStatus.pendiente),
        ),
      );
      await _db
          .into(_db.caseActions)
          .insert(
            CaseActionsCompanion.insert(
              id: id,
              caseId: caseId,
              type: CaseActionType.presentar,
              performedBy: Value(performedBy),
              performedAt: ahora,
              channel: Value(channel),
              documentUrl: Value(documentUrl),
              clientUuid: id,
              updatedAt: ahora,
            ),
          );
      await _cola.encolar(
        entity: 'case_action',
        entityId: id,
        operation: 'crear',
        payload: {
          'id': id,
          'case_id': caseId,
          'type': CaseActionType.presentar.name,
          'channel': channel,
          'organism_id': organismId,
          'performed_at': ahora.toIso8601String(),
        },
      );
    });
    return const Ok(null);
  }

  /// Registra un escalón de la escalera (§13). La reiteración renueva el
  /// plazo (+15 días) y vuelve el caso a `presentado`.
  Future<Result<void>> escalar({
    required String caseId,
    required CaseActionType tipo,
    String channel = 'pdf',
    String? documentUrl,
    String? performedBy,
    int diasReiteracion = 15,
  }) async {
    if (tipo == CaseActionType.presentar) {
      return const Err(
        ValidationFailure('La presentación inicial va por presentar().'),
      );
    }
    final ahora = _ahora();
    final id = _uuid.v4();
    await _db.transaction(() async {
      if (tipo == CaseActionType.reiterar) {
        await (_db.update(_db.cases)..where((t) => t.id.equals(caseId))).write(
          CasesCompanion(
            status: const Value(CaseStatus.presentado),
            deadlineAt: Value(ahora.add(Duration(days: diasReiteracion))),
            updatedAt: Value(ahora),
          ),
        );
      }
      await _db
          .into(_db.caseActions)
          .insert(
            CaseActionsCompanion.insert(
              id: id,
              caseId: caseId,
              type: tipo,
              performedBy: Value(performedBy),
              performedAt: ahora,
              channel: Value(channel),
              documentUrl: Value(documentUrl),
              clientUuid: id,
              updatedAt: ahora,
            ),
          );
      await _cola.encolar(
        entity: 'case_action',
        entityId: id,
        operation: 'crear',
        payload: {
          'id': id,
          'case_id': caseId,
          'type': tipo.name,
          'channel': channel,
          'performed_at': ahora.toIso8601String(),
        },
      );
    });
    return const Ok(null);
  }

  /// Job local `check_deadlines` (§21): marca vencidos. El servidor corre el
  /// suyo con autoridad; esto mantiene el contador honesto sin conexión.
  Future<int> marcarVencidos() async {
    final ahora = _ahora();
    final vencidos =
        await (_db.select(_db.cases)..where(
              (t) =>
                  t.status.equals(CaseStatus.presentado.name) &
                  t.deadlineAt.isSmallerThanValue(ahora),
            ))
            .get();
    for (final c in vencidos) {
      await (_db.update(_db.cases)..where((t) => t.id.equals(c.id))).write(
        CasesCompanion(
          status: const Value(CaseStatus.sinRespuesta),
          updatedAt: Value(ahora),
        ),
      );
    }
    return vencidos.length;
  }

  /// Marca resuelto (§11): foto del después + confirmación de otros 2.
  /// El que reclama no confirma; el caso queda EN EJECUCIÓN hasta juntar 2.
  Future<Result<void>> reclamarResuelto({
    required String caseId,
    required String userId,
    String? fotoDespuesPath,
    String? sha256Foto,
  }) async {
    final existente = await (_db.select(
      _db.resolutions,
    )..where((t) => t.caseId.equals(caseId))).getSingleOrNull();
    if (existente != null) {
      return const Err(
        ValidationFailure('Este caso ya tiene una resolución en curso.'),
      );
    }
    final ahora = _ahora();
    final id = _uuid.v4();
    String? evidenciaId;
    await _db.transaction(() async {
      if (fotoDespuesPath != null && sha256Foto != null) {
        evidenciaId = _uuid.v4();
        await _db
            .into(_db.evidences)
            .insert(
              EvidencesCompanion.insert(
                id: evidenciaId!,
                caseId: caseId,
                type: EvidenceType.foto,
                localPath: Value(fotoDespuesPath),
                sha256: sha256Foto,
                capturedAt: ahora,
                uploadedBy: Value(userId),
                exifStripped: const Value(true),
                clientUuid: evidenciaId!,
                updatedAt: ahora,
              ),
            );
      }
      await _db
          .into(_db.resolutions)
          .insert(
            ResolutionsCompanion.insert(
              id: id,
              caseId: caseId,
              afterPhotoId: Value(evidenciaId),
              claimedBy: userId,
              claimedAt: ahora,
              clientUuid: id,
              updatedAt: ahora,
            ),
          );
      await (_db.update(_db.cases)..where((t) => t.id.equals(caseId))).write(
        CasesCompanion(
          status: const Value(CaseStatus.enEjecucion),
          updatedAt: Value(ahora),
        ),
      );
      await _cola.encolar(
        entity: 'resolution',
        entityId: id,
        operation: 'crear',
        payload: {
          'id': id,
          'case_id': caseId,
          'claimed_by': userId,
          'claimed_at': ahora.toIso8601String(),
        },
      );
    });
    return const Ok(null);
  }

  /// Confirmación de resolución por otro vecino. A las 2 confirmaciones el
  /// caso pasa a RESUELTO (§11) — la recompensa del producto entero.
  Future<Result<void>> confirmarResuelto({
    required String caseId,
    required String userId,
  }) async {
    final resolucion = await (_db.select(
      _db.resolutions,
    )..where((t) => t.caseId.equals(caseId))).getSingleOrNull();
    if (resolucion == null) {
      return const Err(NotFoundFailure('Nadie marcó este caso como resuelto.'));
    }
    if (resolucion.claimedBy == userId) {
      return const Err(
        ValidationFailure(
          'La confirmación tiene que venir de otro vecino, no de quien '
          'lo marcó.',
        ),
      );
    }
    final confirmaciones =
        (jsonDecode(resolucion.confirmations) as List<dynamic>)
            .cast<Map<String, dynamic>>();
    if (confirmaciones.any((c) => c['userId'] == userId)) {
      return const Err(ValidationFailure('Ya confirmaste esta resolución.'));
    }

    final ahora = _ahora();
    confirmaciones.add({'userId': userId, 'at': ahora.toIso8601String()});
    final completo = confirmaciones.length >= 2;

    await _db.transaction(() async {
      await (_db.update(
        _db.resolutions,
      )..where((t) => t.id.equals(resolucion.id))).write(
        ResolutionsCompanion(
          confirmations: Value(jsonEncode(confirmaciones)),
          confirmedAt: completo ? Value(ahora) : const Value.absent(),
          updatedAt: Value(ahora),
          syncStatus: const Value(SyncStatus.pendiente),
        ),
      );
      if (completo) {
        await (_db.update(_db.cases)..where((t) => t.id.equals(caseId))).write(
          CasesCompanion(
            status: const Value(CaseStatus.resuelto),
            resolvedAt: Value(ahora),
            updatedAt: Value(ahora),
          ),
        );
      }
      await _cola.encolar(
        entity: 'resolution',
        entityId: resolucion.id,
        operation: 'actualizar',
        payload: {
          'id': resolucion.id,
          'confirmations': confirmaciones,
          'confirmed_at': completo ? ahora.toIso8601String() : null,
        },
      );
    });
    return const Ok(null);
  }

  Stream<Resolution?> watchResolucion(String caseId) => (_db.select(
    _db.resolutions,
  )..where((t) => t.caseId.equals(caseId))).watchSingleOrNull();

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
