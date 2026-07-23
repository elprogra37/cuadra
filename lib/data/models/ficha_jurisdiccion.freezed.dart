// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ficha_jurisdiccion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FichaJurisdiccion {

 String get jurisdictionId; String get name; String get country; String get timezone; String get language; int get defaultResponseDays; List<Organismo> get organisms;/// Plantillas por tipo de escrito: reclamo, reiteracion, pronto_despacho,
/// acceso_informacion, defensoria.
 Map<String, String> get templates;
/// Create a copy of FichaJurisdiccion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FichaJurisdiccionCopyWith<FichaJurisdiccion> get copyWith => _$FichaJurisdiccionCopyWithImpl<FichaJurisdiccion>(this as FichaJurisdiccion, _$identity);

  /// Serializes this FichaJurisdiccion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FichaJurisdiccion&&(identical(other.jurisdictionId, jurisdictionId) || other.jurisdictionId == jurisdictionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.language, language) || other.language == language)&&(identical(other.defaultResponseDays, defaultResponseDays) || other.defaultResponseDays == defaultResponseDays)&&const DeepCollectionEquality().equals(other.organisms, organisms)&&const DeepCollectionEquality().equals(other.templates, templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jurisdictionId,name,country,timezone,language,defaultResponseDays,const DeepCollectionEquality().hash(organisms),const DeepCollectionEquality().hash(templates));

@override
String toString() {
  return 'FichaJurisdiccion(jurisdictionId: $jurisdictionId, name: $name, country: $country, timezone: $timezone, language: $language, defaultResponseDays: $defaultResponseDays, organisms: $organisms, templates: $templates)';
}


}

/// @nodoc
abstract mixin class $FichaJurisdiccionCopyWith<$Res>  {
  factory $FichaJurisdiccionCopyWith(FichaJurisdiccion value, $Res Function(FichaJurisdiccion) _then) = _$FichaJurisdiccionCopyWithImpl;
@useResult
$Res call({
 String jurisdictionId, String name, String country, String timezone, String language, int defaultResponseDays, List<Organismo> organisms, Map<String, String> templates
});




}
/// @nodoc
class _$FichaJurisdiccionCopyWithImpl<$Res>
    implements $FichaJurisdiccionCopyWith<$Res> {
  _$FichaJurisdiccionCopyWithImpl(this._self, this._then);

  final FichaJurisdiccion _self;
  final $Res Function(FichaJurisdiccion) _then;

/// Create a copy of FichaJurisdiccion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jurisdictionId = null,Object? name = null,Object? country = null,Object? timezone = null,Object? language = null,Object? defaultResponseDays = null,Object? organisms = null,Object? templates = null,}) {
  return _then(_self.copyWith(
jurisdictionId: null == jurisdictionId ? _self.jurisdictionId : jurisdictionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,defaultResponseDays: null == defaultResponseDays ? _self.defaultResponseDays : defaultResponseDays // ignore: cast_nullable_to_non_nullable
as int,organisms: null == organisms ? _self.organisms : organisms // ignore: cast_nullable_to_non_nullable
as List<Organismo>,templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [FichaJurisdiccion].
extension FichaJurisdiccionPatterns on FichaJurisdiccion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FichaJurisdiccion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FichaJurisdiccion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FichaJurisdiccion value)  $default,){
final _that = this;
switch (_that) {
case _FichaJurisdiccion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FichaJurisdiccion value)?  $default,){
final _that = this;
switch (_that) {
case _FichaJurisdiccion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jurisdictionId,  String name,  String country,  String timezone,  String language,  int defaultResponseDays,  List<Organismo> organisms,  Map<String, String> templates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FichaJurisdiccion() when $default != null:
return $default(_that.jurisdictionId,_that.name,_that.country,_that.timezone,_that.language,_that.defaultResponseDays,_that.organisms,_that.templates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jurisdictionId,  String name,  String country,  String timezone,  String language,  int defaultResponseDays,  List<Organismo> organisms,  Map<String, String> templates)  $default,) {final _that = this;
switch (_that) {
case _FichaJurisdiccion():
return $default(_that.jurisdictionId,_that.name,_that.country,_that.timezone,_that.language,_that.defaultResponseDays,_that.organisms,_that.templates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jurisdictionId,  String name,  String country,  String timezone,  String language,  int defaultResponseDays,  List<Organismo> organisms,  Map<String, String> templates)?  $default,) {final _that = this;
switch (_that) {
case _FichaJurisdiccion() when $default != null:
return $default(_that.jurisdictionId,_that.name,_that.country,_that.timezone,_that.language,_that.defaultResponseDays,_that.organisms,_that.templates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FichaJurisdiccion implements FichaJurisdiccion {
  const _FichaJurisdiccion({required this.jurisdictionId, required this.name, required this.country, required this.timezone, required this.language, required this.defaultResponseDays, required final  List<Organismo> organisms, required final  Map<String, String> templates}): _organisms = organisms,_templates = templates;
  factory _FichaJurisdiccion.fromJson(Map<String, dynamic> json) => _$FichaJurisdiccionFromJson(json);

@override final  String jurisdictionId;
@override final  String name;
@override final  String country;
@override final  String timezone;
@override final  String language;
@override final  int defaultResponseDays;
 final  List<Organismo> _organisms;
@override List<Organismo> get organisms {
  if (_organisms is EqualUnmodifiableListView) return _organisms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_organisms);
}

/// Plantillas por tipo de escrito: reclamo, reiteracion, pronto_despacho,
/// acceso_informacion, defensoria.
 final  Map<String, String> _templates;
/// Plantillas por tipo de escrito: reclamo, reiteracion, pronto_despacho,
/// acceso_informacion, defensoria.
@override Map<String, String> get templates {
  if (_templates is EqualUnmodifiableMapView) return _templates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_templates);
}


/// Create a copy of FichaJurisdiccion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FichaJurisdiccionCopyWith<_FichaJurisdiccion> get copyWith => __$FichaJurisdiccionCopyWithImpl<_FichaJurisdiccion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FichaJurisdiccionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FichaJurisdiccion&&(identical(other.jurisdictionId, jurisdictionId) || other.jurisdictionId == jurisdictionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.language, language) || other.language == language)&&(identical(other.defaultResponseDays, defaultResponseDays) || other.defaultResponseDays == defaultResponseDays)&&const DeepCollectionEquality().equals(other._organisms, _organisms)&&const DeepCollectionEquality().equals(other._templates, _templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jurisdictionId,name,country,timezone,language,defaultResponseDays,const DeepCollectionEquality().hash(_organisms),const DeepCollectionEquality().hash(_templates));

@override
String toString() {
  return 'FichaJurisdiccion(jurisdictionId: $jurisdictionId, name: $name, country: $country, timezone: $timezone, language: $language, defaultResponseDays: $defaultResponseDays, organisms: $organisms, templates: $templates)';
}


}

/// @nodoc
abstract mixin class _$FichaJurisdiccionCopyWith<$Res> implements $FichaJurisdiccionCopyWith<$Res> {
  factory _$FichaJurisdiccionCopyWith(_FichaJurisdiccion value, $Res Function(_FichaJurisdiccion) _then) = __$FichaJurisdiccionCopyWithImpl;
@override @useResult
$Res call({
 String jurisdictionId, String name, String country, String timezone, String language, int defaultResponseDays, List<Organismo> organisms, Map<String, String> templates
});




}
/// @nodoc
class __$FichaJurisdiccionCopyWithImpl<$Res>
    implements _$FichaJurisdiccionCopyWith<$Res> {
  __$FichaJurisdiccionCopyWithImpl(this._self, this._then);

  final _FichaJurisdiccion _self;
  final $Res Function(_FichaJurisdiccion) _then;

/// Create a copy of FichaJurisdiccion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jurisdictionId = null,Object? name = null,Object? country = null,Object? timezone = null,Object? language = null,Object? defaultResponseDays = null,Object? organisms = null,Object? templates = null,}) {
  return _then(_FichaJurisdiccion(
jurisdictionId: null == jurisdictionId ? _self.jurisdictionId : jurisdictionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,defaultResponseDays: null == defaultResponseDays ? _self.defaultResponseDays : defaultResponseDays // ignore: cast_nullable_to_non_nullable
as int,organisms: null == organisms ? _self._organisms : organisms // ignore: cast_nullable_to_non_nullable
as List<Organismo>,templates: null == templates ? _self._templates : templates // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}


/// @nodoc
mixin _$Organismo {

 String get id; String get name;/// Ids de categoría que atiende este organismo.
 List<String> get categories; CanalesOrganismo get channels; int get responseDays; List<String> get normativa;/// Escalones siguientes (§13) en orden.
 List<String> get escalation;
/// Create a copy of Organismo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganismoCopyWith<Organismo> get copyWith => _$OrganismoCopyWithImpl<Organismo>(this as Organismo, _$identity);

  /// Serializes this Organismo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Organismo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.responseDays, responseDays) || other.responseDays == responseDays)&&const DeepCollectionEquality().equals(other.normativa, normativa)&&const DeepCollectionEquality().equals(other.escalation, escalation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(categories),channels,responseDays,const DeepCollectionEquality().hash(normativa),const DeepCollectionEquality().hash(escalation));

@override
String toString() {
  return 'Organismo(id: $id, name: $name, categories: $categories, channels: $channels, responseDays: $responseDays, normativa: $normativa, escalation: $escalation)';
}


}

/// @nodoc
abstract mixin class $OrganismoCopyWith<$Res>  {
  factory $OrganismoCopyWith(Organismo value, $Res Function(Organismo) _then) = _$OrganismoCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<String> categories, CanalesOrganismo channels, int responseDays, List<String> normativa, List<String> escalation
});


$CanalesOrganismoCopyWith<$Res> get channels;

}
/// @nodoc
class _$OrganismoCopyWithImpl<$Res>
    implements $OrganismoCopyWith<$Res> {
  _$OrganismoCopyWithImpl(this._self, this._then);

  final Organismo _self;
  final $Res Function(Organismo) _then;

/// Create a copy of Organismo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? categories = null,Object? channels = null,Object? responseDays = null,Object? normativa = null,Object? escalation = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as CanalesOrganismo,responseDays: null == responseDays ? _self.responseDays : responseDays // ignore: cast_nullable_to_non_nullable
as int,normativa: null == normativa ? _self.normativa : normativa // ignore: cast_nullable_to_non_nullable
as List<String>,escalation: null == escalation ? _self.escalation : escalation // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of Organismo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanalesOrganismoCopyWith<$Res> get channels {
  
  return $CanalesOrganismoCopyWith<$Res>(_self.channels, (value) {
    return _then(_self.copyWith(channels: value));
  });
}
}


/// Adds pattern-matching-related methods to [Organismo].
extension OrganismoPatterns on Organismo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Organismo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Organismo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Organismo value)  $default,){
final _that = this;
switch (_that) {
case _Organismo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Organismo value)?  $default,){
final _that = this;
switch (_that) {
case _Organismo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<String> categories,  CanalesOrganismo channels,  int responseDays,  List<String> normativa,  List<String> escalation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Organismo() when $default != null:
return $default(_that.id,_that.name,_that.categories,_that.channels,_that.responseDays,_that.normativa,_that.escalation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<String> categories,  CanalesOrganismo channels,  int responseDays,  List<String> normativa,  List<String> escalation)  $default,) {final _that = this;
switch (_that) {
case _Organismo():
return $default(_that.id,_that.name,_that.categories,_that.channels,_that.responseDays,_that.normativa,_that.escalation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<String> categories,  CanalesOrganismo channels,  int responseDays,  List<String> normativa,  List<String> escalation)?  $default,) {final _that = this;
switch (_that) {
case _Organismo() when $default != null:
return $default(_that.id,_that.name,_that.categories,_that.channels,_that.responseDays,_that.normativa,_that.escalation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Organismo implements Organismo {
  const _Organismo({required this.id, required this.name, required final  List<String> categories, required this.channels, required this.responseDays, final  List<String> normativa = const <String>[], final  List<String> escalation = const <String>[]}): _categories = categories,_normativa = normativa,_escalation = escalation;
  factory _Organismo.fromJson(Map<String, dynamic> json) => _$OrganismoFromJson(json);

@override final  String id;
@override final  String name;
/// Ids de categoría que atiende este organismo.
 final  List<String> _categories;
/// Ids de categoría que atiende este organismo.
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  CanalesOrganismo channels;
@override final  int responseDays;
 final  List<String> _normativa;
@override@JsonKey() List<String> get normativa {
  if (_normativa is EqualUnmodifiableListView) return _normativa;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_normativa);
}

/// Escalones siguientes (§13) en orden.
 final  List<String> _escalation;
/// Escalones siguientes (§13) en orden.
@override@JsonKey() List<String> get escalation {
  if (_escalation is EqualUnmodifiableListView) return _escalation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_escalation);
}


/// Create a copy of Organismo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganismoCopyWith<_Organismo> get copyWith => __$OrganismoCopyWithImpl<_Organismo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrganismoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Organismo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.responseDays, responseDays) || other.responseDays == responseDays)&&const DeepCollectionEquality().equals(other._normativa, _normativa)&&const DeepCollectionEquality().equals(other._escalation, _escalation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_categories),channels,responseDays,const DeepCollectionEquality().hash(_normativa),const DeepCollectionEquality().hash(_escalation));

@override
String toString() {
  return 'Organismo(id: $id, name: $name, categories: $categories, channels: $channels, responseDays: $responseDays, normativa: $normativa, escalation: $escalation)';
}


}

/// @nodoc
abstract mixin class _$OrganismoCopyWith<$Res> implements $OrganismoCopyWith<$Res> {
  factory _$OrganismoCopyWith(_Organismo value, $Res Function(_Organismo) _then) = __$OrganismoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<String> categories, CanalesOrganismo channels, int responseDays, List<String> normativa, List<String> escalation
});


@override $CanalesOrganismoCopyWith<$Res> get channels;

}
/// @nodoc
class __$OrganismoCopyWithImpl<$Res>
    implements _$OrganismoCopyWith<$Res> {
  __$OrganismoCopyWithImpl(this._self, this._then);

  final _Organismo _self;
  final $Res Function(_Organismo) _then;

/// Create a copy of Organismo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? categories = null,Object? channels = null,Object? responseDays = null,Object? normativa = null,Object? escalation = null,}) {
  return _then(_Organismo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as CanalesOrganismo,responseDays: null == responseDays ? _self.responseDays : responseDays // ignore: cast_nullable_to_non_nullable
as int,normativa: null == normativa ? _self._normativa : normativa // ignore: cast_nullable_to_non_nullable
as List<String>,escalation: null == escalation ? _self._escalation : escalation // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of Organismo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanalesOrganismoCopyWith<$Res> get channels {
  
  return $CanalesOrganismoCopyWith<$Res>(_self.channels, (value) {
    return _then(_self.copyWith(channels: value));
  });
}
}


/// @nodoc
mixin _$CanalesOrganismo {

 String? get email; String? get formUrl; String? get open311;
/// Create a copy of CanalesOrganismo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanalesOrganismoCopyWith<CanalesOrganismo> get copyWith => _$CanalesOrganismoCopyWithImpl<CanalesOrganismo>(this as CanalesOrganismo, _$identity);

  /// Serializes this CanalesOrganismo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanalesOrganismo&&(identical(other.email, email) || other.email == email)&&(identical(other.formUrl, formUrl) || other.formUrl == formUrl)&&(identical(other.open311, open311) || other.open311 == open311));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,formUrl,open311);

@override
String toString() {
  return 'CanalesOrganismo(email: $email, formUrl: $formUrl, open311: $open311)';
}


}

/// @nodoc
abstract mixin class $CanalesOrganismoCopyWith<$Res>  {
  factory $CanalesOrganismoCopyWith(CanalesOrganismo value, $Res Function(CanalesOrganismo) _then) = _$CanalesOrganismoCopyWithImpl;
@useResult
$Res call({
 String? email, String? formUrl, String? open311
});




}
/// @nodoc
class _$CanalesOrganismoCopyWithImpl<$Res>
    implements $CanalesOrganismoCopyWith<$Res> {
  _$CanalesOrganismoCopyWithImpl(this._self, this._then);

  final CanalesOrganismo _self;
  final $Res Function(CanalesOrganismo) _then;

/// Create a copy of CanalesOrganismo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? formUrl = freezed,Object? open311 = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,formUrl: freezed == formUrl ? _self.formUrl : formUrl // ignore: cast_nullable_to_non_nullable
as String?,open311: freezed == open311 ? _self.open311 : open311 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CanalesOrganismo].
extension CanalesOrganismoPatterns on CanalesOrganismo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanalesOrganismo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanalesOrganismo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanalesOrganismo value)  $default,){
final _that = this;
switch (_that) {
case _CanalesOrganismo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanalesOrganismo value)?  $default,){
final _that = this;
switch (_that) {
case _CanalesOrganismo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? formUrl,  String? open311)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanalesOrganismo() when $default != null:
return $default(_that.email,_that.formUrl,_that.open311);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? formUrl,  String? open311)  $default,) {final _that = this;
switch (_that) {
case _CanalesOrganismo():
return $default(_that.email,_that.formUrl,_that.open311);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? formUrl,  String? open311)?  $default,) {final _that = this;
switch (_that) {
case _CanalesOrganismo() when $default != null:
return $default(_that.email,_that.formUrl,_that.open311);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CanalesOrganismo implements CanalesOrganismo {
  const _CanalesOrganismo({this.email, this.formUrl, this.open311});
  factory _CanalesOrganismo.fromJson(Map<String, dynamic> json) => _$CanalesOrganismoFromJson(json);

@override final  String? email;
@override final  String? formUrl;
@override final  String? open311;

/// Create a copy of CanalesOrganismo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanalesOrganismoCopyWith<_CanalesOrganismo> get copyWith => __$CanalesOrganismoCopyWithImpl<_CanalesOrganismo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CanalesOrganismoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanalesOrganismo&&(identical(other.email, email) || other.email == email)&&(identical(other.formUrl, formUrl) || other.formUrl == formUrl)&&(identical(other.open311, open311) || other.open311 == open311));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,formUrl,open311);

@override
String toString() {
  return 'CanalesOrganismo(email: $email, formUrl: $formUrl, open311: $open311)';
}


}

/// @nodoc
abstract mixin class _$CanalesOrganismoCopyWith<$Res> implements $CanalesOrganismoCopyWith<$Res> {
  factory _$CanalesOrganismoCopyWith(_CanalesOrganismo value, $Res Function(_CanalesOrganismo) _then) = __$CanalesOrganismoCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? formUrl, String? open311
});




}
/// @nodoc
class __$CanalesOrganismoCopyWithImpl<$Res>
    implements _$CanalesOrganismoCopyWith<$Res> {
  __$CanalesOrganismoCopyWithImpl(this._self, this._then);

  final _CanalesOrganismo _self;
  final $Res Function(_CanalesOrganismo) _then;

/// Create a copy of CanalesOrganismo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? formUrl = freezed,Object? open311 = freezed,}) {
  return _then(_CanalesOrganismo(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,formUrl: freezed == formUrl ? _self.formUrl : formUrl // ignore: cast_nullable_to_non_nullable
as String?,open311: freezed == open311 ? _self.open311 : open311 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
