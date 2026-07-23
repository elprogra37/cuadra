import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../local/base_datos.dart';
import '../models/enums.dart';
import 'cliente_remoto.dart';

/// Cola de sincronización offline-first (§20.2).
///
/// - Reintentos con backoff exponencial.
/// - Idempotencia por `client_uuid` (reintentar nunca duplica).
/// - Resolución de conflictos: last-write-wins, salvo contadores
///   (autoridad del servidor — los contadores locales son caché y se
///   pisan siempre con lo que diga el backend).
/// - Estado visible por ítem: cada entidad Sincronizable lleva su
///   `sync_status`, que esta cola mantiene al día.
class ColaSync {
  ColaSync(this._db, this._remoto, {DateTime Function()? ahora})
    : _ahora = ahora ?? DateTime.now;

  final BaseDatos _db;
  final ClienteRemoto _remoto;
  final DateTime Function() _ahora;
  static const _uuid = Uuid();

  /// Backoff exponencial: 30 s de base, duplica por intento, techo 1 h.
  static Duration backoffPara(int intentos) {
    final segundos = 30 * (1 << intentos.clamp(0, 7));
    return Duration(seconds: segundos.clamp(30, 3600));
  }

  /// Encola una operación. Se llama SIEMPRE dentro del mismo flujo que
  /// escribió el dato local: primero Drift, después la cola.
  Future<void> encolar({
    required String entity,
    required String entityId,
    required String operation,
    required Map<String, dynamic> payload,
  }) async {
    await _db
        .into(_db.syncOps)
        .insert(
          SyncOpsCompanion.insert(
            entity: entity,
            entityId: entityId,
            clientUuid: _uuid.v4(),
            operation: operation,
            payload: jsonEncode(payload),
            createdAt: _ahora(),
            nextAttemptAt: _ahora(),
          ),
        );
  }

  /// Operaciones listas para intentar (pendientes o con error, ya vencidas).
  Future<List<SyncOp>> vencidas() =>
      (_db.select(_db.syncOps)
            ..where(
              (t) =>
                  t.status.isIn([
                    SyncStatus.pendiente.name,
                    SyncStatus.error.name,
                  ]) &
                  t.nextAttemptAt.isSmallerOrEqualValue(_ahora()),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
          .get();

  /// Procesa todo lo vencido, en orden de creación (la causalidad importa:
  /// un caso viaja antes que sus adhesiones). Devuelve cuántas operaciones
  /// quedaron sincronizadas.
  Future<int> procesarPendientes() async {
    final ops = await vencidas();
    var exitosas = 0;
    for (final op in ops) {
      final resultado = await _remoto.enviar(
        OperacionSync(
          entity: op.entity,
          entityId: op.entityId,
          clientUuid: op.clientUuid,
          operation: op.operation,
          payload: op.payload,
        ),
      );

      await resultado.fold(
        (falla) async {
          final intentos = op.attempts + 1;
          await (_db.update(
            _db.syncOps,
          )..where((t) => t.id.equals(op.id))).write(
            SyncOpsCompanion(
              attempts: Value(intentos),
              nextAttemptAt: Value(_ahora().add(backoffPara(intentos))),
              lastError: Value(falla.message),
              status: const Value(SyncStatus.error),
            ),
          );
          await _marcarEntidad(op, SyncStatus.error);
        },
        (_) async {
          exitosas++;
          await (_db.delete(
            _db.syncOps,
          )..where((t) => t.id.equals(op.id))).go();
          await _marcarEntidad(op, SyncStatus.sincronizado);
        },
      );
    }
    return exitosas;
  }

  /// Cantidad de operaciones aún no sincronizadas (para mostrar en la UI).
  Stream<int> pendientesCount() {
    final cuenta = _db.syncOps.id.count();
    final q = _db.selectOnly(_db.syncOps)..addColumns([cuenta]);
    return q.watchSingle().map((row) => row.read(cuenta) ?? 0);
  }

  /// Refleja el estado de sincronización en la fila de la entidad, si la
  /// entidad lo soporta. El estado por ítem es requisito de §20.2.
  Future<void> _marcarEntidad(SyncOp op, SyncStatus estado) async {
    final tabla = switch (op.entity) {
      'case' => _db.cases as TableInfo<Table, Object?>?,
      'evidence' => _db.evidences,
      'endorsement' => _db.endorsements,
      'neighborhood' => _db.neighborhoods,
      'case_action' => _db.caseActions,
      'resolution' => _db.resolutions,
      'category_proposal' => _db.categoryProposals,
      _ => null,
    };
    if (tabla == null) return;
    await _db.customStatement(
      'UPDATE ${tabla.actualTableName} SET sync_status = ? WHERE id = ?',
      [estado.name, op.entityId],
    );
  }
}

/// Resolución de conflictos al bajar datos del servidor (§20.2).
///
/// last-write-wins por timestamp… salvo los campos contadores, donde la
/// autoridad es siempre el servidor (el conteo local es caché optimista).
abstract final class Conflictos {
  /// Campos en los que el servidor manda siempre, gane quien gane el LWW.
  static const contadores = {
    'endorsement_count',
    'verified_endorsement_count',
    'evidence_count',
    'dispute_count',
    'verified_user_count',
    'case_count',
  };

  /// ¿El valor local sobrevive? Solo si NO es contador y es más nuevo.
  static bool gananLocales({
    required String campo,
    required DateTime actualizadoLocal,
    required DateTime actualizadoRemoto,
  }) {
    if (contadores.contains(campo)) return false;
    return actualizadoLocal.isAfter(actualizadoRemoto);
  }
}
