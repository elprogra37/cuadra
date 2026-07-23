import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../app/router.dart';
import '../../core/i18n/textos.dart';
import '../../core/theme/tokens.dart';
import '../../data/local/base_datos.dart';
import '../../data/providers.dart';
import '../../data/repositories/repo_geografia.dart';
import '../../services/geografia/validador_toponimos.dart';
import '../../services/preferencias.dart';

/// Alta de barrio (§6.2): nombre → validación externa automática → dibujo
/// del polígono → propuesto. Nada bloquea: si la validación no encuentra el
/// topónimo, se dibuja igual y queda como manual.
class CrearBarrioScreen extends ConsumerStatefulWidget {
  const CrearBarrioScreen({super.key});

  @override
  ConsumerState<CrearBarrioScreen> createState() => _CrearBarrioScreenState();
}

enum _Validacion { sinValidar, validando, encontrado, noEncontrado }

class _CrearBarrioScreenState extends ConsumerState<CrearBarrioScreen> {
  final _nombre = TextEditingController();
  City? _ciudad;
  List<City> _ciudades = [];
  var _validacion = _Validacion.sinValidar;
  ValidacionToponimo? _resultadoValidacion;
  final _vertices = <LatLng>[];
  var _guardando = false;
  final _mapa = MapController();

  @override
  void initState() {
    super.initState();
    _cargarCiudades();
  }

  Future<void> _cargarCiudades() async {
    await ref.read(siembraLocalProvider.future);
    final db = ref.read(baseDatosProvider);
    final ciudades = await db.select(db.cities).get();
    if (!mounted) return;
    setState(() {
      _ciudades = ciudades;
      _ciudad = ciudades.isEmpty ? null : ciudades.first;
    });
  }

  @override
  void dispose() {
    _nombre.dispose();
    _mapa.dispose();
    super.dispose();
  }

  Future<void> _validarNombre() async {
    final ciudad = _ciudad;
    if (ciudad == null || _nombre.text.trim().isEmpty) return;
    setState(() => _validacion = _Validacion.validando);
    final r = await ref
        .read(validadorToponimosProvider)
        .validar(
          nombre: '${_nombre.text.trim()}, ${ciudad.name}',
          lat: ciudad.lat ?? 0,
          lng: ciudad.lng ?? 0,
        );
    if (!mounted) return;
    setState(() {
      _resultadoValidacion = r.valueOrNull;
      _validacion = (r.valueOrNull?.encontrado ?? false)
          ? _Validacion.encontrado
          : _Validacion.noEncontrado;
    });
    final v = _resultadoValidacion;
    if (v != null && v.encontrado && v.lat != null) {
      _mapa.move(LatLng(v.lat!, v.lng!), 14);
    }
  }

  double get _areaKm2 => RepoGeografia.areaKm2([
    for (final v in _vertices) (lat: v.latitude, lng: v.longitude),
  ]);

  Future<void> _guardar() async {
    final ciudad = _ciudad;
    if (ciudad == null || _guardando) return;
    setState(() => _guardando = true);
    final t = Textos.of(context);
    final mensajero = ScaffoldMessenger.of(context);

    final r = await ref
        .read(repoGeografiaProvider)
        .crearBarrio(
          cityId: ciudad.id,
          nombre: _nombre.text.trim(),
          poligono: [
            for (final v in _vertices) (lat: v.latitude, lng: v.longitude),
          ],
          validationSource: _validacion == _Validacion.encontrado
              ? 'osm'
              : 'manual',
          validationPayload: _resultadoValidacion?.payload,
        );

    if (!mounted) return;
    await r.fold(
      (falla) async {
        setState(() => _guardando = false);
        mensajero.showSnackBar(
          SnackBar(content: Text(falla.message), persist: false),
        );
      },
      (barrio) async {
        final prefs = await ref.read(preferenciasProvider.future);
        await prefs.setBarrioActivo(barrio.id);
        ref.invalidate(barrioActivoProvider);
        mensajero.showSnackBar(
          SnackBar(content: Text(t.barrioCreado), persist: false),
        );
        if (mounted) context.go(Rutas.miCuadra);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    final ciudad = _ciudad;
    final centro = ciudad == null
        ? const LatLng(-34.6037, -58.3816)
        : LatLng(ciudad.lat ?? -34.6037, ciudad.lng ?? -58.3816);
    final puedeGuardar =
        _vertices.length >= RepoGeografia.minVertices &&
        _nombre.text.trim().isNotEmpty &&
        !_guardando;

    return Scaffold(
      appBar: AppBar(title: Text(t.crearMiBarrio)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(TokensCuadra.esp16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_ciudades.isNotEmpty)
                  DropdownButtonFormField<City>(
                    initialValue: ciudad,
                    items: [
                      for (final c in _ciudades)
                        DropdownMenuItem(value: c, child: Text(c.name)),
                    ],
                    onChanged: (c) {
                      setState(() => _ciudad = c);
                      if (c?.lat != null) {
                        _mapa.move(LatLng(c!.lat!, c.lng!), 12);
                      }
                    },
                  ),
                const SizedBox(height: TokensCuadra.esp12),
                TextField(
                  controller: _nombre,
                  decoration: InputDecoration(
                    labelText: t.nombreDelBarrio,
                    hintText: t.nombreDelBarrioPista,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.travel_explore),
                      tooltip: t.validandoNombre,
                      onPressed: _validarNombre,
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                  onSubmitted: (_) => _validarNombre(),
                ),
                const SizedBox(height: TokensCuadra.esp8),
                _MensajeValidacion(estado: _validacion),
              ],
            ),
          ),
          Expanded(
            child: FlutterMap(
              mapController: _mapa,
              options: MapOptions(
                initialCenter: centro,
                initialZoom: 12,
                onTap: (_, punto) => setState(() => _vertices.add(punto)),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.elprogra37.cuadra',
                ),
                if (_vertices.length >= 3)
                  PolygonLayer(
                    polygons: [
                      Polygon(
                        points: _vertices,
                        color: TokensCuadra.vial.withValues(alpha: 0.25),
                        borderColor: TokensCuadra.vial,
                        borderStrokeWidth: 2,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: [
                    for (final v in _vertices)
                      Marker(
                        point: v,
                        width: 14,
                        height: 14,
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                            color: TokensCuadra.vial,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(TokensCuadra.esp16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _vertices.isEmpty
                              ? t.dibujarPoligonoPista
                              : t.verticesYArea(
                                  _vertices.length,
                                  _areaKm2.toStringAsFixed(1),
                                ),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      if (_vertices.isNotEmpty)
                        IconButton(
                          onPressed: () =>
                              setState(() => _vertices.removeLast()),
                          icon: const Icon(Icons.undo),
                          tooltip: t.deshacerVertice,
                        ),
                    ],
                  ),
                  const SizedBox(height: TokensCuadra.esp8),
                  FilledButton(
                    // Acción pendiente por excelencia: amarillo vial.
                    style: FilledButton.styleFrom(
                      backgroundColor: TokensCuadra.vial,
                      foregroundColor: TokensCuadra.asfalto,
                    ),
                    onPressed: puedeGuardar ? _guardar : null,
                    child: Text(t.guardarBarrio),
                  ),
                  const SizedBox(height: TokensCuadra.esp4),
                  Text(
                    t.barrioPropuestoAviso,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MensajeValidacion extends StatelessWidget {
  const _MensajeValidacion({required this.estado});

  final _Validacion estado;

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    return switch (estado) {
      _Validacion.sinValidar => const SizedBox.shrink(),
      _Validacion.validando => Row(
        children: [
          const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: TokensCuadra.esp8),
          Text(t.validandoNombre, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
      _Validacion.encontrado => Text(
        t.nombreValidado,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: TokensCuadra.sello),
      ),
      _Validacion.noEncontrado => Text(
        t.nombreNoEncontrado,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    };
  }
}
