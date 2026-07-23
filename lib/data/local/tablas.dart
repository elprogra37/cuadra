// Esquema local Drift (§19). SQLite es LA fuente de verdad del cliente
// (§20.2): la red es un detalle de sincronización.
//
// Los nombres de tablas y columnas están en inglés porque son contrato 1:1
// con el esquema Postgres del servidor; los comentarios, en español.
import 'package:drift/drift.dart';

import '../models/enums.dart';

// ── Mixin de sincronización ─────────────────────────────────────────────

/// Columnas comunes de todo registro creado localmente que viaja al servidor.
mixin Sincronizable on Table {
  /// Idempotencia: el servidor deduplica por este uuid (§20.2).
  TextColumn get clientUuid => text()();

  /// Estado de sincronización visible por ítem en la UI (§20.2).
  TextColumn get syncStatus =>
      textEnum<SyncStatus>().withDefault(Constant(SyncStatus.pendiente.name))();

  /// Última modificación local (last-write-wins salvo contadores).
  DateTimeColumn get updatedAt => dateTime()();
}

// ── Geografía ───────────────────────────────────────────────────────────

class Countries extends Table {
  /// ISO 3166-1 alpha-2.
  TextColumn get id => text().withLength(min: 2, max: 2)();
  TextColumn get name => text()();
  TextColumn get defaultLanguage => text()();
  TextColumn get defaultTimezone => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Regions extends Table {
  TextColumn get id => text()();
  TextColumn get countryId => text().references(Countries, #id)();
  TextColumn get name => text()();
  IntColumn get geonamesId => integer().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Cities extends Table {
  TextColumn get id => text()();
  TextColumn get regionId => text().references(Regions, #id)();
  TextColumn get name => text()();
  IntColumn get geonamesId => integer().nullable()();

  /// Null hasta que la ciudad tenga ficha jurisdiccional cargada:
  /// el barrio funciona en "modo solo comunidad" (§6.5).
  TextColumn get jurisdictionId => text().nullable()();
  IntColumn get osmRelationId => integer().nullable()();
  IntColumn get population => integer().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Neighborhoods extends Table with Sincronizable {
  TextColumn get id => text()();
  TextColumn get cityId => text().references(Cities, #id)();
  TextColumn get name => text()();
  TextColumn get nameNormalized => text()();

  /// JSON: lista de alias de búsqueda (barrios fusionados).
  TextColumn get aliases => text().withDefault(const Constant('[]'))();

  /// JSON: polígono [[lat,lng],...] SRID 4326. La geometría "de verdad"
  /// (PostGIS) vive en el servidor; acá alcanza para dibujar y contener.
  TextColumn get polygon => text()();
  RealColumn get centroidLat => real()();
  RealColumn get centroidLng => real()();
  RealColumn get areaKm2 => real()();
  TextColumn get status => textEnum<NeighborhoodStatus>()();
  TextColumn get createdBy => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  /// google_places | osm | manual (§6.2).
  TextColumn get validationSource => text().nullable()();

  /// JSON crudo de la validación externa.
  TextColumn get validationPayload => text().nullable()();
  IntColumn get verifiedUserCount => integer().withDefault(const Constant(0))();
  IntColumn get caseCount => integer().withDefault(const Constant(0))();

  /// Id del barrio canónico si este quedó fusionado (§6.4).
  TextColumn get mergedInto => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Jurisdictions extends Table {
  TextColumn get id => text()();
  TextColumn get countryId => text()();
  TextColumn get name => text()();
  TextColumn get timezone => text()();
  TextColumn get language => text()();
  IntColumn get defaultResponseDays => integer()();

  /// JSON: ficha completa (§14.3) — organismos, canales, plantillas.
  TextColumn get config => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

// ── Catálogo ────────────────────────────────────────────────────────────

class Categories extends Table {
  TextColumn get id => text()();

  /// global | national | local (§8.2).
  TextColumn get scope => text()();
  TextColumn get countryId => text().nullable()();

  /// JSON TextoI18n.
  TextColumn get nameI18n => text()();
  TextColumn get icon => text()();
  IntColumn get orderIndex => integer()();

  /// JSON: árbol de preguntas guiadas (§9), CategoriaDef completo.
  TextColumn get guidedTree => text()();
  TextColumn get templateKey => text()();

  /// active | candidate | retired.
  TextColumn get status => text().withDefault(const Constant('active'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class CategoryProposals extends Table with Sincronizable {
  TextColumn get id => text()();
  TextColumn get caseId => text()();
  TextColumn get countryId => text()();

  /// Etiqueta corta, máx. 40 caracteres, filtrada (§8.4).
  TextColumn get rawLabel => text().withLength(max: 40)();

  /// JSON: campos guiados (sobre qué / dónde / frecuencia).
  TextColumn get structuredAnswers => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

// ── Casos ───────────────────────────────────────────────────────────────

class Cases extends Table with Sincronizable {
  TextColumn get id => text()();

  /// Referencia corta compartible (#4417). La asigna el servidor; local
  /// queda null hasta sincronizar.
  TextColumn get publicRef => text().nullable()();
  TextColumn get neighborhoodId => text().references(Neighborhoods, #id)();
  TextColumn get cityId => text().nullable()();
  TextColumn get jurisdictionId => text().nullable()();
  TextColumn get categoryId => text()();
  TextColumn get subtypeId => text()();

  /// JSON: selecciones del árbol guiado {preguntaId: opcionId | [opcionId]}.
  TextColumn get guidedAnswers => text()();

  /// Único campo libre: opcional, máx. 200 caracteres, filtrado (§9.5).
  TextColumn get freeText => text().withLength(max: 200).nullable()();

  /// El escrito redactado por la app (§9.3).
  TextColumn get generatedBody => text().withDefault(const Constant(''))();
  TextColumn get status => textEnum<CaseStatus>()();
  IntColumn get severityComputed => integer().withDefault(const Constant(0))();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  TextColumn get geohash => text()();
  TextColumn get addressText => text().nullable()();

  /// Si el pin se desplazó hasta 25 m por caer sobre un domicilio (§19).
  BoolColumn get pinOffsetApplied =>
      boolean().withDefault(const Constant(false))();
  TextColumn get createdBy => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  /// Desde cuándo ocurre el problema (respuesta guiada, no fecha exacta).
  TextColumn get occurredSince => text().nullable()();
  TextColumn get organismId => text().nullable()();
  DateTimeColumn get submittedAt => dateTime().nullable()();
  DateTimeColumn get deadlineAt => dateTime().nullable()();
  DateTimeColumn get resolvedAt => dateTime().nullable()();

  /// Contadores: autoridad del servidor (§20.2). Localmente solo caché.
  IntColumn get endorsementCount => integer().withDefault(const Constant(0))();
  IntColumn get verifiedEndorsementCount =>
      integer().withDefault(const Constant(0))();
  IntColumn get evidenceCount => integer().withDefault(const Constant(0))();
  IntColumn get disputeCount => integer().withDefault(const Constant(0))();
  TextColumn get moderationStatus => text().nullable()();
  TextColumn get moderationNotes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Evidences extends Table with Sincronizable {
  TextColumn get id => text()();
  TextColumn get caseId => text().references(Cases, #id)();
  TextColumn get type => textEnum<EvidenceType>()();

  /// Ruta local del archivo hasta subir; URL remota después.
  TextColumn get localPath => text().nullable()();
  TextColumn get storageUrl => text().nullable()();
  TextColumn get thumbUrl => text().nullable()();

  /// Hash al momento de captura (§10.2): nadie puede decir "eso es reciente".
  TextColumn get sha256 => text()();
  DateTimeColumn get capturedAt => dateTime()();
  RealColumn get lat => real().nullable()();
  RealColumn get lng => real().nullable()();
  TextColumn get uploadedBy => text().nullable()();
  BoolColumn get exifStripped => boolean().withDefault(const Constant(false))();
  BoolColumn get facesBlurred => boolean().withDefault(const Constant(false))();

  /// JSON: puntajes del clasificador (§10.1).
  TextColumn get classifierScores => text().nullable()();
  TextColumn get moderationStatus => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Endorsements extends Table with Sincronizable {
  TextColumn get id => text()();
  TextColumn get caseId => text().references(Cases, #id)();
  TextColumn get userId => text()();
  DateTimeColumn get createdAt => dateTime()();

  /// JSON: lista de ImpactTag.name (§11, opciones cerradas).
  TextColumn get impactTags => text().withDefault(const Constant('[]'))();

  /// Solo Verificado firma formalmente (§7).
  BoolColumn get countsAsFormalSignature =>
      boolean().withDefault(const Constant(false))();

  /// Dentro del polígono o no: las de afuera se muestran aparte (§22).
  BoolColumn get isResident => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class CaseActions extends Table with Sincronizable {
  TextColumn get id => text()();
  TextColumn get caseId => text().references(Cases, #id)();
  TextColumn get type => textEnum<CaseActionType>()();
  TextColumn get performedBy => text().nullable()();
  DateTimeColumn get performedAt => dateTime()();

  /// email | form | open311 | pdf (§14.2).
  TextColumn get channel => text().nullable()();
  TextColumn get documentUrl => text().nullable()();
  TextColumn get receiptRef => text().nullable()();
  TextColumn get externalRef => text().nullable()();
  TextColumn get payload => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class OfficialResponses extends Table {
  TextColumn get id => text()();
  TextColumn get caseId => text().references(Cases, #id)();
  TextColumn get organismId => text()();
  DateTimeColumn get receivedAt => dateTime()();
  TextColumn get content => text()();
  TextColumn get documentUrl => text().nullable()();
  BoolColumn get isResolution => boolean().withDefault(const Constant(false))();
  TextColumn get registeredBy => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Resolutions extends Table with Sincronizable {
  TextColumn get id => text()();
  TextColumn get caseId => text().references(Cases, #id)();
  TextColumn get afterPhotoId => text().nullable()();
  TextColumn get claimedBy => text()();
  DateTimeColumn get claimedAt => dateTime()();

  /// JSON: [{userId, at}] — hacen falta 2 confirmaciones (§11).
  TextColumn get confirmations => text().withDefault(const Constant('[]'))();
  DateTimeColumn get confirmedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

// ── Usuario ─────────────────────────────────────────────────────────────

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get homeNeighborhoodId => text().nullable()();

  /// Geohash de 7 caracteres (~150 m). Nunca dirección exacta (§19).
  TextColumn get homeGeohash => text().withLength(max: 7).nullable()();
  TextColumn get role => textEnum<UserRole>()();
  IntColumn get verificationLevel => integer().withDefault(const Constant(0))();
  IntColumn get gpsPresenceDays => integer().withDefault(const Constant(0))();
  TextColumn get notificationPrefs =>
      text().withDefault(const Constant('{}'))();
  TextColumn get locale => text().withDefault(const Constant('es'))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

// ── Cola de sincronización (§20.2) ──────────────────────────────────────

class SyncOps extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// case | evidence | endorsement | neighborhood | ...
  TextColumn get entity => text()();

  /// Id local (uuid) de la entidad.
  TextColumn get entityId => text()();

  /// Idempotencia contra el servidor.
  TextColumn get clientUuid => text().unique()();

  /// crear | actualizar | borrar.
  TextColumn get operation => text()();

  /// JSON del cuerpo a enviar.
  TextColumn get payload => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextAttemptAt => dateTime()();
  TextColumn get lastError => text().nullable()();
  TextColumn get status =>
      textEnum<SyncStatus>().withDefault(Constant(SyncStatus.pendiente.name))();
}
