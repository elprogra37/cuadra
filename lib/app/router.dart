import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/plataforma.dart';
import '../features/case/caso_screen.dart';
import '../features/desk/desk_shell.dart';
import '../features/geography/buscador_barrio_screen.dart';
import '../features/geography/crear_barrio_screen.dart';
import '../features/map/mapa_screen.dart';
import '../features/raiz_movil.dart';
import '../features/report/reportar_screen.dart';

/// Rutas nombradas de la app. Los deep links de casos (compartir por WhatsApp)
/// se cuelgan de acá cuando exista el detalle de caso.
abstract class Rutas {
  static const miCuadra = '/';
  static const buscarBarrio = '/barrio/buscar';
  static const crearBarrio = '/barrio/crear';
  static const reportar = '/reportar';
  static const mapa = '/mapa';

  /// Detalle de caso: `/caso/<id>` (deep link compartible a futuro).
  static const caso = '/caso';
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Rutas.miCuadra,
    routes: [
      GoRoute(
        path: Rutas.miCuadra,
        // En Windows la raíz es la mesa de trabajo del referente (§20.4);
        // en Android, el feed de la cuadra.
        builder: (context, state) =>
            Plataforma.esEscritorio ? const DeskShell() : const RaizMovil(),
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
      GoRoute(
        path: Rutas.mapa,
        builder: (context, state) => const MapaScreen(),
      ),
      GoRoute(
        path: '${Rutas.caso}/:id',
        builder: (context, state) =>
            CasoScreen(casoId: state.pathParameters['id']!),
      ),
    ],
  );
});
