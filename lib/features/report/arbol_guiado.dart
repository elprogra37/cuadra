import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/categoria_def.dart';
import '../../data/models/texto_i18n.dart';

/// Motor de árbol guiado (§9): renderiza las preguntas de CUALQUIER categoría
/// desde su JSON — genérico, nunca hardcodeado por categoría (§25.6).
/// `opcion` = una sola respuesta; `multiple` = casillas.
class ArbolGuiado extends StatelessWidget {
  const ArbolGuiado({
    super.key,
    required this.categoria,
    required this.respuestas,
    required this.onCambio,
    required this.idioma,
  });

  final CategoriaDef categoria;

  /// {preguntaId: opcionId} para `opcion`, {preguntaId: [opcionId]} para
  /// `multiple`. Mismo formato que `Cases.guidedAnswers`.
  final Map<String, dynamic> respuestas;
  final ValueChanged<Map<String, dynamic>> onCambio;
  final String idioma;

  /// ¿Todas las preguntas obligatorias tienen respuesta?
  static bool completo(
    CategoriaDef categoria,
    Map<String, dynamic> respuestas,
  ) {
    for (final p in categoria.preguntas) {
      if (!p.obligatoria) continue;
      final r = respuestas[p.id];
      if (r == null || (r is List && r.isEmpty)) return false;
    }
    return true;
  }

  void _responder(PreguntaGuiada pregunta, String opcionId) {
    final nuevas = Map<String, dynamic>.from(respuestas);
    if (pregunta.tipo == 'multiple') {
      final actuales =
          (nuevas[pregunta.id] as List?)?.cast<String>() ?? <String>[];
      nuevas[pregunta.id] = actuales.contains(opcionId)
          ? [
              for (final o in actuales)
                if (o != opcionId) o,
            ]
          : [...actuales, opcionId];
    } else {
      nuevas[pregunta.id] = opcionId;
    }
    onCambio(nuevas);
  }

  bool _elegida(PreguntaGuiada pregunta, String opcionId) {
    final r = respuestas[pregunta.id];
    return r is List ? r.contains(opcionId) : r == opcionId;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final pregunta in categoria.preguntas) ...[
          Padding(
            padding: const EdgeInsets.only(
              top: TokensCuadra.esp16,
              bottom: TokensCuadra.esp8,
            ),
            child: Text(
              pregunta.texto.resolver(idioma),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          for (final opcion in pregunta.opciones)
            _OpcionTile(
              texto: opcion.texto.resolver(idioma),
              multiple: pregunta.tipo == 'multiple',
              elegida: _elegida(pregunta, opcion.id),
              onTap: () => _responder(pregunta, opcion.id),
            ),
        ],
      ],
    );
  }
}

class _OpcionTile extends StatelessWidget {
  const _OpcionTile({
    required this.texto,
    required this.multiple,
    required this.elegida,
    required this.onTap,
  });

  final String texto;
  final bool multiple;
  final bool elegida;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tinta = Theme.of(context).colorScheme.onSurface;
    return Padding(
      padding: const EdgeInsets.only(bottom: TokensCuadra.esp8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: TokensCuadra.objetivoTactilMin,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: TokensCuadra.esp12,
            vertical: TokensCuadra.esp8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: elegida ? tinta : TokensCuadra.tiza.withValues(alpha: 0.5),
              width: elegida ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            children: [
              Icon(
                multiple
                    ? (elegida
                          ? Icons.check_box
                          : Icons.check_box_outline_blank)
                    : (elegida
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off),
                size: 20,
                color: elegida ? tinta : TokensCuadra.tiza,
              ),
              const SizedBox(width: TokensCuadra.esp12),
              Expanded(child: Text(texto)),
            ],
          ),
        ),
      ),
    );
  }
}
