import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'textos_en.dart';
import 'textos_es.dart';
import 'textos_pt.dart';

/// Textos de la interfaz. Ninguna cadena hardcodeada en la UI: todo pasa
/// por acá (convención del documento maestro, sección 25).
///
/// El español rioplatense es la fuente de verdad; en y pt traducen desde ahí.
abstract class Textos {
  const Textos();

  static const soportados = [Locale('es'), Locale('en'), Locale('pt')];

  static Textos of(BuildContext context) =>
      Localizations.of<Textos>(context, Textos)!;

  static const delegate = _TextosDelegate();

  // Identidad
  String get nombreApp;
  String get tagline;

  // Onboarding (sección 4.4)
  String get onboarding1;
  String get onboarding2;
  String get onboarding3;

  // Navegación principal
  String get tabMiCuadra;
  String get tabMapa;
  String get tabReportar;
  String get tabRegistro;
  String get tabPerfil;

  // Estados de caso (sellos)
  String get selloPresentado;
  String selloSinRespuesta(int dias);
  String get selloResuelto;
  String get selloAbierto;
  String get selloArchivado;
  String selloVencido(String fecha);
  String get selloVerificado;

  // Feed (sin scroll infinito: la lista termina y lo dice)
  String get finDeLista;

  // Acciones
  String get publicarEnMiCuadra;
  String get presentarReclamoFormal;
  String get adherir;
  String get aportarEvidencia;
  String get marcarResuelto;
  String get disputar;

  // Errores genéricos
  String get errorSinConexion;
  String get errorReintentar;

  // Buscador geográfico y alta de barrio (§6)
  String get buscarBarrio;
  String get buscarBarrioPista;
  String get sinResultados;
  String get crearMiBarrio;
  String get nombreDelBarrio;
  String get nombreDelBarrioPista;
  String get validandoNombre;
  String get nombreValidado;
  String get nombreNoEncontrado;
  String get dibujarPoligono;
  String get dibujarPoligonoPista;
  String verticesYArea(int vertices, String areaKm2);
  String get deshacerVertice;
  String get guardarBarrio;
  String get barrioCreado;
  String get barrioPropuestoAviso;
  String estadoBarrio(String estado);
  String vecinosVerificados(int n);

  // Flujo de reporte guiado (§9)
  String get tomarFoto;
  String get repetirFoto;
  String get fotoObligatoria;
  String get sinCamaraEnEscritorio;
  String get continuar;
  String get ajustaElPin;
  String get confirmarUbicacion;
  String get queEstaPasando;
  String get queTipo;
  String get contanosMas;
  String get algoMasOpcional;
  String textoNoPasa(String fragmento);
  String get vistaPreviaEscrito;
  String yaHayCasoCerca(int n);
  String get sumarmeAlCaso;
  String get crearNuevoIgual;
  String get reportePublicado;
  String get fueraDeTuBarrio;
}

class _TextosDelegate extends LocalizationsDelegate<Textos> {
  const _TextosDelegate();

  @override
  bool isSupported(Locale locale) =>
      Textos.soportados.any((l) => l.languageCode == locale.languageCode);

  // SynchronousFuture: los textos están compilados en el binario; cargar
  // async dejaría un primer frame sin localizaciones.
  @override
  Future<Textos> load(Locale locale) =>
      SynchronousFuture(switch (locale.languageCode) {
        'en' => const TextosEn(),
        'pt' => const TextosPt(),
        _ => const TextosEs(),
      });

  @override
  bool shouldReload(_TextosDelegate old) => false;
}
