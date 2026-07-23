import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/feed/mi_cuadra_screen.dart';
import '../features/geography/buscador_barrio_screen.dart';
import '../features/geography/crear_barrio_screen.dart';
import '../features/report/reportar_screen.dart';

/// Rutas nombradas de la app. Los deep links de casos (compartir por WhatsApp)
/// se cuelgan de acá cuando exista el detalle de caso.
abstract class Rutas {
  static const miCuadra = '/';
  static const buscarBarrio = '/barrio/buscar';
  static const crearBarrio = '/barrio/crear';
  static const reportar = '/reportar';
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Rutas.miCuadra,
    routes: [
      GoRoute(
        path: Rutas.miCuadra,
        builder: (context, state) => const MiCuadraScreen(),
      ),
      GoRoute(
        path: Rutas.buscarBarrio,
        builder: (context, state) => const BuscadorBarrioScreen(),
      ),
      GoRoute(
        path: Rutas.crearBarrio,
        builder: (context, state) => const CrearBarrioScreen(),
      ),
      GoRoute(
        path: Rutas.reportar,
        builder: (context, state) => const ReportarScreen(),
      ),
    ],
  );
});
