import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

import '../../core/i18n/textos.dart';
import '../../core/theme/estado_sello.dart';
import '../../core/theme/estado_sello_animado.dart';
import '../../core/theme/tokens.dart';
import '../../data/local/base_datos.dart';
import '../../data/models/enums.dart';
import '../../data/providers.dart';
import '../../services/camera/procesador_evidencia.dart';
import '../../services/documents/escalera.dart';
import '../../services/documents/generador_escrito.dart';
import '../../services/preferencias.dart';
import '../onboarding/entrar_vecino.dart';
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

        // Línea de tiempo: creación + cada acción de la escalera (§13).
        Text(t.lineaDeTiempo, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: TokensCuadra.esp8),
        _Evento(texto: t.eventoCreado, fecha: caso.createdAt),
        for (final accion
            in ref.watch(accionesProvider(caso.id)).value ?? <CaseAction>[])
          _Evento(
            texto: t.escalonNombre(accion.type.name),
            fecha: accion.performedAt,
          ),
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
  var _trabajando = false;

  Case get caso => widget.caso;

  @override
  void initState() {
    super.initState();
    _verificar();
  }

  Future<void> _verificar() async {
    final sesion = await ref.read(sesionProvider.future);
    final ya = await ref
        .read(repoCasosProvider)
        .yaAdhirio(caseId: caso.id, userId: sesion.userId);
    if (mounted) setState(() => _yaAdhirio = ya);
  }

  void _aviso(String mensaje) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(mensaje), persist: false));

  Future<void> _adherir() async {
    // Modo visitante (§15.1): firmar exige ser vecino.
    if (!await asegurarVecino(context, ref)) return;
    if (!mounted) return;
    // Confirmación de impacto (§11): convierte una firma en testimonio.
    final impacto = await _elegirImpacto();
    if (!mounted) return;
    final t = Textos.of(context);
    final sesion = await ref.read(sesionProvider.future);
    final r = await ref
        .read(repoCasosProvider)
        .adherir(
          caseId: caso.id,
          userId: sesion.userId,
          esResidente: true,
          impacto: impacto,
        );
    _aviso(r.fold((f) => f.message, (_) => t.adheriste));
    await _verificar();
  }

  /// Opciones cerradas de impacto (§11): a mí también / mi familia / un gasto.
  /// Devuelve la lista elegida (vacía = solo sumar la firma).
  Future<List<ImpactTag>> _elegirImpacto() async {
    final t = Textos.of(context);
    final seleccion = <ImpactTag>{};
    final confirmado = await showModalBottomSheet<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => Padding(
          padding: const EdgeInsets.all(TokensCuadra.esp24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(t.impactoTitulo, style: Theme.of(ctx).textTheme.titleLarge),
              const SizedBox(height: TokensCuadra.esp12),
              for (final (tag, label) in [
                (ImpactTag.aMiTambien, t.impactoAMiTambien),
                (ImpactTag.afectaMiFamilia, t.impactoMiFamilia),
                (ImpactTag.meGeneroGasto, t.impactoGasto),
              ])
                CheckboxListTile(
                  value: seleccion.contains(tag),
                  title: Text(label),
                  contentPadding: EdgeInsets.zero,
                  onChanged: (v) => setLocal(() {
                    if (v ?? false) {
                      seleccion.add(tag);
                    } else {
                      seleccion.remove(tag);
                    }
                  }),
                ),
              const SizedBox(height: TokensCuadra.esp8),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: TokensCuadra.vial,
                  foregroundColor: TokensCuadra.asfalto,
                ),
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(t.adherir),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(t.impactoOmitir),
              ),
            ],
          ),
        ),
      ),
    );
    return confirmado == true ? seleccion.toList() : <ImpactTag>[];
  }

  /// Presenta o escala: genera el PDF, lo comparte y registra la acción.
  Future<void> _ejecutarEscalon(CaseActionType tipo) async {
    if (_trabajando) return;
    // Presentar/escalar exige ser vecino (§7).
    if (!await asegurarVecino(context, ref)) return;
    if (!mounted) return;
    setState(() => _trabajando = true);
    final t = Textos.of(context);
    final sesion = await ref.read(sesionProvider.future);
    try {
      final jurisdiccionId = await ref
          .read(repoGeografiaProvider)
          .jurisdiccionDeBarrio(caso.neighborhoodId);
      if (jurisdiccionId == null) {
        _aviso(t.sinOrganismos);
        return;
      }
      final rOrg = await ref
          .read(repoJurisdiccionesProvider)
          .organismoPara(
            jurisdictionId: jurisdiccionId,
            categoryId: caso.categoryId,
          );
      final org = rOrg.valueOrNull;
      if (org == null) {
        _aviso(t.sinOrganismos);
        return;
      }

      // Escrito definitivo: con normativa, plazo y adhesiones actuales.
      final categoria =
          (await ref.read(repoCategoriasProvider).porId(caso.categoryId))
              .valueOrNull;
      var cuerpo = caso.generatedBody;
      if (categoria != null && mounted) {
        cuerpo = GeneradorEscrito.generar(
          categoria: categoria,
          subtipoId: caso.subtypeId,
          respuestas: jsonDecode(caso.guidedAnswers) as Map<String, dynamic>,
          textoLibre: caso.freeText,
          ctx: ContextoEscrito(
            idioma: Localizations.localeOf(context).languageCode,
            lat: caso.lat,
            lng: caso.lng,
            fechaCaptura: caso.createdAt,
            adhesiones: caso.endorsementCount,
            adhesionesVerificadas: caso.verifiedEndorsementCount,
            normativa: org.organismo.normativa,
            plazoDias: org.organismo.responseDays,
          ),
        );
      }

      final barrio = await ref
          .read(repoGeografiaProvider)
          .watchBarrio(caso.neighborhoodId)
          .first;
      final evidencias = await ref
          .read(repoCasosProvider)
          .watchEvidencias(caso.id)
          .first;
      final pdf = await ref
          .read(generadorPdfProvider)
          .generar(
            caso: caso,
            evidencias: evidencias,
            organismo: org.organismo,
            ficha: org.ficha,
            nombreBarrio: barrio?.name ?? '',
            tipo: Escalera.plantillaDe(tipo),
          );

      // Guardar el legajo y compartir/imprimir (canal Exportar PDF §14.2).
      final dir = await getApplicationDocumentsDirectory();
      final carpeta = Directory(p.join(dir.path, 'presentaciones'));
      await carpeta.create(recursive: true);
      final nombre =
          '${caso.publicRef?.replaceAll('#', 'exp-') ?? caso.id}-${tipo.name}.pdf';
      final ruta = p.join(carpeta.path, nombre);
      await File(ruta).writeAsBytes(pdf);
      await Printing.sharePdf(bytes: pdf, filename: nombre);

      if (tipo == CaseActionType.presentar) {
        final r = await ref
            .read(repoCasosProvider)
            .presentar(
              caseId: caso.id,
              jurisdictionId: jurisdiccionId,
              organismId: org.organismo.id,
              responseDays: org.organismo.responseDays,
              generatedBody: cuerpo,
              documentUrl: ruta,
              performedBy: sesion.userId,
            );
        _aviso(
          r.fold(
            (f) => f.message,
            (_) => t.presentadoConPlazo(org.organismo.responseDays),
          ),
        );
      } else {
        final r = await ref
            .read(repoCasosProvider)
            .escalar(
              caseId: caso.id,
              tipo: tipo,
              documentUrl: ruta,
              performedBy: sesion.userId,
            );
        _aviso(r.fold((f) => f.message, (_) => t.escalonNombre(tipo.name)));
      }
    } finally {
      if (mounted) setState(() => _trabajando = false);
    }
  }

  Future<void> _reclamarResuelto() async {
    if (!await asegurarVecino(context, ref)) return;
    if (!mounted) return;
    final t = Textos.of(context);
    final sesion = await ref.read(sesionProvider.future);
    // Foto del después: cámara en Android; en escritorio se permite sin foto.
    String? ruta;
    String? hash;
    if (defaultTargetPlatform == TargetPlatform.android) {
      final captura = await ImagePicker().pickImage(
        source: ImageSource.camera,
        requestFullMetadata: false,
      );
      if (captura == null) return;
      final procesada = ProcesadorEvidencia.procesar(
        await captura.readAsBytes(),
      );
      final dir = await getApplicationDocumentsDirectory();
      final carpeta = Directory(p.join(dir.path, 'evidencias'));
      await carpeta.create(recursive: true);
      ruta = p.join(carpeta.path, '${caso.id}-despues.jpg');
      await File(ruta).writeAsBytes(procesada.jpeg);
      hash = procesada.sha256;
    }
    final r = await ref
        .read(repoCasosProvider)
        .reclamarResuelto(
          caseId: caso.id,
          userId: sesion.userId,
          fotoDespuesPath: ruta,
          sha256Foto: hash,
        );
    _aviso(r.fold((f) => f.message, (_) => t.esperandoConfirmaciones(2)));
  }

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    final acciones = ref.watch(accionesProvider(caso.id)).value ?? [];
    final resolucion = ref.watch(resolucionProvider(caso.id)).value;

    // Resolución en curso o cerrada.
    if (caso.status == CaseStatus.resuelto) {
      return Text(t.resueltoGracias);
    }
    if (caso.status == CaseStatus.enEjecucion && resolucion != null) {
      final confirmaciones =
          (jsonDecode(resolucion.confirmations) as List<dynamic>).length;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(t.esperandoConfirmaciones(2 - confirmaciones)),
          const SizedBox(height: TokensCuadra.esp8),
          OutlinedButton(
            onPressed: () async {
              if (!await asegurarVecino(context, ref)) return;
              final sesion = await ref.read(sesionProvider.future);
              final r = await ref
                  .read(repoCasosProvider)
                  .confirmarResuelto(caseId: caso.id, userId: sesion.userId);
              _aviso(r.fold((f) => f.message, (_) => t.resueltoGracias));
            },
            child: Text(t.confirmarResolucion),
          ),
        ],
      );
    }

    final proximo = Escalera.proximo(caso.status, [
      for (final a in acciones) a.type,
    ]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (proximo != null) ...[
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: TokensCuadra.vial,
              foregroundColor: TokensCuadra.asfalto,
            ),
            onPressed: _trabajando ? null : () => _ejecutarEscalon(proximo),
            child: Text(t.escalonNombre(proximo.name)),
          ),
          const SizedBox(height: TokensCuadra.esp4),
          Text(
            t.escalonDescripcion(proximo.name),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ] else if (caso.status == CaseStatus.presentado &&
            caso.deadlineAt != null)
          Text(
            t.esperandoRespuesta(
              caso.deadlineAt!.difference(DateTime.now()).inDays,
            ),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        const SizedBox(height: TokensCuadra.esp8),
        if (_yaAdhirio == false && caso.status.esperaAccion)
          OutlinedButton(onPressed: _adherir, child: Text(t.adherir)),
        if (caso.status == CaseStatus.presentado ||
            caso.status == CaseStatus.sinRespuesta ||
            caso.status == CaseStatus.abierto) ...[
          const SizedBox(height: TokensCuadra.esp8),
          TextButton(
            onPressed: _reclamarResuelto,
            child: Text(t.reclamarResuelto),
          ),
          // Aportar evidencia y disputar (§11): las otras interacciones
          // estructuradas del caso, con opciones cerradas.
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: _aportarEvidencia,
                  icon: const Icon(Icons.add_a_photo_outlined, size: 18),
                  label: Text(t.aportarEvidencia),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  onPressed: _disputar,
                  icon: const Icon(Icons.flag_outlined, size: 18),
                  label: Text(t.disputar),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Future<void> _aportarEvidencia() async {
    if (!await asegurarVecino(context, ref)) return;
    if (!mounted || defaultTargetPlatform != TargetPlatform.android) return;
    final t = Textos.of(context);
    final sesion = await ref.read(sesionProvider.future);
    final captura = await ImagePicker().pickImage(
      source: ImageSource.camera,
      requestFullMetadata: false,
    );
    if (captura == null) return;
    final procesada = ProcesadorEvidencia.procesar(await captura.readAsBytes());
    final dir = await getApplicationDocumentsDirectory();
    final carpeta = Directory(p.join(dir.path, 'evidencias'));
    await carpeta.create(recursive: true);
    final ruta = p.join(
      carpeta.path,
      '${caso.id}-${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await File(ruta).writeAsBytes(procesada.jpeg);
    final r = await ref
        .read(repoCasosProvider)
        .agregarEvidencia(
          caseId: caso.id,
          localPath: ruta,
          sha256: procesada.sha256,
          uploadedBy: sesion.userId,
        );
    _aviso(r.fold((f) => f.message, (_) => t.evidenciaAgregada));
  }

  Future<void> _disputar() async {
    if (!await asegurarVecino(context, ref)) return;
    if (!mounted) return;
    final t = Textos.of(context);
    final motivo = await showModalBottomSheet<DisputeReason>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(TokensCuadra.esp16),
              child: Text(
                t.disputarTitulo,
                style: Theme.of(ctx).textTheme.titleLarge,
              ),
            ),
            for (final (m, label) in [
              (DisputeReason.yaResuelto, t.disputaYaResuelto),
              (DisputeReason.ubicacionIncorrecta, t.disputaUbicacion),
              (DisputeReason.categoriaIncorrecta, t.disputaCategoria),
              (DisputeReason.noCorresponde, t.disputaNoCorresponde),
            ])
              ListTile(title: Text(label), onTap: () => Navigator.pop(ctx, m)),
          ],
        ),
      ),
    );
    if (motivo == null || !mounted) return;
    final sesion = await ref.read(sesionProvider.future);
    final r = await ref
        .read(repoCasosProvider)
        .disputar(caseId: caso.id, userId: sesion.userId, motivo: motivo);
    _aviso(r.fold((f) => f.message, (_) => t.disputaste));
  }
}
