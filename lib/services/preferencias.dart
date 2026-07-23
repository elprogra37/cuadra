import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Preferencias locales chicas (barrio activo, flags de onboarding).
/// Todo lo que es dato de dominio vive en Drift, no acá.
class Preferencias {
  Preferencias(this._prefs);

  final SharedPreferences _prefs;

  static const _kBarrioActivo = 'barrio_activo';

  String? get barrioActivo => _prefs.getString(_kBarrioActivo);

  Future<void> setBarrioActivo(String id) =>
      _prefs.setString(_kBarrioActivo, id);
}

final preferenciasProvider = FutureProvider<Preferencias>((ref) async {
  return Preferencias(await SharedPreferences.getInstance());
});

/// Barrio activo del usuario (null = todavía no eligió/creó ninguno).
final barrioActivoProvider = FutureProvider<String?>((ref) async {
  final prefs = await ref.watch(preferenciasProvider.future);
  return prefs.barrioActivo;
});
