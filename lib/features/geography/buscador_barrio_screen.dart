import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../data/local/base_datos.dart';
import '../../data/providers.dart';
import '../../services/preferencias.dart';

/// Buscador de barrio (§6.2). Busca en la base local; si no está, el camino
/// es siempre visible: crear el barrio. Nunca un callejón sin salida.
class BuscadorBarrioScreen extends ConsumerStatefulWidget {
  const BuscadorBarrioScreen({super.key});

  @override
  ConsumerState<BuscadorBarrioScreen> createState() =>
      _BuscadorBarrioScreenState();
}

class _BuscadorBarrioScreenState extends ConsumerState<BuscadorBarrioScreen> {
  var _consulta = '';
  var _resultados = <Neighborhood>[];

  Future<void> _buscar(String consulta) async {
    setState(() => _consulta = consulta);
    if (consulta.trim().length < 2) {
      setState(() => _resultados = []);
      return;
    }
    final encontrados = await ref
        .read(repoGeografiaProvider)
        .buscarBarrios(consulta);
    if (!mounted || consulta != _consulta) return;
    setState(() => _resultados = encontrados);
  }

  Future<void> _elegir(Neighborhood barrio) async {
    final prefs = await ref.read(preferenciasProvider.future);
    await prefs.setBarrioActivo(barrio.id);
    ref.invalidate(barrioActivoProvider);
    if (mounted) context.go(Rutas.miCuadra);
  }

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(t.buscarBarrio)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(TokensCuadra.esp16),
            child: TextField(
              autofocus: true,
              onChanged: _buscar,
              decoration: InputDecoration(
                hintText: t.buscarBarrioPista,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
            ),
          ),
          Expanded(
            child: _resultados.isEmpty
                ? _SinResultados(mostrarPista: _consulta.trim().length >= 2)
                : ListView.separated(
                    itemCount: _resultados.length,
                    separatorBuilder: (_, _) => const Divider(),
                    itemBuilder: (context, i) {
                      final b = _resultados[i];
                      return ListTile(
                        title: Text(b.name),
                        subtitle: Text(
                          '${t.estadoBarrio(b.status.name)} · '
                          '${t.vecinosVerificados(b.verifiedUserCount)}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onTap: () => _elegir(b),
                      );
                    },
                  ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(TokensCuadra.esp16),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.push(Rutas.crearBarrio),
                  child: Text(t.crearMiBarrio),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SinResultados extends StatelessWidget {
  const _SinResultados({required this.mostrarPista});

  final bool mostrarPista;

  @override
  Widget build(BuildContext context) {
    if (!mostrarPista) return const SizedBox.shrink();
    final t = Textos.of(context);
    return Padding(
      padding: const EdgeInsets.all(TokensCuadra.esp24),
      child: Text(t.sinResultados, textAlign: TextAlign.center),
    );
  }
}
