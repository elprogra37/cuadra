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

  @override
  String get buscarBarrio => 'Find your neighborhood';
  @override
  String get buscarBarrioPista => 'Neighborhood name, city…';
  @override
  String get sinResultados =>
      "Your neighborhood isn't listed. Create it: the app verifies it exists and adds it to the map.";
  @override
  String get crearMiBarrio => 'Create my neighborhood';
  @override
  String get nombreDelBarrio => "What's your neighborhood called?";
  @override
  String get nombreDelBarrioPista => 'E.g.: Villa Crespo';
  @override
  String get validandoNombre => 'Checking that the neighborhood exists…';
  @override
  String get nombreValidado => 'Found on the map. Now mark its boundaries.';
  @override
  String get nombreNoEncontrado =>
      "We couldn't find it on the map. You can still draw its boundaries: "
      'it stays proposed until more neighbors confirm it.';
  @override
  String get dibujarPoligono => 'Mark the boundaries';
  @override
  String get dibujarPoligonoPista =>
      'Tap the map to mark each corner of the neighborhood (minimum 4).';
  @override
  String verticesYArea(int vertices, String areaKm2) =>
      '$vertices vertices · $areaKm2 km²';
  @override
  String get deshacerVertice => 'Undo last point';
  @override
  String get guardarBarrio => 'Propose this neighborhood';
  @override
  String get barrioCreado =>
      'Your neighborhood is proposed. You can already report.';
  @override
  String get barrioPropuestoAviso =>
      'With 3 verified neighbors it becomes active and shows in public search.';
  @override
  String estadoBarrio(String estado) => switch (estado) {
    'propuesto' => 'Proposed',
    'activo' => 'Active',
    'consolidado' => 'Established',
    'fusionado' => 'Merged',
    _ => 'Hidden',
  };
  @override
  String vecinosVerificados(int n) =>
      n == 1 ? '1 verified neighbor' : '$n verified neighbors';

  @override
  String get tomarFoto => 'Take the photo';
  @override
  String get repetirFoto => 'Retake it';
  @override
  String get fotoObligatoria =>
      'Evidence starts with a photo of the place, taken here and now.';
  @override
  String get sinCamaraEnEscritorio =>
      'No capture from desktop: photos are taken with your phone, on site. You can continue without a photo and add it later.';
  @override
  String get continuar => 'Continue';
  @override
  String get ajustaElPin => 'Move the map until the pin sits on the problem.';
  @override
  String get confirmarUbicacion => "It's here";
  @override
  String get queEstaPasando => "What's happening?";
  @override
  String get queTipo => 'What kind?';
  @override
  String get contanosMas => 'Tell us more';
  @override
  String get algoMasOpcional => 'Anything else? (optional, 200 characters)';
  @override
  String textoNoPasa(String fragmento) =>
      'That part can\'t go in a public record: "$fragmento". '
      'Rephrase it or publish without this text: the claim goes through anyway.';
  @override
  String get vistaPreviaEscrito => 'This is how the filing reads';
  @override
  String yaHayCasoCerca(int n) => n == 1
      ? 'There is already an identical case within 80 meters'
      : 'There are already $n identical cases within 80 meters';
  @override
  String get sumarmeAlCaso => 'Join that case';
  @override
  String get crearNuevoIgual => "It's a different problem, create new";
  @override
  String get reportePublicado => 'Published to your block. On the record.';
  @override
  String get fueraDeTuBarrio =>
      'The pin landed outside your neighborhood. You can only report where you live.';

  @override
  String diasAbierto(int dias) => dias == 1 ? '1 day' : '$dias days';
  @override
  String adhesiones(int n) => n == 1 ? '1 endorsement' : '$n endorsements';
  @override
  String get casoNoEncontrado => "That case isn't in your local database.";
  @override
  String get adheriste => 'Your endorsement is on record.';
  @override
  String get accionSiguiente => 'Next step';
  @override
  String get verEnElMapa => 'See on the map';
  @override
  String get lineaDeTiempo => 'Timeline';
  @override
  String get eventoCreado => 'Reported with evidence';
  @override
  String get eventoPresentado => 'Filed with the agency';
  @override
  String get eventoResuelto => 'Resolved and verified';
  @override
  String get presentacionEnFase2 =>
      'Formal filing with the agency arrives in the next phase. '
      'Meanwhile, every endorsement makes the record stronger.';

  @override
  String presentadoConPlazo(int dias) =>
      'Filed. The agency has $dias days to respond; the clock is public.';
  @override
  String esperandoRespuesta(int diasRestantes) => diasRestantes == 1
      ? 'The deadline is tomorrow. Meanwhile: add endorsements and evidence.'
      : '$diasRestantes days left on the clock. Meanwhile: add endorsements and evidence.';
  @override
  String escalonNombre(String tipo) => switch (tipo) {
    'presentar' => 'File formal claim',
    'reiterar' => 'Reiterate the claim',
    'prontoDespacho' => 'Demand prompt dispatch',
    'accesoInformacion' => 'File an information request',
    'defensoria' => 'Go to the Ombudsman',
    'concejal' => 'Write to your council member',
    'prensa' => 'Build the press dossier',
    'datoAbierto' => 'Publish as open data',
    _ => tipo,
  };
  @override
  String escalonDescripcion(String tipo) => switch (tipo) {
    'presentar' =>
      'The app drafts the filing in official format with evidence attached.',
    'reiterar' =>
      'Past the deadline, reiteration leaves a record and restarts a 15-day clock.',
    'prontoDespacho' =>
      'A formal figure that obliges the agency to rule on the file.',
    'accesoInformacion' =>
      'What was done with the file? The law requires an answer.',
    'defensoria' =>
      'The oversight body takes the case with its full history attached.',
    'concejal' =>
      'Direct contact to your representative, with the letter already drafted.',
    'prensa' =>
      'Complete case dossier: chronology, evidence and silences. Ready to send.',
    'datoAbierto' =>
      "The case enters the city's public record. Silence stops being free.",
    _ => '',
  };
  @override
  String get generarYCompartirPdf => 'Generate and share the PDF';
  @override
  String get sinOrganismos =>
      "We haven't loaded your city's agencies yet. Your case stays on record "
      'and gets filed as soon as they are.';
  @override
  String get fotoDelDespues => 'After photo';
  @override
  String get reclamarResuelto => 'Mark as resolved';
  @override
  String get confirmarResolucion => 'Confirm it is resolved';
  @override
  String esperandoConfirmaciones(int faltan) => faltan == 1
      ? '1 more neighbor confirmation needed to close the case.'
      : '$faltan more neighbor confirmations needed to close the case.';
  @override
  String get resueltoGracias =>
      "Resolved and in the neighborhood's record, with the names of those who pushed it.";

  @override
  String get deskPanel => 'Dashboard';
  @override
  String get deskCasos => 'Cases';
  @override
  String get deskDatos => 'Data';
  @override
  String get deskModeracion => 'Moderation';
  @override
  String get deskBarrios => 'Neighborhoods';
  @override
  String get deskColumnaRef => 'File';
  @override
  String get deskColumnaCategoria => 'Category';
  @override
  String get deskColumnaEstado => 'Status';
  @override
  String get deskColumnaDias => 'Days';
  @override
  String get deskColumnaAdhesiones => 'Endorsements';
  @override
  String get deskFiltrar => 'Filter by text, category or status…';
  @override
  String get deskEmbudo => 'Neighborhood funnel';
  @override
  String get deskReportes => 'Reports';
  @override
  String get deskPresentados => 'Filed';
  @override
  String get deskRespondidos => 'Answered';
  @override
  String get deskResueltos => 'Resolved';
  @override
  String get deskSinRespuesta => 'No response';
  @override
  String get deskTasaResolucion => 'Resolution rate';
  @override
  String get deskDiasRespuestaOrg => 'Average agency response days';
  @override
  String get deskExportarCsv => 'Export CSV';
  @override
  String get deskImprimirLegajo => 'Print file';
  @override
  String get deskSinBarrio =>
      'Pick a neighborhood on your phone to see its workbench here.';
  @override
  String get deskColaVacia => 'Nothing pending in this queue.';
  @override
  String get deskBarrioEstigmaNota =>
      'Many reports = an organized neighborhood. The metric that matters is how '
      'long the State takes to respond, not how many problems there are.';

  @override
  String get registroTitulo => 'Neighborhood record';
  @override
  String get registroVacio =>
      'No resolved cases yet. When the first one gets fixed, it lands here with '
      'the before and after.';
  @override
  String get registroEmpujadoPor => 'Pushed by';
  @override
  String get perfilTitulo => 'Profile';
  @override
  String get perfilVisitante => "You're viewing as a visitor";
  @override
  String get perfilVecino => 'Neighbor';
  @override
  String get perfilCambiarBarrio => 'Change neighborhood';
  @override
  String get perfilIdioma => 'Language';
  @override
  String get perfilExportarDatos => 'Export my data';
  @override
  String get perfilBorrarDatos => 'Delete my data';
  @override
  String get modoVisitante => 'Visitor mode';
  @override
  String get soloLectura =>
      "You're viewing your neighborhood read-only. To report and sign, enter as a neighbor.";
  @override
  String get entrarComoVecino => 'Enter as a neighbor';
  @override
  String tiempoMedioRespuesta(int dias) =>
      'The city takes an average of $dias days to respond here.';
  @override
  String get sinDatosAun => 'Not enough data yet.';

  @override
  String get onbEmpezar => 'Get started';
  @override
  String get onbSiguiente => 'Next';
  @override
  String get tuNombre => 'Your name or nickname';
  @override
  String get tuNombrePista => 'How your neighbors will see you';
  @override
  String get entrar => 'Enter';
  @override
  String get comoTeLlamas => 'How do you want to be seen in the neighborhood?';
  @override
  String get soloParaVecinos =>
      'You\'re viewing as a visitor. To report, sign or create a neighborhood, '
      'enter as a neighbor.';
  @override
  String get impactoTitulo => 'Does it affect you too?';
  @override
  String get impactoAMiTambien => 'It happens to me too';
  @override
  String get impactoMiFamilia => 'It affects my family';
  @override
  String get impactoGasto => 'It cost me money';
  @override
  String get impactoOmitir => 'Just add my signature';
}
