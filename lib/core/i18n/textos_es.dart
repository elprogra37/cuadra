import 'textos.dart';

/// Español rioplatense. Fuente de verdad de todos los textos.
class TextosEs extends Textos {
  const TextosEs();

  @override
  String get nombreApp => 'Cuadra';
  @override
  String get tagline => 'Tu barrio deja constancia.';

  @override
  String get onboarding1 =>
      'Esto no es para quejarse. Es para dejar constancia.';
  @override
  String get onboarding2 => 'Solo vas a ver lo que pasa cerca tuyo.';
  @override
  String get onboarding3 =>
      'Te avisamos cuando haya novedad, no para que vuelvas.';

  @override
  String get tabMiCuadra => 'Mi cuadra';
  @override
  String get tabMapa => 'Mapa';
  @override
  String get tabReportar => 'Reportar';
  @override
  String get tabRegistro => 'Registro';
  @override
  String get tabPerfil => 'Perfil';

  @override
  String get selloPresentado => 'PRESENTADO';
  @override
  String selloSinRespuesta(int dias) => 'SIN RESPUESTA · $dias D';
  @override
  String get selloResuelto => 'RESUELTO';
  @override
  String get selloAbierto => 'ABIERTO';
  @override
  String get selloArchivado => 'ARCHIVADO';
  @override
  String selloVencido(String fecha) => 'vencido $fecha';
  @override
  String get selloVerificado => 'verificado';

  @override
  String get finDeLista => 'Eso es todo lo que hay abierto cerca tuyo.';

  @override
  String get publicarEnMiCuadra => 'Publicar en mi cuadra';
  @override
  String get presentarReclamoFormal => 'Presentar reclamo formal';
  @override
  String get adherir => 'Adherir';
  @override
  String get aportarEvidencia => 'Aportar evidencia';
  @override
  String get marcarResuelto => 'Marcar resuelto';
  @override
  String get disputar => 'Disputar';

  @override
  String get errorSinConexion =>
      'Sin conexión. Tu reporte queda guardado y se envía solo cuando vuelva la señal.';
  @override
  String get errorReintentar => 'Reintentar';

  @override
  String get buscarBarrio => 'Buscá tu barrio';
  @override
  String get buscarBarrioPista => 'Nombre del barrio, ciudad…';
  @override
  String get sinResultados =>
      'Tu barrio no aparece. Crealo: la app verifica que exista y lo suma al mapa.';
  @override
  String get crearMiBarrio => 'Crear mi barrio';
  @override
  String get nombreDelBarrio => '¿Cómo se llama tu barrio?';
  @override
  String get nombreDelBarrioPista => 'Ej.: Villa Crespo';
  @override
  String get validandoNombre => 'Verificando que el barrio exista…';
  @override
  String get nombreValidado =>
      'Encontrado en el mapa. Ahora marcá sus límites.';
  @override
  String get nombreNoEncontrado =>
      'No lo encontramos en el mapa. Podés dibujar sus límites igual: '
      'queda como propuesto hasta que más vecinos lo confirmen.';
  @override
  String get dibujarPoligono => 'Marcá los límites';
  @override
  String get dibujarPoligonoPista =>
      'Tocá el mapa para marcar cada esquina del barrio (mínimo 4).';
  @override
  String verticesYArea(int vertices, String areaKm2) =>
      '$vertices vértices · $areaKm2 km²';
  @override
  String get deshacerVertice => 'Deshacer último punto';
  @override
  String get guardarBarrio => 'Proponer este barrio';
  @override
  String get barrioCreado => 'Tu barrio quedó propuesto. Ya podés reportar.';
  @override
  String get barrioPropuestoAviso =>
      'Con 3 vecinos verificados pasa a activo y aparece en el buscador público.';
  @override
  String estadoBarrio(String estado) => switch (estado) {
    'propuesto' => 'Propuesto',
    'activo' => 'Activo',
    'consolidado' => 'Consolidado',
    'fusionado' => 'Fusionado',
    _ => 'Oculto',
  };
  @override
  String vecinosVerificados(int n) =>
      n == 1 ? '1 vecino verificado' : '$n vecinos verificados';
}
