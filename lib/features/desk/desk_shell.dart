import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../services/preferencias.dart';
import 'desk_casos.dart';
import 'desk_datos.dart';
import 'desk_moderacion.dart';

/// Shell del panel de escritorio (§20.4): barra lateral + secciones densas.
/// Es la mesa de trabajo del referente; solo se muestra en Windows.
class DeskShell extends ConsumerStatefulWidget {
  const DeskShell({super.key});

  @override
  ConsumerState<DeskShell> createState() => _DeskShellState();
}

class _DeskShellState extends ConsumerState<DeskShell> {
  var _seccion = 0;

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    final barrioId = ref.watch(barrioActivoProvider).value;

    final destinos = [
      (t.deskCasos, Icons.table_rows_outlined),
      (t.deskDatos, Icons.insights_outlined),
      (t.deskModeracion, Icons.gavel_outlined),
    ];

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _seccion,
            onDestinationSelected: (i) => setState(() => _seccion = i),
            labelType: NavigationRailLabelType.all,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: TokensCuadra.esp16),
              child: Text(
                t.nombreApp,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            destinations: [
              for (final (label, icono) in destinos)
                NavigationRailDestination(
                  icon: Icon(icono),
                  label: Text(label),
                ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: barrioId == null
                ? Center(child: Text(t.deskSinBarrio))
                : switch (_seccion) {
                    0 => DeskCasos(barrioId: barrioId),
                    1 => DeskDatos(barrioId: barrioId),
                    _ => const DeskModeracion(),
                  },
          ),
        ],
      ),
    );
  }
}
