// Definición de una categoría del catálogo (§8) y su árbol guiado (§9).
//
// La regla estructural: agregar una categoría es agregar un JSON en
// assets/categories/ — nunca tocar código. El motor de árbol guiado (etapa 6)
// renderiza estas definiciones de forma genérica.
import 'package:freezed_annotation/freezed_annotation.dart';

import 'texto_i18n.dart';

part 'categoria_def.freezed.dart';
part 'categoria_def.g.dart';

/// Una categoría del catálogo estandarizado.
@freezed
abstract class CategoriaDef with _$CategoriaDef {
  const factory CategoriaDef({
    required String id,
    required int version,

    /// global | national | local (§8.2).
    required String scope,

    /// Solo para scope national/local.
    String? countryId,
    required int orden,
    required String icono,
    required TextoI18n nombre,

    /// Plantilla de escrito que usa esta categoría (etapa 6).
    required String templateKey,
    required List<SubtipoDef> subtipos,

    /// Preguntas guiadas: 3 a 5, todas de opción (§9.2).
    required List<PreguntaGuiada> preguntas,
  }) = _CategoriaDef;

  factory CategoriaDef.fromJson(Map<String, dynamic> json) =>
      _$CategoriaDefFromJson(json);
}

/// Subtipo dentro de una categoría (§8.3).
@freezed
abstract class SubtipoDef with _$SubtipoDef {
  const factory SubtipoDef({
    required String id,
    required TextoI18n nombre,

    /// Fragmento para el escrito generado: "la falta de funcionamiento de la
    /// luminaria" etc. (§9.3).
    required TextoI18n fragmento,
  }) = _SubtipoDef;

  factory SubtipoDef.fromJson(Map<String, dynamic> json) =>
      _$SubtipoDefFromJson(json);
}

/// Una pregunta del árbol guiado. `tipo` opcion = una sola respuesta,
/// multiple = casillas de verificación.
@freezed
abstract class PreguntaGuiada with _$PreguntaGuiada {
  const factory PreguntaGuiada({
    required String id,

    /// opcion | multiple
    required String tipo,
    required TextoI18n texto,
    required List<OpcionGuiada> opciones,

    /// Si la respuesta es obligatoria para publicar. Las multiples suelen
    /// poder quedar vacías.
    @Default(true) bool obligatoria,
  }) = _PreguntaGuiada;

  factory PreguntaGuiada.fromJson(Map<String, dynamic> json) =>
      _$PreguntaGuiadaFromJson(json);
}

/// Una opción cerrada de una pregunta. Nadie puede insultar en un menú
/// desplegable (§9.3).
@freezed
abstract class OpcionGuiada with _$OpcionGuiada {
  const factory OpcionGuiada({
    required String id,
    required TextoI18n texto,

    /// Fragmento que aporta al escrito formal si se elige. Puede faltar
    /// (opciones que solo clasifican).
    TextoI18n? fragmento,
  }) = _OpcionGuiada;

  factory OpcionGuiada.fromJson(Map<String, dynamic> json) =>
      _$OpcionGuiadaFromJson(json);
}
