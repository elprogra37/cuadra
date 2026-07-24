import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../services/preferencias.dart';

/// Onboarding: tres pantallas, tres frases (§4.4). Se muestra una sola vez.
/// No es para quejarse; solo lo cercano; avisos con novedad real.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key, required this.alTerminar});

  final VoidCallback alTerminar;

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  var _pagina = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _terminar() async {
    final prefs = await ref.read(preferenciasProvider.future);
    await prefs.marcarOnboardingVisto();
    ref.invalidate(sesionProvider);
    widget.alTerminar();
  }

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    final frases = [t.onboarding1, t.onboarding2, t.onboarding3];
    final esUltima = _pagina == frases.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: frases.length,
                onPageChanged: (i) => setState(() => _pagina = i),
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(TokensCuadra.esp32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (i == 0)
                        Text(
                          t.nombreApp,
                          style: Theme.of(context).textTheme.displayLarge,
                          textAlign: TextAlign.center,
                        ),
                      const SizedBox(height: TokensCuadra.esp24),
                      Text(
                        frases[i],
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < frases.length; i++)
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == _pagina
                          ? TokensCuadra.vial
                          : TokensCuadra.tiza.withValues(alpha: 0.4),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(TokensCuadra.esp16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: TokensCuadra.vial,
                    foregroundColor: TokensCuadra.asfalto,
                  ),
                  onPressed: esUltima
                      ? _terminar
                      : () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                        ),
                  child: Text(esUltima ? t.onbEmpezar : t.onbSiguiente),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
