import 'textos.dart';

/// English.
class TextosEn extends Textos {
  const TextosEn();

  @override
  String get nombreApp => 'Cuadra';
  @override
  String get tagline => 'Your block, on the record.';

  @override
  String get onboarding1 =>
      "This isn't for complaining. It's for leaving a record.";
  @override
  String get onboarding2 => "You'll only see what happens near you.";
  @override
  String get onboarding3 =>
      "We'll notify you when there's news, not to bring you back.";

  @override
  String get tabMiCuadra => 'My block';
  @override
  String get tabMapa => 'Map';
  @override
  String get tabReportar => 'Report';
  @override
  String get tabRegistro => 'Record';
  @override
  String get tabPerfil => 'Profile';

  @override
  String get selloPresentado => 'FILED';
  @override
  String selloSinRespuesta(int dias) => 'NO RESPONSE · $dias D';
  @override
  String get selloResuelto => 'RESOLVED';
  @override
  String get selloAbierto => 'OPEN';
  @override
  String get selloArchivado => 'ARCHIVED';
  @override
  String selloVencido(String fecha) => 'overdue $fecha';
  @override
  String get selloVerificado => 'verified';

  @override
  String get finDeLista => "That's everything open near you.";

  @override
  String get publicarEnMiCuadra => 'Publish to my block';
  @override
  String get presentarReclamoFormal => 'File formal claim';
  @override
  String get adherir => 'Endorse';
  @override
  String get aportarEvidencia => 'Add evidence';
  @override
  String get marcarResuelto => 'Mark resolved';
  @override
  String get disputar => 'Dispute';

  @override
  String get errorSinConexion =>
      'No connection. Your report is saved and will be sent when signal returns.';
  @override
  String get errorReintentar => 'Retry';
}
