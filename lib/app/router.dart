import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/feed/mi_cuadra_screen.dart';

/// Rutas nombradas de la app. Los deep links de casos (compartir por WhatsApp)
/// se cuelgan de acá cuando exista el detalle de caso.
abstract class Rutas {
  static const miCuadra = '/';
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Rutas.miCuadra,
    routes: [
      GoRoute(
        path: Rutas.miCuadra,
        builder: (context, state) => const MiCuadraScreen(),
      ),
    ],
  );
});
