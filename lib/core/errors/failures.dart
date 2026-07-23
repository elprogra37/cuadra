/// Errores de dominio tipados (sealed) — la capa de presentación hace `switch`
/// o `fold` sobre un [Result] sin atrapar excepciones sueltas.
///
/// Los mensajes explican qué pasó y cómo se arregla. No se disculpan y no son
/// vagos (convención del documento maestro, sección 25).
sealed class Failure {
  const Failure(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Sin conexión o el backend no respondió. En Cuadra esto casi nunca es un
/// error terminal: el dato queda en Drift y la SyncQueue lo reintenta.
class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message =
        'Sin conexión. Tus cambios quedan guardados y se '
        'sincronizan solos cuando vuelva la señal.',
  ]);
}

/// Falla de autenticación (sesión expirada, permisos).
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// Datos inválidos o violación de una regla del servidor (Postgres/RLS).
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// El recurso pedido no existe.
class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'No lo encontramos.']);
}

/// La base local rechazó la operación (conflicto de migración, disco lleno).
class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

/// Cualquier otra cosa inesperada.
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Algo salió mal. Probá de nuevo.']);
}
