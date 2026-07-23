import '../../data/local/base_datos.dart';
import '../../data/models/enums.dart';

/// Métricas agregadas del barrio para el panel de escritorio (§17.2, §23).
/// La métrica visible es la respuesta del Estado, NUNCA un puntaje de barrio
/// (§15.2): nada de rankings ni estrellas.
class DatosBarrio {
  const DatosBarrio({
    required this.reportes,
    required this.presentados,
    required this.respondidos,
    required this.resueltos,
    required this.sinRespuesta,
    required this.diasPromedioRespuesta,
    required this.porCategoria,
  });

  final int reportes;
  final int presentados;
  final int respondidos;
  final int resueltos;
  final int sinRespuesta;

  /// Días medios hasta la respuesta del organismo: el dato periodístico (§23).
  final double? diasPromedioRespuesta;

  /// Conteo por categoría (para el embudo, no para rankear barrios).
  final Map<String, int> porCategoria;

  /// Tasa de resolución = resueltos / presentados (§23).
  double get tasaResolucion => presentados == 0 ? 0 : resueltos / presentados;
}

/// Calcula las métricas del barrio desde la base local (el panel real del
/// dueño §17 corre server-side; esto alimenta la vista del referente).
class DatosPanel {
  DatosPanel(this._db);

  final BaseDatos _db;

  Future<DatosBarrio> deBarrio(String neighborhoodId) async {
    final casos = await (_db.select(
      _db.cases,
    )..where((t) => t.neighborhoodId.equals(neighborhoodId))).get();

    var presentados = 0, respondidos = 0, resueltos = 0, sinRespuesta = 0;
    final porCategoria = <String, int>{};
    final tiemposRespuesta = <int>[];

    for (final c in casos) {
      porCategoria[c.categoryId] = (porCategoria[c.categoryId] ?? 0) + 1;
      if (c.submittedAt != null) presentados++;
      switch (c.status) {
        case CaseStatus.respondido:
          respondidos++;
        case CaseStatus.resuelto:
          resueltos++;
          if (c.submittedAt != null && c.resolvedAt != null) {
            tiemposRespuesta.add(
              c.resolvedAt!.difference(c.submittedAt!).inDays,
            );
          }
        case CaseStatus.sinRespuesta:
          sinRespuesta++;
        default:
          break;
      }
    }

    return DatosBarrio(
      reportes: casos.length,
      presentados: presentados,
      respondidos: respondidos,
      resueltos: resueltos,
      sinRespuesta: sinRespuesta,
      diasPromedioRespuesta: tiemposRespuesta.isEmpty
          ? null
          : tiemposRespuesta.reduce((a, b) => a + b) / tiemposRespuesta.length,
      porCategoria: porCategoria,
    );
  }
}
