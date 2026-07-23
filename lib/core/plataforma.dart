import 'package:flutter/foundation.dart';

/// ¿Corremos en la mesa de trabajo (Windows) o en la calle (Android)?
/// Define layout, entrada y funciones exclusivas (§20.4).
abstract final class Plataforma {
  static bool get esEscritorio =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.windows;

  static bool get esMovil =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);
}
