import 'failures.dart';

/// Resultado tipado (sealed) para la salida de repositorios y servicios.
/// Evita propagar excepciones: la presentación hace `switch` o `fold`.
sealed class Result<T> {
  const Result();

  /// Colapsa el resultado: [onErr] si es [Err], [onOk] si es [Ok].
  R fold<R>(R Function(Failure failure) onErr, R Function(T value) onOk);

  bool get isOk => this is Ok<T>;

  T? get valueOrNull => switch (this) {
    Ok(:final value) => value,
    _ => null,
  };

  Failure? get failureOrNull => switch (this) {
    Err(:final failure) => failure,
    _ => null,
  };
}

/// Éxito con un valor.
class Ok<T> extends Result<T> {
  const Ok(this.value);
  final T value;

  @override
  R fold<R>(R Function(Failure failure) onErr, R Function(T value) onOk) =>
      onOk(value);
}

/// Fallo con un [Failure] tipado.
class Err<T> extends Result<T> {
  const Err(this.failure);
  final Failure failure;

  @override
  R fold<R>(R Function(Failure failure) onErr, R Function(T value) onOk) =>
      onErr(failure);
}
