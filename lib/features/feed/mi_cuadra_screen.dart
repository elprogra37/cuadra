import 'package:flutter/material.dart';

import '../../core/i18n/textos.dart';

/// Pantalla principal: el feed de la cuadra. Por ahora es el punto de partida
/// del andamiaje; el feed real (orden cercanía × urgencia, cierre explícito
/// de lista) llega en la etapa 7 de la Fase 1.
class MiCuadraScreen extends StatelessWidget {
  const MiCuadraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(t.nombreApp, style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 8),
            Text(t.tagline),
          ],
        ),
      ),
    );
  }
}
