import 'textos.dart';

/// Português.
class TextosPt extends Textos {
  const TextosPt();

  @override
  String get nombreApp => 'Cuadra';
  @override
  String get tagline => 'Seu bairro deixa registro.';

  @override
  String get onboarding1 => 'Isto não é para reclamar. É para deixar registro.';
  @override
  String get onboarding2 => 'Você só vai ver o que acontece perto de você.';
  @override
  String get onboarding3 =>
      'Avisamos quando houver novidade, não para você voltar.';

  @override
  String get tabMiCuadra => 'Minha quadra';
  @override
  String get tabMapa => 'Mapa';
  @override
  String get tabReportar => 'Reportar';
  @override
  String get tabRegistro => 'Registro';
  @override
  String get tabPerfil => 'Perfil';

  @override
  String get selloPresentado => 'PROTOCOLADO';
  @override
  String selloSinRespuesta(int dias) => 'SEM RESPOSTA · $dias D';
  @override
  String get selloResuelto => 'RESOLVIDO';
  @override
  String get selloAbierto => 'ABERTO';
  @override
  String get selloArchivado => 'ARQUIVADO';
  @override
  String selloVencido(String fecha) => 'vencido $fecha';
  @override
  String get selloVerificado => 'verificado';

  @override
  String get finDeLista => 'Isso é tudo o que está aberto perto de você.';

  @override
  String get publicarEnMiCuadra => 'Publicar na minha quadra';
  @override
  String get presentarReclamoFormal => 'Protocolar reclamação formal';
  @override
  String get adherir => 'Aderir';
  @override
  String get aportarEvidencia => 'Adicionar evidência';
  @override
  String get marcarResuelto => 'Marcar como resolvido';
  @override
  String get disputar => 'Contestar';

  @override
  String get errorSinConexion =>
      'Sem conexão. Seu reporte fica salvo e será enviado quando o sinal voltar.';
  @override
  String get errorReintentar => 'Tentar de novo';
}
