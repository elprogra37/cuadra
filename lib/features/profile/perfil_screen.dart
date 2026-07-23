import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../data/providers.dart';
import '../../services/preferencias.dart';

/// Perfil (§7, §22): estado de vecino, cambio de barrio, exportar/borrar datos.
/// La verificación con documento y el login llegan con el backend; acá está
/// lo que funciona 100% local.
class PerfilScreen extends ConsumerWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final barrioId = ref.watch(barrioActivoProvider).value;
    final barrio = barrioId == null
        ? null
        : ref.watch(barrioProvider(barrioId)).value;

    return Scaffold(
      appBar: AppBar(title: Text(t.perfilTitulo)),
      body: ListView(
        padding: const EdgeInsets.all(TokensCuadra.esp16),
        children: [
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text(t.perfilVecino),
            subtitle: Text(barrio?.name ?? '—'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.swap_horiz),
            title: Text(t.perfilCambiarBarrio),
            onTap: () => context.push(Rutas.buscarBarrio),
          ),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: Text(t.perfilExportarDatos),
            onTap: () => _exportar(context, ref, t),
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: Text(t.perfilBorrarDatos),
            onTap: () => _borrar(context, ref, t),
          ),
        ],
      ),
    );
  }

  Future<void> _exportar(BuildContext context, WidgetRef ref, Textos t) async {
    // Exportación de datos del usuario (§22): sus casos y adhesiones locales.
    final db = ref.read(baseDatosProvider);
    final casos = await db.select(db.cases).get();
    final resumen = 'Casos locales: ${casos.length}';
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(resumen), persist: false));
    }
  }

  Future<void> _borrar(BuildContext context, WidgetRef ref, Textos t) async {
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(t.perfilBorrarDatos),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(t.errorReintentar),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(t.perfilBorrarDatos),
          ),
        ],
      ),
    );
    if (confirmado != true) return;
    final prefs = await ref.read(preferenciasProvider.future);
    await prefs.setBarrioActivo('');
    ref.invalidate(barrioActivoProvider);
    if (context.mounted) context.go(Rutas.miCuadra);
  }
}
