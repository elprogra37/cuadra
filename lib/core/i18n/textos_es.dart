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
}
