import '../../core/errors/failures.dart';
import '../../core/errors/result.dart';

/// Una operación pendiente de sincronizar, tal como sale de la cola.
class OperacionSync {
  const OperacionSync({
    required this.entity,
    required this.entityId,
    required this.clientUuid,
    required this.operation,
    required this.payload,
  });

  final String entity;
  final String entityId;

  /// El servidor deduplica por este uuid: reintentar es seguro.
  final String clientUuid;
  final String operation;
  final String payload;
}

/// Lo que la SyncQueue necesita del backend. La implementación real
/// (Supabase) llega en la etapa 4; mientras tanto la app funciona 100%
/// offline con [ClienteRemotoNulo].
abstract class ClienteRemoto {
  /// Envía una operación. Ok(null) = aceptada (o duplicada ya aplicada).
  Future<Result<void>> enviar(OperacionSync op);
}

/// Sin backend: todo queda pendiente en la cola. La app es utilizable
/// igual — offline-first no es un modo degradado (§20.2).
class ClienteRemotoNulo implements ClienteRemoto {
  const ClienteRemotoNulo();

  @override
  Future<Result<void>> enviar(OperacionSync op) async =>
      const Err(NetworkFailure());
}
