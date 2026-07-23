/// Enums de dominio compartidos entre la base local (Drift), la API y la UI.
/// Los valores serializados (name) van en snake/camel simple y NO se cambian:
/// son contrato con el servidor.
library;

/// Ciclo de vida del caso (§12).
enum CaseStatus {
  borrador,
  abierto,
  presentado,
  respondido,
  sinRespuesta,
  enEjecucion,
  resuelto,
  archivado,
  enRevision,
  disputado,
  fusionado,
  rechazado;

  /// Estados donde el reclamo espera acción del barrio o del organismo:
  /// alimentan la regla del amarillo en la UI.
  bool get esperaAccion => switch (this) {
    borrador || abierto || presentado || sinRespuesta => true,
    _ => false,
  };

  /// Estados visibles en el feed público de la cuadra.
  bool get visibleEnFeed => switch (this) {
    borrador || enRevision || rechazado || fusionado => false,
    _ => true,
  };
}

/// Estados de un barrio (§6.3).
enum NeighborhoodStatus { propuesto, activo, consolidado, fusionado, rechazado }

/// Roles de usuario (§7).
enum UserRole {
  visitante,
  registrado,
  vecino,
  verificado,
  referente,
  moderador,
  admin,
}

/// Estado de sincronización de un registro local (§20.2: visible por ítem).
enum SyncStatus { pendiente, enviando, sincronizado, error }

/// Tipos de acción sobre un caso (§13, escalera de escalamiento).
enum CaseActionType {
  presentar,
  reiterar,
  prontoDespacho,
  accesoInformacion,
  defensoria,
  concejal,
  prensa,
  datoAbierto,
}

/// Tipos de evidencia.
enum EvidenceType { foto, video, documento }

/// Motivos cerrados de disputa (§11).
enum DisputeReason {
  yaResuelto,
  ubicacionIncorrecta,
  categoriaIncorrecta,
  noCorresponde,
}

/// Confirmación de impacto al adherir (§11, opciones cerradas).
enum ImpactTag { aMiTambien, afectaMiFamilia, meGeneroGasto }
