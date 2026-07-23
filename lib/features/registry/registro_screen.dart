import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/i18n/textos.dart';
import '../../core/theme/estado_sello.dart';
import '../../core/theme/tokens.dart';
import '../../data/providers.dart';

/// Registro del barrio (§12): el antes/después de lo arreglado, permanente,
/// con el nombre de quienes lo empujaron. Es el mejor activo de retención y
/// completamente honesto.
class RegistroScreen extends ConsumerWidget {
  const RegistroScreen({super.key, required this.barrioId});

  final String barrioId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final resueltos = ref.watch(registroBarrioProvider(barrioId)).value ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(t.registroTitulo)),
      body: resueltos.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(TokensCuadra.esp24),
                child: Text(t.registroVacio, textAlign: TextAlign.center),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(TokensCuadra.esp16),
              itemCount: resueltos.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: TokensCuadra.esp12),
              itemBuilder: (context, i) {
                final c = resueltos[i];
                return InkWell(
                  onTap: () => context.push('${Rutas.caso}/${c.id}'),
                  child: Container(
                    padding: const EdgeInsets.all(TokensCuadra.esp12),
                    decoration: BoxDecoration(
                      border: Border.all(color: TokensCuadra.sello, width: 1.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${c.publicRef ?? ''} ${c.categoryId} · '
                                        '${c.subtypeId.replaceAll('_', ' ')}'
                                    .trim(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: TokensCuadra.esp4),
                              Text(
                                '${t.registroEmpujadoPor}: '
                                '${t.adhesiones(c.endorsementCount)}',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 0.75,
                          child: EstadoSello(
                            variante: SelloVariante.resuelto,
                            titulo: t.selloResuelto,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
