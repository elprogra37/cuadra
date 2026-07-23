import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/desk/datos_panel.dart';
import '../services/documents/generador_pdf.dart';
import '../services/geografia/validador_toponimos.dart';
import 'local/base_datos.dart';
import 'local/conexion.dart';
import 'local/siembra_local.dart';
import 'models/enums.dart';
import 'repositories/repo_casos.dart';
import 'repositories/repo_categorias.dart';
import 'repositories/repo_geografia.dart';
import 'repositories/repo_jurisdicciones.dart';
import 'sync/cliente_remoto.dart';
import 'sync/cola_sync.dart';

/// Cableado de la capa de datos. La UI consume repos; nunca toca Drift ni
/// la red directamente (convención §25).

final baseDatosProvider = Provider<BaseDatos>((ref) {
  final db = BaseDatos(abrirConexion());
  ref.onDispose(db.close);
  return db;
});

/// Sin backend todavía (etapa 4): cliente nulo, todo queda en cola local.
final clienteRemotoProvider = Provider<ClienteRemoto>(
  (ref) => const ClienteRemotoNulo(),
);

final colaSyncProvider = Provider<ColaSync>(
  (ref) =>
      ColaSync(ref.watch(baseDatosProvider), ref.watch(clienteRemotoProvider)),
);

final repoCasosProvider = Provider<RepoCasos>(
  (ref) => RepoCasos(ref.watch(baseDatosProvider), ref.watch(colaSyncProvider)),
);

final repoGeografiaProvider = Provider<RepoGeografia>(
  (ref) =>
      RepoGeografia(ref.watch(baseDatosProvider), ref.watch(colaSyncProvider)),
);

final repoCategoriasProvider = Provider<RepoCategorias>(
  (ref) => RepoCategorias(rootBundle),
);

/// Operaciones sin sincronizar, para el indicador global de la UI.
final syncPendientesProvider = StreamProvider<int>(
  (ref) => ref.watch(colaSyncProvider).pendientesCount(),
);

/// Siembra geográfica mínima local (idempotente, primer arranque).
final siembraLocalProvider = FutureProvider<void>(
  (ref) => sembrarGeografiaLocal(ref.watch(baseDatosProvider)),
);

/// Validación externa de topónimos: Nominatim/OSM primero (§6.2); Google
/// Places como fallback cuando haya API key.
final validadorToponimosProvider = Provider<ValidadorToponimos>(
  (ref) => NominatimValidador(Dio()),
);

/// Un barrio observado en vivo desde la base local.
final barrioProvider = StreamProvider.family<Neighborhood?, String>(
  (ref, id) => ref.watch(repoGeografiaProvider).watchBarrio(id),
);

/// Feed de casos del barrio (pendiente arriba, más nuevo primero).
final casosDeBarrioProvider = StreamProvider.family<List<Case>, String>(
  (ref, barrioId) => ref.watch(repoCasosProvider).watchCasosDeBarrio(barrioId),
);

final casoProvider = StreamProvider.family<Case?, String>(
  (ref, id) => ref.watch(repoCasosProvider).watchCaso(id),
);

final evidenciasProvider = StreamProvider.family<List<Evidence>, String>(
  (ref, caseId) => ref.watch(repoCasosProvider).watchEvidencias(caseId),
);

final accionesProvider = StreamProvider.family<List<CaseAction>, String>(
  (ref, caseId) => ref.watch(repoCasosProvider).watchAcciones(caseId),
);

final resolucionProvider = StreamProvider.family<Resolution?, String>(
  (ref, caseId) => ref.watch(repoCasosProvider).watchResolucion(caseId),
);

final repoJurisdiccionesProvider = Provider<RepoJurisdicciones>(
  (ref) => RepoJurisdicciones(rootBundle),
);

final generadorPdfProvider = Provider<GeneradorPdf>(
  (ref) => GeneradorPdf(rootBundle),
);

/// Tareas de arranque: siembra local + job de vencimientos (§21
/// check_deadlines, versión local). Se observa desde la raíz de la app.
final arranqueProvider = FutureProvider<void>((ref) async {
  await ref.watch(siembraLocalProvider.future);
  await ref.watch(repoCasosProvider).marcarVencidos();
});

/// Métricas agregadas del barrio para el panel de escritorio (§17.2).
final datosPanelProvider = Provider<DatosPanel>(
  (ref) => DatosPanel(ref.watch(baseDatosProvider)),
);

final datosBarrioProvider = FutureProvider.family<DatosBarrio, String>(
  (ref, barrioId) => ref.watch(datosPanelProvider).deBarrio(barrioId),
);

/// Barrios propuestos, para la cola de moderación de barrios (§17.1).
final barriosPropuestosProvider = StreamProvider<List<Neighborhood>>((ref) {
  final db = ref.watch(baseDatosProvider);
  return (db.select(
    db.neighborhoods,
  )..where((t) => t.status.equals(NeighborhoodStatus.propuesto.name))).watch();
});

/// Registro del barrio (§12): casos resueltos, permanentes.
final registroBarrioProvider = StreamProvider.family<List<Case>, String>((
  ref,
  barrioId,
) {
  final db = ref.watch(baseDatosProvider);
  return (db.select(db.cases)
        ..where(
          (t) =>
              t.neighborhoodId.equals(barrioId) &
              t.status.equals(CaseStatus.resuelto.name),
        )
        ..orderBy([(t) => OrderingTerm.desc(t.resolvedAt)]))
      .watch();
});
