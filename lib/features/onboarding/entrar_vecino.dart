import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../services/preferencias.dart';

/// Puerta del modo visitante (§7, §15.1): quien mira sin ser vecino no puede
/// reportar, firmar ni crear barrio. Al intentarlo, se le pide identidad.
///
/// Devuelve true si quedó como vecino (recién ahora o ya lo era).
Future<bool> asegurarVecino(BuildContext context, WidgetRef ref) async {
  final sesion = await ref.read(sesionProvider.future);
  if (sesion.esVecino) return true;
  if (!context.mounted) return false;

  final t = Textos.of(context);
  final controlador = TextEditingController(text: sesion.displayName ?? '');

  final entrado = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => Padding(
      padding: EdgeInsets.only(
        left: TokensCuadra.esp24,
        right: TokensCuadra.esp24,
        top: TokensCuadra.esp24,
        bottom: MediaQuery.of(ctx).viewInsets.bottom + TokensCuadra.esp24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(t.comoTeLlamas, style: Theme.of(ctx).textTheme.titleLarge),
          const SizedBox(height: TokensCuadra.esp8),
          Text(t.soloParaVecinos, style: Theme.of(ctx).textTheme.bodySmall),
          const SizedBox(height: TokensCuadra.esp16),
          TextField(
            controller: controlador,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: t.tuNombre,
              hintText: t.tuNombrePista,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            onSubmitted: (_) => Navigator.pop(ctx, true),
          ),
          const SizedBox(height: TokensCuadra.esp16),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: TokensCuadra.vial,
              foregroundColor: TokensCuadra.asfalto,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(t.entrar),
          ),
        ],
      ),
    ),
  );

  if (entrado != true) return false;
  final nombre = controlador.text.trim().isEmpty
      ? t.perfilVecino
      : controlador.text.trim();
  final prefs = await ref.read(preferenciasProvider.future);
  await prefs.entrarComoVecino(nombre);
  ref.invalidate(sesionProvider);
  return true;
}
