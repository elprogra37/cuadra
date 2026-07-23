import '../../data/models/enums.dart';

/// Escalera de escalamiento (§13): nunca hay callejón sin salida. Cada
/// escalón es un trámite real con su plantilla y su destinatario.
abstract final class Escalera {
  /// Orden §13. `presentar` es el escalón 1; del 2 en adelante solo se
  /// habilitan cuando el plazo venció (el silencio deja de ser gratis).
  static const orden = [
    CaseActionType.presentar,
    CaseActionType.reiterar,
    CaseActionType.prontoDespacho,
    CaseActionType.accesoInformacion,
    CaseActionType.defensoria,
    CaseActionType.concejal,
    CaseActionType.prensa,
    CaseActionType.datoAbierto,
  ];

  /// Días extra de plazo que otorga una reiteración (§13).
  static const diasReiteracion = 15;

  /// El próximo escalón accionable, o null si lo que toca es esperar
  /// (plazo corriendo, respuesta recibida, caso cerrado).
  static CaseActionType? proximo(
    CaseStatus status,
    List<CaseActionType> hechas,
  ) {
    switch (status) {
      case CaseStatus.borrador:
      case CaseStatus.abierto:
        return CaseActionType.presentar;
      case CaseStatus.sinRespuesta:
        for (final tipo in orden) {
          if (!hechas.contains(tipo)) return tipo;
        }
        // Todo hecho: la reiteración siempre puede repetirse (§12).
        return CaseActionType.reiterar;
      case CaseStatus.presentado:
      case CaseStatus.respondido:
      case CaseStatus.enEjecucion:
      case CaseStatus.resuelto:
      case CaseStatus.archivado:
      case CaseStatus.enRevision:
      case CaseStatus.disputado:
      case CaseStatus.fusionado:
      case CaseStatus.rechazado:
        return null;
    }
  }

  /// Clave de plantilla de la ficha de jurisdicción (§14.3) por escalón.
  static String plantillaDe(CaseActionType tipo) => switch (tipo) {
    CaseActionType.presentar => 'reclamo',
    CaseActionType.reiterar => 'reiteracion',
    CaseActionType.prontoDespacho => 'pronto_despacho',
    CaseActionType.accesoInformacion => 'acceso_informacion',
    CaseActionType.defensoria => 'defensoria',
    CaseActionType.concejal => 'concejal',
    CaseActionType.prensa => 'prensa',
    CaseActionType.datoAbierto => 'dato_abierto',
  };
}
