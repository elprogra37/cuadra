import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../app/router.dart';
import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../data/local/base_datos.dart';
import '../../data/providers.dart';
import '../../services/preferencias.dart';
import '../case/estado_visual.dart';

/// Mapa de la cuadra (§25.7): pines por caso, color por estado (la regla del
/// amarillo también rige acá). Clustering llega con más densidad real.
class MapaScreen extends ConsumerWidget {
  const MapaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final barrioId = ref.watch(barrioActivoProvider).value;
    final barrio = barrioId == null
        ? null
        : ref.watch(barrioProvider(barrioId)).value;
    final casos = barrioId == null
        ? const <Case>[]
        : ref.watch(casosDeBarrioProvider(barrioId)).value ?? <Case>[];

    final centro = barrio == null
        ? const LatLng(-34.6037, -58.3816)
        : LatLng(barrio.centroidLat, barrio.centroidLng);

    return Scaffold(
      appBar: AppBar(title: Text(t.tabMapa)),
      body: FlutterMap(
        options: MapOptions(initialCenter: centro, initialZoom: 15),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.elprogra37.cuadra',
          ),
          MarkerLayer(
            markers: [
              for (final caso in casos)
                Marker(
                  point: LatLng(caso.lat, caso.lng),
                  width: 34,
                  height: 34,
                  child: GestureDetector(
                    onTap: () => context.push('${Rutas.caso}/${caso.id}'),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: selloDeCaso(
                          caso,
                          t,
                          ahora: DateTime.now(),
                        ).variante.tinta,
                        shape: BoxShape.circle,
                        border: Border.all(color: TokensCuadra.cal, width: 2),
                      ),
                      child: const Icon(
                        Icons.priority_high,
                        size: 18,
                        color: TokensCuadra.cal,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
