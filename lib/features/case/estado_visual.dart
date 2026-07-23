import '../../core/i18n/textos.dart';
import '../../core/theme/estado_sello.dart';
import '../../data/local/base_datos.dart';
import '../../data/models/enums.dart';

/// Mapa estado de caso → sello (§5/§12). El texto sale de i18n; la variante
/// fija la tinta y por lo tanto la regla del amarillo.
({SelloVariante variante, String titulo, String? subtitulo}) selloDeCaso(
  Case caso,
  Textos t, {
  required DateTime ahora,
}) {
  String fecha(DateTime f) =>
      '${f.day.toString().padLeft(2, '0')}·${f.month.toString().padLeft(2, '0')}·${f.year % 100}';

  return switch (caso.status) {
    CaseStatus.presentado => (
      variante: SelloVariante.presentado,
      titulo: t.selloPresentado,
      subtitulo:
          '${fecha(caso.submittedAt ?? caso.createdAt)}'
          '${caso.publicRef == null ? '' : ' · ${caso.publicRef}'}',
    ),
    CaseStatus.sinRespuesta => (
      variante: SelloVariante.sinRespuesta,
      titulo: t.selloSinRespuesta(
        ahora.difference(caso.submittedAt ?? caso.createdAt).inDays,
      ),
      subtitulo: caso.deadlineAt == null
          ? null
          : t.selloVencido(fecha(caso.deadlineAt!)),
    ),
    CaseStatus.resuelto => (
      variante: SelloVariante.resuelto,
      titulo: t.selloResuelto,
      subtitulo:
          '${fecha(caso.resolvedAt ?? caso.createdAt)} · ${t.selloVerificado}',
    ),
    CaseStatus.archivado => (
      variante: SelloVariante.archivado,
      titulo: t.selloArchivado,
      subtitulo: null,
    ),
    _ => (
      variante: SelloVariante.abierto,
      titulo: t.selloAbierto,
      subtitulo: fecha(caso.createdAt),
    ),
  };
}
