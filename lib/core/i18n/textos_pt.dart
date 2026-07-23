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

  @override
  String get tomarFoto => 'Tirar a foto';
  @override
  String get repetirFoto => 'Tirar de novo';
  @override
  String get fotoObligatoria =>
      'A evidência começa com uma foto do local, tirada aqui e agora.';
  @override
  String get sinCamaraEnEscritorio =>
      'No computador não há captura: a foto é tirada com o telefone, no local. Você pode continuar sem foto e adicioná-la depois.';
  @override
  String get continuar => 'Continuar';
  @override
  String get ajustaElPin => 'Mova o mapa até o pino ficar sobre o problema.';
  @override
  String get confirmarUbicacion => 'É aqui';
  @override
  String get queEstaPasando => 'O que está acontecendo?';
  @override
  String get queTipo => 'De que tipo?';
  @override
  String get contanosMas => 'Conte mais';
  @override
  String get algoMasOpcional => 'Algo mais? (opcional, 200 caracteres)';
  @override
  String textoNoPasa(String fragmento) =>
      'Essa parte não pode ir em um registro público: “$fragmento”. '
      'Reformule ou publique sem este texto: a reclamação sai mesmo assim.';
  @override
  String get vistaPreviaEscrito => 'Assim fica o documento';
  @override
  String yaHayCasoCerca(int n) => n == 1
      ? 'Já existe um caso igual a menos de 80 metros'
      : 'Já existem $n casos iguais a menos de 80 metros';
  @override
  String get sumarmeAlCaso => 'Aderir a esse caso';
  @override
  String get crearNuevoIgual => 'É outro problema, criar novo';
  @override
  String get reportePublicado => 'Publicado na sua quadra. Ficou registrado.';
  @override
  String get fueraDeTuBarrio =>
      'O pino ficou fora do seu bairro. Só se reporta onde você mora.';

  @override
  String diasAbierto(int dias) => dias == 1 ? '1 dia' : '$dias dias';
  @override
  String adhesiones(int n) => n == 1 ? '1 adesão' : '$n adesões';
  @override
  String get casoNoEncontrado => 'Esse caso não está na sua base local.';
  @override
  String get adheriste => 'Sua adesão ficou registrada.';
  @override
  String get accionSiguiente => 'Próximo passo';
  @override
  String get verEnElMapa => 'Ver no mapa';
  @override
  String get lineaDeTiempo => 'Linha do tempo';
  @override
  String get eventoCreado => 'Reportado com evidência';
  @override
  String get eventoPresentado => 'Protocolado no órgão';
  @override
  String get eventoResuelto => 'Resolvido e verificado';
  @override
  String get presentacionEnFase2 =>
      'O protocolo formal no órgão chega na próxima fase. '
      'Enquanto isso, cada adesão fortalece o registro.';

  @override
  String presentadoConPlazo(int dias) =>
      'Protocolado. O órgão tem $dias dias para responder; o contador é público.';
  @override
  String esperandoRespuesta(int diasRestantes) => diasRestantes == 1
      ? 'O prazo vence amanhã. Enquanto isso: some adesões e evidências.'
      : 'Restam $diasRestantes dias de prazo. Enquanto isso: some adesões e evidências.';
  @override
  String escalonNombre(String tipo) => switch (tipo) {
    'presentar' => 'Protocolar reclamação formal',
    'reiterar' => 'Reiterar a reclamação',
    'prontoDespacho' => 'Pedir pronto despacho',
    'accesoInformacion' => 'Pedir acesso à informação',
    'defensoria' => 'Ir à Defensoria do Povo',
    'concejal' => 'Escrever ao seu vereador',
    'prensa' => 'Montar o dossiê de imprensa',
    'datoAbierto' => 'Publicar como dado aberto',
    _ => tipo,
  };
  @override
  String escalonDescripcion(String tipo) => switch (tipo) {
    'presentar' =>
      'O app redige o documento em formato oficial com a evidência anexa.',
    'reiterar' =>
      'Vencido o prazo, a reiteração deixa registro e renova o relógio por 15 dias.',
    'prontoDespacho' =>
      'Figura formal que obriga o órgão a se pronunciar sobre o processo.',
    'accesoInformacion' =>
      'O que foi feito com o processo? A lei obriga a responder.',
    'defensoria' =>
      'O órgão de controle assume o caso com todo o histórico anexo.',
    'concejal' =>
      'Contato direto com seu representante, com o documento já pronto.',
    'prensa' =>
      'Dossiê completo do caso: cronologia, evidências e silêncios. Pronto para enviar.',
    'datoAbierto' =>
      'O caso entra no registro público da cidade. O silêncio deixa de ser grátis.',
    _ => '',
  };
  @override
  String get generarYCompartirPdf => 'Gerar e compartilhar o PDF';
  @override
  String get sinOrganismos =>
      'Ainda não carregamos os órgãos da sua cidade. Seu caso fica registrado '
      'e será protocolado assim que estiverem.';
  @override
  String get fotoDelDespues => 'Foto do depois';
  @override
  String get reclamarResuelto => 'Marcar como resolvido';
  @override
  String get confirmarResolucion => 'Confirmar que está resolvido';
  @override
  String esperandoConfirmaciones(int faltan) => faltan == 1
      ? 'Falta 1 confirmação de outro vizinho para fechar o caso.'
      : 'Faltam $faltan confirmações de outros vizinhos para fechar o caso.';
  @override
  String get resueltoGracias =>
      'Resolvido e no registro do bairro, com os nomes de quem o empurrou.';

  @override
  String get deskPanel => 'Painel';
  @override
  String get deskCasos => 'Casos';
  @override
  String get deskDatos => 'Dados';
  @override
  String get deskModeracion => 'Moderação';
  @override
  String get deskBarrios => 'Bairros';
  @override
  String get deskColumnaRef => 'Processo';
  @override
  String get deskColumnaCategoria => 'Categoria';
  @override
  String get deskColumnaEstado => 'Estado';
  @override
  String get deskColumnaDias => 'Dias';
  @override
  String get deskColumnaAdhesiones => 'Adesões';
  @override
  String get deskFiltrar => 'Filtrar por texto, categoria ou estado…';
  @override
  String get deskEmbudo => 'Funil do bairro';
  @override
  String get deskReportes => 'Reportes';
  @override
  String get deskPresentados => 'Protocolados';
  @override
  String get deskRespondidos => 'Respondidos';
  @override
  String get deskResueltos => 'Resolvidos';
  @override
  String get deskSinRespuesta => 'Sem resposta';
  @override
  String get deskTasaResolucion => 'Taxa de resolução';
  @override
  String get deskDiasRespuestaOrg => 'Dias médios de resposta do órgão';
  @override
  String get deskExportarCsv => 'Exportar CSV';
  @override
  String get deskImprimirLegajo => 'Imprimir processo';
  @override
  String get deskSinBarrio =>
      'Escolha um bairro no telefone para ver sua mesa de trabalho aqui.';
  @override
  String get deskColaVacia => 'Nada pendente nesta fila.';
  @override
  String get deskBarrioEstigmaNota =>
      'Muitos reportes = bairro organizado. A métrica que importa é quanto o '
      'Estado demora a responder, não quantos problemas existem.';

  @override
  String get registroTitulo => 'Registro do bairro';
  @override
  String get registroVacio =>
      'Ainda não há casos resolvidos. Quando o primeiro for resolvido, fica aqui '
      'com o antes e o depois.';
  @override
  String get registroEmpujadoPor => 'Empurrado por';
  @override
  String get perfilTitulo => 'Perfil';
  @override
  String get perfilVisitante => 'Você está vendo como visitante';
  @override
  String get perfilVecino => 'Vizinho';
  @override
  String get perfilCambiarBarrio => 'Trocar de bairro';
  @override
  String get perfilIdioma => 'Idioma';
  @override
  String get perfilExportarDatos => 'Exportar meus dados';
  @override
  String get perfilBorrarDatos => 'Apagar meus dados';
  @override
  String get modoVisitante => 'Modo visitante';
  @override
  String get soloLectura =>
      'Você está vendo seu bairro em modo leitura. Para reportar e assinar, entre como vizinho.';
  @override
  String get entrarComoVecino => 'Entrar como vizinho';
  @override
  String tiempoMedioRespuesta(int dias) =>
      'A prefeitura leva em média $dias dias para responder aqui.';
  @override
  String get sinDatosAun => 'Ainda sem dados suficientes.';
}
