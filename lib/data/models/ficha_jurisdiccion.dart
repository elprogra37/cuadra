// Ficha de jurisdicción (§14.3): configuración, no código.
// Expandir a una ciudad nueva = agregar un JSON en assets/jurisdictions/.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ficha_jurisdiccion.freezed.dart';
part 'ficha_jurisdiccion.g.dart';

@freezed
abstract class FichaJurisdiccion with _$FichaJurisdiccion {
  const factory FichaJurisdiccion({
    required String jurisdictionId,
    required String name,
    required String country,
    required String timezone,
    required String language,
    required int defaultResponseDays,
    required List<Organismo> organisms,

    /// Plantillas por tipo de escrito: reclamo, reiteracion, pronto_despacho,
    /// acceso_informacion, defensoria.
    required Map<String, String> templates,
  }) = _FichaJurisdiccion;

  factory FichaJurisdiccion.fromJson(Map<String, dynamic> json) =>
      _$FichaJurisdiccionFromJson(json);
}

@freezed
abstract class Organismo with _$Organismo {
  const factory Organismo({
    required String id,
    required String name,

    /// Ids de categoría que atiende este organismo.
    required List<String> categories,
    required CanalesOrganismo channels,
    required int responseDays,
    @Default(<String>[]) List<String> normativa,

    /// Escalones siguientes (§13) en orden.
    @Default(<String>[]) List<String> escalation,
  }) = _Organismo;

  factory Organismo.fromJson(Map<String, dynamic> json) =>
      _$OrganismoFromJson(json);
}

@freezed
abstract class CanalesOrganismo with _$CanalesOrganismo {
  const factory CanalesOrganismo({
    String? email,
    String? formUrl,
    String? open311,
  }) = _CanalesOrganismo;

  factory CanalesOrganismo.fromJson(Map<String, dynamic> json) =>
      _$CanalesOrganismoFromJson(json);
}
