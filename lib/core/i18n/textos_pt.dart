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

  @override
  String get buscarBarrio => 'Encontre seu bairro';
  @override
  String get buscarBarrioPista => 'Nome do bairro, cidade…';
  @override
  String get sinResultados =>
      'Seu bairro não aparece. Crie-o: o app verifica que existe e o adiciona ao mapa.';
  @override
  String get crearMiBarrio => 'Criar meu bairro';
  @override
  String get nombreDelBarrio => 'Como se chama seu bairro?';
  @override
  String get nombreDelBarrioPista => 'Ex.: Vila Madalena';
  @override
  String get validandoNombre => 'Verificando que o bairro existe…';
  @override
  String get nombreValidado => 'Encontrado no mapa. Agora marque seus limites.';
  @override
  String get nombreNoEncontrado =>
      'Não o encontramos no mapa. Você pode desenhar os limites mesmo assim: '
      'fica como proposto até que mais vizinhos o confirmem.';
  @override
  String get dibujarPoligono => 'Marque os limites';
  @override
  String get dibujarPoligonoPista =>
      'Toque no mapa para marcar cada esquina do bairro (mínimo 4).';
  @override
  String verticesYArea(int vertices, String areaKm2) =>
      '$vertices vértices · $areaKm2 km²';
  @override
  String get deshacerVertice => 'Desfazer último ponto';
  @override
  String get guardarBarrio => 'Propor este bairro';
  @override
  String get barrioCreado => 'Seu bairro foi proposto. Você já pode reportar.';
  @override
  String get barrioPropuestoAviso =>
      'Com 3 vizinhos verificados passa a ativo e aparece na busca pública.';
  @override
  String estadoBarrio(String estado) => switch (estado) {
    'propuesto' => 'Proposto',
    'activo' => 'Ativo',
    'consolidado' => 'Consolidado',
    'fusionado' => 'Fundido',
    _ => 'Oculto',
  };
  @override
  String vecinosVerificados(int n) =>
      n == 1 ? '1 vizinho verificado' : '$n vizinhos verificados';
}
