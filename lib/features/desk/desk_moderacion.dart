import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../data/local/base_datos.dart';
import '../../data/models/enums.dart';
import '../../data/providers.dart';

/// Cola de moderación de barrios (§17.1): propuestos a revisar, promover o
/// rechazar. La cola de contenido marcado por el clasificador y la de
/// categorías candidatas viven server-side (panel del dueño §17); acá está
/// lo que el referente puede resolver localmente.
class DeskModeracion extends ConsumerWidget {
  const DeskModeracion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final propuestos = ref.watch(barriosPropuestosProvider).value ?? [];

    if (propuestos.isEmpty) {
      return Center(child: Text(t.deskColaVacia));
    }

    return ListView(
      padding: const EdgeInsets.all(TokensCuadra.esp24),
      children: [
        Text(t.deskBarrios, style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: TokensCuadra.esp16),
        for (final b in propuestos) _FilaBarrio(barrio: b),
      ],
    );
  }
}

class _FilaBarrio extends ConsumerWidget {
  const _FilaBarrio({required this.barrio});

  final Neighborhood barrio;

  Future<void> _cambiarEstado(WidgetRef ref, NeighborhoodStatus estado) async {
    final db = ref.read(baseDatosProvider);
    await (db.update(
      db.neighborhoods,
    )..where((x) => x.id.equals(barrio.id))).write(
      NeighborhoodsCompanion(
        status: Value(estado),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: TokensCuadra.esp12),
      padding: const EdgeInsets.all(TokensCuadra.esp16),
      decoration: BoxDecoration(
        border: Border.all(color: TokensCuadra.tiza.withValues(alpha: 0.45)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  barrio.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '${barrio.areaKm2.toStringAsFixed(1)} km² · '
                  '${t.vecinosVerificados(barrio.verifiedUserCount)} · '
                  '${barrio.validationSource ?? 'manual'}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => _cambiarEstado(ref, NeighborhoodStatus.rechazado),
            child: const Text('✕'),
          ),
          const SizedBox(width: TokensCuadra.esp8),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: TokensCuadra.sello,
              foregroundColor: TokensCuadra.cal,
            ),
            onPressed: () => _cambiarEstado(ref, NeighborhoodStatus.activo),
            child: Text(t.estadoBarrio('activo')),
          ),
        ],
      ),
    );
  }
}
