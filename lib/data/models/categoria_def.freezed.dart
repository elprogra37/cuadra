// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoria_def.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriaDef {

 String get id; int get version;/// global | national | local (§8.2).
 String get scope;/// Solo para scope national/local.
 String? get countryId; int get orden; String get icono; TextoI18n get nombre;/// Plantilla de escrito que usa esta categoría (etapa 6).
 String get templateKey; List<SubtipoDef> get subtipos;/// Preguntas guiadas: 3 a 5, todas de opción (§9.2).
 List<PreguntaGuiada> get preguntas;
/// Create a copy of CategoriaDef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriaDefCopyWith<CategoriaDef> get copyWith => _$CategoriaDefCopyWithImpl<CategoriaDef>(this as CategoriaDef, _$identity);

  /// Serializes this CategoriaDef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriaDef&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.icono, icono) || other.icono == icono)&&const DeepCollectionEquality().equals(other.nombre, nombre)&&(identical(other.templateKey, templateKey) || other.templateKey == templateKey)&&const DeepCollectionEquality().equals(other.subtipos, subtipos)&&const DeepCollectionEquality().equals(other.preguntas, preguntas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,version,scope,countryId,orden,icono,const DeepCollectionEquality().hash(nombre),templateKey,const DeepCollectionEquality().hash(subtipos),const DeepCollectionEquality().hash(preguntas));

@override
String toString() {
  return 'CategoriaDef(id: $id, version: $version, scope: $scope, countryId: $countryId, orden: $orden, icono: $icono, nombre: $nombre, templateKey: $templateKey, subtipos: $subtipos, preguntas: $preguntas)';
}


}

/// @nodoc
abstract mixin class $CategoriaDefCopyWith<$Res>  {
  factory $CategoriaDefCopyWith(CategoriaDef value, $Res Function(CategoriaDef) _then) = _$CategoriaDefCopyWithImpl;
@useResult
$Res call({
 String id, int version, String scope, String? countryId, int orden, String icono, TextoI18n nombre, String templateKey, List<SubtipoDef> subtipos, List<PreguntaGuiada> preguntas
});




}
/// @nodoc
class _$CategoriaDefCopyWithImpl<$Res>
    implements $CategoriaDefCopyWith<$Res> {
  _$CategoriaDefCopyWithImpl(this._self, this._then);

  final CategoriaDef _self;
  final $Res Function(CategoriaDef) _then;

/// Create a copy of CategoriaDef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? version = null,Object? scope = null,Object? countryId = freezed,Object? orden = null,Object? icono = null,Object? nombre = null,Object? templateKey = null,Object? subtipos = null,Object? preguntas = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,icono: null == icono ? _self.icono : icono // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as TextoI18n,templateKey: null == templateKey ? _self.templateKey : templateKey // ignore: cast_nullable_to_non_nullable
as String,subtipos: null == subtipos ? _self.subtipos : subtipos // ignore: cast_nullable_to_non_nullable
as List<SubtipoDef>,preguntas: null == preguntas ? _self.preguntas : preguntas // ignore: cast_nullable_to_non_nullable
as List<PreguntaGuiada>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriaDef].
extension CategoriaDefPatterns on CategoriaDef {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriaDef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriaDef() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriaDef value)  $default,){
final _that = this;
switch (_that) {
case _CategoriaDef():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriaDef value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriaDef() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int version,  String scope,  String? countryId,  int orden,  String icono,  TextoI18n nombre,  String templateKey,  List<SubtipoDef> subtipos,  List<PreguntaGuiada> preguntas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriaDef() when $default != null:
return $default(_that.id,_that.version,_that.scope,_that.countryId,_that.orden,_that.icono,_that.nombre,_that.templateKey,_that.subtipos,_that.preguntas);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int version,  String scope,  String? countryId,  int orden,  String icono,  TextoI18n nombre,  String templateKey,  List<SubtipoDef> subtipos,  List<PreguntaGuiada> preguntas)  $default,) {final _that = this;
switch (_that) {
case _CategoriaDef():
return $default(_that.id,_that.version,_that.scope,_that.countryId,_that.orden,_that.icono,_that.nombre,_that.templateKey,_that.subtipos,_that.preguntas);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int version,  String scope,  String? countryId,  int orden,  String icono,  TextoI18n nombre,  String templateKey,  List<SubtipoDef> subtipos,  List<PreguntaGuiada> preguntas)?  $default,) {final _that = this;
switch (_that) {
case _CategoriaDef() when $default != null:
return $default(_that.id,_that.version,_that.scope,_that.countryId,_that.orden,_that.icono,_that.nombre,_that.templateKey,_that.subtipos,_that.preguntas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoriaDef implements CategoriaDef {
  const _CategoriaDef({required this.id, required this.version, required this.scope, this.countryId, required this.orden, required this.icono, required final  TextoI18n nombre, required this.templateKey, required final  List<SubtipoDef> subtipos, required final  List<PreguntaGuiada> preguntas}): _nombre = nombre,_subtipos = subtipos,_preguntas = preguntas;
  factory _CategoriaDef.fromJson(Map<String, dynamic> json) => _$CategoriaDefFromJson(json);

@override final  String id;
@override final  int version;
/// global | national | local (§8.2).
@override final  String scope;
/// Solo para scope national/local.
@override final  String? countryId;
@override final  int orden;
@override final  String icono;
 final  TextoI18n _nombre;
@override TextoI18n get nombre {
  if (_nombre is EqualUnmodifiableMapView) return _nombre;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_nombre);
}

/// Plantilla de escrito que usa esta categoría (etapa 6).
@override final  String templateKey;
 final  List<SubtipoDef> _subtipos;
@override List<SubtipoDef> get subtipos {
  if (_subtipos is EqualUnmodifiableListView) return _subtipos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtipos);
}

/// Preguntas guiadas: 3 a 5, todas de opción (§9.2).
 final  List<PreguntaGuiada> _preguntas;
/// Preguntas guiadas: 3 a 5, todas de opción (§9.2).
@override List<PreguntaGuiada> get preguntas {
  if (_preguntas is EqualUnmodifiableListView) return _preguntas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preguntas);
}


/// Create a copy of CategoriaDef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriaDefCopyWith<_CategoriaDef> get copyWith => __$CategoriaDefCopyWithImpl<_CategoriaDef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriaDefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriaDef&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.icono, icono) || other.icono == icono)&&const DeepCollectionEquality().equals(other._nombre, _nombre)&&(identical(other.templateKey, templateKey) || other.templateKey == templateKey)&&const DeepCollectionEquality().equals(other._subtipos, _subtipos)&&const DeepCollectionEquality().equals(other._preguntas, _preguntas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,version,scope,countryId,orden,icono,const DeepCollectionEquality().hash(_nombre),templateKey,const DeepCollectionEquality().hash(_subtipos),const DeepCollectionEquality().hash(_preguntas));

@override
String toString() {
  return 'CategoriaDef(id: $id, version: $version, scope: $scope, countryId: $countryId, orden: $orden, icono: $icono, nombre: $nombre, templateKey: $templateKey, subtipos: $subtipos, preguntas: $preguntas)';
}


}

/// @nodoc
abstract mixin class _$CategoriaDefCopyWith<$Res> implements $CategoriaDefCopyWith<$Res> {
  factory _$CategoriaDefCopyWith(_CategoriaDef value, $Res Function(_CategoriaDef) _then) = __$CategoriaDefCopyWithImpl;
@override @useResult
$Res call({
 String id, int version, String scope, String? countryId, int orden, String icono, TextoI18n nombre, String templateKey, List<SubtipoDef> subtipos, List<PreguntaGuiada> preguntas
});




}
/// @nodoc
class __$CategoriaDefCopyWithImpl<$Res>
    implements _$CategoriaDefCopyWith<$Res> {
  __$CategoriaDefCopyWithImpl(this._self, this._then);

  final _CategoriaDef _self;
  final $Res Function(_CategoriaDef) _then;

/// Create a copy of CategoriaDef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? version = null,Object? scope = null,Object? countryId = freezed,Object? orden = null,Object? icono = null,Object? nombre = null,Object? templateKey = null,Object? subtipos = null,Object? preguntas = null,}) {
  return _then(_CategoriaDef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as String,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,icono: null == icono ? _self.icono : icono // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self._nombre : nombre // ignore: cast_nullable_to_non_nullable
as TextoI18n,templateKey: null == templateKey ? _self.templateKey : templateKey // ignore: cast_nullable_to_non_nullable
as String,subtipos: null == subtipos ? _self._subtipos : subtipos // ignore: cast_nullable_to_non_nullable
as List<SubtipoDef>,preguntas: null == preguntas ? _self._preguntas : preguntas // ignore: cast_nullable_to_non_nullable
as List<PreguntaGuiada>,
  ));
}


}


/// @nodoc
mixin _$SubtipoDef {

 String get id; TextoI18n get nombre;/// Fragmento para el escrito generado: "la falta de funcionamiento de la
/// luminaria" etc. (§9.3).
 TextoI18n get fragmento;
/// Create a copy of SubtipoDef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtipoDefCopyWith<SubtipoDef> get copyWith => _$SubtipoDefCopyWithImpl<SubtipoDef>(this as SubtipoDef, _$identity);

  /// Serializes this SubtipoDef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubtipoDef&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.nombre, nombre)&&const DeepCollectionEquality().equals(other.fragmento, fragmento));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(nombre),const DeepCollectionEquality().hash(fragmento));

@override
String toString() {
  return 'SubtipoDef(id: $id, nombre: $nombre, fragmento: $fragmento)';
}


}

/// @nodoc
abstract mixin class $SubtipoDefCopyWith<$Res>  {
  factory $SubtipoDefCopyWith(SubtipoDef value, $Res Function(SubtipoDef) _then) = _$SubtipoDefCopyWithImpl;
@useResult
$Res call({
 String id, TextoI18n nombre, TextoI18n fragmento
});




}
/// @nodoc
class _$SubtipoDefCopyWithImpl<$Res>
    implements $SubtipoDefCopyWith<$Res> {
  _$SubtipoDefCopyWithImpl(this._self, this._then);

  final SubtipoDef _self;
  final $Res Function(SubtipoDef) _then;

/// Create a copy of SubtipoDef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? fragmento = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as TextoI18n,fragmento: null == fragmento ? _self.fragmento : fragmento // ignore: cast_nullable_to_non_nullable
as TextoI18n,
  ));
}

}


/// Adds pattern-matching-related methods to [SubtipoDef].
extension SubtipoDefPatterns on SubtipoDef {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubtipoDef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubtipoDef() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubtipoDef value)  $default,){
final _that = this;
switch (_that) {
case _SubtipoDef():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubtipoDef value)?  $default,){
final _that = this;
switch (_that) {
case _SubtipoDef() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TextoI18n nombre,  TextoI18n fragmento)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubtipoDef() when $default != null:
return $default(_that.id,_that.nombre,_that.fragmento);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TextoI18n nombre,  TextoI18n fragmento)  $default,) {final _that = this;
switch (_that) {
case _SubtipoDef():
return $default(_that.id,_that.nombre,_that.fragmento);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TextoI18n nombre,  TextoI18n fragmento)?  $default,) {final _that = this;
switch (_that) {
case _SubtipoDef() when $default != null:
return $default(_that.id,_that.nombre,_that.fragmento);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubtipoDef implements SubtipoDef {
  const _SubtipoDef({required this.id, required final  TextoI18n nombre, required final  TextoI18n fragmento}): _nombre = nombre,_fragmento = fragmento;
  factory _SubtipoDef.fromJson(Map<String, dynamic> json) => _$SubtipoDefFromJson(json);

@override final  String id;
 final  TextoI18n _nombre;
@override TextoI18n get nombre {
  if (_nombre is EqualUnmodifiableMapView) return _nombre;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_nombre);
}

/// Fragmento para el escrito generado: "la falta de funcionamiento de la
/// luminaria" etc. (§9.3).
 final  TextoI18n _fragmento;
/// Fragmento para el escrito generado: "la falta de funcionamiento de la
/// luminaria" etc. (§9.3).
@override TextoI18n get fragmento {
  if (_fragmento is EqualUnmodifiableMapView) return _fragmento;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fragmento);
}


/// Create a copy of SubtipoDef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtipoDefCopyWith<_SubtipoDef> get copyWith => __$SubtipoDefCopyWithImpl<_SubtipoDef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubtipoDefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubtipoDef&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._nombre, _nombre)&&const DeepCollectionEquality().equals(other._fragmento, _fragmento));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_nombre),const DeepCollectionEquality().hash(_fragmento));

@override
String toString() {
  return 'SubtipoDef(id: $id, nombre: $nombre, fragmento: $fragmento)';
}


}

/// @nodoc
abstract mixin class _$SubtipoDefCopyWith<$Res> implements $SubtipoDefCopyWith<$Res> {
  factory _$SubtipoDefCopyWith(_SubtipoDef value, $Res Function(_SubtipoDef) _then) = __$SubtipoDefCopyWithImpl;
@override @useResult
$Res call({
 String id, TextoI18n nombre, TextoI18n fragmento
});




}
/// @nodoc
class __$SubtipoDefCopyWithImpl<$Res>
    implements _$SubtipoDefCopyWith<$Res> {
  __$SubtipoDefCopyWithImpl(this._self, this._then);

  final _SubtipoDef _self;
  final $Res Function(_SubtipoDef) _then;

/// Create a copy of SubtipoDef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? fragmento = null,}) {
  return _then(_SubtipoDef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self._nombre : nombre // ignore: cast_nullable_to_non_nullable
as TextoI18n,fragmento: null == fragmento ? _self._fragmento : fragmento // ignore: cast_nullable_to_non_nullable
as TextoI18n,
  ));
}


}


/// @nodoc
mixin _$PreguntaGuiada {

 String get id;/// opcion | multiple
 String get tipo; TextoI18n get texto; List<OpcionGuiada> get opciones;/// Si la respuesta es obligatoria para publicar. Las multiples suelen
/// poder quedar vacías.
 bool get obligatoria;
/// Create a copy of PreguntaGuiada
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreguntaGuiadaCopyWith<PreguntaGuiada> get copyWith => _$PreguntaGuiadaCopyWithImpl<PreguntaGuiada>(this as PreguntaGuiada, _$identity);

  /// Serializes this PreguntaGuiada to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreguntaGuiada&&(identical(other.id, id) || other.id == id)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&const DeepCollectionEquality().equals(other.texto, texto)&&const DeepCollectionEquality().equals(other.opciones, opciones)&&(identical(other.obligatoria, obligatoria) || other.obligatoria == obligatoria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tipo,const DeepCollectionEquality().hash(texto),const DeepCollectionEquality().hash(opciones),obligatoria);

@override
String toString() {
  return 'PreguntaGuiada(id: $id, tipo: $tipo, texto: $texto, opciones: $opciones, obligatoria: $obligatoria)';
}


}

/// @nodoc
abstract mixin class $PreguntaGuiadaCopyWith<$Res>  {
  factory $PreguntaGuiadaCopyWith(PreguntaGuiada value, $Res Function(PreguntaGuiada) _then) = _$PreguntaGuiadaCopyWithImpl;
@useResult
$Res call({
 String id, String tipo, TextoI18n texto, List<OpcionGuiada> opciones, bool obligatoria
});




}
/// @nodoc
class _$PreguntaGuiadaCopyWithImpl<$Res>
    implements $PreguntaGuiadaCopyWith<$Res> {
  _$PreguntaGuiadaCopyWithImpl(this._self, this._then);

  final PreguntaGuiada _self;
  final $Res Function(PreguntaGuiada) _then;

/// Create a copy of PreguntaGuiada
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tipo = null,Object? texto = null,Object? opciones = null,Object? obligatoria = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as TextoI18n,opciones: null == opciones ? _self.opciones : opciones // ignore: cast_nullable_to_non_nullable
as List<OpcionGuiada>,obligatoria: null == obligatoria ? _self.obligatoria : obligatoria // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PreguntaGuiada].
extension PreguntaGuiadaPatterns on PreguntaGuiada {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreguntaGuiada value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreguntaGuiada() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreguntaGuiada value)  $default,){
final _that = this;
switch (_that) {
case _PreguntaGuiada():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreguntaGuiada value)?  $default,){
final _that = this;
switch (_that) {
case _PreguntaGuiada() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tipo,  TextoI18n texto,  List<OpcionGuiada> opciones,  bool obligatoria)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreguntaGuiada() when $default != null:
return $default(_that.id,_that.tipo,_that.texto,_that.opciones,_that.obligatoria);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tipo,  TextoI18n texto,  List<OpcionGuiada> opciones,  bool obligatoria)  $default,) {final _that = this;
switch (_that) {
case _PreguntaGuiada():
return $default(_that.id,_that.tipo,_that.texto,_that.opciones,_that.obligatoria);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tipo,  TextoI18n texto,  List<OpcionGuiada> opciones,  bool obligatoria)?  $default,) {final _that = this;
switch (_that) {
case _PreguntaGuiada() when $default != null:
return $default(_that.id,_that.tipo,_that.texto,_that.opciones,_that.obligatoria);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreguntaGuiada implements PreguntaGuiada {
  const _PreguntaGuiada({required this.id, required this.tipo, required final  TextoI18n texto, required final  List<OpcionGuiada> opciones, this.obligatoria = true}): _texto = texto,_opciones = opciones;
  factory _PreguntaGuiada.fromJson(Map<String, dynamic> json) => _$PreguntaGuiadaFromJson(json);

@override final  String id;
/// opcion | multiple
@override final  String tipo;
 final  TextoI18n _texto;
@override TextoI18n get texto {
  if (_texto is EqualUnmodifiableMapView) return _texto;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_texto);
}

 final  List<OpcionGuiada> _opciones;
@override List<OpcionGuiada> get opciones {
  if (_opciones is EqualUnmodifiableListView) return _opciones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_opciones);
}

/// Si la respuesta es obligatoria para publicar. Las multiples suelen
/// poder quedar vacías.
@override@JsonKey() final  bool obligatoria;

/// Create a copy of PreguntaGuiada
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreguntaGuiadaCopyWith<_PreguntaGuiada> get copyWith => __$PreguntaGuiadaCopyWithImpl<_PreguntaGuiada>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreguntaGuiadaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreguntaGuiada&&(identical(other.id, id) || other.id == id)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&const DeepCollectionEquality().equals(other._texto, _texto)&&const DeepCollectionEquality().equals(other._opciones, _opciones)&&(identical(other.obligatoria, obligatoria) || other.obligatoria == obligatoria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tipo,const DeepCollectionEquality().hash(_texto),const DeepCollectionEquality().hash(_opciones),obligatoria);

@override
String toString() {
  return 'PreguntaGuiada(id: $id, tipo: $tipo, texto: $texto, opciones: $opciones, obligatoria: $obligatoria)';
}


}

/// @nodoc
abstract mixin class _$PreguntaGuiadaCopyWith<$Res> implements $PreguntaGuiadaCopyWith<$Res> {
  factory _$PreguntaGuiadaCopyWith(_PreguntaGuiada value, $Res Function(_PreguntaGuiada) _then) = __$PreguntaGuiadaCopyWithImpl;
@override @useResult
$Res call({
 String id, String tipo, TextoI18n texto, List<OpcionGuiada> opciones, bool obligatoria
});




}
/// @nodoc
class __$PreguntaGuiadaCopyWithImpl<$Res>
    implements _$PreguntaGuiadaCopyWith<$Res> {
  __$PreguntaGuiadaCopyWithImpl(this._self, this._then);

  final _PreguntaGuiada _self;
  final $Res Function(_PreguntaGuiada) _then;

/// Create a copy of PreguntaGuiada
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tipo = null,Object? texto = null,Object? opciones = null,Object? obligatoria = null,}) {
  return _then(_PreguntaGuiada(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self._texto : texto // ignore: cast_nullable_to_non_nullable
as TextoI18n,opciones: null == opciones ? _self._opciones : opciones // ignore: cast_nullable_to_non_nullable
as List<OpcionGuiada>,obligatoria: null == obligatoria ? _self.obligatoria : obligatoria // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$OpcionGuiada {

 String get id; TextoI18n get texto;/// Fragmento que aporta al escrito formal si se elige. Puede faltar
/// (opciones que solo clasifican).
 TextoI18n? get fragmento;
/// Create a copy of OpcionGuiada
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpcionGuiadaCopyWith<OpcionGuiada> get copyWith => _$OpcionGuiadaCopyWithImpl<OpcionGuiada>(this as OpcionGuiada, _$identity);

  /// Serializes this OpcionGuiada to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpcionGuiada&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.texto, texto)&&const DeepCollectionEquality().equals(other.fragmento, fragmento));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(texto),const DeepCollectionEquality().hash(fragmento));

@override
String toString() {
  return 'OpcionGuiada(id: $id, texto: $texto, fragmento: $fragmento)';
}


}

/// @nodoc
abstract mixin class $OpcionGuiadaCopyWith<$Res>  {
  factory $OpcionGuiadaCopyWith(OpcionGuiada value, $Res Function(OpcionGuiada) _then) = _$OpcionGuiadaCopyWithImpl;
@useResult
$Res call({
 String id, TextoI18n texto, TextoI18n? fragmento
});




}
/// @nodoc
class _$OpcionGuiadaCopyWithImpl<$Res>
    implements $OpcionGuiadaCopyWith<$Res> {
  _$OpcionGuiadaCopyWithImpl(this._self, this._then);

  final OpcionGuiada _self;
  final $Res Function(OpcionGuiada) _then;

/// Create a copy of OpcionGuiada
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? texto = null,Object? fragmento = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as TextoI18n,fragmento: freezed == fragmento ? _self.fragmento : fragmento // ignore: cast_nullable_to_non_nullable
as TextoI18n?,
  ));
}

}


/// Adds pattern-matching-related methods to [OpcionGuiada].
extension OpcionGuiadaPatterns on OpcionGuiada {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpcionGuiada value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpcionGuiada() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpcionGuiada value)  $default,){
final _that = this;
switch (_that) {
case _OpcionGuiada():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpcionGuiada value)?  $default,){
final _that = this;
switch (_that) {
case _OpcionGuiada() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TextoI18n texto,  TextoI18n? fragmento)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpcionGuiada() when $default != null:
return $default(_that.id,_that.texto,_that.fragmento);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TextoI18n texto,  TextoI18n? fragmento)  $default,) {final _that = this;
switch (_that) {
case _OpcionGuiada():
return $default(_that.id,_that.texto,_that.fragmento);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TextoI18n texto,  TextoI18n? fragmento)?  $default,) {final _that = this;
switch (_that) {
case _OpcionGuiada() when $default != null:
return $default(_that.id,_that.texto,_that.fragmento);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpcionGuiada implements OpcionGuiada {
  const _OpcionGuiada({required this.id, required final  TextoI18n texto, final  TextoI18n? fragmento}): _texto = texto,_fragmento = fragmento;
  factory _OpcionGuiada.fromJson(Map<String, dynamic> json) => _$OpcionGuiadaFromJson(json);

@override final  String id;
 final  TextoI18n _texto;
@override TextoI18n get texto {
  if (_texto is EqualUnmodifiableMapView) return _texto;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_texto);
}

/// Fragmento que aporta al escrito formal si se elige. Puede faltar
/// (opciones que solo clasifican).
 final  TextoI18n? _fragmento;
/// Fragmento que aporta al escrito formal si se elige. Puede faltar
/// (opciones que solo clasifican).
@override TextoI18n? get fragmento {
  final value = _fragmento;
  if (value == null) return null;
  if (_fragmento is EqualUnmodifiableMapView) return _fragmento;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of OpcionGuiada
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpcionGuiadaCopyWith<_OpcionGuiada> get copyWith => __$OpcionGuiadaCopyWithImpl<_OpcionGuiada>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpcionGuiadaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpcionGuiada&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._texto, _texto)&&const DeepCollectionEquality().equals(other._fragmento, _fragmento));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_texto),const DeepCollectionEquality().hash(_fragmento));

@override
String toString() {
  return 'OpcionGuiada(id: $id, texto: $texto, fragmento: $fragmento)';
}


}

/// @nodoc
abstract mixin class _$OpcionGuiadaCopyWith<$Res> implements $OpcionGuiadaCopyWith<$Res> {
  factory _$OpcionGuiadaCopyWith(_OpcionGuiada value, $Res Function(_OpcionGuiada) _then) = __$OpcionGuiadaCopyWithImpl;
@override @useResult
$Res call({
 String id, TextoI18n texto, TextoI18n? fragmento
});




}
/// @nodoc
class __$OpcionGuiadaCopyWithImpl<$Res>
    implements _$OpcionGuiadaCopyWith<$Res> {
  __$OpcionGuiadaCopyWithImpl(this._self, this._then);

  final _OpcionGuiada _self;
  final $Res Function(_OpcionGuiada) _then;

/// Create a copy of OpcionGuiada
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? texto = null,Object? fragmento = freezed,}) {
  return _then(_OpcionGuiada(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self._texto : texto // ignore: cast_nullable_to_non_nullable
as TextoI18n,fragmento: freezed == fragmento ? _self._fragmento : fragmento // ignore: cast_nullable_to_non_nullable
as TextoI18n?,
  ));
}


}

// dart format on
