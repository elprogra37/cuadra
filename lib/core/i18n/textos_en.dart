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
}
