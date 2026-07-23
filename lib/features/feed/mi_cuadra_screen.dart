import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/i18n/textos.dart';
import '../../core/theme/estado_sello.dart';
import '../../core/theme/tokens.dart';
import '../../data/local/base_datos.dart';
import '../../data/providers.dart';
import '../case/estado_visual.dart';

/// Bienvenida sin barrio elegido: UNA sola acción concreta (regla §2).
class MiCuadraBienvenida extends StatelessWidget {
  const MiCuadraBienvenida({super.key});

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

/// Feed de la cuadra (contenido de la pestaña Mi cuadra; el shell provee la
/// barra de navegación y el FAB). La lista TERMINA y lo dice (§25.4).
class MiCuadraFeed extends ConsumerWidget {
  const MiCuadraFeed({super.key, required this.barrioId});

  final String barrioId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final barrio = ref.watch(barrioProvider(barrioId));
    final casos = ref.watch(casosDeBarrioProvider(barrioId)).value ?? [];

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
      body: ListView(
        padding: const EdgeInsets.all(TokensCuadra.esp16),
        children: [
          for (final caso in casos) _TarjetaCaso(caso),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TokensCuadra.esp32),
            child: Text(
              t.finDeLista,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _TarjetaCaso extends StatelessWidget {
  const _TarjetaCaso(this.caso);

  final Case caso;

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    final sello = selloDeCaso(caso, t, ahora: DateTime.now());
    final dias = DateTime.now().difference(caso.createdAt).inDays;

    return Padding(
      padding: const EdgeInsets.only(bottom: TokensCuadra.esp12),
      child: InkWell(
        onTap: () => context.push('${Rutas.caso}/${caso.id}'),
        child: Container(
          padding: const EdgeInsets.all(TokensCuadra.esp12),
          decoration: BoxDecoration(
            border: Border.all(
              color: TokensCuadra.tiza.withValues(alpha: 0.45),
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${caso.publicRef ?? ''} ${caso.categoryId} · ${caso.subtypeId.replaceAll('_', ' ')}'
                          .trim(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: TokensCuadra.esp4),
                    Text(
                      '${t.diasAbierto(dias)} · ${t.adhesiones(caso.endorsementCount)}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 0.75,
                child: EstadoSello(
                  variante: sello.variante,
                  titulo: sello.titulo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
