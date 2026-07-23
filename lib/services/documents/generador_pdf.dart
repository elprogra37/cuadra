import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart' show AssetBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../data/local/base_datos.dart';
import '../../data/models/ficha_jurisdiccion.dart';

/// Genera el PDF de presentación formal (§14.1): carátula, hechos y fechas,
/// ubicación exacta, evidencia con hash y timestamp, adherentes (verificados
/// aparte), normativa y petitorio. Es el documento que entra por mesa de
/// entradas: sobrio, en serif del sistema PDF + mono para los datos.
class GeneradorPdf {
  GeneradorPdf(this._bundle);

  final AssetBundle _bundle;
  pw.Font? _cuerpo;
  pw.Font? _mono;
  pw.Font? _negrita;

  Future<void> _cargarFuentes() async {
    if (_cuerpo != null) return;
    _cuerpo = pw.Font.ttf(
      await _bundle.load('assets/fonts/Inter-Variable.ttf'),
    );
    _negrita = _cuerpo;
    _mono = pw.Font.ttf(
      await _bundle.load('assets/fonts/JetBrainsMono-Variable.ttf'),
    );
  }

  Future<Uint8List> generar({
    required Case caso,
    required List<Evidence> evidencias,
    required Organismo organismo,
    required FichaJurisdiccion ficha,
    required String nombreBarrio,

    /// Tipo de escrito: reclamo | reiteracion | pronto_despacho |
    /// acceso_informacion | defensoria (§13).
    String tipo = 'reclamo',
  }) async {
    await _cargarFuentes();
    final doc = pw.Document();

    final estiloTitulo = pw.TextStyle(
      font: _negrita,
      fontSize: 12,
      fontWeight: pw.FontWeight.bold,
    );
    final estiloCuerpo = pw.TextStyle(font: _cuerpo, fontSize: 10.5);
    final estiloDato = pw.TextStyle(font: _mono, fontSize: 8.5);

    // Evidencia embebida (máx. 2 fotos por página de anexo).
    final fotos = <pw.MemoryImage>[];
    for (final e in evidencias) {
      final ruta = e.localPath;
      if (ruta == null) continue;
      final archivo = File(ruta);
      if (archivo.existsSync()) {
        fotos.add(pw.MemoryImage(archivo.readAsBytesSync()));
      }
    }

    String fecha(DateTime f) =>
        '${f.day.toString().padLeft(2, '0')}/${f.month.toString().padLeft(2, '0')}/${f.year}';

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(48),
        footer: (ctx) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Divider(thickness: 0.5),
            pw.Text(
              'Documento generado por Cuadra — expediente vecinal '
              '${caso.publicRef ?? caso.id} · página ${ctx.pageNumber}/${ctx.pagesCount}',
              style: estiloDato,
            ),
          ],
        ),
        build: (ctx) => [
          // Carátula
          pw.Container(
            padding: const pw.EdgeInsets.all(12),
            decoration: pw.BoxDecoration(border: pw.Border.all(width: 1.5)),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  _tituloTipo(tipo).toUpperCase(),
                  style: pw.TextStyle(
                    font: _negrita,
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 6),
                pw.Text('Ante: ${organismo.name}', style: estiloCuerpo),
                pw.Text(
                  '${ficha.name} · ${fecha(DateTime.now())}',
                  style: estiloCuerpo,
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  'Referencia: ${caso.publicRef ?? caso.id} · '
                  'Barrio: $nombreBarrio',
                  style: estiloDato,
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 16),

          // Cuerpo del escrito (secciones ya redactadas por la app §9).
          ..._secciones(caso.generatedBody, estiloTitulo, estiloCuerpo),

          pw.SizedBox(height: 12),

          // Adhesiones: verificadas aparte (§14.1).
          pw.Text('Adhesiones', style: estiloTitulo),
          pw.Text(
            'Adhesiones de vecinos: ${caso.endorsementCount} · '
            'Con domicilio verificado: ${caso.verifiedEndorsementCount}. '
            'El detalle nominal obra en el registro de la plataforma y se '
            'acompaña a requerimiento.',
            style: estiloCuerpo,
          ),
          pw.SizedBox(height: 12),

          // Ubicación
          pw.Text('Ubicación', style: estiloTitulo),
          pw.Text(
            'Coordenadas: ${caso.lat.toStringAsFixed(6)}, '
            '${caso.lng.toStringAsFixed(6)}'
            '${caso.addressText == null ? '' : ' · ${caso.addressText}'}',
            style: estiloDato,
          ),
          pw.SizedBox(height: 12),

          // Anexo de evidencia con integridad (§10.2).
          if (evidencias.isNotEmpty) ...[
            pw.Text('Anexo — Evidencia', style: estiloTitulo),
            for (var i = 0; i < evidencias.length; i++) ...[
              pw.SizedBox(height: 6),
              pw.Text(
                'Registro ${i + 1}: captura ${fecha(evidencias[i].capturedAt)} · '
                'SHA-256 ${evidencias[i].sha256}',
                style: estiloDato,
              ),
              if (i < fotos.length)
                pw.Container(
                  height: 260,
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Image(fotos[i], fit: pw.BoxFit.contain),
                ),
            ],
          ],
        ],
      ),
    );

    return doc.save();
  }

  static String _tituloTipo(String tipo) => switch (tipo) {
    'reiteracion' => 'Reiteración de reclamo',
    'pronto_despacho' => 'Solicitud de pronto despacho',
    'acceso_informacion' => 'Pedido de acceso a la información pública',
    'defensoria' => 'Presentación ante la Defensoría del Pueblo',
    _ => 'Reclamo administrativo',
  };

  /// Parte el escrito generado (con títulos `**X:**`) en widgets.
  static List<pw.Widget> _secciones(
    String cuerpo,
    pw.TextStyle titulo,
    pw.TextStyle normal,
  ) {
    final widgets = <pw.Widget>[];
    for (final linea in cuerpo.split('\n')) {
      if (linea.trim().isEmpty) {
        widgets.add(pw.SizedBox(height: 8));
      } else if (linea.startsWith('**') && linea.contains(':**')) {
        widgets.add(
          pw.Text(
            linea.replaceAll('**', '').replaceAll(':', ''),
            style: titulo,
          ),
        );
      } else {
        widgets.add(pw.Text(linea.replaceAll('**', ''), style: normal));
      }
    }
    return widgets;
  }
}
