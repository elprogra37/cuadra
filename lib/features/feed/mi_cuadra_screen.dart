import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../data/providers.dart';
import '../../services/preferencias.dart';

/// Pantalla principal: el feed de la cuadra. Sin barrio elegido muestra la
/// bienvenida con UNA acción concreta (regla §2: cada pantalla ofrece un
/// acto). El feed real llega en la etapa 7.
class MiCuadraScreen extends ConsumerWidget {
  const MiCuadraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barrioId = ref.watch(barrioActivoProvider);
    return barrioId.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, _) => const _Bienvenida(),
      data: (id) => id == null ? const _Bienvenida() : _Feed(barrioId: id),
    );
  }
}

class _Bienvenida extends StatelessWidget {
  const _Bienvenida();

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TokensCuadra.esp24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                t.nombreApp,
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TokensCuadra.esp8),
              Text(
                t.tagline,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TokensCuadra.esp32),
              Text(
                t.onboarding1,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TokensCuadra.esp32),
              // La única acción pendiente de esta pantalla: amarillo vial.
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: TokensCuadra.vial,
                  foregroundColor: TokensCuadra.asfalto,
                ),
                onPressed: () => context.push(Rutas.buscarBarrio),
                child: Text(t.buscarBarrio),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Feed extends ConsumerWidget {
  const _Feed({required this.barrioId});

  final String barrioId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final barrio = ref.watch(barrioProvider(barrioId));

    return Scaffold(
      appBar: AppBar(
        title: Text(barrio.value?.name ?? t.tabMiCuadra),
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            tooltip: t.buscarBarrio,
            onPressed: () => context.push(Rutas.buscarBarrio),
          ),
        ],
      ),
      // Reportar es LA acción pendiente del feed: amarillo vial.
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: TokensCuadra.vial,
        foregroundColor: TokensCuadra.asfalto,
        onPressed: () => context.push(Rutas.reportar),
        icon: const Icon(Icons.photo_camera_outlined),
        label: Text(t.tabReportar),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(TokensCuadra.esp24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (barrio.value != null) ...[
                Text(
                  t.estadoBarrio(barrio.value!.status.name),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  t.vecinosVerificados(barrio.value!.verifiedUserCount),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: TokensCuadra.esp24),
              ],
              // Cierre explícito de lista (§25.4): sin scroll infinito.
              Text(
                t.finDeLista,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
