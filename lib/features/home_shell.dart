import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../app/router.dart';
import '../core/i18n/textos.dart';
import '../core/theme/tokens.dart';
import '../services/preferencias.dart';
import 'feed/mi_cuadra_screen.dart';
import 'map/mapa_screen.dart';
import 'profile/perfil_screen.dart';
import 'registry/registro_screen.dart';

/// Shell móvil con las 4 pestañas + botón flotante de reportar (§20.4).
/// Sin barrio elegido, muestra la bienvenida. La única acción pendiente vive
/// en la pestaña Mi cuadra (FAB amarillo).
class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  var _tab = 0;

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    final barrioId = ref.watch(barrioActivoProvider);

    return barrioId.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, _) => const MiCuadraBienvenida(),
      data: (id) {
        if (id == null || id.isEmpty) return const MiCuadraBienvenida();
        final paginas = [
          MiCuadraFeed(barrioId: id),
          const MapaScreen(),
          RegistroScreen(barrioId: id),
          const PerfilScreen(),
        ];
        return Scaffold(
          body: paginas[_tab],
          floatingActionButton: _tab == 0
              ? FloatingActionButton.extended(
                  backgroundColor: TokensCuadra.vial,
                  foregroundColor: TokensCuadra.asfalto,
                  onPressed: () => context.push(Rutas.reportar),
                  icon: const Icon(Icons.photo_camera_outlined),
                  label: Text(t.tabReportar),
                )
              : null,
          bottomNavigationBar: NavigationBar(
            selectedIndex: _tab,
            onDestinationSelected: (i) => setState(() => _tab = i),
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
                label: t.tabMiCuadra,
              ),
              NavigationDestination(
                icon: const Icon(Icons.map_outlined),
                selectedIcon: const Icon(Icons.map),
                label: t.tabMapa,
              ),
              NavigationDestination(
                icon: const Icon(Icons.verified_outlined),
                selectedIcon: const Icon(Icons.verified),
                label: t.tabRegistro,
              ),
              NavigationDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person),
                label: t.tabPerfil,
              ),
            ],
          ),
        );
      },
    );
  }
}
