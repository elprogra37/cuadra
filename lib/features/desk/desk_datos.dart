import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../data/providers.dart';
import 'datos_panel.dart';

/// Sección Datos del panel (§17.2, §20.4): embudo del barrio, respuesta del
/// organismo y exportación. La métrica visible es la respuesta del Estado,
/// nunca un puntaje de barrio (§15.2).
class DeskDatos extends ConsumerWidget {
  const DeskDatos({super.key, required this.barrioId});

  final String barrioId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final datos = ref.watch(datosBarrioProvider(barrioId));

    return datos.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('$e')),
      data: (d) => ListView(
        padding: const EdgeInsets.all(TokensCuadra.esp24),
        children: [
          Text(t.deskEmbudo, style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: TokensCuadra.esp16),
          Wrap(
            spacing: TokensCuadra.esp16,
            runSpacing: TokensCuadra.esp16,
            children: [
              _Tarjeta(rotulo: t.deskReportes, valor: '${d.reportes}'),
              _Tarjeta(rotulo: t.deskPresentados, valor: '${d.presentados}'),
              _Tarjeta(rotulo: t.deskRespondidos, valor: '${d.respondidos}'),
              _Tarjeta(rotulo: t.deskResueltos, valor: '${d.resueltos}'),
              _Tarjeta(
                rotulo: t.deskSinRespuesta,
                valor: '${d.sinRespuesta}',
                // El silencio del Estado se marca en rojo, no el barrio.
                tinta: d.sinRespuesta > 0 ? TokensCuadra.vencido : null,
              ),
              _Tarjeta(
                rotulo: t.deskTasaResolucion,
                valor: '${(d.tasaResolucion * 100).round()}%',
                tinta: TokensCuadra.sello,
              ),
              _Tarjeta(
                rotulo: t.deskDiasRespuestaOrg,
                valor: d.diasPromedioRespuesta == null
                    ? '—'
                    : d.diasPromedioRespuesta!.toStringAsFixed(0),
              ),
            ],
          ),
          const SizedBox(height: TokensCuadra.esp24),
          Text(
            t.deskBarrioEstigmaNota,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: TokensCuadra.esp24),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () => _exportarCsv(context, t, d),
                icon: const Icon(Icons.download),
                label: Text(t.deskExportarCsv),
              ),
              const SizedBox(width: TokensCuadra.esp12),
              OutlinedButton.icon(
                onPressed: () => _imprimir(t, d),
                icon: const Icon(Icons.print),
                label: Text(t.deskImprimirLegajo),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _exportarCsv(
    BuildContext context,
    Textos t,
    DatosBarrio d,
  ) async {
    final buffer = StringBuffer()
      ..writeln('metrica,valor')
      ..writeln('${t.deskReportes},${d.reportes}')
      ..writeln('${t.deskPresentados},${d.presentados}')
      ..writeln('${t.deskRespondidos},${d.respondidos}')
      ..writeln('${t.deskResueltos},${d.resueltos}')
      ..writeln('${t.deskSinRespuesta},${d.sinRespuesta}')
      ..writeln('${t.deskTasaResolucion},${(d.tasaResolucion * 100).round()}%')
      ..writeln(
        '${t.deskDiasRespuestaOrg},${d.diasPromedioRespuesta?.toStringAsFixed(1) ?? ''}',
      );
    for (final e in d.porCategoria.entries) {
      buffer.writeln('cat:${e.key},${e.value}');
    }
    final dir = await getApplicationDocumentsDirectory();
    final ruta = p.join(dir.path, 'cuadra-datos-$barrioId.csv');
    await File(ruta).writeAsString(buffer.toString());
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ruta), persist: false));
    }
  }

  Future<void> _imprimir(Textos t, DatosBarrio d) async {
    // Legajo de datos del barrio para llevar a la prensa o al concejo.
    await Printing.layoutPdf(
      onLayout: (format) async {
        final doc = pw.Document();
        pw.Widget fila(String k, String v) => pw.Padding(
          padding: const pw.EdgeInsets.symmetric(vertical: 2),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [pw.Text(k), pw.Text(v)],
          ),
        );
        doc.addPage(
          pw.Page(
            pageFormat: format,
            build: (ctx) => pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  t.deskEmbudo,
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 16),
                fila(t.deskReportes, '${d.reportes}'),
                fila(t.deskPresentados, '${d.presentados}'),
                fila(t.deskRespondidos, '${d.respondidos}'),
                fila(t.deskResueltos, '${d.resueltos}'),
                fila(t.deskSinRespuesta, '${d.sinRespuesta}'),
                fila(
                  t.deskTasaResolucion,
                  '${(d.tasaResolucion * 100).round()}%',
                ),
                fila(
                  t.deskDiasRespuestaOrg,
                  d.diasPromedioRespuesta?.toStringAsFixed(1) ?? '—',
                ),
                pw.SizedBox(height: 16),
                pw.Text(
                  t.deskBarrioEstigmaNota,
                  style: const pw.TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
        );
        return doc.save();
      },
    );
  }
}

class _Tarjeta extends StatelessWidget {
  const _Tarjeta({required this.rotulo, required this.valor, this.tinta});

  final String rotulo;
  final String valor;
  final Color? tinta;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(TokensCuadra.esp16),
      decoration: BoxDecoration(
        border: Border.all(color: TokensCuadra.tiza.withValues(alpha: 0.45)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valor,
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(color: tinta),
          ),
          const SizedBox(height: TokensCuadra.esp4),
          Text(rotulo, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
