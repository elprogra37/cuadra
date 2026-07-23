import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../data/providers.dart';
import '../case/estado_visual.dart';

/// Tabla densa filtrable de casos del barrio (§20.4, pantalla Panel de
/// Windows). Teclado y clic; abre el detalle en la misma app.
class DeskCasos extends ConsumerStatefulWidget {
  const DeskCasos({super.key, required this.barrioId});

  final String barrioId;

  @override
  ConsumerState<DeskCasos> createState() => _DeskCasosState();
}

class _DeskCasosState extends ConsumerState<DeskCasos> {
  var _filtro = '';

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    final casos = ref.watch(casosDeBarrioProvider(widget.barrioId)).value ?? [];
    final filtrados = _filtro.isEmpty
        ? casos
        : casos.where((c) {
            final texto =
                '${c.publicRef ?? ''} ${c.categoryId} ${c.subtypeId} ${c.status.name}'
                    .toLowerCase();
            return texto.contains(_filtro.toLowerCase());
          }).toList();

    return Padding(
      padding: const EdgeInsets.all(TokensCuadra.esp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: t.deskFiltrar,
              prefixIcon: const Icon(Icons.filter_list),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            onChanged: (v) => setState(() => _filtro = v),
          ),
          const SizedBox(height: TokensCuadra.esp12),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text(t.deskColumnaRef)),
                    DataColumn(label: Text(t.deskColumnaCategoria)),
                    DataColumn(label: Text(t.deskColumnaEstado)),
                    DataColumn(label: Text(t.deskColumnaDias), numeric: true),
                    DataColumn(
                      label: Text(t.deskColumnaAdhesiones),
                      numeric: true,
                    ),
                  ],
                  rows: [
                    for (final c in filtrados)
                      DataRow(
                        onSelectChanged: (_) =>
                            context.push('${Rutas.caso}/${c.id}'),
                        cells: [
                          DataCell(Text(c.publicRef ?? c.id.substring(0, 8))),
                          DataCell(Text('${c.categoryId} · ${c.subtypeId}')),
                          DataCell(
                            Text(
                              selloDeCaso(c, t, ahora: DateTime.now()).titulo,
                            ),
                          ),
                          DataCell(
                            Text(
                              '${DateTime.now().difference(c.createdAt).inDays}',
                            ),
                          ),
                          DataCell(Text('${c.endorsementCount}')),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: TokensCuadra.esp8),
          Text(t.finDeLista, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
