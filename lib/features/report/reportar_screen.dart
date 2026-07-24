import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../app/router.dart';
import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../data/local/base_datos.dart';
import '../../data/models/categoria_def.dart';
import '../../data/models/texto_i18n.dart';
import '../../data/providers.dart';
import '../../services/camera/procesador_evidencia.dart';
import '../../services/documents/generador_escrito.dart';
import '../../services/moderation/filtro_texto.dart';
import '../../services/preferencias.dart';
import '../onboarding/entrar_vecino.dart';
import 'arbol_guiado.dart';

/// Flujo de reporte guiado (§9.2): cámara → ubicación → categoría → subtipo →
/// preguntas → vista previa del escrito → publicar. Funciona completo sin
/// conexión: todo queda en Drift y la cola sincroniza después.
class ReportarScreen extends ConsumerStatefulWidget {
  const ReportarScreen({super.key});

  @override
  ConsumerState<ReportarScreen> createState() => _ReportarScreenState();
}

enum _Paso { foto, ubicacion, categoria, subtipo, preguntas, revision }

class _ReportarScreenState extends ConsumerState<ReportarScreen> {
  var _paso = _Paso.foto;

  // Evidencia
  EvidenciaProcesada? _foto;

  // Ubicación (pin fijo al centro, el mapa se arrastra §9.2)
  final _mapa = MapController();
  LatLng? _pin;

  // Selecciones
  List<CategoriaDef> _categorias = [];
  CategoriaDef? _categoria;
  String? _subtipoId;
  Map<String, dynamic> _respuestas = {};
  final _textoLibre = TextEditingController();
  ResultadoFiltro _filtro = const ResultadoFiltro(aprobado: true);

  List<Case> _similares = [];
  var _publicando = false;

  /// En escritorio no hay captura (§20.4): se permite seguir sin foto.
  bool get _esEscritorio =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.windows;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    final categorias = await ref.read(repoCategoriasProvider).todas();
    if (!mounted) return;
    setState(() => _categorias = categorias.valueOrNull ?? []);
    await _ubicar();
  }

  Future<void> _ubicar() async {
    // GPS si se puede; si no, el centroide del barrio activo.
    try {
      final permiso = await Geolocator.checkPermission().then(
        (actual) async => actual == LocationPermission.denied
            ? Geolocator.requestPermission()
            : actual,
      );
      if (permiso != LocationPermission.denied &&
          permiso != LocationPermission.deniedForever) {
        final pos = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            timeLimit: Duration(seconds: 8),
          ),
        );
        if (mounted) setState(() => _pin = LatLng(pos.latitude, pos.longitude));
        return;
      }
    } on Exception {
      // Sin GPS no se frena el reporte: pin manual.
    }
    final barrioId = await ref.read(barrioActivoProvider.future);
    if (barrioId == null || !mounted) return;
    final barrio = await ref
        .read(repoGeografiaProvider)
        .watchBarrio(barrioId)
        .first;
    if (barrio != null && mounted) {
      setState(() => _pin = LatLng(barrio.centroidLat, barrio.centroidLng));
    }
  }

  Future<void> _sacarFoto() async {
    // Cámara nativa obligatoria, sin galería (§10.1).
    final captura = await ImagePicker().pickImage(
      source: ImageSource.camera,
      requestFullMetadata: false,
    );
    if (captura == null) return;
    final bytes = await captura.readAsBytes();
    final procesada = ProcesadorEvidencia.procesar(bytes);
    if (mounted) setState(() => _foto = procesada);
  }

  String get _idioma => Localizations.localeOf(context).languageCode;

  String get _escrito {
    final c = _categoria;
    final pin = _pin;
    if (c == null || _subtipoId == null || pin == null) return '';
    return GeneradorEscrito.generar(
      categoria: c,
      subtipoId: _subtipoId!,
      respuestas: _respuestas,
      textoLibre: _filtro.aprobado ? _textoLibre.text : null,
      ctx: ContextoEscrito(
        idioma: _idioma,
        lat: pin.latitude,
        lng: pin.longitude,
        fechaCaptura: DateTime.now(),
      ),
    );
  }

  Future<void> _buscarSimilares() async {
    final pin = _pin;
    final c = _categoria;
    if (pin == null || c == null) return;
    final similares = await ref
        .read(repoCasosProvider)
        .similaresCerca(
          lat: pin.latitude,
          lng: pin.longitude,
          categoryId: c.id,
        );
    if (mounted) setState(() => _similares = similares);
  }

  Future<void> _publicar() async {
    final pin = _pin;
    final c = _categoria;
    if (pin == null || c == null || _subtipoId == null || _publicando) return;
    // Modo visitante (§15.1): reportar exige ser vecino.
    if (!await asegurarVecino(context, ref)) return;
    if (!mounted) return;
    setState(() => _publicando = true);
    final t = Textos.of(context);
    final mensajero = ScaffoldMessenger.of(context);
    final sesion = await ref.read(sesionProvider.future);

    // Ubicación forzada (§10.3): el pin tiene que caer en el barrio activo.
    final barrioId = await ref.read(barrioActivoProvider.future);
    final resuelto = await ref
        .read(repoGeografiaProvider)
        .resolver(pin.latitude, pin.longitude);
    if (barrioId == null || resuelto == null || resuelto.id != barrioId) {
      mensajero.showSnackBar(
        SnackBar(content: Text(t.fueraDeTuBarrio), persist: false),
      );
      setState(() => _publicando = false);
      return;
    }

    final r = await ref
        .read(repoCasosProvider)
        .crearCaso(
          neighborhoodId: barrioId,
          categoryId: c.id,
          subtypeId: _subtipoId!,
          guidedAnswers: _respuestas,
          lat: pin.latitude,
          lng: pin.longitude,
          freeText: _filtro.aprobado && _textoLibre.text.trim().isNotEmpty
              ? _textoLibre.text.trim()
              : null,
          occurredSince: _respuestas['desde_cuando'] as String?,
          generatedBody: _escrito,
          createdBy: sesion.userId,
        );

    await r.fold(
      (falla) async {
        setState(() => _publicando = false);
        mensajero.showSnackBar(
          SnackBar(content: Text(falla.message), persist: false),
        );
      },
      (caso) async {
        final foto = _foto;
        if (foto != null) {
          final dir = await getApplicationDocumentsDirectory();
          final carpeta = Directory(p.join(dir.path, 'evidencias'));
          await carpeta.create(recursive: true);
          final ruta = p.join(carpeta.path, '${caso.id}.jpg');
          await File(ruta).writeAsBytes(foto.jpeg);
          await ref
              .read(repoCasosProvider)
              .agregarEvidencia(
                caseId: caso.id,
                localPath: ruta,
                sha256: foto.sha256,
                lat: pin.latitude,
                lng: pin.longitude,
                uploadedBy: sesion.userId,
              );
        }
        mensajero.showSnackBar(
          SnackBar(content: Text(t.reportePublicado), persist: false),
        );
        if (mounted) context.go(Rutas.miCuadra);
      },
    );
  }

  Future<void> _sumarme(Case caso) async {
    if (!await asegurarVecino(context, ref)) return;
    if (!mounted) return;
    final mensajero = ScaffoldMessenger.of(context);
    final t = Textos.of(context);
    final sesion = await ref.read(sesionProvider.future);
    final r = await ref
        .read(repoCasosProvider)
        .adherir(caseId: caso.id, userId: sesion.userId, esResidente: true);
    mensajero.showSnackBar(
      SnackBar(
        content: Text(r.fold((f) => f.message, (_) => t.reportePublicado)),
        persist: false,
      ),
    );
    if (mounted) context.go(Rutas.miCuadra);
  }

  @override
  void dispose() {
    _textoLibre.dispose();
    _mapa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(t.tabReportar)),
      body: switch (_paso) {
        _Paso.foto => _pasoFoto(t),
        _Paso.ubicacion => _pasoUbicacion(t),
        _Paso.categoria => _pasoCategoria(t),
        _Paso.subtipo => _pasoSubtipo(t),
        _Paso.preguntas => _pasoPreguntas(t),
        _Paso.revision => _pasoRevision(t),
      },
    );
  }

  Widget _boton(String texto, VoidCallback? onPressed) => Padding(
    padding: const EdgeInsets.all(TokensCuadra.esp16),
    child: SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: TokensCuadra.vial,
          foregroundColor: TokensCuadra.asfalto,
          disabledBackgroundColor: TokensCuadra.tiza.withValues(alpha: 0.3),
        ),
        onPressed: onPressed,
        child: Text(texto),
      ),
    ),
  );

  Widget _pasoFoto(Textos t) {
    final foto = _foto;
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(TokensCuadra.esp24),
              child: foto == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo_camera_outlined,
                          size: 56,
                          color: TokensCuadra.tiza,
                        ),
                        const SizedBox(height: TokensCuadra.esp16),
                        Text(
                          _esEscritorio
                              ? t.sinCamaraEnEscritorio
                              : t.fotoObligatoria,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Image.memory(foto.jpeg, fit: BoxFit.contain),
            ),
          ),
        ),
        if (!_esEscritorio)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TokensCuadra.esp16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _sacarFoto,
                child: Text(foto == null ? t.tomarFoto : t.repetirFoto),
              ),
            ),
          ),
        _boton(
          t.continuar,
          (foto != null || _esEscritorio)
              ? () => setState(() => _paso = _Paso.ubicacion)
              : null,
        ),
      ],
    );
  }

  Widget _pasoUbicacion(Textos t) {
    final pin = _pin ?? const LatLng(-34.6037, -58.3816);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(TokensCuadra.esp16),
          child: Text(t.ajustaElPin),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              FlutterMap(
                mapController: _mapa,
                options: MapOptions(
                  initialCenter: pin,
                  initialZoom: 17,
                  onPositionChanged: (pos, _) => _pin = pos.center,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.elprogra37.cuadra',
                  ),
                ],
              ),
              // El pin queda fijo al centro; lo que se arrastra es el mapa.
              const IgnorePointer(
                child: Icon(Icons.place, size: 44, color: TokensCuadra.vencido),
              ),
            ],
          ),
        ),
        _boton(t.confirmarUbicacion, () async {
          await _buscarSimilares();
          if (mounted) setState(() => _paso = _Paso.categoria);
        }),
      ],
    );
  }

  Widget _pasoCategoria(Textos t) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(TokensCuadra.esp16),
          child: Text(
            t.queEstaPasando,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(TokensCuadra.esp16),
            mainAxisSpacing: TokensCuadra.esp12,
            crossAxisSpacing: TokensCuadra.esp12,
            children: [
              for (final c in _categorias)
                InkWell(
                  onTap: () => setState(() {
                    _categoria = c;
                    _subtipoId = null;
                    _respuestas = {};
                    _paso = _Paso.subtipo;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TokensCuadra.tiza.withValues(alpha: 0.5),
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(c.icono, style: const TextStyle(fontSize: 32)),
                        const SizedBox(height: TokensCuadra.esp8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: TokensCuadra.esp4,
                          ),
                          child: Text(
                            c.nombre.resolver(_idioma),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _pasoSubtipo(Textos t) {
    final c = _categoria!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(TokensCuadra.esp16),
          child: Text(t.queTipo, style: Theme.of(context).textTheme.titleLarge),
        ),
        Expanded(
          child: ListView(
            children: [
              for (final s in c.subtipos)
                ListTile(
                  title: Text(s.nombre.resolver(_idioma)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => setState(() {
                    _subtipoId = s.id;
                    _paso = _Paso.preguntas;
                  }),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _pasoPreguntas(Textos t) {
    final c = _categoria!;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: TokensCuadra.esp16),
            child: ArbolGuiado(
              categoria: c,
              respuestas: _respuestas,
              idioma: _idioma,
              onCambio: (r) => setState(() => _respuestas = r),
            ),
          ),
        ),
        _boton(
          t.continuar,
          ArbolGuiado.completo(c, _respuestas)
              ? () => setState(() => _paso = _Paso.revision)
              : null,
        ),
      ],
    );
  }

  Widget _pasoRevision(Textos t) {
    return ListView(
      padding: const EdgeInsets.all(TokensCuadra.esp16),
      children: [
        if (_similares.isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.all(TokensCuadra.esp12),
            decoration: BoxDecoration(
              border: Border.all(color: TokensCuadra.vial, width: 2),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.yaHayCasoCerca(_similares.length),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: TokensCuadra.esp8),
                for (final s in _similares.take(3))
                  Text(
                    '${s.publicRef ?? s.id.substring(0, 8)} · '
                    '${s.endorsementCount} 🤝',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                const SizedBox(height: TokensCuadra.esp8),
                OutlinedButton(
                  onPressed: () => _sumarme(_similares.first),
                  child: Text(t.sumarmeAlCaso),
                ),
              ],
            ),
          ),
          const SizedBox(height: TokensCuadra.esp16),
        ],
        TextField(
          controller: _textoLibre,
          maxLength: FiltroTexto.maxCaracteres,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: t.algoMasOpcional,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            errorText: _filtro.aprobado
                ? null
                : t.textoNoPasa(_filtro.fragmento ?? ''),
            errorMaxLines: 4,
          ),
          onChanged: (v) => setState(() => _filtro = FiltroTexto.evaluar(v)),
        ),
        const SizedBox(height: TokensCuadra.esp16),
        Text(
          t.vistaPreviaEscrito,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: TokensCuadra.esp8),
        Container(
          padding: const EdgeInsets.all(TokensCuadra.esp12),
          decoration: BoxDecoration(
            border: Border.all(color: TokensCuadra.tiza.withValues(alpha: 0.5)),
            borderRadius: BorderRadius.circular(2),
          ),
          // El vecino ve EXACTAMENTE qué se va a decir (§9.2).
          child: Text(
            _escrito.replaceAll('**', ''),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        const SizedBox(height: TokensCuadra.esp8),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: TokensCuadra.vial,
              foregroundColor: TokensCuadra.asfalto,
            ),
            onPressed: _publicando ? null : _publicar,
            child: Text(
              _similares.isEmpty ? t.publicarEnMiCuadra : t.crearNuevoIgual,
            ),
          ),
        ),
      ],
    );
  }
}
