import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// Conexión de la app real: archivo `cuadra.db` en el directorio de datos
/// de la plataforma (Android y Windows). Los tests usan
/// `NativeDatabase.memory()` directamente.
QueryExecutor abrirConexion() => driftDatabase(name: 'cuadra');
