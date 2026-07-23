import 'package:drift/drift.dart';

// El part generado resuelve los enums de dominio con los imports de ESTE
// archivo: enums.dart tiene que estar acá aunque el editor lo marque sin uso
// directo.
import '../models/enums.dart';
import 'tablas.dart';

part 'base_datos.g.dart';

/// Base local de Cuadra. Fuente de verdad del cliente (§20.2): la UI lee
/// SIEMPRE de acá; la SyncQueue empuja los cambios al servidor cuando puede.
@DriftDatabase(
  tables: [
    Countries,
    Regions,
    Cities,
    Neighborhoods,
    Jurisdictions,
    Categories,
    CategoryProposals,
    Cases,
    Evidences,
    Endorsements,
    CaseActions,
    OfficialResponses,
    Resolutions,
    Users,
    SyncOps,
  ],
)
class BaseDatos extends _$BaseDatos {
  BaseDatos(super.executor);

  /// Migraciones versionadas (§25 etapa 3). v1 = esquema inicial completo.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      // Índices de consulta local: feed por barrio/estado y dedup por
      // geohash (§10.3), cola por vencimiento.
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_cases_neighborhood '
        'ON cases (neighborhood_id, status)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_cases_geohash ON cases (geohash)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_sync_ops_due '
        'ON sync_ops (status, next_attempt_at)',
      );
    },
    onUpgrade: (m, from, to) async {
      // Las migraciones futuras se encadenan acá por versión.
    },
  );
}
