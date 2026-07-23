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
}
