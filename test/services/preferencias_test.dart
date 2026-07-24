import 'package:cuadra/services/preferencias.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<Preferencias> nueva([Map<String, Object> inicial = const {}]) async {
    SharedPreferences.setMockInitialValues(inicial);
    return Preferencias(await SharedPreferences.getInstance());
  }

  test('el userId se genera una vez y es estable', () async {
    final p = await nueva();
    final a = p.userId;
    final b = p.userId;
    expect(a, b);
    expect(a, isNotEmpty);
  });

  test('arranca como visitante y pasa a vecino al entrar', () async {
    final p = await nueva();
    expect(p.role, 'visitante');
    expect(p.displayName, isNull);

    await p.entrarComoVecino('Vecina del 3°');
    expect(p.role, 'vecino');
    expect(p.displayName, 'Vecina del 3°');
  });

  test('borrarTodo vuelve a visitante y limpia barrio y nombre', () async {
    final p = await nueva();
    await p.setBarrioActivo('b1');
    await p.entrarComoVecino('Alguien');
    await p.borrarTodo();

    expect(p.role, 'visitante');
    expect(p.displayName, isNull);
    expect(p.barrioActivo, isNull);
  });

  test('barrioActivo vacío se lee como null', () async {
    final p = await nueva({'barrio_activo': ''});
    expect(p.barrioActivo, isNull);
  });

  test('el flag de onboarding persiste', () async {
    final p = await nueva();
    expect(p.onboardingVisto, isFalse);
    await p.marcarOnboardingVisto();
    expect(p.onboardingVisto, isTrue);
  });
}
