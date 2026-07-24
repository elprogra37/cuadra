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

  @override
  String get tomarFoto => 'Sacar la foto';
  @override
  String get repetirFoto => 'Sacarla de nuevo';
  @override
  String get fotoObligatoria =>
      'La evidencia arranca con una foto del lugar, sacada acá y ahora.';
  @override
  String get sinCamaraEnEscritorio =>
      'Desde la compu no hay captura: la foto se saca con el teléfono, en el lugar. Podés seguir sin foto y sumarla después.';
  @override
  String get continuar => 'Continuar';
  @override
  String get ajustaElPin =>
      'Movete en el mapa hasta que el pin quede sobre el problema.';
  @override
  String get confirmarUbicacion => 'Es acá';
  @override
  String get queEstaPasando => '¿Qué pasa?';
  @override
  String get queTipo => '¿De qué tipo?';
  @override
  String get contanosMas => 'Contanos más';
  @override
  String get algoMasOpcional => '¿Algo más? (opcional, 200 caracteres)';
  @override
  String textoNoPasa(String fragmento) =>
      'Esa parte no puede ir en un expediente público: “$fragmento”. '
      'Reformulala o publicá sin este texto: el reclamo sale igual.';
  @override
  String get vistaPreviaEscrito => 'Así queda el escrito';
  @override
  String yaHayCasoCerca(int n) => n == 1
      ? 'Ya hay un caso igual a menos de 80 metros'
      : 'Ya hay $n casos iguales a menos de 80 metros';
  @override
  String get sumarmeAlCaso => 'Sumarme a ese caso';
  @override
  String get crearNuevoIgual => 'Es otro problema, crear nuevo';
  @override
  String get reportePublicado =>
      'Publicado en tu cuadra. Quedó en el expediente.';
  @override
  String get fueraDeTuBarrio =>
      'El pin quedó fuera de tu barrio. Solo se reporta donde sos vecino.';

  @override
  String diasAbierto(int dias) => dias == 1 ? '1 día' : '$dias días';
  @override
  String adhesiones(int n) => n == 1 ? '1 adhesión' : '$n adhesiones';
  @override
  String get casoNoEncontrado => 'Ese caso no está en tu base local.';
  @override
  String get adheriste => 'Tu adhesión quedó registrada.';
  @override
  String get accionSiguiente => 'Paso siguiente';
  @override
  String get verEnElMapa => 'Ver en el mapa';
  @override
  String get lineaDeTiempo => 'Línea de tiempo';
  @override
  String get eventoCreado => 'Reportado con evidencia';
  @override
  String get eventoPresentado => 'Presentado ante el organismo';
  @override
  String get eventoResuelto => 'Resuelto y verificado';
  @override
  String get presentacionEnFase2 =>
      'La presentación formal ante el organismo llega en la próxima fase. '
      'Mientras tanto, cada adhesión hace más fuerte el expediente.';

  @override
  String presentadoConPlazo(int dias) =>
      'Presentado. El organismo tiene $dias días para responder; el contador '
      'queda a la vista de todos.';
  @override
  String esperandoRespuesta(int diasRestantes) => diasRestantes == 1
      ? 'El plazo vence mañana. Mientras tanto: sumá adhesiones y evidencia.'
      : 'Quedan $diasRestantes días de plazo. Mientras tanto: sumá adhesiones y evidencia.';
  @override
  String escalonNombre(String tipo) => switch (tipo) {
    'presentar' => 'Presentar reclamo formal',
    'reiterar' => 'Reiterar el reclamo',
    'prontoDespacho' => 'Pedir pronto despacho',
    'accesoInformacion' => 'Pedir acceso a la información',
    'defensoria' => 'Ir a la Defensoría del Pueblo',
    'concejal' => 'Escribirle a tu concejal',
    'prensa' => 'Armar el dossier de prensa',
    'datoAbierto' => 'Publicar como dato abierto',
    _ => tipo,
  };
  @override
  String escalonDescripcion(String tipo) => switch (tipo) {
    'presentar' =>
      'La app arma el escrito con formato de mesa de entradas y evidencia adjunta.',
    'reiterar' =>
      'Vencido el plazo, la reiteración deja constancia y renueva el reloj 15 días.',
    'prontoDespacho' =>
      'Figura formal que obliga al organismo a expedirse sobre el expediente.',
    'accesoInformacion' =>
      '¿Qué se hizo con el expediente? La ley obliga a responder.',
    'defensoria' =>
      'El organismo de control toma el caso con todo el historial adjunto.',
    'concejal' =>
      'Contacto directo a tu representante, con el escrito ya armado.',
    'prensa' =>
      'Dossier completo del caso: cronología, evidencia y silencios. Listo para enviar.',
    'datoAbierto' =>
      'El caso entra al registro público de la ciudad. El silencio deja de ser gratis.',
    _ => '',
  };
  @override
  String get generarYCompartirPdf => 'Generar y compartir el PDF';
  @override
  String get sinOrganismos =>
      'Todavía no cargamos los organismos de tu ciudad. Tu caso queda '
      'registrado y lo presentamos apenas estén.';
  @override
  String get fotoDelDespues => 'Foto del después';
  @override
  String get reclamarResuelto => 'Marcar como resuelto';
  @override
  String get confirmarResolucion => 'Confirmar que está resuelto';
  @override
  String esperandoConfirmaciones(int faltan) => faltan == 1
      ? 'Falta 1 confirmación de otro vecino para cerrar el caso.'
      : 'Faltan $faltan confirmaciones de otros vecinos para cerrar el caso.';
  @override
  String get resueltoGracias =>
      'Resuelto y en el registro del barrio, con los nombres de quienes lo empujaron.';

  @override
  String get deskPanel => 'Panel';
  @override
  String get deskCasos => 'Casos';
  @override
  String get deskDatos => 'Datos';
  @override
  String get deskModeracion => 'Moderación';
  @override
  String get deskBarrios => 'Barrios';
  @override
  String get deskColumnaRef => 'Expediente';
  @override
  String get deskColumnaCategoria => 'Categoría';
  @override
  String get deskColumnaEstado => 'Estado';
  @override
  String get deskColumnaDias => 'Días';
  @override
  String get deskColumnaAdhesiones => 'Adhesiones';
  @override
  String get deskFiltrar => 'Filtrar por texto, categoría o estado…';
  @override
  String get deskEmbudo => 'Embudo del barrio';
  @override
  String get deskReportes => 'Reportes';
  @override
  String get deskPresentados => 'Presentados';
  @override
  String get deskRespondidos => 'Respondidos';
  @override
  String get deskResueltos => 'Resueltos';
  @override
  String get deskSinRespuesta => 'Sin respuesta';
  @override
  String get deskTasaResolucion => 'Tasa de resolución';
  @override
  String get deskDiasRespuestaOrg => 'Días medios de respuesta del organismo';
  @override
  String get deskExportarCsv => 'Exportar CSV';
  @override
  String get deskImprimirLegajo => 'Imprimir legajo';
  @override
  String get deskSinBarrio =>
      'Elegí un barrio en el teléfono para ver su mesa de trabajo acá.';
  @override
  String get deskColaVacia => 'No hay nada pendiente en esta cola.';
  @override
  String get deskBarrioEstigmaNota =>
      'Muchos reportes = barrio organizado. La métrica que importa es cuánto '
      'tarda el Estado en responder, no cuántos problemas hay.';

  @override
  String get registroTitulo => 'Registro del barrio';
  @override
  String get registroVacio =>
      'Todavía no hay casos resueltos. Cuando se arregle el primero, queda acá '
      'con el antes y el después.';
  @override
  String get registroEmpujadoPor => 'Lo empujaron';
  @override
  String get perfilTitulo => 'Perfil';
  @override
  String get perfilVisitante => 'Estás mirando como visitante';
  @override
  String get perfilVecino => 'Vecino';
  @override
  String get perfilCambiarBarrio => 'Cambiar de barrio';
  @override
  String get perfilIdioma => 'Idioma';
  @override
  String get perfilExportarDatos => 'Exportar mis datos';
  @override
  String get perfilBorrarDatos => 'Borrar mis datos';
  @override
  String get modoVisitante => 'Modo visitante';
  @override
  String get soloLectura =>
      'Estás viendo tu barrio en modo lectura. Para reportar y firmar, entrá como vecino.';
  @override
  String get entrarComoVecino => 'Entrar como vecino';
  @override
  String tiempoMedioRespuesta(int dias) =>
      'El municipio tarda en promedio $dias días en responder acá.';
  @override
  String get sinDatosAun => 'Sin datos suficientes todavía.';

  @override
  String get onbEmpezar => 'Empezar';
  @override
  String get onbSiguiente => 'Siguiente';
  @override
  String get tuNombre => 'Tu nombre o apodo';
  @override
  String get tuNombrePista => 'Cómo van a verte tus vecinos';
  @override
  String get entrar => 'Entrar';
  @override
  String get comoTeLlamas => '¿Cómo querés que te vean en el barrio?';
  @override
  String get soloParaVecinos =>
      'Estás mirando como visitante. Para reportar, firmar o crear un barrio, '
      'entrá como vecino.';
  @override
  String get impactoTitulo => '¿Te afecta a vos también?';
  @override
  String get impactoAMiTambien => 'A mí también me pasa';
  @override
  String get impactoMiFamilia => 'Afecta a mi familia';
  @override
  String get impactoGasto => 'Me generó un gasto';
  @override
  String get impactoOmitir => 'Solo sumar mi firma';
}
