// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_def.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriaDef _$CategoriaDefFromJson(Map<String, dynamic> json) =>
    _CategoriaDef(
      id: json['id'] as String,
      version: (json['version'] as num).toInt(),
      scope: json['scope'] as String,
      countryId: json['countryId'] as String?,
      orden: (json['orden'] as num).toInt(),
      icono: json['icono'] as String,
      nombre: Map<String, String>.from(json['nombre'] as Map),
      templateKey: json['templateKey'] as String,
      subtipos: (json['subtipos'] as List<dynamic>)
          .map((e) => SubtipoDef.fromJson(e as Map<String, dynamic>))
          .toList(),
      preguntas: (json['preguntas'] as List<dynamic>)
          .map((e) => PreguntaGuiada.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriaDefToJson(_CategoriaDef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'scope': instance.scope,
      'countryId': instance.countryId,
      'orden': instance.orden,
      'icono': instance.icono,
      'nombre': instance.nombre,
      'templateKey': instance.templateKey,
      'subtipos': instance.subtipos,
      'preguntas': instance.preguntas,
    };

_SubtipoDef _$SubtipoDefFromJson(Map<String, dynamic> json) => _SubtipoDef(
  id: json['id'] as String,
  nombre: Map<String, String>.from(json['nombre'] as Map),
  fragmento: Map<String, String>.from(json['fragmento'] as Map),
);

Map<String, dynamic> _$SubtipoDefToJson(_SubtipoDef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'fragmento': instance.fragmento,
    };

_PreguntaGuiada _$PreguntaGuiadaFromJson(Map<String, dynamic> json) =>
    _PreguntaGuiada(
      id: json['id'] as String,
      tipo: json['tipo'] as String,
      texto: Map<String, String>.from(json['texto'] as Map),
      opciones: (json['opciones'] as List<dynamic>)
          .map((e) => OpcionGuiada.fromJson(e as Map<String, dynamic>))
          .toList(),
      obligatoria: json['obligatoria'] as bool? ?? true,
    );

Map<String, dynamic> _$PreguntaGuiadaToJson(_PreguntaGuiada instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tipo': instance.tipo,
      'texto': instance.texto,
      'opciones': instance.opciones,
      'obligatoria': instance.obligatoria,
    };

_OpcionGuiada _$OpcionGuiadaFromJson(Map<String, dynamic> json) =>
    _OpcionGuiada(
      id: json['id'] as String,
      texto: Map<String, String>.from(json['texto'] as Map),
      fragmento: (json['fragmento'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$OpcionGuiadaToJson(_OpcionGuiada instance) =>
    <String, dynamic>{
      'id': instance.id,
      'texto': instance.texto,
      'fragmento': instance.fragmento,
    };
