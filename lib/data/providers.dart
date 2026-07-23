import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'local/base_datos.dart';
import 'local/conexion.dart';
import 'repositories/repo_casos.dart';
import 'repositories/repo_categorias.dart';
import 'repositories/repo_geografia.dart';
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
