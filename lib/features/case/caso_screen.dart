import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/i18n/textos.dart';
import '../../core/theme/estado_sello.dart';
import '../../core/theme/estado_sello_animado.dart';
import '../../core/theme/tokens.dart';
import '../../data/local/base_datos.dart';
import '../../data/models/enums.dart';
import '../../data/providers.dart';
import 'estado_visual.dart';

/// Detalle de caso (§25.9): foto, sello, contador de días en display, línea
/// de tiempo, adherentes y SIEMPRE un botón de acción siguiente.
class CasoScreen extends ConsumerWidget {
  const CasoScreen({super.key, required this.casoId});

  final String casoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final caso = ref.watch(casoProvider(casoId));

    return Scaffold(
      appBar: AppBar(title: Text(caso.value?.publicRef ?? t.tabMiCuadra)),
      body: caso.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(child: Text(t.casoNoEncontrado)),
        data: (c) =>
            c == null ? Center(child: Text(t.casoNoEncontrado)) : _Detalle(c),
      ),
    );
  }
}

class _Detalle extends ConsumerWidget {
  const _Detalle(this.caso);

  final Case caso;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final evidencias = ref.watch(evidenciasProvider(caso.id)).value ?? [];
    final ahora = DateTime.now();
    final sello = selloDeCaso(caso, t, ahora: ahora);
    final dias = ahora.difference(caso.createdAt).inDays;

    return ListView(
      padding: const EdgeInsets.all(TokensCuadra.esp16),
      children: [
        // Evidencia principal con el sello estampado encima (§5).
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            if (evidencias.isNotEmpty && evidencias.first.localPath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.file(
                  File(evidencias.first.localPath!),
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const _SinFoto(),
                ),
              )
            else
              const _SinFoto(),
            Padding(
              padding: const EdgeInsets.all(TokensCuadra.esp12),
              child: EstadoSelloAnimado(
                // La caída con rebote es solo para el paso a resuelto (§12);
                // el resto de los estados aparece ya estampado.
                animar: caso.status == CaseStatus.resuelto,
                sello: EstadoSello(
                  variante: sello.variante,
                  titulo: sello.titulo,
                  subtitulo: sello.subtitulo,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: TokensCuadra.esp16),

        // Contador de días: tipografía display, el reloj a la vista (§3.5).
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$dias',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: caso.status.esperaAccion ? TokensCuadra.vial : null,
              ),
            ),
            const SizedBox(width: TokensCuadra.esp8),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                t.diasAbierto(dias).replaceFirst(RegExp(r'^\d+ '), ''),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            Text(
              t.adhesiones(caso.endorsementCount),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const Divider(height: TokensCuadra.esp32),

        // Escrito generado: el expediente es el producto.
        Text(
          caso.generatedBody.replaceAll('**', ''),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Divider(height: TokensCuadra.esp32),

        // Línea de tiempo mínima (se enriquece con case_actions en Fase 2).
        Text(t.lineaDeTiempo, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: TokensCuadra.esp8),
        _Evento(texto: t.eventoCreado, fecha: caso.createdAt),
        if (caso.submittedAt != null)
          _Evento(texto: t.eventoPresentado, fecha: caso.submittedAt!),
        if (caso.resolvedAt != null)
          _Evento(texto: t.eventoResuelto, fecha: caso.resolvedAt!),
        const SizedBox(height: TokensCuadra.esp24),

        // SIEMPRE hay un paso siguiente (§13).
        Text(t.accionSiguiente, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: TokensCuadra.esp8),
        _AccionSiguiente(caso: caso),
      ],
    );
  }
}

class _SinFoto extends StatelessWidget {
  const _SinFoto();

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: 220,
    color: TokensCuadra.tiza.withValues(alpha: 0.2),
    child: const Icon(Icons.photo_outlined, size: 48, color: TokensCuadra.tiza),
  );
}

class _Evento extends StatelessWidget {
  const _Evento({required this.texto, required this.fecha});

  final String texto;
  final DateTime fecha;

  @override
  Widget build(BuildContext context) {
    final f =
        '${fecha.day.toString().padLeft(2, '0')}·${fecha.month.toString().padLeft(2, '0')}·${fecha.year % 100}';
    return Padding(
      padding: const EdgeInsets.only(bottom: TokensCuadra.esp8),
      child: Row(
        children: [
          Text(f, style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(width: TokensCuadra.esp12),
          Expanded(child: Text(texto)),
        ],
      ),
    );
  }
}

class _AccionSiguiente extends ConsumerStatefulWidget {
  const _AccionSiguiente({required this.caso});

  final Case caso;

  @override
  ConsumerState<_AccionSiguiente> createState() => _AccionSiguienteState();
}

class _AccionSiguienteState extends ConsumerState<_AccionSiguiente> {
  bool? _yaAdhirio;

  @override
  void initState() {
    super.initState();
    _verificar();
  }

  Future<void> _verificar() async {
    final ya = await ref
        .read(repoCasosProvider)
        .yaAdhirio(caseId: widget.caso.id, userId: 'local');
    if (mounted) setState(() => _yaAdhirio = ya);
  }

  Future<void> _adherir() async {
    final t = Textos.of(context);
    final mensajero = ScaffoldMessenger.of(context);
    final r = await ref
        .read(repoCasosProvider)
        .adherir(caseId: widget.caso.id, userId: 'local', esResidente: true);
    mensajero.showSnackBar(
      SnackBar(
        content: Text(r.fold((f) => f.message, (_) => t.adheriste)),
        persist: false,
      ),
    );
    await _verificar();
  }

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    if (_yaAdhirio == null) return const SizedBox.shrink();

    if (_yaAdhirio == false && widget.caso.status.esperaAccion) {
      return FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: TokensCuadra.vial,
          foregroundColor: TokensCuadra.asfalto,
        ),
        onPressed: _adherir,
        child: Text(t.adherir),
      );
    }
    // Adherido y abierto: el siguiente escalón (presentación formal) es de
    // la Fase 2 — se dice explícito, nunca un callejón sin salida mudo.
    return Text(
      t.presentacionEnFase2,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
