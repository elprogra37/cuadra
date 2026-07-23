// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ficha_jurisdiccion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FichaJurisdiccion _$FichaJurisdiccionFromJson(Map<String, dynamic> json) =>
    _FichaJurisdiccion(
      jurisdictionId: json['jurisdictionId'] as String,
      name: json['name'] as String,
      country: json['country'] as String,
      timezone: json['timezone'] as String,
      language: json['language'] as String,
      defaultResponseDays: (json['defaultResponseDays'] as num).toInt(),
      organisms: (json['organisms'] as List<dynamic>)
          .map((e) => Organismo.fromJson(e as Map<String, dynamic>))
          .toList(),
      templates: Map<String, String>.from(json['templates'] as Map),
    );

Map<String, dynamic> _$FichaJurisdiccionToJson(_FichaJurisdiccion instance) =>
    <String, dynamic>{
      'jurisdictionId': instance.jurisdictionId,
      'name': instance.name,
      'country': instance.country,
      'timezone': instance.timezone,
      'language': instance.language,
      'defaultResponseDays': instance.defaultResponseDays,
      'organisms': instance.organisms,
      'templates': instance.templates,
    };

_Organismo _$OrganismoFromJson(Map<String, dynamic> json) => _Organismo(
  id: json['id'] as String,
  name: json['name'] as String,
  categories: (json['categories'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  channels: CanalesOrganismo.fromJson(json['channels'] as Map<String, dynamic>),
  responseDays: (json['responseDays'] as num).toInt(),
  normativa:
      (json['normativa'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  escalation:
      (json['escalation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$OrganismoToJson(_Organismo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categories': instance.categories,
      'channels': instance.channels,
      'responseDays': instance.responseDays,
      'normativa': instance.normativa,
      'escalation': instance.escalation,
    };

_CanalesOrganismo _$CanalesOrganismoFromJson(Map<String, dynamic> json) =>
    _CanalesOrganismo(
      email: json['email'] as String?,
      formUrl: json['formUrl'] as String?,
      open311: json['open311'] as String?,
    );

Map<String, dynamic> _$CanalesOrganismoToJson(_CanalesOrganismo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'formUrl': instance.formUrl,
      'open311': instance.open311,
    };
