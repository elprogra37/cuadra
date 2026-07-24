import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/preferencias.dart';
import 'home_shell.dart';
import 'onboarding/onboarding_screen.dart';

/// Raíz de la app en móvil: onboarding una sola vez (§4.4), después el shell
/// de pestañas. El escritorio (referente) no pasa por onboarding.
class RaizMovil extends ConsumerWidget {
  const RaizMovil({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sesion = ref.watch(sesionProvider);
    return sesion.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, _) => const HomeShell(),
      data: (s) => s.onboardingVisto
          ? const HomeShell()
          : OnboardingScreen(alTerminar: () => ref.invalidate(sesionProvider)),
    );
  }
}
