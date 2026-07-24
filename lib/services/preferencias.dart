import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Preferencias locales chicas (barrio activo, identidad de sesión, flags de
/// onboarding). Todo lo que es dato de dominio vive en Drift, no acá.
class Preferencias {
  Preferencias(this._prefs);

  final SharedPreferences _prefs;
  static const _uuid = Uuid();

  static const _kBarrioActivo = 'barrio_activo';
  static const _kUserId = 'user_id';
  static const _kDisplayName = 'display_name';
  static const _kRole = 'role';
  static const _kOnboarding = 'onboarding_visto';

  String? get barrioActivo {
    final v = _prefs.getString(_kBarrioActivo);
    return (v == null || v.isEmpty) ? null : v;
  }

  Future<void> setBarrioActivo(String id) =>
      _prefs.setString(_kBarrioActivo, id);

  /// Id estable del usuario en este dispositivo. Se genera una sola vez; el
  /// login real (email/OTP contra Supabase) lo reemplazará por el uid del
  /// backend, migrando este id local.
  String get userId {
    final actual = _prefs.getString(_kUserId);
    if (actual != null && actual.isNotEmpty) return actual;
    final nuevo = _uuid.v4();
    _prefs.setString(_kUserId, nuevo);
    return nuevo;
  }

  String? get displayName => _prefs.getString(_kDisplayName);

  /// Rol de la sesión (§7). visitante hasta que "entra como vecino".
  String get role => _prefs.getString(_kRole) ?? 'visitante';

  bool get onboardingVisto => _prefs.getBool(_kOnboarding) ?? false;

  Future<void> marcarOnboardingVisto() => _prefs.setBool(_kOnboarding, true);

  Future<void> entrarComoVecino(String nombre) async {
    await _prefs.setString(_kDisplayName, nombre.trim());
    await _prefs.setString(_kRole, 'vecino');
  }

  Future<void> volverAVisitante() async {
    await _prefs.setString(_kRole, 'visitante');
  }

  Future<void> borrarTodo() async {
    await _prefs.remove(_kBarrioActivo);
    await _prefs.remove(_kDisplayName);
    await _prefs.setString(_kRole, 'visitante');
  }
}

final preferenciasProvider = FutureProvider<Preferencias>((ref) async {
  return Preferencias(await SharedPreferences.getInstance());
});

/// Barrio activo del usuario (null = todavía no eligió/creó ninguno).
final barrioActivoProvider = FutureProvider<String?>((ref) async {
  final prefs = await ref.watch(preferenciasProvider.future);
  return prefs.barrioActivo;
});

/// Estado de sesión: id, nombre, rol, onboarding. La UI lo observa para
/// decidir modo visitante vs vecino.
class Sesion {
  const Sesion({
    required this.userId,
    required this.displayName,
    required this.role,
    required this.onboardingVisto,
  });

  final String userId;
  final String? displayName;
  final String role;
  final bool onboardingVisto;

  bool get esVisitante => role == 'visitante';
  bool get esVecino => role != 'visitante';
}

final sesionProvider = FutureProvider<Sesion>((ref) async {
  final prefs = await ref.watch(preferenciasProvider.future);
  return Sesion(
    userId: prefs.userId,
    displayName: prefs.displayName,
    role: prefs.role,
    onboardingVisto: prefs.onboardingVisto,
  );
});
