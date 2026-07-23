// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_datos.dart';

// ignore_for_file: type=lint
class $CountriesTable extends Countries
    with TableInfo<$CountriesTable, Country> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 2,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultLanguageMeta = const VerificationMeta(
    'defaultLanguage',
  );
  @override
  late final GeneratedColumn<String> defaultLanguage = GeneratedColumn<String>(
    'default_language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultTimezoneMeta = const VerificationMeta(
    'defaultTimezone',
  );
  @override
  late final GeneratedColumn<String> defaultTimezone = GeneratedColumn<String>(
    'default_timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    defaultLanguage,
    defaultTimezone,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'countries';
  @override
  VerificationContext validateIntegrity(
    Insertable<Country> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('default_language')) {
      context.handle(
        _defaultLanguageMeta,
        defaultLanguage.isAcceptableOrUnknown(
          data['default_language']!,
          _defaultLanguageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defaultLanguageMeta);
    }
    if (data.containsKey('default_timezone')) {
      context.handle(
        _defaultTimezoneMeta,
        defaultTimezone.isAcceptableOrUnknown(
          data['default_timezone']!,
          _defaultTimezoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defaultTimezoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Country map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Country(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      defaultLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_language'],
      )!,
      defaultTimezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_timezone'],
      )!,
    );
  }

  @override
  $CountriesTable createAlias(String alias) {
    return $CountriesTable(attachedDatabase, alias);
  }
}

class Country extends DataClass implements Insertable<Country> {
  /// ISO 3166-1 alpha-2.
  final String id;
  final String name;
  final String defaultLanguage;
  final String defaultTimezone;
  const Country({
    required this.id,
    required this.name,
    required this.defaultLanguage,
    required this.defaultTimezone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['default_language'] = Variable<String>(defaultLanguage);
    map['default_timezone'] = Variable<String>(defaultTimezone);
    return map;
  }

  CountriesCompanion toCompanion(bool nullToAbsent) {
    return CountriesCompanion(
      id: Value(id),
      name: Value(name),
      defaultLanguage: Value(defaultLanguage),
      defaultTimezone: Value(defaultTimezone),
    );
  }

  factory Country.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Country(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      defaultLanguage: serializer.fromJson<String>(json['defaultLanguage']),
      defaultTimezone: serializer.fromJson<String>(json['defaultTimezone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'defaultLanguage': serializer.toJson<String>(defaultLanguage),
      'defaultTimezone': serializer.toJson<String>(defaultTimezone),
    };
  }

  Country copyWith({
    String? id,
    String? name,
    String? defaultLanguage,
    String? defaultTimezone,
  }) => Country(
    id: id ?? this.id,
    name: name ?? this.name,
    defaultLanguage: defaultLanguage ?? this.defaultLanguage,
    defaultTimezone: defaultTimezone ?? this.defaultTimezone,
  );
  Country copyWithCompanion(CountriesCompanion data) {
    return Country(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      defaultLanguage: data.defaultLanguage.present
          ? data.defaultLanguage.value
          : this.defaultLanguage,
      defaultTimezone: data.defaultTimezone.present
          ? data.defaultTimezone.value
          : this.defaultTimezone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Country(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('defaultLanguage: $defaultLanguage, ')
          ..write('defaultTimezone: $defaultTimezone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, defaultLanguage, defaultTimezone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Country &&
          other.id == this.id &&
          other.name == this.name &&
          other.defaultLanguage == this.defaultLanguage &&
          other.defaultTimezone == this.defaultTimezone);
}

class CountriesCompanion extends UpdateCompanion<Country> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> defaultLanguage;
  final Value<String> defaultTimezone;
  final Value<int> rowid;
  const CountriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.defaultLanguage = const Value.absent(),
    this.defaultTimezone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CountriesCompanion.insert({
    required String id,
    required String name,
    required String defaultLanguage,
    required String defaultTimezone,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       defaultLanguage = Value(defaultLanguage),
       defaultTimezone = Value(defaultTimezone);
  static Insertable<Country> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? defaultLanguage,
    Expression<String>? defaultTimezone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (defaultLanguage != null) 'default_language': defaultLanguage,
      if (defaultTimezone != null) 'default_timezone': defaultTimezone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CountriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? defaultLanguage,
    Value<String>? defaultTimezone,
    Value<int>? rowid,
  }) {
    return CountriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      defaultLanguage: defaultLanguage ?? this.defaultLanguage,
      defaultTimezone: defaultTimezone ?? this.defaultTimezone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (defaultLanguage.present) {
      map['default_language'] = Variable<String>(defaultLanguage.value);
    }
    if (defaultTimezone.present) {
      map['default_timezone'] = Variable<String>(defaultTimezone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('defaultLanguage: $defaultLanguage, ')
          ..write('defaultTimezone: $defaultTimezone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RegionsTable extends Regions with TableInfo<$RegionsTable, Region> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<String> countryId = GeneratedColumn<String>(
    'country_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _geonamesIdMeta = const VerificationMeta(
    'geonamesId',
  );
  @override
  late final GeneratedColumn<int> geonamesId = GeneratedColumn<int>(
    'geonames_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, countryId, name, geonamesId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'regions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Region> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('geonames_id')) {
      context.handle(
        _geonamesIdMeta,
        geonamesId.isAcceptableOrUnknown(data['geonames_id']!, _geonamesIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Region map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Region(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      geonamesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}geonames_id'],
      ),
    );
  }

  @override
  $RegionsTable createAlias(String alias) {
    return $RegionsTable(attachedDatabase, alias);
  }
}

class Region extends DataClass implements Insertable<Region> {
  final String id;
  final String countryId;
  final String name;
  final int? geonamesId;
  const Region({
    required this.id,
    required this.countryId,
    required this.name,
    this.geonamesId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['country_id'] = Variable<String>(countryId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || geonamesId != null) {
      map['geonames_id'] = Variable<int>(geonamesId);
    }
    return map;
  }

  RegionsCompanion toCompanion(bool nullToAbsent) {
    return RegionsCompanion(
      id: Value(id),
      countryId: Value(countryId),
      name: Value(name),
      geonamesId: geonamesId == null && nullToAbsent
          ? const Value.absent()
          : Value(geonamesId),
    );
  }

  factory Region.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Region(
      id: serializer.fromJson<String>(json['id']),
      countryId: serializer.fromJson<String>(json['countryId']),
      name: serializer.fromJson<String>(json['name']),
      geonamesId: serializer.fromJson<int?>(json['geonamesId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'countryId': serializer.toJson<String>(countryId),
      'name': serializer.toJson<String>(name),
      'geonamesId': serializer.toJson<int?>(geonamesId),
    };
  }

  Region copyWith({
    String? id,
    String? countryId,
    String? name,
    Value<int?> geonamesId = const Value.absent(),
  }) => Region(
    id: id ?? this.id,
    countryId: countryId ?? this.countryId,
    name: name ?? this.name,
    geonamesId: geonamesId.present ? geonamesId.value : this.geonamesId,
  );
  Region copyWithCompanion(RegionsCompanion data) {
    return Region(
      id: data.id.present ? data.id.value : this.id,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      name: data.name.present ? data.name.value : this.name,
      geonamesId: data.geonamesId.present
          ? data.geonamesId.value
          : this.geonamesId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Region(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('name: $name, ')
          ..write('geonamesId: $geonamesId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, countryId, name, geonamesId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Region &&
          other.id == this.id &&
          other.countryId == this.countryId &&
          other.name == this.name &&
          other.geonamesId == this.geonamesId);
}

class RegionsCompanion extends UpdateCompanion<Region> {
  final Value<String> id;
  final Value<String> countryId;
  final Value<String> name;
  final Value<int?> geonamesId;
  final Value<int> rowid;
  const RegionsCompanion({
    this.id = const Value.absent(),
    this.countryId = const Value.absent(),
    this.name = const Value.absent(),
    this.geonamesId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RegionsCompanion.insert({
    required String id,
    required String countryId,
    required String name,
    this.geonamesId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       countryId = Value(countryId),
       name = Value(name);
  static Insertable<Region> custom({
    Expression<String>? id,
    Expression<String>? countryId,
    Expression<String>? name,
    Expression<int>? geonamesId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryId != null) 'country_id': countryId,
      if (name != null) 'name': name,
      if (geonamesId != null) 'geonames_id': geonamesId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RegionsCompanion copyWith({
    Value<String>? id,
    Value<String>? countryId,
    Value<String>? name,
    Value<int?>? geonamesId,
    Value<int>? rowid,
  }) {
    return RegionsCompanion(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      name: name ?? this.name,
      geonamesId: geonamesId ?? this.geonamesId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String>(countryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (geonamesId.present) {
      map['geonames_id'] = Variable<int>(geonamesId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegionsCompanion(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('name: $name, ')
          ..write('geonamesId: $geonamesId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CitiesTable extends Cities with TableInfo<$CitiesTable, City> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regionIdMeta = const VerificationMeta(
    'regionId',
  );
  @override
  late final GeneratedColumn<String> regionId = GeneratedColumn<String>(
    'region_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _geonamesIdMeta = const VerificationMeta(
    'geonamesId',
  );
  @override
  late final GeneratedColumn<int> geonamesId = GeneratedColumn<int>(
    'geonames_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jurisdictionIdMeta = const VerificationMeta(
    'jurisdictionId',
  );
  @override
  late final GeneratedColumn<String> jurisdictionId = GeneratedColumn<String>(
    'jurisdiction_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _osmRelationIdMeta = const VerificationMeta(
    'osmRelationId',
  );
  @override
  late final GeneratedColumn<int> osmRelationId = GeneratedColumn<int>(
    'osm_relation_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _populationMeta = const VerificationMeta(
    'population',
  );
  @override
  late final GeneratedColumn<int> population = GeneratedColumn<int>(
    'population',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    regionId,
    name,
    geonamesId,
    jurisdictionId,
    osmRelationId,
    population,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cities';
  @override
  VerificationContext validateIntegrity(
    Insertable<City> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('region_id')) {
      context.handle(
        _regionIdMeta,
        regionId.isAcceptableOrUnknown(data['region_id']!, _regionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_regionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('geonames_id')) {
      context.handle(
        _geonamesIdMeta,
        geonamesId.isAcceptableOrUnknown(data['geonames_id']!, _geonamesIdMeta),
      );
    }
    if (data.containsKey('jurisdiction_id')) {
      context.handle(
        _jurisdictionIdMeta,
        jurisdictionId.isAcceptableOrUnknown(
          data['jurisdiction_id']!,
          _jurisdictionIdMeta,
        ),
      );
    }
    if (data.containsKey('osm_relation_id')) {
      context.handle(
        _osmRelationIdMeta,
        osmRelationId.isAcceptableOrUnknown(
          data['osm_relation_id']!,
          _osmRelationIdMeta,
        ),
      );
    }
    if (data.containsKey('population')) {
      context.handle(
        _populationMeta,
        population.isAcceptableOrUnknown(data['population']!, _populationMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  City map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return City(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      regionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      geonamesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}geonames_id'],
      ),
      jurisdictionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jurisdiction_id'],
      ),
      osmRelationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}osm_relation_id'],
      ),
      population: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}population'],
      ),
    );
  }

  @override
  $CitiesTable createAlias(String alias) {
    return $CitiesTable(attachedDatabase, alias);
  }
}

class City extends DataClass implements Insertable<City> {
  final String id;
  final String regionId;
  final String name;
  final int? geonamesId;

  /// Null hasta que la ciudad tenga ficha jurisdiccional cargada:
  /// el barrio funciona en "modo solo comunidad" (§6.5).
  final String? jurisdictionId;
  final int? osmRelationId;
  final int? population;
  const City({
    required this.id,
    required this.regionId,
    required this.name,
    this.geonamesId,
    this.jurisdictionId,
    this.osmRelationId,
    this.population,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['region_id'] = Variable<String>(regionId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || geonamesId != null) {
      map['geonames_id'] = Variable<int>(geonamesId);
    }
    if (!nullToAbsent || jurisdictionId != null) {
      map['jurisdiction_id'] = Variable<String>(jurisdictionId);
    }
    if (!nullToAbsent || osmRelationId != null) {
      map['osm_relation_id'] = Variable<int>(osmRelationId);
    }
    if (!nullToAbsent || population != null) {
      map['population'] = Variable<int>(population);
    }
    return map;
  }

  CitiesCompanion toCompanion(bool nullToAbsent) {
    return CitiesCompanion(
      id: Value(id),
      regionId: Value(regionId),
      name: Value(name),
      geonamesId: geonamesId == null && nullToAbsent
          ? const Value.absent()
          : Value(geonamesId),
      jurisdictionId: jurisdictionId == null && nullToAbsent
          ? const Value.absent()
          : Value(jurisdictionId),
      osmRelationId: osmRelationId == null && nullToAbsent
          ? const Value.absent()
          : Value(osmRelationId),
      population: population == null && nullToAbsent
          ? const Value.absent()
          : Value(population),
    );
  }

  factory City.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return City(
      id: serializer.fromJson<String>(json['id']),
      regionId: serializer.fromJson<String>(json['regionId']),
      name: serializer.fromJson<String>(json['name']),
      geonamesId: serializer.fromJson<int?>(json['geonamesId']),
      jurisdictionId: serializer.fromJson<String?>(json['jurisdictionId']),
      osmRelationId: serializer.fromJson<int?>(json['osmRelationId']),
      population: serializer.fromJson<int?>(json['population']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'regionId': serializer.toJson<String>(regionId),
      'name': serializer.toJson<String>(name),
      'geonamesId': serializer.toJson<int?>(geonamesId),
      'jurisdictionId': serializer.toJson<String?>(jurisdictionId),
      'osmRelationId': serializer.toJson<int?>(osmRelationId),
      'population': serializer.toJson<int?>(population),
    };
  }

  City copyWith({
    String? id,
    String? regionId,
    String? name,
    Value<int?> geonamesId = const Value.absent(),
    Value<String?> jurisdictionId = const Value.absent(),
    Value<int?> osmRelationId = const Value.absent(),
    Value<int?> population = const Value.absent(),
  }) => City(
    id: id ?? this.id,
    regionId: regionId ?? this.regionId,
    name: name ?? this.name,
    geonamesId: geonamesId.present ? geonamesId.value : this.geonamesId,
    jurisdictionId: jurisdictionId.present
        ? jurisdictionId.value
        : this.jurisdictionId,
    osmRelationId: osmRelationId.present
        ? osmRelationId.value
        : this.osmRelationId,
    population: population.present ? population.value : this.population,
  );
  City copyWithCompanion(CitiesCompanion data) {
    return City(
      id: data.id.present ? data.id.value : this.id,
      regionId: data.regionId.present ? data.regionId.value : this.regionId,
      name: data.name.present ? data.name.value : this.name,
      geonamesId: data.geonamesId.present
          ? data.geonamesId.value
          : this.geonamesId,
      jurisdictionId: data.jurisdictionId.present
          ? data.jurisdictionId.value
          : this.jurisdictionId,
      osmRelationId: data.osmRelationId.present
          ? data.osmRelationId.value
          : this.osmRelationId,
      population: data.population.present
          ? data.population.value
          : this.population,
    );
  }

  @override
  String toString() {
    return (StringBuffer('City(')
          ..write('id: $id, ')
          ..write('regionId: $regionId, ')
          ..write('name: $name, ')
          ..write('geonamesId: $geonamesId, ')
          ..write('jurisdictionId: $jurisdictionId, ')
          ..write('osmRelationId: $osmRelationId, ')
          ..write('population: $population')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    regionId,
    name,
    geonamesId,
    jurisdictionId,
    osmRelationId,
    population,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is City &&
          other.id == this.id &&
          other.regionId == this.regionId &&
          other.name == this.name &&
          other.geonamesId == this.geonamesId &&
          other.jurisdictionId == this.jurisdictionId &&
          other.osmRelationId == this.osmRelationId &&
          other.population == this.population);
}

class CitiesCompanion extends UpdateCompanion<City> {
  final Value<String> id;
  final Value<String> regionId;
  final Value<String> name;
  final Value<int?> geonamesId;
  final Value<String?> jurisdictionId;
  final Value<int?> osmRelationId;
  final Value<int?> population;
  final Value<int> rowid;
  const CitiesCompanion({
    this.id = const Value.absent(),
    this.regionId = const Value.absent(),
    this.name = const Value.absent(),
    this.geonamesId = const Value.absent(),
    this.jurisdictionId = const Value.absent(),
    this.osmRelationId = const Value.absent(),
    this.population = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CitiesCompanion.insert({
    required String id,
    required String regionId,
    required String name,
    this.geonamesId = const Value.absent(),
    this.jurisdictionId = const Value.absent(),
    this.osmRelationId = const Value.absent(),
    this.population = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       regionId = Value(regionId),
       name = Value(name);
  static Insertable<City> custom({
    Expression<String>? id,
    Expression<String>? regionId,
    Expression<String>? name,
    Expression<int>? geonamesId,
    Expression<String>? jurisdictionId,
    Expression<int>? osmRelationId,
    Expression<int>? population,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (regionId != null) 'region_id': regionId,
      if (name != null) 'name': name,
      if (geonamesId != null) 'geonames_id': geonamesId,
      if (jurisdictionId != null) 'jurisdiction_id': jurisdictionId,
      if (osmRelationId != null) 'osm_relation_id': osmRelationId,
      if (population != null) 'population': population,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CitiesCompanion copyWith({
    Value<String>? id,
    Value<String>? regionId,
    Value<String>? name,
    Value<int?>? geonamesId,
    Value<String?>? jurisdictionId,
    Value<int?>? osmRelationId,
    Value<int?>? population,
    Value<int>? rowid,
  }) {
    return CitiesCompanion(
      id: id ?? this.id,
      regionId: regionId ?? this.regionId,
      name: name ?? this.name,
      geonamesId: geonamesId ?? this.geonamesId,
      jurisdictionId: jurisdictionId ?? this.jurisdictionId,
      osmRelationId: osmRelationId ?? this.osmRelationId,
      population: population ?? this.population,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (regionId.present) {
      map['region_id'] = Variable<String>(regionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (geonamesId.present) {
      map['geonames_id'] = Variable<int>(geonamesId.value);
    }
    if (jurisdictionId.present) {
      map['jurisdiction_id'] = Variable<String>(jurisdictionId.value);
    }
    if (osmRelationId.present) {
      map['osm_relation_id'] = Variable<int>(osmRelationId.value);
    }
    if (population.present) {
      map['population'] = Variable<int>(population.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CitiesCompanion(')
          ..write('id: $id, ')
          ..write('regionId: $regionId, ')
          ..write('name: $name, ')
          ..write('geonamesId: $geonamesId, ')
          ..write('jurisdictionId: $jurisdictionId, ')
          ..write('osmRelationId: $osmRelationId, ')
          ..write('population: $population, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NeighborhoodsTable extends Neighborhoods
    with TableInfo<$NeighborhoodsTable, Neighborhood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NeighborhoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pendiente.name),
      ).withConverter<SyncStatus>($NeighborhoodsTable.$convertersyncStatus);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String> cityId = GeneratedColumn<String>(
    'city_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameNormalizedMeta = const VerificationMeta(
    'nameNormalized',
  );
  @override
  late final GeneratedColumn<String> nameNormalized = GeneratedColumn<String>(
    'name_normalized',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aliasesMeta = const VerificationMeta(
    'aliases',
  );
  @override
  late final GeneratedColumn<String> aliases = GeneratedColumn<String>(
    'aliases',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _polygonMeta = const VerificationMeta(
    'polygon',
  );
  @override
  late final GeneratedColumn<String> polygon = GeneratedColumn<String>(
    'polygon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _centroidLatMeta = const VerificationMeta(
    'centroidLat',
  );
  @override
  late final GeneratedColumn<double> centroidLat = GeneratedColumn<double>(
    'centroid_lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _centroidLngMeta = const VerificationMeta(
    'centroidLng',
  );
  @override
  late final GeneratedColumn<double> centroidLng = GeneratedColumn<double>(
    'centroid_lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaKm2Meta = const VerificationMeta(
    'areaKm2',
  );
  @override
  late final GeneratedColumn<double> areaKm2 = GeneratedColumn<double>(
    'area_km2',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<NeighborhoodStatus, String>
  status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<NeighborhoodStatus>($NeighborhoodsTable.$converterstatus);
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _validationSourceMeta = const VerificationMeta(
    'validationSource',
  );
  @override
  late final GeneratedColumn<String> validationSource = GeneratedColumn<String>(
    'validation_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _validationPayloadMeta = const VerificationMeta(
    'validationPayload',
  );
  @override
  late final GeneratedColumn<String> validationPayload =
      GeneratedColumn<String>(
        'validation_payload',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _verifiedUserCountMeta = const VerificationMeta(
    'verifiedUserCount',
  );
  @override
  late final GeneratedColumn<int> verifiedUserCount = GeneratedColumn<int>(
    'verified_user_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _caseCountMeta = const VerificationMeta(
    'caseCount',
  );
  @override
  late final GeneratedColumn<int> caseCount = GeneratedColumn<int>(
    'case_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _mergedIntoMeta = const VerificationMeta(
    'mergedInto',
  );
  @override
  late final GeneratedColumn<String> mergedInto = GeneratedColumn<String>(
    'merged_into',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    cityId,
    name,
    nameNormalized,
    aliases,
    polygon,
    centroidLat,
    centroidLng,
    areaKm2,
    status,
    createdBy,
    createdAt,
    validationSource,
    validationPayload,
    verifiedUserCount,
    caseCount,
    mergedInto,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'neighborhoods';
  @override
  VerificationContext validateIntegrity(
    Insertable<Neighborhood> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('city_id')) {
      context.handle(
        _cityIdMeta,
        cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cityIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_normalized')) {
      context.handle(
        _nameNormalizedMeta,
        nameNormalized.isAcceptableOrUnknown(
          data['name_normalized']!,
          _nameNormalizedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nameNormalizedMeta);
    }
    if (data.containsKey('aliases')) {
      context.handle(
        _aliasesMeta,
        aliases.isAcceptableOrUnknown(data['aliases']!, _aliasesMeta),
      );
    }
    if (data.containsKey('polygon')) {
      context.handle(
        _polygonMeta,
        polygon.isAcceptableOrUnknown(data['polygon']!, _polygonMeta),
      );
    } else if (isInserting) {
      context.missing(_polygonMeta);
    }
    if (data.containsKey('centroid_lat')) {
      context.handle(
        _centroidLatMeta,
        centroidLat.isAcceptableOrUnknown(
          data['centroid_lat']!,
          _centroidLatMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_centroidLatMeta);
    }
    if (data.containsKey('centroid_lng')) {
      context.handle(
        _centroidLngMeta,
        centroidLng.isAcceptableOrUnknown(
          data['centroid_lng']!,
          _centroidLngMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_centroidLngMeta);
    }
    if (data.containsKey('area_km2')) {
      context.handle(
        _areaKm2Meta,
        areaKm2.isAcceptableOrUnknown(data['area_km2']!, _areaKm2Meta),
      );
    } else if (isInserting) {
      context.missing(_areaKm2Meta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('validation_source')) {
      context.handle(
        _validationSourceMeta,
        validationSource.isAcceptableOrUnknown(
          data['validation_source']!,
          _validationSourceMeta,
        ),
      );
    }
    if (data.containsKey('validation_payload')) {
      context.handle(
        _validationPayloadMeta,
        validationPayload.isAcceptableOrUnknown(
          data['validation_payload']!,
          _validationPayloadMeta,
        ),
      );
    }
    if (data.containsKey('verified_user_count')) {
      context.handle(
        _verifiedUserCountMeta,
        verifiedUserCount.isAcceptableOrUnknown(
          data['verified_user_count']!,
          _verifiedUserCountMeta,
        ),
      );
    }
    if (data.containsKey('case_count')) {
      context.handle(
        _caseCountMeta,
        caseCount.isAcceptableOrUnknown(data['case_count']!, _caseCountMeta),
      );
    }
    if (data.containsKey('merged_into')) {
      context.handle(
        _mergedIntoMeta,
        mergedInto.isAcceptableOrUnknown(data['merged_into']!, _mergedIntoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Neighborhood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Neighborhood(
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      syncStatus: $NeighborhoodsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameNormalized: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_normalized'],
      )!,
      aliases: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aliases'],
      )!,
      polygon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}polygon'],
      )!,
      centroidLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}centroid_lat'],
      )!,
      centroidLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}centroid_lng'],
      )!,
      areaKm2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}area_km2'],
      )!,
      status: $NeighborhoodsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      validationSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}validation_source'],
      ),
      validationPayload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}validation_payload'],
      ),
      verifiedUserCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verified_user_count'],
      )!,
      caseCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}case_count'],
      )!,
      mergedInto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merged_into'],
      ),
    );
  }

  @override
  $NeighborhoodsTable createAlias(String alias) {
    return $NeighborhoodsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<NeighborhoodStatus, String, String>
  $converterstatus = const EnumNameConverter<NeighborhoodStatus>(
    NeighborhoodStatus.values,
  );
}

class Neighborhood extends DataClass implements Insertable<Neighborhood> {
  /// Idempotencia: el servidor deduplica por este uuid (§20.2).
  final String clientUuid;

  /// Estado de sincronización visible por ítem en la UI (§20.2).
  final SyncStatus syncStatus;

  /// Última modificación local (last-write-wins salvo contadores).
  final DateTime updatedAt;
  final String id;
  final String cityId;
  final String name;
  final String nameNormalized;

  /// JSON: lista de alias de búsqueda (barrios fusionados).
  final String aliases;

  /// JSON: polígono [[lat,lng],...] SRID 4326. La geometría "de verdad"
  /// (PostGIS) vive en el servidor; acá alcanza para dibujar y contener.
  final String polygon;
  final double centroidLat;
  final double centroidLng;
  final double areaKm2;
  final NeighborhoodStatus status;
  final String? createdBy;
  final DateTime createdAt;

  /// google_places | osm | manual (§6.2).
  final String? validationSource;

  /// JSON crudo de la validación externa.
  final String? validationPayload;
  final int verifiedUserCount;
  final int caseCount;

  /// Id del barrio canónico si este quedó fusionado (§6.4).
  final String? mergedInto;
  const Neighborhood({
    required this.clientUuid,
    required this.syncStatus,
    required this.updatedAt,
    required this.id,
    required this.cityId,
    required this.name,
    required this.nameNormalized,
    required this.aliases,
    required this.polygon,
    required this.centroidLat,
    required this.centroidLng,
    required this.areaKm2,
    required this.status,
    this.createdBy,
    required this.createdAt,
    this.validationSource,
    this.validationPayload,
    required this.verifiedUserCount,
    required this.caseCount,
    this.mergedInto,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_uuid'] = Variable<String>(clientUuid);
    {
      map['sync_status'] = Variable<String>(
        $NeighborhoodsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['city_id'] = Variable<String>(cityId);
    map['name'] = Variable<String>(name);
    map['name_normalized'] = Variable<String>(nameNormalized);
    map['aliases'] = Variable<String>(aliases);
    map['polygon'] = Variable<String>(polygon);
    map['centroid_lat'] = Variable<double>(centroidLat);
    map['centroid_lng'] = Variable<double>(centroidLng);
    map['area_km2'] = Variable<double>(areaKm2);
    {
      map['status'] = Variable<String>(
        $NeighborhoodsTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || validationSource != null) {
      map['validation_source'] = Variable<String>(validationSource);
    }
    if (!nullToAbsent || validationPayload != null) {
      map['validation_payload'] = Variable<String>(validationPayload);
    }
    map['verified_user_count'] = Variable<int>(verifiedUserCount);
    map['case_count'] = Variable<int>(caseCount);
    if (!nullToAbsent || mergedInto != null) {
      map['merged_into'] = Variable<String>(mergedInto);
    }
    return map;
  }

  NeighborhoodsCompanion toCompanion(bool nullToAbsent) {
    return NeighborhoodsCompanion(
      clientUuid: Value(clientUuid),
      syncStatus: Value(syncStatus),
      updatedAt: Value(updatedAt),
      id: Value(id),
      cityId: Value(cityId),
      name: Value(name),
      nameNormalized: Value(nameNormalized),
      aliases: Value(aliases),
      polygon: Value(polygon),
      centroidLat: Value(centroidLat),
      centroidLng: Value(centroidLng),
      areaKm2: Value(areaKm2),
      status: Value(status),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: Value(createdAt),
      validationSource: validationSource == null && nullToAbsent
          ? const Value.absent()
          : Value(validationSource),
      validationPayload: validationPayload == null && nullToAbsent
          ? const Value.absent()
          : Value(validationPayload),
      verifiedUserCount: Value(verifiedUserCount),
      caseCount: Value(caseCount),
      mergedInto: mergedInto == null && nullToAbsent
          ? const Value.absent()
          : Value(mergedInto),
    );
  }

  factory Neighborhood.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Neighborhood(
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      syncStatus: $NeighborhoodsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      cityId: serializer.fromJson<String>(json['cityId']),
      name: serializer.fromJson<String>(json['name']),
      nameNormalized: serializer.fromJson<String>(json['nameNormalized']),
      aliases: serializer.fromJson<String>(json['aliases']),
      polygon: serializer.fromJson<String>(json['polygon']),
      centroidLat: serializer.fromJson<double>(json['centroidLat']),
      centroidLng: serializer.fromJson<double>(json['centroidLng']),
      areaKm2: serializer.fromJson<double>(json['areaKm2']),
      status: $NeighborhoodsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      validationSource: serializer.fromJson<String?>(json['validationSource']),
      validationPayload: serializer.fromJson<String?>(
        json['validationPayload'],
      ),
      verifiedUserCount: serializer.fromJson<int>(json['verifiedUserCount']),
      caseCount: serializer.fromJson<int>(json['caseCount']),
      mergedInto: serializer.fromJson<String?>(json['mergedInto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientUuid': serializer.toJson<String>(clientUuid),
      'syncStatus': serializer.toJson<String>(
        $NeighborhoodsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'cityId': serializer.toJson<String>(cityId),
      'name': serializer.toJson<String>(name),
      'nameNormalized': serializer.toJson<String>(nameNormalized),
      'aliases': serializer.toJson<String>(aliases),
      'polygon': serializer.toJson<String>(polygon),
      'centroidLat': serializer.toJson<double>(centroidLat),
      'centroidLng': serializer.toJson<double>(centroidLng),
      'areaKm2': serializer.toJson<double>(areaKm2),
      'status': serializer.toJson<String>(
        $NeighborhoodsTable.$converterstatus.toJson(status),
      ),
      'createdBy': serializer.toJson<String?>(createdBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'validationSource': serializer.toJson<String?>(validationSource),
      'validationPayload': serializer.toJson<String?>(validationPayload),
      'verifiedUserCount': serializer.toJson<int>(verifiedUserCount),
      'caseCount': serializer.toJson<int>(caseCount),
      'mergedInto': serializer.toJson<String?>(mergedInto),
    };
  }

  Neighborhood copyWith({
    String? clientUuid,
    SyncStatus? syncStatus,
    DateTime? updatedAt,
    String? id,
    String? cityId,
    String? name,
    String? nameNormalized,
    String? aliases,
    String? polygon,
    double? centroidLat,
    double? centroidLng,
    double? areaKm2,
    NeighborhoodStatus? status,
    Value<String?> createdBy = const Value.absent(),
    DateTime? createdAt,
    Value<String?> validationSource = const Value.absent(),
    Value<String?> validationPayload = const Value.absent(),
    int? verifiedUserCount,
    int? caseCount,
    Value<String?> mergedInto = const Value.absent(),
  }) => Neighborhood(
    clientUuid: clientUuid ?? this.clientUuid,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    cityId: cityId ?? this.cityId,
    name: name ?? this.name,
    nameNormalized: nameNormalized ?? this.nameNormalized,
    aliases: aliases ?? this.aliases,
    polygon: polygon ?? this.polygon,
    centroidLat: centroidLat ?? this.centroidLat,
    centroidLng: centroidLng ?? this.centroidLng,
    areaKm2: areaKm2 ?? this.areaKm2,
    status: status ?? this.status,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    createdAt: createdAt ?? this.createdAt,
    validationSource: validationSource.present
        ? validationSource.value
        : this.validationSource,
    validationPayload: validationPayload.present
        ? validationPayload.value
        : this.validationPayload,
    verifiedUserCount: verifiedUserCount ?? this.verifiedUserCount,
    caseCount: caseCount ?? this.caseCount,
    mergedInto: mergedInto.present ? mergedInto.value : this.mergedInto,
  );
  Neighborhood copyWithCompanion(NeighborhoodsCompanion data) {
    return Neighborhood(
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      cityId: data.cityId.present ? data.cityId.value : this.cityId,
      name: data.name.present ? data.name.value : this.name,
      nameNormalized: data.nameNormalized.present
          ? data.nameNormalized.value
          : this.nameNormalized,
      aliases: data.aliases.present ? data.aliases.value : this.aliases,
      polygon: data.polygon.present ? data.polygon.value : this.polygon,
      centroidLat: data.centroidLat.present
          ? data.centroidLat.value
          : this.centroidLat,
      centroidLng: data.centroidLng.present
          ? data.centroidLng.value
          : this.centroidLng,
      areaKm2: data.areaKm2.present ? data.areaKm2.value : this.areaKm2,
      status: data.status.present ? data.status.value : this.status,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      validationSource: data.validationSource.present
          ? data.validationSource.value
          : this.validationSource,
      validationPayload: data.validationPayload.present
          ? data.validationPayload.value
          : this.validationPayload,
      verifiedUserCount: data.verifiedUserCount.present
          ? data.verifiedUserCount.value
          : this.verifiedUserCount,
      caseCount: data.caseCount.present ? data.caseCount.value : this.caseCount,
      mergedInto: data.mergedInto.present
          ? data.mergedInto.value
          : this.mergedInto,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Neighborhood(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('cityId: $cityId, ')
          ..write('name: $name, ')
          ..write('nameNormalized: $nameNormalized, ')
          ..write('aliases: $aliases, ')
          ..write('polygon: $polygon, ')
          ..write('centroidLat: $centroidLat, ')
          ..write('centroidLng: $centroidLng, ')
          ..write('areaKm2: $areaKm2, ')
          ..write('status: $status, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('validationSource: $validationSource, ')
          ..write('validationPayload: $validationPayload, ')
          ..write('verifiedUserCount: $verifiedUserCount, ')
          ..write('caseCount: $caseCount, ')
          ..write('mergedInto: $mergedInto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    cityId,
    name,
    nameNormalized,
    aliases,
    polygon,
    centroidLat,
    centroidLng,
    areaKm2,
    status,
    createdBy,
    createdAt,
    validationSource,
    validationPayload,
    verifiedUserCount,
    caseCount,
    mergedInto,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Neighborhood &&
          other.clientUuid == this.clientUuid &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.cityId == this.cityId &&
          other.name == this.name &&
          other.nameNormalized == this.nameNormalized &&
          other.aliases == this.aliases &&
          other.polygon == this.polygon &&
          other.centroidLat == this.centroidLat &&
          other.centroidLng == this.centroidLng &&
          other.areaKm2 == this.areaKm2 &&
          other.status == this.status &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.validationSource == this.validationSource &&
          other.validationPayload == this.validationPayload &&
          other.verifiedUserCount == this.verifiedUserCount &&
          other.caseCount == this.caseCount &&
          other.mergedInto == this.mergedInto);
}

class NeighborhoodsCompanion extends UpdateCompanion<Neighborhood> {
  final Value<String> clientUuid;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> cityId;
  final Value<String> name;
  final Value<String> nameNormalized;
  final Value<String> aliases;
  final Value<String> polygon;
  final Value<double> centroidLat;
  final Value<double> centroidLng;
  final Value<double> areaKm2;
  final Value<NeighborhoodStatus> status;
  final Value<String?> createdBy;
  final Value<DateTime> createdAt;
  final Value<String?> validationSource;
  final Value<String?> validationPayload;
  final Value<int> verifiedUserCount;
  final Value<int> caseCount;
  final Value<String?> mergedInto;
  final Value<int> rowid;
  const NeighborhoodsCompanion({
    this.clientUuid = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.cityId = const Value.absent(),
    this.name = const Value.absent(),
    this.nameNormalized = const Value.absent(),
    this.aliases = const Value.absent(),
    this.polygon = const Value.absent(),
    this.centroidLat = const Value.absent(),
    this.centroidLng = const Value.absent(),
    this.areaKm2 = const Value.absent(),
    this.status = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.validationSource = const Value.absent(),
    this.validationPayload = const Value.absent(),
    this.verifiedUserCount = const Value.absent(),
    this.caseCount = const Value.absent(),
    this.mergedInto = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NeighborhoodsCompanion.insert({
    required String clientUuid,
    this.syncStatus = const Value.absent(),
    required DateTime updatedAt,
    required String id,
    required String cityId,
    required String name,
    required String nameNormalized,
    this.aliases = const Value.absent(),
    required String polygon,
    required double centroidLat,
    required double centroidLng,
    required double areaKm2,
    required NeighborhoodStatus status,
    this.createdBy = const Value.absent(),
    required DateTime createdAt,
    this.validationSource = const Value.absent(),
    this.validationPayload = const Value.absent(),
    this.verifiedUserCount = const Value.absent(),
    this.caseCount = const Value.absent(),
    this.mergedInto = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientUuid = Value(clientUuid),
       updatedAt = Value(updatedAt),
       id = Value(id),
       cityId = Value(cityId),
       name = Value(name),
       nameNormalized = Value(nameNormalized),
       polygon = Value(polygon),
       centroidLat = Value(centroidLat),
       centroidLng = Value(centroidLng),
       areaKm2 = Value(areaKm2),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<Neighborhood> custom({
    Expression<String>? clientUuid,
    Expression<String>? syncStatus,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? cityId,
    Expression<String>? name,
    Expression<String>? nameNormalized,
    Expression<String>? aliases,
    Expression<String>? polygon,
    Expression<double>? centroidLat,
    Expression<double>? centroidLng,
    Expression<double>? areaKm2,
    Expression<String>? status,
    Expression<String>? createdBy,
    Expression<DateTime>? createdAt,
    Expression<String>? validationSource,
    Expression<String>? validationPayload,
    Expression<int>? verifiedUserCount,
    Expression<int>? caseCount,
    Expression<String>? mergedInto,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (cityId != null) 'city_id': cityId,
      if (name != null) 'name': name,
      if (nameNormalized != null) 'name_normalized': nameNormalized,
      if (aliases != null) 'aliases': aliases,
      if (polygon != null) 'polygon': polygon,
      if (centroidLat != null) 'centroid_lat': centroidLat,
      if (centroidLng != null) 'centroid_lng': centroidLng,
      if (areaKm2 != null) 'area_km2': areaKm2,
      if (status != null) 'status': status,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (validationSource != null) 'validation_source': validationSource,
      if (validationPayload != null) 'validation_payload': validationPayload,
      if (verifiedUserCount != null) 'verified_user_count': verifiedUserCount,
      if (caseCount != null) 'case_count': caseCount,
      if (mergedInto != null) 'merged_into': mergedInto,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NeighborhoodsCompanion copyWith({
    Value<String>? clientUuid,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? cityId,
    Value<String>? name,
    Value<String>? nameNormalized,
    Value<String>? aliases,
    Value<String>? polygon,
    Value<double>? centroidLat,
    Value<double>? centroidLng,
    Value<double>? areaKm2,
    Value<NeighborhoodStatus>? status,
    Value<String?>? createdBy,
    Value<DateTime>? createdAt,
    Value<String?>? validationSource,
    Value<String?>? validationPayload,
    Value<int>? verifiedUserCount,
    Value<int>? caseCount,
    Value<String?>? mergedInto,
    Value<int>? rowid,
  }) {
    return NeighborhoodsCompanion(
      clientUuid: clientUuid ?? this.clientUuid,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      cityId: cityId ?? this.cityId,
      name: name ?? this.name,
      nameNormalized: nameNormalized ?? this.nameNormalized,
      aliases: aliases ?? this.aliases,
      polygon: polygon ?? this.polygon,
      centroidLat: centroidLat ?? this.centroidLat,
      centroidLng: centroidLng ?? this.centroidLng,
      areaKm2: areaKm2 ?? this.areaKm2,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      validationSource: validationSource ?? this.validationSource,
      validationPayload: validationPayload ?? this.validationPayload,
      verifiedUserCount: verifiedUserCount ?? this.verifiedUserCount,
      caseCount: caseCount ?? this.caseCount,
      mergedInto: mergedInto ?? this.mergedInto,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $NeighborhoodsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String>(cityId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameNormalized.present) {
      map['name_normalized'] = Variable<String>(nameNormalized.value);
    }
    if (aliases.present) {
      map['aliases'] = Variable<String>(aliases.value);
    }
    if (polygon.present) {
      map['polygon'] = Variable<String>(polygon.value);
    }
    if (centroidLat.present) {
      map['centroid_lat'] = Variable<double>(centroidLat.value);
    }
    if (centroidLng.present) {
      map['centroid_lng'] = Variable<double>(centroidLng.value);
    }
    if (areaKm2.present) {
      map['area_km2'] = Variable<double>(areaKm2.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $NeighborhoodsTable.$converterstatus.toSql(status.value),
      );
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (validationSource.present) {
      map['validation_source'] = Variable<String>(validationSource.value);
    }
    if (validationPayload.present) {
      map['validation_payload'] = Variable<String>(validationPayload.value);
    }
    if (verifiedUserCount.present) {
      map['verified_user_count'] = Variable<int>(verifiedUserCount.value);
    }
    if (caseCount.present) {
      map['case_count'] = Variable<int>(caseCount.value);
    }
    if (mergedInto.present) {
      map['merged_into'] = Variable<String>(mergedInto.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NeighborhoodsCompanion(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('cityId: $cityId, ')
          ..write('name: $name, ')
          ..write('nameNormalized: $nameNormalized, ')
          ..write('aliases: $aliases, ')
          ..write('polygon: $polygon, ')
          ..write('centroidLat: $centroidLat, ')
          ..write('centroidLng: $centroidLng, ')
          ..write('areaKm2: $areaKm2, ')
          ..write('status: $status, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('validationSource: $validationSource, ')
          ..write('validationPayload: $validationPayload, ')
          ..write('verifiedUserCount: $verifiedUserCount, ')
          ..write('caseCount: $caseCount, ')
          ..write('mergedInto: $mergedInto, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JurisdictionsTable extends Jurisdictions
    with TableInfo<$JurisdictionsTable, Jurisdiction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JurisdictionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<String> countryId = GeneratedColumn<String>(
    'country_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultResponseDaysMeta =
      const VerificationMeta('defaultResponseDays');
  @override
  late final GeneratedColumn<int> defaultResponseDays = GeneratedColumn<int>(
    'default_response_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _configMeta = const VerificationMeta('config');
  @override
  late final GeneratedColumn<String> config = GeneratedColumn<String>(
    'config',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    countryId,
    name,
    timezone,
    language,
    defaultResponseDays,
    config,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'jurisdictions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Jurisdiction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('default_response_days')) {
      context.handle(
        _defaultResponseDaysMeta,
        defaultResponseDays.isAcceptableOrUnknown(
          data['default_response_days']!,
          _defaultResponseDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defaultResponseDaysMeta);
    }
    if (data.containsKey('config')) {
      context.handle(
        _configMeta,
        config.isAcceptableOrUnknown(data['config']!, _configMeta),
      );
    } else if (isInserting) {
      context.missing(_configMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Jurisdiction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Jurisdiction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      defaultResponseDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_response_days'],
      )!,
      config: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}config'],
      )!,
    );
  }

  @override
  $JurisdictionsTable createAlias(String alias) {
    return $JurisdictionsTable(attachedDatabase, alias);
  }
}

class Jurisdiction extends DataClass implements Insertable<Jurisdiction> {
  final String id;
  final String countryId;
  final String name;
  final String timezone;
  final String language;
  final int defaultResponseDays;

  /// JSON: ficha completa (§14.3) — organismos, canales, plantillas.
  final String config;
  const Jurisdiction({
    required this.id,
    required this.countryId,
    required this.name,
    required this.timezone,
    required this.language,
    required this.defaultResponseDays,
    required this.config,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['country_id'] = Variable<String>(countryId);
    map['name'] = Variable<String>(name);
    map['timezone'] = Variable<String>(timezone);
    map['language'] = Variable<String>(language);
    map['default_response_days'] = Variable<int>(defaultResponseDays);
    map['config'] = Variable<String>(config);
    return map;
  }

  JurisdictionsCompanion toCompanion(bool nullToAbsent) {
    return JurisdictionsCompanion(
      id: Value(id),
      countryId: Value(countryId),
      name: Value(name),
      timezone: Value(timezone),
      language: Value(language),
      defaultResponseDays: Value(defaultResponseDays),
      config: Value(config),
    );
  }

  factory Jurisdiction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Jurisdiction(
      id: serializer.fromJson<String>(json['id']),
      countryId: serializer.fromJson<String>(json['countryId']),
      name: serializer.fromJson<String>(json['name']),
      timezone: serializer.fromJson<String>(json['timezone']),
      language: serializer.fromJson<String>(json['language']),
      defaultResponseDays: serializer.fromJson<int>(
        json['defaultResponseDays'],
      ),
      config: serializer.fromJson<String>(json['config']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'countryId': serializer.toJson<String>(countryId),
      'name': serializer.toJson<String>(name),
      'timezone': serializer.toJson<String>(timezone),
      'language': serializer.toJson<String>(language),
      'defaultResponseDays': serializer.toJson<int>(defaultResponseDays),
      'config': serializer.toJson<String>(config),
    };
  }

  Jurisdiction copyWith({
    String? id,
    String? countryId,
    String? name,
    String? timezone,
    String? language,
    int? defaultResponseDays,
    String? config,
  }) => Jurisdiction(
    id: id ?? this.id,
    countryId: countryId ?? this.countryId,
    name: name ?? this.name,
    timezone: timezone ?? this.timezone,
    language: language ?? this.language,
    defaultResponseDays: defaultResponseDays ?? this.defaultResponseDays,
    config: config ?? this.config,
  );
  Jurisdiction copyWithCompanion(JurisdictionsCompanion data) {
    return Jurisdiction(
      id: data.id.present ? data.id.value : this.id,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      name: data.name.present ? data.name.value : this.name,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      language: data.language.present ? data.language.value : this.language,
      defaultResponseDays: data.defaultResponseDays.present
          ? data.defaultResponseDays.value
          : this.defaultResponseDays,
      config: data.config.present ? data.config.value : this.config,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Jurisdiction(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('name: $name, ')
          ..write('timezone: $timezone, ')
          ..write('language: $language, ')
          ..write('defaultResponseDays: $defaultResponseDays, ')
          ..write('config: $config')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    countryId,
    name,
    timezone,
    language,
    defaultResponseDays,
    config,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Jurisdiction &&
          other.id == this.id &&
          other.countryId == this.countryId &&
          other.name == this.name &&
          other.timezone == this.timezone &&
          other.language == this.language &&
          other.defaultResponseDays == this.defaultResponseDays &&
          other.config == this.config);
}

class JurisdictionsCompanion extends UpdateCompanion<Jurisdiction> {
  final Value<String> id;
  final Value<String> countryId;
  final Value<String> name;
  final Value<String> timezone;
  final Value<String> language;
  final Value<int> defaultResponseDays;
  final Value<String> config;
  final Value<int> rowid;
  const JurisdictionsCompanion({
    this.id = const Value.absent(),
    this.countryId = const Value.absent(),
    this.name = const Value.absent(),
    this.timezone = const Value.absent(),
    this.language = const Value.absent(),
    this.defaultResponseDays = const Value.absent(),
    this.config = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JurisdictionsCompanion.insert({
    required String id,
    required String countryId,
    required String name,
    required String timezone,
    required String language,
    required int defaultResponseDays,
    required String config,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       countryId = Value(countryId),
       name = Value(name),
       timezone = Value(timezone),
       language = Value(language),
       defaultResponseDays = Value(defaultResponseDays),
       config = Value(config);
  static Insertable<Jurisdiction> custom({
    Expression<String>? id,
    Expression<String>? countryId,
    Expression<String>? name,
    Expression<String>? timezone,
    Expression<String>? language,
    Expression<int>? defaultResponseDays,
    Expression<String>? config,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countryId != null) 'country_id': countryId,
      if (name != null) 'name': name,
      if (timezone != null) 'timezone': timezone,
      if (language != null) 'language': language,
      if (defaultResponseDays != null)
        'default_response_days': defaultResponseDays,
      if (config != null) 'config': config,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JurisdictionsCompanion copyWith({
    Value<String>? id,
    Value<String>? countryId,
    Value<String>? name,
    Value<String>? timezone,
    Value<String>? language,
    Value<int>? defaultResponseDays,
    Value<String>? config,
    Value<int>? rowid,
  }) {
    return JurisdictionsCompanion(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      name: name ?? this.name,
      timezone: timezone ?? this.timezone,
      language: language ?? this.language,
      defaultResponseDays: defaultResponseDays ?? this.defaultResponseDays,
      config: config ?? this.config,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String>(countryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (defaultResponseDays.present) {
      map['default_response_days'] = Variable<int>(defaultResponseDays.value);
    }
    if (config.present) {
      map['config'] = Variable<String>(config.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JurisdictionsCompanion(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('name: $name, ')
          ..write('timezone: $timezone, ')
          ..write('language: $language, ')
          ..write('defaultResponseDays: $defaultResponseDays, ')
          ..write('config: $config, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
    'scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<String> countryId = GeneratedColumn<String>(
    'country_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameI18nMeta = const VerificationMeta(
    'nameI18n',
  );
  @override
  late final GeneratedColumn<String> nameI18n = GeneratedColumn<String>(
    'name_i18n',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guidedTreeMeta = const VerificationMeta(
    'guidedTree',
  );
  @override
  late final GeneratedColumn<String> guidedTree = GeneratedColumn<String>(
    'guided_tree',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _templateKeyMeta = const VerificationMeta(
    'templateKey',
  );
  @override
  late final GeneratedColumn<String> templateKey = GeneratedColumn<String>(
    'template_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    scope,
    countryId,
    nameI18n,
    icon,
    orderIndex,
    guidedTree,
    templateKey,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
        _scopeMeta,
        scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta),
      );
    } else if (isInserting) {
      context.missing(_scopeMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    }
    if (data.containsKey('name_i18n')) {
      context.handle(
        _nameI18nMeta,
        nameI18n.isAcceptableOrUnknown(data['name_i18n']!, _nameI18nMeta),
      );
    } else if (isInserting) {
      context.missing(_nameI18nMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('guided_tree')) {
      context.handle(
        _guidedTreeMeta,
        guidedTree.isAcceptableOrUnknown(data['guided_tree']!, _guidedTreeMeta),
      );
    } else if (isInserting) {
      context.missing(_guidedTreeMeta);
    }
    if (data.containsKey('template_key')) {
      context.handle(
        _templateKeyMeta,
        templateKey.isAcceptableOrUnknown(
          data['template_key']!,
          _templateKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_templateKeyMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      scope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope'],
      )!,
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_id'],
      ),
      nameI18n: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_i18n'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      guidedTree: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guided_tree'],
      )!,
      templateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_key'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final String id;

  /// global | national | local (§8.2).
  final String scope;
  final String? countryId;

  /// JSON TextoI18n.
  final String nameI18n;
  final String icon;
  final int orderIndex;

  /// JSON: árbol de preguntas guiadas (§9), CategoriaDef completo.
  final String guidedTree;
  final String templateKey;

  /// active | candidate | retired.
  final String status;
  const Category({
    required this.id,
    required this.scope,
    this.countryId,
    required this.nameI18n,
    required this.icon,
    required this.orderIndex,
    required this.guidedTree,
    required this.templateKey,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['scope'] = Variable<String>(scope);
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String>(countryId);
    }
    map['name_i18n'] = Variable<String>(nameI18n);
    map['icon'] = Variable<String>(icon);
    map['order_index'] = Variable<int>(orderIndex);
    map['guided_tree'] = Variable<String>(guidedTree);
    map['template_key'] = Variable<String>(templateKey);
    map['status'] = Variable<String>(status);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      scope: Value(scope),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      nameI18n: Value(nameI18n),
      icon: Value(icon),
      orderIndex: Value(orderIndex),
      guidedTree: Value(guidedTree),
      templateKey: Value(templateKey),
      status: Value(status),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      scope: serializer.fromJson<String>(json['scope']),
      countryId: serializer.fromJson<String?>(json['countryId']),
      nameI18n: serializer.fromJson<String>(json['nameI18n']),
      icon: serializer.fromJson<String>(json['icon']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      guidedTree: serializer.fromJson<String>(json['guidedTree']),
      templateKey: serializer.fromJson<String>(json['templateKey']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'scope': serializer.toJson<String>(scope),
      'countryId': serializer.toJson<String?>(countryId),
      'nameI18n': serializer.toJson<String>(nameI18n),
      'icon': serializer.toJson<String>(icon),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'guidedTree': serializer.toJson<String>(guidedTree),
      'templateKey': serializer.toJson<String>(templateKey),
      'status': serializer.toJson<String>(status),
    };
  }

  Category copyWith({
    String? id,
    String? scope,
    Value<String?> countryId = const Value.absent(),
    String? nameI18n,
    String? icon,
    int? orderIndex,
    String? guidedTree,
    String? templateKey,
    String? status,
  }) => Category(
    id: id ?? this.id,
    scope: scope ?? this.scope,
    countryId: countryId.present ? countryId.value : this.countryId,
    nameI18n: nameI18n ?? this.nameI18n,
    icon: icon ?? this.icon,
    orderIndex: orderIndex ?? this.orderIndex,
    guidedTree: guidedTree ?? this.guidedTree,
    templateKey: templateKey ?? this.templateKey,
    status: status ?? this.status,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      scope: data.scope.present ? data.scope.value : this.scope,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      nameI18n: data.nameI18n.present ? data.nameI18n.value : this.nameI18n,
      icon: data.icon.present ? data.icon.value : this.icon,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      guidedTree: data.guidedTree.present
          ? data.guidedTree.value
          : this.guidedTree,
      templateKey: data.templateKey.present
          ? data.templateKey.value
          : this.templateKey,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('scope: $scope, ')
          ..write('countryId: $countryId, ')
          ..write('nameI18n: $nameI18n, ')
          ..write('icon: $icon, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('guidedTree: $guidedTree, ')
          ..write('templateKey: $templateKey, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    scope,
    countryId,
    nameI18n,
    icon,
    orderIndex,
    guidedTree,
    templateKey,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.scope == this.scope &&
          other.countryId == this.countryId &&
          other.nameI18n == this.nameI18n &&
          other.icon == this.icon &&
          other.orderIndex == this.orderIndex &&
          other.guidedTree == this.guidedTree &&
          other.templateKey == this.templateKey &&
          other.status == this.status);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<String> scope;
  final Value<String?> countryId;
  final Value<String> nameI18n;
  final Value<String> icon;
  final Value<int> orderIndex;
  final Value<String> guidedTree;
  final Value<String> templateKey;
  final Value<String> status;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.scope = const Value.absent(),
    this.countryId = const Value.absent(),
    this.nameI18n = const Value.absent(),
    this.icon = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.guidedTree = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String scope,
    this.countryId = const Value.absent(),
    required String nameI18n,
    required String icon,
    required int orderIndex,
    required String guidedTree,
    required String templateKey,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       scope = Value(scope),
       nameI18n = Value(nameI18n),
       icon = Value(icon),
       orderIndex = Value(orderIndex),
       guidedTree = Value(guidedTree),
       templateKey = Value(templateKey);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? scope,
    Expression<String>? countryId,
    Expression<String>? nameI18n,
    Expression<String>? icon,
    Expression<int>? orderIndex,
    Expression<String>? guidedTree,
    Expression<String>? templateKey,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scope != null) 'scope': scope,
      if (countryId != null) 'country_id': countryId,
      if (nameI18n != null) 'name_i18n': nameI18n,
      if (icon != null) 'icon': icon,
      if (orderIndex != null) 'order_index': orderIndex,
      if (guidedTree != null) 'guided_tree': guidedTree,
      if (templateKey != null) 'template_key': templateKey,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? scope,
    Value<String?>? countryId,
    Value<String>? nameI18n,
    Value<String>? icon,
    Value<int>? orderIndex,
    Value<String>? guidedTree,
    Value<String>? templateKey,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      scope: scope ?? this.scope,
      countryId: countryId ?? this.countryId,
      nameI18n: nameI18n ?? this.nameI18n,
      icon: icon ?? this.icon,
      orderIndex: orderIndex ?? this.orderIndex,
      guidedTree: guidedTree ?? this.guidedTree,
      templateKey: templateKey ?? this.templateKey,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String>(countryId.value);
    }
    if (nameI18n.present) {
      map['name_i18n'] = Variable<String>(nameI18n.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (guidedTree.present) {
      map['guided_tree'] = Variable<String>(guidedTree.value);
    }
    if (templateKey.present) {
      map['template_key'] = Variable<String>(templateKey.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('scope: $scope, ')
          ..write('countryId: $countryId, ')
          ..write('nameI18n: $nameI18n, ')
          ..write('icon: $icon, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('guidedTree: $guidedTree, ')
          ..write('templateKey: $templateKey, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryProposalsTable extends CategoryProposals
    with TableInfo<$CategoryProposalsTable, CategoryProposal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryProposalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pendiente.name),
      ).withConverter<SyncStatus>($CategoryProposalsTable.$convertersyncStatus);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
    'case_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<String> countryId = GeneratedColumn<String>(
    'country_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rawLabelMeta = const VerificationMeta(
    'rawLabel',
  );
  @override
  late final GeneratedColumn<String> rawLabel = GeneratedColumn<String>(
    'raw_label',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 40),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _structuredAnswersMeta = const VerificationMeta(
    'structuredAnswers',
  );
  @override
  late final GeneratedColumn<String> structuredAnswers =
      GeneratedColumn<String>(
        'structured_answers',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    countryId,
    rawLabel,
    structuredAnswers,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_proposals';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryProposal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(
        _caseIdMeta,
        caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('raw_label')) {
      context.handle(
        _rawLabelMeta,
        rawLabel.isAcceptableOrUnknown(data['raw_label']!, _rawLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_rawLabelMeta);
    }
    if (data.containsKey('structured_answers')) {
      context.handle(
        _structuredAnswersMeta,
        structuredAnswers.isAcceptableOrUnknown(
          data['structured_answers']!,
          _structuredAnswersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_structuredAnswersMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryProposal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryProposal(
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      syncStatus: $CategoryProposalsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      caseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_id'],
      )!,
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_id'],
      )!,
      rawLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_label'],
      )!,
      structuredAnswers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}structured_answers'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CategoryProposalsTable createAlias(String alias) {
    return $CategoryProposalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class CategoryProposal extends DataClass
    implements Insertable<CategoryProposal> {
  /// Idempotencia: el servidor deduplica por este uuid (§20.2).
  final String clientUuid;

  /// Estado de sincronización visible por ítem en la UI (§20.2).
  final SyncStatus syncStatus;

  /// Última modificación local (last-write-wins salvo contadores).
  final DateTime updatedAt;
  final String id;
  final String caseId;
  final String countryId;

  /// Etiqueta corta, máx. 40 caracteres, filtrada (§8.4).
  final String rawLabel;

  /// JSON: campos guiados (sobre qué / dónde / frecuencia).
  final String structuredAnswers;
  final DateTime createdAt;
  const CategoryProposal({
    required this.clientUuid,
    required this.syncStatus,
    required this.updatedAt,
    required this.id,
    required this.caseId,
    required this.countryId,
    required this.rawLabel,
    required this.structuredAnswers,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_uuid'] = Variable<String>(clientUuid);
    {
      map['sync_status'] = Variable<String>(
        $CategoryProposalsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['country_id'] = Variable<String>(countryId);
    map['raw_label'] = Variable<String>(rawLabel);
    map['structured_answers'] = Variable<String>(structuredAnswers);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CategoryProposalsCompanion toCompanion(bool nullToAbsent) {
    return CategoryProposalsCompanion(
      clientUuid: Value(clientUuid),
      syncStatus: Value(syncStatus),
      updatedAt: Value(updatedAt),
      id: Value(id),
      caseId: Value(caseId),
      countryId: Value(countryId),
      rawLabel: Value(rawLabel),
      structuredAnswers: Value(structuredAnswers),
      createdAt: Value(createdAt),
    );
  }

  factory CategoryProposal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryProposal(
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      syncStatus: $CategoryProposalsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      countryId: serializer.fromJson<String>(json['countryId']),
      rawLabel: serializer.fromJson<String>(json['rawLabel']),
      structuredAnswers: serializer.fromJson<String>(json['structuredAnswers']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientUuid': serializer.toJson<String>(clientUuid),
      'syncStatus': serializer.toJson<String>(
        $CategoryProposalsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'countryId': serializer.toJson<String>(countryId),
      'rawLabel': serializer.toJson<String>(rawLabel),
      'structuredAnswers': serializer.toJson<String>(structuredAnswers),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CategoryProposal copyWith({
    String? clientUuid,
    SyncStatus? syncStatus,
    DateTime? updatedAt,
    String? id,
    String? caseId,
    String? countryId,
    String? rawLabel,
    String? structuredAnswers,
    DateTime? createdAt,
  }) => CategoryProposal(
    clientUuid: clientUuid ?? this.clientUuid,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    countryId: countryId ?? this.countryId,
    rawLabel: rawLabel ?? this.rawLabel,
    structuredAnswers: structuredAnswers ?? this.structuredAnswers,
    createdAt: createdAt ?? this.createdAt,
  );
  CategoryProposal copyWithCompanion(CategoryProposalsCompanion data) {
    return CategoryProposal(
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      rawLabel: data.rawLabel.present ? data.rawLabel.value : this.rawLabel,
      structuredAnswers: data.structuredAnswers.present
          ? data.structuredAnswers.value
          : this.structuredAnswers,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryProposal(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('countryId: $countryId, ')
          ..write('rawLabel: $rawLabel, ')
          ..write('structuredAnswers: $structuredAnswers, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    countryId,
    rawLabel,
    structuredAnswers,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryProposal &&
          other.clientUuid == this.clientUuid &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.countryId == this.countryId &&
          other.rawLabel == this.rawLabel &&
          other.structuredAnswers == this.structuredAnswers &&
          other.createdAt == this.createdAt);
}

class CategoryProposalsCompanion extends UpdateCompanion<CategoryProposal> {
  final Value<String> clientUuid;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> caseId;
  final Value<String> countryId;
  final Value<String> rawLabel;
  final Value<String> structuredAnswers;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CategoryProposalsCompanion({
    this.clientUuid = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.countryId = const Value.absent(),
    this.rawLabel = const Value.absent(),
    this.structuredAnswers = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryProposalsCompanion.insert({
    required String clientUuid,
    this.syncStatus = const Value.absent(),
    required DateTime updatedAt,
    required String id,
    required String caseId,
    required String countryId,
    required String rawLabel,
    required String structuredAnswers,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : clientUuid = Value(clientUuid),
       updatedAt = Value(updatedAt),
       id = Value(id),
       caseId = Value(caseId),
       countryId = Value(countryId),
       rawLabel = Value(rawLabel),
       structuredAnswers = Value(structuredAnswers),
       createdAt = Value(createdAt);
  static Insertable<CategoryProposal> custom({
    Expression<String>? clientUuid,
    Expression<String>? syncStatus,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? countryId,
    Expression<String>? rawLabel,
    Expression<String>? structuredAnswers,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (countryId != null) 'country_id': countryId,
      if (rawLabel != null) 'raw_label': rawLabel,
      if (structuredAnswers != null) 'structured_answers': structuredAnswers,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryProposalsCompanion copyWith({
    Value<String>? clientUuid,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? caseId,
    Value<String>? countryId,
    Value<String>? rawLabel,
    Value<String>? structuredAnswers,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CategoryProposalsCompanion(
      clientUuid: clientUuid ?? this.clientUuid,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      countryId: countryId ?? this.countryId,
      rawLabel: rawLabel ?? this.rawLabel,
      structuredAnswers: structuredAnswers ?? this.structuredAnswers,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $CategoryProposalsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String>(countryId.value);
    }
    if (rawLabel.present) {
      map['raw_label'] = Variable<String>(rawLabel.value);
    }
    if (structuredAnswers.present) {
      map['structured_answers'] = Variable<String>(structuredAnswers.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryProposalsCompanion(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('countryId: $countryId, ')
          ..write('rawLabel: $rawLabel, ')
          ..write('structuredAnswers: $structuredAnswers, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CasesTable extends Cases with TableInfo<$CasesTable, Case> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pendiente.name),
      ).withConverter<SyncStatus>($CasesTable.$convertersyncStatus);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publicRefMeta = const VerificationMeta(
    'publicRef',
  );
  @override
  late final GeneratedColumn<String> publicRef = GeneratedColumn<String>(
    'public_ref',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _neighborhoodIdMeta = const VerificationMeta(
    'neighborhoodId',
  );
  @override
  late final GeneratedColumn<String> neighborhoodId = GeneratedColumn<String>(
    'neighborhood_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<String> cityId = GeneratedColumn<String>(
    'city_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jurisdictionIdMeta = const VerificationMeta(
    'jurisdictionId',
  );
  @override
  late final GeneratedColumn<String> jurisdictionId = GeneratedColumn<String>(
    'jurisdiction_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtypeIdMeta = const VerificationMeta(
    'subtypeId',
  );
  @override
  late final GeneratedColumn<String> subtypeId = GeneratedColumn<String>(
    'subtype_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guidedAnswersMeta = const VerificationMeta(
    'guidedAnswers',
  );
  @override
  late final GeneratedColumn<String> guidedAnswers = GeneratedColumn<String>(
    'guided_answers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _freeTextMeta = const VerificationMeta(
    'freeText',
  );
  @override
  late final GeneratedColumn<String> freeText = GeneratedColumn<String>(
    'free_text',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _generatedBodyMeta = const VerificationMeta(
    'generatedBody',
  );
  @override
  late final GeneratedColumn<String> generatedBody = GeneratedColumn<String>(
    'generated_body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  late final GeneratedColumnWithTypeConverter<CaseStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CaseStatus>($CasesTable.$converterstatus);
  static const VerificationMeta _severityComputedMeta = const VerificationMeta(
    'severityComputed',
  );
  @override
  late final GeneratedColumn<int> severityComputed = GeneratedColumn<int>(
    'severity_computed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _geohashMeta = const VerificationMeta(
    'geohash',
  );
  @override
  late final GeneratedColumn<String> geohash = GeneratedColumn<String>(
    'geohash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressTextMeta = const VerificationMeta(
    'addressText',
  );
  @override
  late final GeneratedColumn<String> addressText = GeneratedColumn<String>(
    'address_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pinOffsetAppliedMeta = const VerificationMeta(
    'pinOffsetApplied',
  );
  @override
  late final GeneratedColumn<bool> pinOffsetApplied = GeneratedColumn<bool>(
    'pin_offset_applied',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pin_offset_applied" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredSinceMeta = const VerificationMeta(
    'occurredSince',
  );
  @override
  late final GeneratedColumn<String> occurredSince = GeneratedColumn<String>(
    'occurred_since',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _organismIdMeta = const VerificationMeta(
    'organismId',
  );
  @override
  late final GeneratedColumn<String> organismId = GeneratedColumn<String>(
    'organism_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _submittedAtMeta = const VerificationMeta(
    'submittedAt',
  );
  @override
  late final GeneratedColumn<DateTime> submittedAt = GeneratedColumn<DateTime>(
    'submitted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deadlineAtMeta = const VerificationMeta(
    'deadlineAt',
  );
  @override
  late final GeneratedColumn<DateTime> deadlineAt = GeneratedColumn<DateTime>(
    'deadline_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resolvedAtMeta = const VerificationMeta(
    'resolvedAt',
  );
  @override
  late final GeneratedColumn<DateTime> resolvedAt = GeneratedColumn<DateTime>(
    'resolved_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endorsementCountMeta = const VerificationMeta(
    'endorsementCount',
  );
  @override
  late final GeneratedColumn<int> endorsementCount = GeneratedColumn<int>(
    'endorsement_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _verifiedEndorsementCountMeta =
      const VerificationMeta('verifiedEndorsementCount');
  @override
  late final GeneratedColumn<int> verifiedEndorsementCount =
      GeneratedColumn<int>(
        'verified_endorsement_count',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _evidenceCountMeta = const VerificationMeta(
    'evidenceCount',
  );
  @override
  late final GeneratedColumn<int> evidenceCount = GeneratedColumn<int>(
    'evidence_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _disputeCountMeta = const VerificationMeta(
    'disputeCount',
  );
  @override
  late final GeneratedColumn<int> disputeCount = GeneratedColumn<int>(
    'dispute_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _moderationStatusMeta = const VerificationMeta(
    'moderationStatus',
  );
  @override
  late final GeneratedColumn<String> moderationStatus = GeneratedColumn<String>(
    'moderation_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moderationNotesMeta = const VerificationMeta(
    'moderationNotes',
  );
  @override
  late final GeneratedColumn<String> moderationNotes = GeneratedColumn<String>(
    'moderation_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    publicRef,
    neighborhoodId,
    cityId,
    jurisdictionId,
    categoryId,
    subtypeId,
    guidedAnswers,
    freeText,
    generatedBody,
    status,
    severityComputed,
    lat,
    lng,
    geohash,
    addressText,
    pinOffsetApplied,
    createdBy,
    createdAt,
    occurredSince,
    organismId,
    submittedAt,
    deadlineAt,
    resolvedAt,
    endorsementCount,
    verifiedEndorsementCount,
    evidenceCount,
    disputeCount,
    moderationStatus,
    moderationNotes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cases';
  @override
  VerificationContext validateIntegrity(
    Insertable<Case> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('public_ref')) {
      context.handle(
        _publicRefMeta,
        publicRef.isAcceptableOrUnknown(data['public_ref']!, _publicRefMeta),
      );
    }
    if (data.containsKey('neighborhood_id')) {
      context.handle(
        _neighborhoodIdMeta,
        neighborhoodId.isAcceptableOrUnknown(
          data['neighborhood_id']!,
          _neighborhoodIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_neighborhoodIdMeta);
    }
    if (data.containsKey('city_id')) {
      context.handle(
        _cityIdMeta,
        cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta),
      );
    }
    if (data.containsKey('jurisdiction_id')) {
      context.handle(
        _jurisdictionIdMeta,
        jurisdictionId.isAcceptableOrUnknown(
          data['jurisdiction_id']!,
          _jurisdictionIdMeta,
        ),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('subtype_id')) {
      context.handle(
        _subtypeIdMeta,
        subtypeId.isAcceptableOrUnknown(data['subtype_id']!, _subtypeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subtypeIdMeta);
    }
    if (data.containsKey('guided_answers')) {
      context.handle(
        _guidedAnswersMeta,
        guidedAnswers.isAcceptableOrUnknown(
          data['guided_answers']!,
          _guidedAnswersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_guidedAnswersMeta);
    }
    if (data.containsKey('free_text')) {
      context.handle(
        _freeTextMeta,
        freeText.isAcceptableOrUnknown(data['free_text']!, _freeTextMeta),
      );
    }
    if (data.containsKey('generated_body')) {
      context.handle(
        _generatedBodyMeta,
        generatedBody.isAcceptableOrUnknown(
          data['generated_body']!,
          _generatedBodyMeta,
        ),
      );
    }
    if (data.containsKey('severity_computed')) {
      context.handle(
        _severityComputedMeta,
        severityComputed.isAcceptableOrUnknown(
          data['severity_computed']!,
          _severityComputedMeta,
        ),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('geohash')) {
      context.handle(
        _geohashMeta,
        geohash.isAcceptableOrUnknown(data['geohash']!, _geohashMeta),
      );
    } else if (isInserting) {
      context.missing(_geohashMeta);
    }
    if (data.containsKey('address_text')) {
      context.handle(
        _addressTextMeta,
        addressText.isAcceptableOrUnknown(
          data['address_text']!,
          _addressTextMeta,
        ),
      );
    }
    if (data.containsKey('pin_offset_applied')) {
      context.handle(
        _pinOffsetAppliedMeta,
        pinOffsetApplied.isAcceptableOrUnknown(
          data['pin_offset_applied']!,
          _pinOffsetAppliedMeta,
        ),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('occurred_since')) {
      context.handle(
        _occurredSinceMeta,
        occurredSince.isAcceptableOrUnknown(
          data['occurred_since']!,
          _occurredSinceMeta,
        ),
      );
    }
    if (data.containsKey('organism_id')) {
      context.handle(
        _organismIdMeta,
        organismId.isAcceptableOrUnknown(data['organism_id']!, _organismIdMeta),
      );
    }
    if (data.containsKey('submitted_at')) {
      context.handle(
        _submittedAtMeta,
        submittedAt.isAcceptableOrUnknown(
          data['submitted_at']!,
          _submittedAtMeta,
        ),
      );
    }
    if (data.containsKey('deadline_at')) {
      context.handle(
        _deadlineAtMeta,
        deadlineAt.isAcceptableOrUnknown(data['deadline_at']!, _deadlineAtMeta),
      );
    }
    if (data.containsKey('resolved_at')) {
      context.handle(
        _resolvedAtMeta,
        resolvedAt.isAcceptableOrUnknown(data['resolved_at']!, _resolvedAtMeta),
      );
    }
    if (data.containsKey('endorsement_count')) {
      context.handle(
        _endorsementCountMeta,
        endorsementCount.isAcceptableOrUnknown(
          data['endorsement_count']!,
          _endorsementCountMeta,
        ),
      );
    }
    if (data.containsKey('verified_endorsement_count')) {
      context.handle(
        _verifiedEndorsementCountMeta,
        verifiedEndorsementCount.isAcceptableOrUnknown(
          data['verified_endorsement_count']!,
          _verifiedEndorsementCountMeta,
        ),
      );
    }
    if (data.containsKey('evidence_count')) {
      context.handle(
        _evidenceCountMeta,
        evidenceCount.isAcceptableOrUnknown(
          data['evidence_count']!,
          _evidenceCountMeta,
        ),
      );
    }
    if (data.containsKey('dispute_count')) {
      context.handle(
        _disputeCountMeta,
        disputeCount.isAcceptableOrUnknown(
          data['dispute_count']!,
          _disputeCountMeta,
        ),
      );
    }
    if (data.containsKey('moderation_status')) {
      context.handle(
        _moderationStatusMeta,
        moderationStatus.isAcceptableOrUnknown(
          data['moderation_status']!,
          _moderationStatusMeta,
        ),
      );
    }
    if (data.containsKey('moderation_notes')) {
      context.handle(
        _moderationNotesMeta,
        moderationNotes.isAcceptableOrUnknown(
          data['moderation_notes']!,
          _moderationNotesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Case map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Case(
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      syncStatus: $CasesTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      publicRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}public_ref'],
      ),
      neighborhoodId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}neighborhood_id'],
      )!,
      cityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city_id'],
      ),
      jurisdictionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jurisdiction_id'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      subtypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subtype_id'],
      )!,
      guidedAnswers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guided_answers'],
      )!,
      freeText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}free_text'],
      ),
      generatedBody: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}generated_body'],
      )!,
      status: $CasesTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      severityComputed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}severity_computed'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      )!,
      geohash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}geohash'],
      )!,
      addressText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_text'],
      ),
      pinOffsetApplied: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pin_offset_applied'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      occurredSince: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occurred_since'],
      ),
      organismId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organism_id'],
      ),
      submittedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}submitted_at'],
      ),
      deadlineAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline_at'],
      ),
      resolvedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}resolved_at'],
      ),
      endorsementCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}endorsement_count'],
      )!,
      verifiedEndorsementCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verified_endorsement_count'],
      )!,
      evidenceCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}evidence_count'],
      )!,
      disputeCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dispute_count'],
      )!,
      moderationStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moderation_status'],
      ),
      moderationNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moderation_notes'],
      ),
    );
  }

  @override
  $CasesTable createAlias(String alias) {
    return $CasesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<CaseStatus, String, String> $converterstatus =
      const EnumNameConverter<CaseStatus>(CaseStatus.values);
}

class Case extends DataClass implements Insertable<Case> {
  /// Idempotencia: el servidor deduplica por este uuid (§20.2).
  final String clientUuid;

  /// Estado de sincronización visible por ítem en la UI (§20.2).
  final SyncStatus syncStatus;

  /// Última modificación local (last-write-wins salvo contadores).
  final DateTime updatedAt;
  final String id;

  /// Referencia corta compartible (#4417). La asigna el servidor; local
  /// queda null hasta sincronizar.
  final String? publicRef;
  final String neighborhoodId;
  final String? cityId;
  final String? jurisdictionId;
  final String categoryId;
  final String subtypeId;

  /// JSON: selecciones del árbol guiado {preguntaId: opcionId | [opcionId]}.
  final String guidedAnswers;

  /// Único campo libre: opcional, máx. 200 caracteres, filtrado (§9.5).
  final String? freeText;

  /// El escrito redactado por la app (§9.3).
  final String generatedBody;
  final CaseStatus status;
  final int severityComputed;
  final double lat;
  final double lng;
  final String geohash;
  final String? addressText;

  /// Si el pin se desplazó hasta 25 m por caer sobre un domicilio (§19).
  final bool pinOffsetApplied;
  final String? createdBy;
  final DateTime createdAt;

  /// Desde cuándo ocurre el problema (respuesta guiada, no fecha exacta).
  final String? occurredSince;
  final String? organismId;
  final DateTime? submittedAt;
  final DateTime? deadlineAt;
  final DateTime? resolvedAt;

  /// Contadores: autoridad del servidor (§20.2). Localmente solo caché.
  final int endorsementCount;
  final int verifiedEndorsementCount;
  final int evidenceCount;
  final int disputeCount;
  final String? moderationStatus;
  final String? moderationNotes;
  const Case({
    required this.clientUuid,
    required this.syncStatus,
    required this.updatedAt,
    required this.id,
    this.publicRef,
    required this.neighborhoodId,
    this.cityId,
    this.jurisdictionId,
    required this.categoryId,
    required this.subtypeId,
    required this.guidedAnswers,
    this.freeText,
    required this.generatedBody,
    required this.status,
    required this.severityComputed,
    required this.lat,
    required this.lng,
    required this.geohash,
    this.addressText,
    required this.pinOffsetApplied,
    this.createdBy,
    required this.createdAt,
    this.occurredSince,
    this.organismId,
    this.submittedAt,
    this.deadlineAt,
    this.resolvedAt,
    required this.endorsementCount,
    required this.verifiedEndorsementCount,
    required this.evidenceCount,
    required this.disputeCount,
    this.moderationStatus,
    this.moderationNotes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_uuid'] = Variable<String>(clientUuid);
    {
      map['sync_status'] = Variable<String>(
        $CasesTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || publicRef != null) {
      map['public_ref'] = Variable<String>(publicRef);
    }
    map['neighborhood_id'] = Variable<String>(neighborhoodId);
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<String>(cityId);
    }
    if (!nullToAbsent || jurisdictionId != null) {
      map['jurisdiction_id'] = Variable<String>(jurisdictionId);
    }
    map['category_id'] = Variable<String>(categoryId);
    map['subtype_id'] = Variable<String>(subtypeId);
    map['guided_answers'] = Variable<String>(guidedAnswers);
    if (!nullToAbsent || freeText != null) {
      map['free_text'] = Variable<String>(freeText);
    }
    map['generated_body'] = Variable<String>(generatedBody);
    {
      map['status'] = Variable<String>(
        $CasesTable.$converterstatus.toSql(status),
      );
    }
    map['severity_computed'] = Variable<int>(severityComputed);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['geohash'] = Variable<String>(geohash);
    if (!nullToAbsent || addressText != null) {
      map['address_text'] = Variable<String>(addressText);
    }
    map['pin_offset_applied'] = Variable<bool>(pinOffsetApplied);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || occurredSince != null) {
      map['occurred_since'] = Variable<String>(occurredSince);
    }
    if (!nullToAbsent || organismId != null) {
      map['organism_id'] = Variable<String>(organismId);
    }
    if (!nullToAbsent || submittedAt != null) {
      map['submitted_at'] = Variable<DateTime>(submittedAt);
    }
    if (!nullToAbsent || deadlineAt != null) {
      map['deadline_at'] = Variable<DateTime>(deadlineAt);
    }
    if (!nullToAbsent || resolvedAt != null) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt);
    }
    map['endorsement_count'] = Variable<int>(endorsementCount);
    map['verified_endorsement_count'] = Variable<int>(verifiedEndorsementCount);
    map['evidence_count'] = Variable<int>(evidenceCount);
    map['dispute_count'] = Variable<int>(disputeCount);
    if (!nullToAbsent || moderationStatus != null) {
      map['moderation_status'] = Variable<String>(moderationStatus);
    }
    if (!nullToAbsent || moderationNotes != null) {
      map['moderation_notes'] = Variable<String>(moderationNotes);
    }
    return map;
  }

  CasesCompanion toCompanion(bool nullToAbsent) {
    return CasesCompanion(
      clientUuid: Value(clientUuid),
      syncStatus: Value(syncStatus),
      updatedAt: Value(updatedAt),
      id: Value(id),
      publicRef: publicRef == null && nullToAbsent
          ? const Value.absent()
          : Value(publicRef),
      neighborhoodId: Value(neighborhoodId),
      cityId: cityId == null && nullToAbsent
          ? const Value.absent()
          : Value(cityId),
      jurisdictionId: jurisdictionId == null && nullToAbsent
          ? const Value.absent()
          : Value(jurisdictionId),
      categoryId: Value(categoryId),
      subtypeId: Value(subtypeId),
      guidedAnswers: Value(guidedAnswers),
      freeText: freeText == null && nullToAbsent
          ? const Value.absent()
          : Value(freeText),
      generatedBody: Value(generatedBody),
      status: Value(status),
      severityComputed: Value(severityComputed),
      lat: Value(lat),
      lng: Value(lng),
      geohash: Value(geohash),
      addressText: addressText == null && nullToAbsent
          ? const Value.absent()
          : Value(addressText),
      pinOffsetApplied: Value(pinOffsetApplied),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
      createdAt: Value(createdAt),
      occurredSince: occurredSince == null && nullToAbsent
          ? const Value.absent()
          : Value(occurredSince),
      organismId: organismId == null && nullToAbsent
          ? const Value.absent()
          : Value(organismId),
      submittedAt: submittedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(submittedAt),
      deadlineAt: deadlineAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deadlineAt),
      resolvedAt: resolvedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedAt),
      endorsementCount: Value(endorsementCount),
      verifiedEndorsementCount: Value(verifiedEndorsementCount),
      evidenceCount: Value(evidenceCount),
      disputeCount: Value(disputeCount),
      moderationStatus: moderationStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(moderationStatus),
      moderationNotes: moderationNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(moderationNotes),
    );
  }

  factory Case.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Case(
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      syncStatus: $CasesTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      publicRef: serializer.fromJson<String?>(json['publicRef']),
      neighborhoodId: serializer.fromJson<String>(json['neighborhoodId']),
      cityId: serializer.fromJson<String?>(json['cityId']),
      jurisdictionId: serializer.fromJson<String?>(json['jurisdictionId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      subtypeId: serializer.fromJson<String>(json['subtypeId']),
      guidedAnswers: serializer.fromJson<String>(json['guidedAnswers']),
      freeText: serializer.fromJson<String?>(json['freeText']),
      generatedBody: serializer.fromJson<String>(json['generatedBody']),
      status: $CasesTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      severityComputed: serializer.fromJson<int>(json['severityComputed']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      geohash: serializer.fromJson<String>(json['geohash']),
      addressText: serializer.fromJson<String?>(json['addressText']),
      pinOffsetApplied: serializer.fromJson<bool>(json['pinOffsetApplied']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      occurredSince: serializer.fromJson<String?>(json['occurredSince']),
      organismId: serializer.fromJson<String?>(json['organismId']),
      submittedAt: serializer.fromJson<DateTime?>(json['submittedAt']),
      deadlineAt: serializer.fromJson<DateTime?>(json['deadlineAt']),
      resolvedAt: serializer.fromJson<DateTime?>(json['resolvedAt']),
      endorsementCount: serializer.fromJson<int>(json['endorsementCount']),
      verifiedEndorsementCount: serializer.fromJson<int>(
        json['verifiedEndorsementCount'],
      ),
      evidenceCount: serializer.fromJson<int>(json['evidenceCount']),
      disputeCount: serializer.fromJson<int>(json['disputeCount']),
      moderationStatus: serializer.fromJson<String?>(json['moderationStatus']),
      moderationNotes: serializer.fromJson<String?>(json['moderationNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientUuid': serializer.toJson<String>(clientUuid),
      'syncStatus': serializer.toJson<String>(
        $CasesTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'publicRef': serializer.toJson<String?>(publicRef),
      'neighborhoodId': serializer.toJson<String>(neighborhoodId),
      'cityId': serializer.toJson<String?>(cityId),
      'jurisdictionId': serializer.toJson<String?>(jurisdictionId),
      'categoryId': serializer.toJson<String>(categoryId),
      'subtypeId': serializer.toJson<String>(subtypeId),
      'guidedAnswers': serializer.toJson<String>(guidedAnswers),
      'freeText': serializer.toJson<String?>(freeText),
      'generatedBody': serializer.toJson<String>(generatedBody),
      'status': serializer.toJson<String>(
        $CasesTable.$converterstatus.toJson(status),
      ),
      'severityComputed': serializer.toJson<int>(severityComputed),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'geohash': serializer.toJson<String>(geohash),
      'addressText': serializer.toJson<String?>(addressText),
      'pinOffsetApplied': serializer.toJson<bool>(pinOffsetApplied),
      'createdBy': serializer.toJson<String?>(createdBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'occurredSince': serializer.toJson<String?>(occurredSince),
      'organismId': serializer.toJson<String?>(organismId),
      'submittedAt': serializer.toJson<DateTime?>(submittedAt),
      'deadlineAt': serializer.toJson<DateTime?>(deadlineAt),
      'resolvedAt': serializer.toJson<DateTime?>(resolvedAt),
      'endorsementCount': serializer.toJson<int>(endorsementCount),
      'verifiedEndorsementCount': serializer.toJson<int>(
        verifiedEndorsementCount,
      ),
      'evidenceCount': serializer.toJson<int>(evidenceCount),
      'disputeCount': serializer.toJson<int>(disputeCount),
      'moderationStatus': serializer.toJson<String?>(moderationStatus),
      'moderationNotes': serializer.toJson<String?>(moderationNotes),
    };
  }

  Case copyWith({
    String? clientUuid,
    SyncStatus? syncStatus,
    DateTime? updatedAt,
    String? id,
    Value<String?> publicRef = const Value.absent(),
    String? neighborhoodId,
    Value<String?> cityId = const Value.absent(),
    Value<String?> jurisdictionId = const Value.absent(),
    String? categoryId,
    String? subtypeId,
    String? guidedAnswers,
    Value<String?> freeText = const Value.absent(),
    String? generatedBody,
    CaseStatus? status,
    int? severityComputed,
    double? lat,
    double? lng,
    String? geohash,
    Value<String?> addressText = const Value.absent(),
    bool? pinOffsetApplied,
    Value<String?> createdBy = const Value.absent(),
    DateTime? createdAt,
    Value<String?> occurredSince = const Value.absent(),
    Value<String?> organismId = const Value.absent(),
    Value<DateTime?> submittedAt = const Value.absent(),
    Value<DateTime?> deadlineAt = const Value.absent(),
    Value<DateTime?> resolvedAt = const Value.absent(),
    int? endorsementCount,
    int? verifiedEndorsementCount,
    int? evidenceCount,
    int? disputeCount,
    Value<String?> moderationStatus = const Value.absent(),
    Value<String?> moderationNotes = const Value.absent(),
  }) => Case(
    clientUuid: clientUuid ?? this.clientUuid,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    publicRef: publicRef.present ? publicRef.value : this.publicRef,
    neighborhoodId: neighborhoodId ?? this.neighborhoodId,
    cityId: cityId.present ? cityId.value : this.cityId,
    jurisdictionId: jurisdictionId.present
        ? jurisdictionId.value
        : this.jurisdictionId,
    categoryId: categoryId ?? this.categoryId,
    subtypeId: subtypeId ?? this.subtypeId,
    guidedAnswers: guidedAnswers ?? this.guidedAnswers,
    freeText: freeText.present ? freeText.value : this.freeText,
    generatedBody: generatedBody ?? this.generatedBody,
    status: status ?? this.status,
    severityComputed: severityComputed ?? this.severityComputed,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    geohash: geohash ?? this.geohash,
    addressText: addressText.present ? addressText.value : this.addressText,
    pinOffsetApplied: pinOffsetApplied ?? this.pinOffsetApplied,
    createdBy: createdBy.present ? createdBy.value : this.createdBy,
    createdAt: createdAt ?? this.createdAt,
    occurredSince: occurredSince.present
        ? occurredSince.value
        : this.occurredSince,
    organismId: organismId.present ? organismId.value : this.organismId,
    submittedAt: submittedAt.present ? submittedAt.value : this.submittedAt,
    deadlineAt: deadlineAt.present ? deadlineAt.value : this.deadlineAt,
    resolvedAt: resolvedAt.present ? resolvedAt.value : this.resolvedAt,
    endorsementCount: endorsementCount ?? this.endorsementCount,
    verifiedEndorsementCount:
        verifiedEndorsementCount ?? this.verifiedEndorsementCount,
    evidenceCount: evidenceCount ?? this.evidenceCount,
    disputeCount: disputeCount ?? this.disputeCount,
    moderationStatus: moderationStatus.present
        ? moderationStatus.value
        : this.moderationStatus,
    moderationNotes: moderationNotes.present
        ? moderationNotes.value
        : this.moderationNotes,
  );
  Case copyWithCompanion(CasesCompanion data) {
    return Case(
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      publicRef: data.publicRef.present ? data.publicRef.value : this.publicRef,
      neighborhoodId: data.neighborhoodId.present
          ? data.neighborhoodId.value
          : this.neighborhoodId,
      cityId: data.cityId.present ? data.cityId.value : this.cityId,
      jurisdictionId: data.jurisdictionId.present
          ? data.jurisdictionId.value
          : this.jurisdictionId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      subtypeId: data.subtypeId.present ? data.subtypeId.value : this.subtypeId,
      guidedAnswers: data.guidedAnswers.present
          ? data.guidedAnswers.value
          : this.guidedAnswers,
      freeText: data.freeText.present ? data.freeText.value : this.freeText,
      generatedBody: data.generatedBody.present
          ? data.generatedBody.value
          : this.generatedBody,
      status: data.status.present ? data.status.value : this.status,
      severityComputed: data.severityComputed.present
          ? data.severityComputed.value
          : this.severityComputed,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      geohash: data.geohash.present ? data.geohash.value : this.geohash,
      addressText: data.addressText.present
          ? data.addressText.value
          : this.addressText,
      pinOffsetApplied: data.pinOffsetApplied.present
          ? data.pinOffsetApplied.value
          : this.pinOffsetApplied,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      occurredSince: data.occurredSince.present
          ? data.occurredSince.value
          : this.occurredSince,
      organismId: data.organismId.present
          ? data.organismId.value
          : this.organismId,
      submittedAt: data.submittedAt.present
          ? data.submittedAt.value
          : this.submittedAt,
      deadlineAt: data.deadlineAt.present
          ? data.deadlineAt.value
          : this.deadlineAt,
      resolvedAt: data.resolvedAt.present
          ? data.resolvedAt.value
          : this.resolvedAt,
      endorsementCount: data.endorsementCount.present
          ? data.endorsementCount.value
          : this.endorsementCount,
      verifiedEndorsementCount: data.verifiedEndorsementCount.present
          ? data.verifiedEndorsementCount.value
          : this.verifiedEndorsementCount,
      evidenceCount: data.evidenceCount.present
          ? data.evidenceCount.value
          : this.evidenceCount,
      disputeCount: data.disputeCount.present
          ? data.disputeCount.value
          : this.disputeCount,
      moderationStatus: data.moderationStatus.present
          ? data.moderationStatus.value
          : this.moderationStatus,
      moderationNotes: data.moderationNotes.present
          ? data.moderationNotes.value
          : this.moderationNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Case(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('publicRef: $publicRef, ')
          ..write('neighborhoodId: $neighborhoodId, ')
          ..write('cityId: $cityId, ')
          ..write('jurisdictionId: $jurisdictionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('subtypeId: $subtypeId, ')
          ..write('guidedAnswers: $guidedAnswers, ')
          ..write('freeText: $freeText, ')
          ..write('generatedBody: $generatedBody, ')
          ..write('status: $status, ')
          ..write('severityComputed: $severityComputed, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('geohash: $geohash, ')
          ..write('addressText: $addressText, ')
          ..write('pinOffsetApplied: $pinOffsetApplied, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('occurredSince: $occurredSince, ')
          ..write('organismId: $organismId, ')
          ..write('submittedAt: $submittedAt, ')
          ..write('deadlineAt: $deadlineAt, ')
          ..write('resolvedAt: $resolvedAt, ')
          ..write('endorsementCount: $endorsementCount, ')
          ..write('verifiedEndorsementCount: $verifiedEndorsementCount, ')
          ..write('evidenceCount: $evidenceCount, ')
          ..write('disputeCount: $disputeCount, ')
          ..write('moderationStatus: $moderationStatus, ')
          ..write('moderationNotes: $moderationNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    publicRef,
    neighborhoodId,
    cityId,
    jurisdictionId,
    categoryId,
    subtypeId,
    guidedAnswers,
    freeText,
    generatedBody,
    status,
    severityComputed,
    lat,
    lng,
    geohash,
    addressText,
    pinOffsetApplied,
    createdBy,
    createdAt,
    occurredSince,
    organismId,
    submittedAt,
    deadlineAt,
    resolvedAt,
    endorsementCount,
    verifiedEndorsementCount,
    evidenceCount,
    disputeCount,
    moderationStatus,
    moderationNotes,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Case &&
          other.clientUuid == this.clientUuid &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.publicRef == this.publicRef &&
          other.neighborhoodId == this.neighborhoodId &&
          other.cityId == this.cityId &&
          other.jurisdictionId == this.jurisdictionId &&
          other.categoryId == this.categoryId &&
          other.subtypeId == this.subtypeId &&
          other.guidedAnswers == this.guidedAnswers &&
          other.freeText == this.freeText &&
          other.generatedBody == this.generatedBody &&
          other.status == this.status &&
          other.severityComputed == this.severityComputed &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.geohash == this.geohash &&
          other.addressText == this.addressText &&
          other.pinOffsetApplied == this.pinOffsetApplied &&
          other.createdBy == this.createdBy &&
          other.createdAt == this.createdAt &&
          other.occurredSince == this.occurredSince &&
          other.organismId == this.organismId &&
          other.submittedAt == this.submittedAt &&
          other.deadlineAt == this.deadlineAt &&
          other.resolvedAt == this.resolvedAt &&
          other.endorsementCount == this.endorsementCount &&
          other.verifiedEndorsementCount == this.verifiedEndorsementCount &&
          other.evidenceCount == this.evidenceCount &&
          other.disputeCount == this.disputeCount &&
          other.moderationStatus == this.moderationStatus &&
          other.moderationNotes == this.moderationNotes);
}

class CasesCompanion extends UpdateCompanion<Case> {
  final Value<String> clientUuid;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String?> publicRef;
  final Value<String> neighborhoodId;
  final Value<String?> cityId;
  final Value<String?> jurisdictionId;
  final Value<String> categoryId;
  final Value<String> subtypeId;
  final Value<String> guidedAnswers;
  final Value<String?> freeText;
  final Value<String> generatedBody;
  final Value<CaseStatus> status;
  final Value<int> severityComputed;
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> geohash;
  final Value<String?> addressText;
  final Value<bool> pinOffsetApplied;
  final Value<String?> createdBy;
  final Value<DateTime> createdAt;
  final Value<String?> occurredSince;
  final Value<String?> organismId;
  final Value<DateTime?> submittedAt;
  final Value<DateTime?> deadlineAt;
  final Value<DateTime?> resolvedAt;
  final Value<int> endorsementCount;
  final Value<int> verifiedEndorsementCount;
  final Value<int> evidenceCount;
  final Value<int> disputeCount;
  final Value<String?> moderationStatus;
  final Value<String?> moderationNotes;
  final Value<int> rowid;
  const CasesCompanion({
    this.clientUuid = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.publicRef = const Value.absent(),
    this.neighborhoodId = const Value.absent(),
    this.cityId = const Value.absent(),
    this.jurisdictionId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.subtypeId = const Value.absent(),
    this.guidedAnswers = const Value.absent(),
    this.freeText = const Value.absent(),
    this.generatedBody = const Value.absent(),
    this.status = const Value.absent(),
    this.severityComputed = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.geohash = const Value.absent(),
    this.addressText = const Value.absent(),
    this.pinOffsetApplied = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.occurredSince = const Value.absent(),
    this.organismId = const Value.absent(),
    this.submittedAt = const Value.absent(),
    this.deadlineAt = const Value.absent(),
    this.resolvedAt = const Value.absent(),
    this.endorsementCount = const Value.absent(),
    this.verifiedEndorsementCount = const Value.absent(),
    this.evidenceCount = const Value.absent(),
    this.disputeCount = const Value.absent(),
    this.moderationStatus = const Value.absent(),
    this.moderationNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CasesCompanion.insert({
    required String clientUuid,
    this.syncStatus = const Value.absent(),
    required DateTime updatedAt,
    required String id,
    this.publicRef = const Value.absent(),
    required String neighborhoodId,
    this.cityId = const Value.absent(),
    this.jurisdictionId = const Value.absent(),
    required String categoryId,
    required String subtypeId,
    required String guidedAnswers,
    this.freeText = const Value.absent(),
    this.generatedBody = const Value.absent(),
    required CaseStatus status,
    this.severityComputed = const Value.absent(),
    required double lat,
    required double lng,
    required String geohash,
    this.addressText = const Value.absent(),
    this.pinOffsetApplied = const Value.absent(),
    this.createdBy = const Value.absent(),
    required DateTime createdAt,
    this.occurredSince = const Value.absent(),
    this.organismId = const Value.absent(),
    this.submittedAt = const Value.absent(),
    this.deadlineAt = const Value.absent(),
    this.resolvedAt = const Value.absent(),
    this.endorsementCount = const Value.absent(),
    this.verifiedEndorsementCount = const Value.absent(),
    this.evidenceCount = const Value.absent(),
    this.disputeCount = const Value.absent(),
    this.moderationStatus = const Value.absent(),
    this.moderationNotes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientUuid = Value(clientUuid),
       updatedAt = Value(updatedAt),
       id = Value(id),
       neighborhoodId = Value(neighborhoodId),
       categoryId = Value(categoryId),
       subtypeId = Value(subtypeId),
       guidedAnswers = Value(guidedAnswers),
       status = Value(status),
       lat = Value(lat),
       lng = Value(lng),
       geohash = Value(geohash),
       createdAt = Value(createdAt);
  static Insertable<Case> custom({
    Expression<String>? clientUuid,
    Expression<String>? syncStatus,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? publicRef,
    Expression<String>? neighborhoodId,
    Expression<String>? cityId,
    Expression<String>? jurisdictionId,
    Expression<String>? categoryId,
    Expression<String>? subtypeId,
    Expression<String>? guidedAnswers,
    Expression<String>? freeText,
    Expression<String>? generatedBody,
    Expression<String>? status,
    Expression<int>? severityComputed,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? geohash,
    Expression<String>? addressText,
    Expression<bool>? pinOffsetApplied,
    Expression<String>? createdBy,
    Expression<DateTime>? createdAt,
    Expression<String>? occurredSince,
    Expression<String>? organismId,
    Expression<DateTime>? submittedAt,
    Expression<DateTime>? deadlineAt,
    Expression<DateTime>? resolvedAt,
    Expression<int>? endorsementCount,
    Expression<int>? verifiedEndorsementCount,
    Expression<int>? evidenceCount,
    Expression<int>? disputeCount,
    Expression<String>? moderationStatus,
    Expression<String>? moderationNotes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (publicRef != null) 'public_ref': publicRef,
      if (neighborhoodId != null) 'neighborhood_id': neighborhoodId,
      if (cityId != null) 'city_id': cityId,
      if (jurisdictionId != null) 'jurisdiction_id': jurisdictionId,
      if (categoryId != null) 'category_id': categoryId,
      if (subtypeId != null) 'subtype_id': subtypeId,
      if (guidedAnswers != null) 'guided_answers': guidedAnswers,
      if (freeText != null) 'free_text': freeText,
      if (generatedBody != null) 'generated_body': generatedBody,
      if (status != null) 'status': status,
      if (severityComputed != null) 'severity_computed': severityComputed,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (geohash != null) 'geohash': geohash,
      if (addressText != null) 'address_text': addressText,
      if (pinOffsetApplied != null) 'pin_offset_applied': pinOffsetApplied,
      if (createdBy != null) 'created_by': createdBy,
      if (createdAt != null) 'created_at': createdAt,
      if (occurredSince != null) 'occurred_since': occurredSince,
      if (organismId != null) 'organism_id': organismId,
      if (submittedAt != null) 'submitted_at': submittedAt,
      if (deadlineAt != null) 'deadline_at': deadlineAt,
      if (resolvedAt != null) 'resolved_at': resolvedAt,
      if (endorsementCount != null) 'endorsement_count': endorsementCount,
      if (verifiedEndorsementCount != null)
        'verified_endorsement_count': verifiedEndorsementCount,
      if (evidenceCount != null) 'evidence_count': evidenceCount,
      if (disputeCount != null) 'dispute_count': disputeCount,
      if (moderationStatus != null) 'moderation_status': moderationStatus,
      if (moderationNotes != null) 'moderation_notes': moderationNotes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CasesCompanion copyWith({
    Value<String>? clientUuid,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String?>? publicRef,
    Value<String>? neighborhoodId,
    Value<String?>? cityId,
    Value<String?>? jurisdictionId,
    Value<String>? categoryId,
    Value<String>? subtypeId,
    Value<String>? guidedAnswers,
    Value<String?>? freeText,
    Value<String>? generatedBody,
    Value<CaseStatus>? status,
    Value<int>? severityComputed,
    Value<double>? lat,
    Value<double>? lng,
    Value<String>? geohash,
    Value<String?>? addressText,
    Value<bool>? pinOffsetApplied,
    Value<String?>? createdBy,
    Value<DateTime>? createdAt,
    Value<String?>? occurredSince,
    Value<String?>? organismId,
    Value<DateTime?>? submittedAt,
    Value<DateTime?>? deadlineAt,
    Value<DateTime?>? resolvedAt,
    Value<int>? endorsementCount,
    Value<int>? verifiedEndorsementCount,
    Value<int>? evidenceCount,
    Value<int>? disputeCount,
    Value<String?>? moderationStatus,
    Value<String?>? moderationNotes,
    Value<int>? rowid,
  }) {
    return CasesCompanion(
      clientUuid: clientUuid ?? this.clientUuid,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      publicRef: publicRef ?? this.publicRef,
      neighborhoodId: neighborhoodId ?? this.neighborhoodId,
      cityId: cityId ?? this.cityId,
      jurisdictionId: jurisdictionId ?? this.jurisdictionId,
      categoryId: categoryId ?? this.categoryId,
      subtypeId: subtypeId ?? this.subtypeId,
      guidedAnswers: guidedAnswers ?? this.guidedAnswers,
      freeText: freeText ?? this.freeText,
      generatedBody: generatedBody ?? this.generatedBody,
      status: status ?? this.status,
      severityComputed: severityComputed ?? this.severityComputed,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      geohash: geohash ?? this.geohash,
      addressText: addressText ?? this.addressText,
      pinOffsetApplied: pinOffsetApplied ?? this.pinOffsetApplied,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      occurredSince: occurredSince ?? this.occurredSince,
      organismId: organismId ?? this.organismId,
      submittedAt: submittedAt ?? this.submittedAt,
      deadlineAt: deadlineAt ?? this.deadlineAt,
      resolvedAt: resolvedAt ?? this.resolvedAt,
      endorsementCount: endorsementCount ?? this.endorsementCount,
      verifiedEndorsementCount:
          verifiedEndorsementCount ?? this.verifiedEndorsementCount,
      evidenceCount: evidenceCount ?? this.evidenceCount,
      disputeCount: disputeCount ?? this.disputeCount,
      moderationStatus: moderationStatus ?? this.moderationStatus,
      moderationNotes: moderationNotes ?? this.moderationNotes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $CasesTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (publicRef.present) {
      map['public_ref'] = Variable<String>(publicRef.value);
    }
    if (neighborhoodId.present) {
      map['neighborhood_id'] = Variable<String>(neighborhoodId.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<String>(cityId.value);
    }
    if (jurisdictionId.present) {
      map['jurisdiction_id'] = Variable<String>(jurisdictionId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (subtypeId.present) {
      map['subtype_id'] = Variable<String>(subtypeId.value);
    }
    if (guidedAnswers.present) {
      map['guided_answers'] = Variable<String>(guidedAnswers.value);
    }
    if (freeText.present) {
      map['free_text'] = Variable<String>(freeText.value);
    }
    if (generatedBody.present) {
      map['generated_body'] = Variable<String>(generatedBody.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $CasesTable.$converterstatus.toSql(status.value),
      );
    }
    if (severityComputed.present) {
      map['severity_computed'] = Variable<int>(severityComputed.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (geohash.present) {
      map['geohash'] = Variable<String>(geohash.value);
    }
    if (addressText.present) {
      map['address_text'] = Variable<String>(addressText.value);
    }
    if (pinOffsetApplied.present) {
      map['pin_offset_applied'] = Variable<bool>(pinOffsetApplied.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (occurredSince.present) {
      map['occurred_since'] = Variable<String>(occurredSince.value);
    }
    if (organismId.present) {
      map['organism_id'] = Variable<String>(organismId.value);
    }
    if (submittedAt.present) {
      map['submitted_at'] = Variable<DateTime>(submittedAt.value);
    }
    if (deadlineAt.present) {
      map['deadline_at'] = Variable<DateTime>(deadlineAt.value);
    }
    if (resolvedAt.present) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt.value);
    }
    if (endorsementCount.present) {
      map['endorsement_count'] = Variable<int>(endorsementCount.value);
    }
    if (verifiedEndorsementCount.present) {
      map['verified_endorsement_count'] = Variable<int>(
        verifiedEndorsementCount.value,
      );
    }
    if (evidenceCount.present) {
      map['evidence_count'] = Variable<int>(evidenceCount.value);
    }
    if (disputeCount.present) {
      map['dispute_count'] = Variable<int>(disputeCount.value);
    }
    if (moderationStatus.present) {
      map['moderation_status'] = Variable<String>(moderationStatus.value);
    }
    if (moderationNotes.present) {
      map['moderation_notes'] = Variable<String>(moderationNotes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CasesCompanion(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('publicRef: $publicRef, ')
          ..write('neighborhoodId: $neighborhoodId, ')
          ..write('cityId: $cityId, ')
          ..write('jurisdictionId: $jurisdictionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('subtypeId: $subtypeId, ')
          ..write('guidedAnswers: $guidedAnswers, ')
          ..write('freeText: $freeText, ')
          ..write('generatedBody: $generatedBody, ')
          ..write('status: $status, ')
          ..write('severityComputed: $severityComputed, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('geohash: $geohash, ')
          ..write('addressText: $addressText, ')
          ..write('pinOffsetApplied: $pinOffsetApplied, ')
          ..write('createdBy: $createdBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('occurredSince: $occurredSince, ')
          ..write('organismId: $organismId, ')
          ..write('submittedAt: $submittedAt, ')
          ..write('deadlineAt: $deadlineAt, ')
          ..write('resolvedAt: $resolvedAt, ')
          ..write('endorsementCount: $endorsementCount, ')
          ..write('verifiedEndorsementCount: $verifiedEndorsementCount, ')
          ..write('evidenceCount: $evidenceCount, ')
          ..write('disputeCount: $disputeCount, ')
          ..write('moderationStatus: $moderationStatus, ')
          ..write('moderationNotes: $moderationNotes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EvidencesTable extends Evidences
    with TableInfo<$EvidencesTable, Evidence> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvidencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pendiente.name),
      ).withConverter<SyncStatus>($EvidencesTable.$convertersyncStatus);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
    'case_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EvidenceType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<EvidenceType>($EvidencesTable.$convertertype);
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _storageUrlMeta = const VerificationMeta(
    'storageUrl',
  );
  @override
  late final GeneratedColumn<String> storageUrl = GeneratedColumn<String>(
    'storage_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbUrlMeta = const VerificationMeta(
    'thumbUrl',
  );
  @override
  late final GeneratedColumn<String> thumbUrl = GeneratedColumn<String>(
    'thumb_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
    'sha256',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capturedAtMeta = const VerificationMeta(
    'capturedAt',
  );
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
    'captured_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _uploadedByMeta = const VerificationMeta(
    'uploadedBy',
  );
  @override
  late final GeneratedColumn<String> uploadedBy = GeneratedColumn<String>(
    'uploaded_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exifStrippedMeta = const VerificationMeta(
    'exifStripped',
  );
  @override
  late final GeneratedColumn<bool> exifStripped = GeneratedColumn<bool>(
    'exif_stripped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("exif_stripped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _facesBlurredMeta = const VerificationMeta(
    'facesBlurred',
  );
  @override
  late final GeneratedColumn<bool> facesBlurred = GeneratedColumn<bool>(
    'faces_blurred',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("faces_blurred" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _classifierScoresMeta = const VerificationMeta(
    'classifierScores',
  );
  @override
  late final GeneratedColumn<String> classifierScores = GeneratedColumn<String>(
    'classifier_scores',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moderationStatusMeta = const VerificationMeta(
    'moderationStatus',
  );
  @override
  late final GeneratedColumn<String> moderationStatus = GeneratedColumn<String>(
    'moderation_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    type,
    localPath,
    storageUrl,
    thumbUrl,
    sha256,
    capturedAt,
    lat,
    lng,
    uploadedBy,
    exifStripped,
    facesBlurred,
    classifierScores,
    moderationStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evidences';
  @override
  VerificationContext validateIntegrity(
    Insertable<Evidence> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(
        _caseIdMeta,
        caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    }
    if (data.containsKey('storage_url')) {
      context.handle(
        _storageUrlMeta,
        storageUrl.isAcceptableOrUnknown(data['storage_url']!, _storageUrlMeta),
      );
    }
    if (data.containsKey('thumb_url')) {
      context.handle(
        _thumbUrlMeta,
        thumbUrl.isAcceptableOrUnknown(data['thumb_url']!, _thumbUrlMeta),
      );
    }
    if (data.containsKey('sha256')) {
      context.handle(
        _sha256Meta,
        sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta),
      );
    } else if (isInserting) {
      context.missing(_sha256Meta);
    }
    if (data.containsKey('captured_at')) {
      context.handle(
        _capturedAtMeta,
        capturedAt.isAcceptableOrUnknown(data['captured_at']!, _capturedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    }
    if (data.containsKey('uploaded_by')) {
      context.handle(
        _uploadedByMeta,
        uploadedBy.isAcceptableOrUnknown(data['uploaded_by']!, _uploadedByMeta),
      );
    }
    if (data.containsKey('exif_stripped')) {
      context.handle(
        _exifStrippedMeta,
        exifStripped.isAcceptableOrUnknown(
          data['exif_stripped']!,
          _exifStrippedMeta,
        ),
      );
    }
    if (data.containsKey('faces_blurred')) {
      context.handle(
        _facesBlurredMeta,
        facesBlurred.isAcceptableOrUnknown(
          data['faces_blurred']!,
          _facesBlurredMeta,
        ),
      );
    }
    if (data.containsKey('classifier_scores')) {
      context.handle(
        _classifierScoresMeta,
        classifierScores.isAcceptableOrUnknown(
          data['classifier_scores']!,
          _classifierScoresMeta,
        ),
      );
    }
    if (data.containsKey('moderation_status')) {
      context.handle(
        _moderationStatusMeta,
        moderationStatus.isAcceptableOrUnknown(
          data['moderation_status']!,
          _moderationStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Evidence map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Evidence(
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      syncStatus: $EvidencesTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      caseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_id'],
      )!,
      type: $EvidencesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      ),
      storageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}storage_url'],
      ),
      thumbUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumb_url'],
      ),
      sha256: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sha256'],
      )!,
      capturedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}captured_at'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      ),
      uploadedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uploaded_by'],
      ),
      exifStripped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}exif_stripped'],
      )!,
      facesBlurred: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}faces_blurred'],
      )!,
      classifierScores: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}classifier_scores'],
      ),
      moderationStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moderation_status'],
      ),
    );
  }

  @override
  $EvidencesTable createAlias(String alias) {
    return $EvidencesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<EvidenceType, String, String> $convertertype =
      const EnumNameConverter<EvidenceType>(EvidenceType.values);
}

class Evidence extends DataClass implements Insertable<Evidence> {
  /// Idempotencia: el servidor deduplica por este uuid (§20.2).
  final String clientUuid;

  /// Estado de sincronización visible por ítem en la UI (§20.2).
  final SyncStatus syncStatus;

  /// Última modificación local (last-write-wins salvo contadores).
  final DateTime updatedAt;
  final String id;
  final String caseId;
  final EvidenceType type;

  /// Ruta local del archivo hasta subir; URL remota después.
  final String? localPath;
  final String? storageUrl;
  final String? thumbUrl;

  /// Hash al momento de captura (§10.2): nadie puede decir "eso es reciente".
  final String sha256;
  final DateTime capturedAt;
  final double? lat;
  final double? lng;
  final String? uploadedBy;
  final bool exifStripped;
  final bool facesBlurred;

  /// JSON: puntajes del clasificador (§10.1).
  final String? classifierScores;
  final String? moderationStatus;
  const Evidence({
    required this.clientUuid,
    required this.syncStatus,
    required this.updatedAt,
    required this.id,
    required this.caseId,
    required this.type,
    this.localPath,
    this.storageUrl,
    this.thumbUrl,
    required this.sha256,
    required this.capturedAt,
    this.lat,
    this.lng,
    this.uploadedBy,
    required this.exifStripped,
    required this.facesBlurred,
    this.classifierScores,
    this.moderationStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_uuid'] = Variable<String>(clientUuid);
    {
      map['sync_status'] = Variable<String>(
        $EvidencesTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    {
      map['type'] = Variable<String>(
        $EvidencesTable.$convertertype.toSql(type),
      );
    }
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    if (!nullToAbsent || storageUrl != null) {
      map['storage_url'] = Variable<String>(storageUrl);
    }
    if (!nullToAbsent || thumbUrl != null) {
      map['thumb_url'] = Variable<String>(thumbUrl);
    }
    map['sha256'] = Variable<String>(sha256);
    map['captured_at'] = Variable<DateTime>(capturedAt);
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<double>(lng);
    }
    if (!nullToAbsent || uploadedBy != null) {
      map['uploaded_by'] = Variable<String>(uploadedBy);
    }
    map['exif_stripped'] = Variable<bool>(exifStripped);
    map['faces_blurred'] = Variable<bool>(facesBlurred);
    if (!nullToAbsent || classifierScores != null) {
      map['classifier_scores'] = Variable<String>(classifierScores);
    }
    if (!nullToAbsent || moderationStatus != null) {
      map['moderation_status'] = Variable<String>(moderationStatus);
    }
    return map;
  }

  EvidencesCompanion toCompanion(bool nullToAbsent) {
    return EvidencesCompanion(
      clientUuid: Value(clientUuid),
      syncStatus: Value(syncStatus),
      updatedAt: Value(updatedAt),
      id: Value(id),
      caseId: Value(caseId),
      type: Value(type),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
      storageUrl: storageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(storageUrl),
      thumbUrl: thumbUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbUrl),
      sha256: Value(sha256),
      capturedAt: Value(capturedAt),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      uploadedBy: uploadedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(uploadedBy),
      exifStripped: Value(exifStripped),
      facesBlurred: Value(facesBlurred),
      classifierScores: classifierScores == null && nullToAbsent
          ? const Value.absent()
          : Value(classifierScores),
      moderationStatus: moderationStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(moderationStatus),
    );
  }

  factory Evidence.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Evidence(
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      syncStatus: $EvidencesTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      type: $EvidencesTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      localPath: serializer.fromJson<String?>(json['localPath']),
      storageUrl: serializer.fromJson<String?>(json['storageUrl']),
      thumbUrl: serializer.fromJson<String?>(json['thumbUrl']),
      sha256: serializer.fromJson<String>(json['sha256']),
      capturedAt: serializer.fromJson<DateTime>(json['capturedAt']),
      lat: serializer.fromJson<double?>(json['lat']),
      lng: serializer.fromJson<double?>(json['lng']),
      uploadedBy: serializer.fromJson<String?>(json['uploadedBy']),
      exifStripped: serializer.fromJson<bool>(json['exifStripped']),
      facesBlurred: serializer.fromJson<bool>(json['facesBlurred']),
      classifierScores: serializer.fromJson<String?>(json['classifierScores']),
      moderationStatus: serializer.fromJson<String?>(json['moderationStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientUuid': serializer.toJson<String>(clientUuid),
      'syncStatus': serializer.toJson<String>(
        $EvidencesTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'type': serializer.toJson<String>(
        $EvidencesTable.$convertertype.toJson(type),
      ),
      'localPath': serializer.toJson<String?>(localPath),
      'storageUrl': serializer.toJson<String?>(storageUrl),
      'thumbUrl': serializer.toJson<String?>(thumbUrl),
      'sha256': serializer.toJson<String>(sha256),
      'capturedAt': serializer.toJson<DateTime>(capturedAt),
      'lat': serializer.toJson<double?>(lat),
      'lng': serializer.toJson<double?>(lng),
      'uploadedBy': serializer.toJson<String?>(uploadedBy),
      'exifStripped': serializer.toJson<bool>(exifStripped),
      'facesBlurred': serializer.toJson<bool>(facesBlurred),
      'classifierScores': serializer.toJson<String?>(classifierScores),
      'moderationStatus': serializer.toJson<String?>(moderationStatus),
    };
  }

  Evidence copyWith({
    String? clientUuid,
    SyncStatus? syncStatus,
    DateTime? updatedAt,
    String? id,
    String? caseId,
    EvidenceType? type,
    Value<String?> localPath = const Value.absent(),
    Value<String?> storageUrl = const Value.absent(),
    Value<String?> thumbUrl = const Value.absent(),
    String? sha256,
    DateTime? capturedAt,
    Value<double?> lat = const Value.absent(),
    Value<double?> lng = const Value.absent(),
    Value<String?> uploadedBy = const Value.absent(),
    bool? exifStripped,
    bool? facesBlurred,
    Value<String?> classifierScores = const Value.absent(),
    Value<String?> moderationStatus = const Value.absent(),
  }) => Evidence(
    clientUuid: clientUuid ?? this.clientUuid,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    type: type ?? this.type,
    localPath: localPath.present ? localPath.value : this.localPath,
    storageUrl: storageUrl.present ? storageUrl.value : this.storageUrl,
    thumbUrl: thumbUrl.present ? thumbUrl.value : this.thumbUrl,
    sha256: sha256 ?? this.sha256,
    capturedAt: capturedAt ?? this.capturedAt,
    lat: lat.present ? lat.value : this.lat,
    lng: lng.present ? lng.value : this.lng,
    uploadedBy: uploadedBy.present ? uploadedBy.value : this.uploadedBy,
    exifStripped: exifStripped ?? this.exifStripped,
    facesBlurred: facesBlurred ?? this.facesBlurred,
    classifierScores: classifierScores.present
        ? classifierScores.value
        : this.classifierScores,
    moderationStatus: moderationStatus.present
        ? moderationStatus.value
        : this.moderationStatus,
  );
  Evidence copyWithCompanion(EvidencesCompanion data) {
    return Evidence(
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      type: data.type.present ? data.type.value : this.type,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      storageUrl: data.storageUrl.present
          ? data.storageUrl.value
          : this.storageUrl,
      thumbUrl: data.thumbUrl.present ? data.thumbUrl.value : this.thumbUrl,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
      capturedAt: data.capturedAt.present
          ? data.capturedAt.value
          : this.capturedAt,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      uploadedBy: data.uploadedBy.present
          ? data.uploadedBy.value
          : this.uploadedBy,
      exifStripped: data.exifStripped.present
          ? data.exifStripped.value
          : this.exifStripped,
      facesBlurred: data.facesBlurred.present
          ? data.facesBlurred.value
          : this.facesBlurred,
      classifierScores: data.classifierScores.present
          ? data.classifierScores.value
          : this.classifierScores,
      moderationStatus: data.moderationStatus.present
          ? data.moderationStatus.value
          : this.moderationStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Evidence(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('type: $type, ')
          ..write('localPath: $localPath, ')
          ..write('storageUrl: $storageUrl, ')
          ..write('thumbUrl: $thumbUrl, ')
          ..write('sha256: $sha256, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('uploadedBy: $uploadedBy, ')
          ..write('exifStripped: $exifStripped, ')
          ..write('facesBlurred: $facesBlurred, ')
          ..write('classifierScores: $classifierScores, ')
          ..write('moderationStatus: $moderationStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    type,
    localPath,
    storageUrl,
    thumbUrl,
    sha256,
    capturedAt,
    lat,
    lng,
    uploadedBy,
    exifStripped,
    facesBlurred,
    classifierScores,
    moderationStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Evidence &&
          other.clientUuid == this.clientUuid &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.type == this.type &&
          other.localPath == this.localPath &&
          other.storageUrl == this.storageUrl &&
          other.thumbUrl == this.thumbUrl &&
          other.sha256 == this.sha256 &&
          other.capturedAt == this.capturedAt &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.uploadedBy == this.uploadedBy &&
          other.exifStripped == this.exifStripped &&
          other.facesBlurred == this.facesBlurred &&
          other.classifierScores == this.classifierScores &&
          other.moderationStatus == this.moderationStatus);
}

class EvidencesCompanion extends UpdateCompanion<Evidence> {
  final Value<String> clientUuid;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> caseId;
  final Value<EvidenceType> type;
  final Value<String?> localPath;
  final Value<String?> storageUrl;
  final Value<String?> thumbUrl;
  final Value<String> sha256;
  final Value<DateTime> capturedAt;
  final Value<double?> lat;
  final Value<double?> lng;
  final Value<String?> uploadedBy;
  final Value<bool> exifStripped;
  final Value<bool> facesBlurred;
  final Value<String?> classifierScores;
  final Value<String?> moderationStatus;
  final Value<int> rowid;
  const EvidencesCompanion({
    this.clientUuid = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.type = const Value.absent(),
    this.localPath = const Value.absent(),
    this.storageUrl = const Value.absent(),
    this.thumbUrl = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.uploadedBy = const Value.absent(),
    this.exifStripped = const Value.absent(),
    this.facesBlurred = const Value.absent(),
    this.classifierScores = const Value.absent(),
    this.moderationStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EvidencesCompanion.insert({
    required String clientUuid,
    this.syncStatus = const Value.absent(),
    required DateTime updatedAt,
    required String id,
    required String caseId,
    required EvidenceType type,
    this.localPath = const Value.absent(),
    this.storageUrl = const Value.absent(),
    this.thumbUrl = const Value.absent(),
    required String sha256,
    required DateTime capturedAt,
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.uploadedBy = const Value.absent(),
    this.exifStripped = const Value.absent(),
    this.facesBlurred = const Value.absent(),
    this.classifierScores = const Value.absent(),
    this.moderationStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientUuid = Value(clientUuid),
       updatedAt = Value(updatedAt),
       id = Value(id),
       caseId = Value(caseId),
       type = Value(type),
       sha256 = Value(sha256),
       capturedAt = Value(capturedAt);
  static Insertable<Evidence> custom({
    Expression<String>? clientUuid,
    Expression<String>? syncStatus,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? type,
    Expression<String>? localPath,
    Expression<String>? storageUrl,
    Expression<String>? thumbUrl,
    Expression<String>? sha256,
    Expression<DateTime>? capturedAt,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? uploadedBy,
    Expression<bool>? exifStripped,
    Expression<bool>? facesBlurred,
    Expression<String>? classifierScores,
    Expression<String>? moderationStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (type != null) 'type': type,
      if (localPath != null) 'local_path': localPath,
      if (storageUrl != null) 'storage_url': storageUrl,
      if (thumbUrl != null) 'thumb_url': thumbUrl,
      if (sha256 != null) 'sha256': sha256,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (uploadedBy != null) 'uploaded_by': uploadedBy,
      if (exifStripped != null) 'exif_stripped': exifStripped,
      if (facesBlurred != null) 'faces_blurred': facesBlurred,
      if (classifierScores != null) 'classifier_scores': classifierScores,
      if (moderationStatus != null) 'moderation_status': moderationStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EvidencesCompanion copyWith({
    Value<String>? clientUuid,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? caseId,
    Value<EvidenceType>? type,
    Value<String?>? localPath,
    Value<String?>? storageUrl,
    Value<String?>? thumbUrl,
    Value<String>? sha256,
    Value<DateTime>? capturedAt,
    Value<double?>? lat,
    Value<double?>? lng,
    Value<String?>? uploadedBy,
    Value<bool>? exifStripped,
    Value<bool>? facesBlurred,
    Value<String?>? classifierScores,
    Value<String?>? moderationStatus,
    Value<int>? rowid,
  }) {
    return EvidencesCompanion(
      clientUuid: clientUuid ?? this.clientUuid,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      type: type ?? this.type,
      localPath: localPath ?? this.localPath,
      storageUrl: storageUrl ?? this.storageUrl,
      thumbUrl: thumbUrl ?? this.thumbUrl,
      sha256: sha256 ?? this.sha256,
      capturedAt: capturedAt ?? this.capturedAt,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      exifStripped: exifStripped ?? this.exifStripped,
      facesBlurred: facesBlurred ?? this.facesBlurred,
      classifierScores: classifierScores ?? this.classifierScores,
      moderationStatus: moderationStatus ?? this.moderationStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $EvidencesTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $EvidencesTable.$convertertype.toSql(type.value),
      );
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (storageUrl.present) {
      map['storage_url'] = Variable<String>(storageUrl.value);
    }
    if (thumbUrl.present) {
      map['thumb_url'] = Variable<String>(thumbUrl.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (uploadedBy.present) {
      map['uploaded_by'] = Variable<String>(uploadedBy.value);
    }
    if (exifStripped.present) {
      map['exif_stripped'] = Variable<bool>(exifStripped.value);
    }
    if (facesBlurred.present) {
      map['faces_blurred'] = Variable<bool>(facesBlurred.value);
    }
    if (classifierScores.present) {
      map['classifier_scores'] = Variable<String>(classifierScores.value);
    }
    if (moderationStatus.present) {
      map['moderation_status'] = Variable<String>(moderationStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvidencesCompanion(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('type: $type, ')
          ..write('localPath: $localPath, ')
          ..write('storageUrl: $storageUrl, ')
          ..write('thumbUrl: $thumbUrl, ')
          ..write('sha256: $sha256, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('uploadedBy: $uploadedBy, ')
          ..write('exifStripped: $exifStripped, ')
          ..write('facesBlurred: $facesBlurred, ')
          ..write('classifierScores: $classifierScores, ')
          ..write('moderationStatus: $moderationStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EndorsementsTable extends Endorsements
    with TableInfo<$EndorsementsTable, Endorsement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EndorsementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pendiente.name),
      ).withConverter<SyncStatus>($EndorsementsTable.$convertersyncStatus);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
    'case_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _impactTagsMeta = const VerificationMeta(
    'impactTags',
  );
  @override
  late final GeneratedColumn<String> impactTags = GeneratedColumn<String>(
    'impact_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _countsAsFormalSignatureMeta =
      const VerificationMeta('countsAsFormalSignature');
  @override
  late final GeneratedColumn<bool> countsAsFormalSignature =
      GeneratedColumn<bool>(
        'counts_as_formal_signature',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("counts_as_formal_signature" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _isResidentMeta = const VerificationMeta(
    'isResident',
  );
  @override
  late final GeneratedColumn<bool> isResident = GeneratedColumn<bool>(
    'is_resident',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_resident" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    userId,
    createdAt,
    impactTags,
    countsAsFormalSignature,
    isResident,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'endorsements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Endorsement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(
        _caseIdMeta,
        caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('impact_tags')) {
      context.handle(
        _impactTagsMeta,
        impactTags.isAcceptableOrUnknown(data['impact_tags']!, _impactTagsMeta),
      );
    }
    if (data.containsKey('counts_as_formal_signature')) {
      context.handle(
        _countsAsFormalSignatureMeta,
        countsAsFormalSignature.isAcceptableOrUnknown(
          data['counts_as_formal_signature']!,
          _countsAsFormalSignatureMeta,
        ),
      );
    }
    if (data.containsKey('is_resident')) {
      context.handle(
        _isResidentMeta,
        isResident.isAcceptableOrUnknown(data['is_resident']!, _isResidentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Endorsement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Endorsement(
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      syncStatus: $EndorsementsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      caseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      impactTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}impact_tags'],
      )!,
      countsAsFormalSignature: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}counts_as_formal_signature'],
      )!,
      isResident: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_resident'],
      )!,
    );
  }

  @override
  $EndorsementsTable createAlias(String alias) {
    return $EndorsementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class Endorsement extends DataClass implements Insertable<Endorsement> {
  /// Idempotencia: el servidor deduplica por este uuid (§20.2).
  final String clientUuid;

  /// Estado de sincronización visible por ítem en la UI (§20.2).
  final SyncStatus syncStatus;

  /// Última modificación local (last-write-wins salvo contadores).
  final DateTime updatedAt;
  final String id;
  final String caseId;
  final String userId;
  final DateTime createdAt;

  /// JSON: lista de ImpactTag.name (§11, opciones cerradas).
  final String impactTags;

  /// Solo Verificado firma formalmente (§7).
  final bool countsAsFormalSignature;

  /// Dentro del polígono o no: las de afuera se muestran aparte (§22).
  final bool isResident;
  const Endorsement({
    required this.clientUuid,
    required this.syncStatus,
    required this.updatedAt,
    required this.id,
    required this.caseId,
    required this.userId,
    required this.createdAt,
    required this.impactTags,
    required this.countsAsFormalSignature,
    required this.isResident,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_uuid'] = Variable<String>(clientUuid);
    {
      map['sync_status'] = Variable<String>(
        $EndorsementsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['impact_tags'] = Variable<String>(impactTags);
    map['counts_as_formal_signature'] = Variable<bool>(countsAsFormalSignature);
    map['is_resident'] = Variable<bool>(isResident);
    return map;
  }

  EndorsementsCompanion toCompanion(bool nullToAbsent) {
    return EndorsementsCompanion(
      clientUuid: Value(clientUuid),
      syncStatus: Value(syncStatus),
      updatedAt: Value(updatedAt),
      id: Value(id),
      caseId: Value(caseId),
      userId: Value(userId),
      createdAt: Value(createdAt),
      impactTags: Value(impactTags),
      countsAsFormalSignature: Value(countsAsFormalSignature),
      isResident: Value(isResident),
    );
  }

  factory Endorsement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Endorsement(
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      syncStatus: $EndorsementsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      impactTags: serializer.fromJson<String>(json['impactTags']),
      countsAsFormalSignature: serializer.fromJson<bool>(
        json['countsAsFormalSignature'],
      ),
      isResident: serializer.fromJson<bool>(json['isResident']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientUuid': serializer.toJson<String>(clientUuid),
      'syncStatus': serializer.toJson<String>(
        $EndorsementsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'impactTags': serializer.toJson<String>(impactTags),
      'countsAsFormalSignature': serializer.toJson<bool>(
        countsAsFormalSignature,
      ),
      'isResident': serializer.toJson<bool>(isResident),
    };
  }

  Endorsement copyWith({
    String? clientUuid,
    SyncStatus? syncStatus,
    DateTime? updatedAt,
    String? id,
    String? caseId,
    String? userId,
    DateTime? createdAt,
    String? impactTags,
    bool? countsAsFormalSignature,
    bool? isResident,
  }) => Endorsement(
    clientUuid: clientUuid ?? this.clientUuid,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    userId: userId ?? this.userId,
    createdAt: createdAt ?? this.createdAt,
    impactTags: impactTags ?? this.impactTags,
    countsAsFormalSignature:
        countsAsFormalSignature ?? this.countsAsFormalSignature,
    isResident: isResident ?? this.isResident,
  );
  Endorsement copyWithCompanion(EndorsementsCompanion data) {
    return Endorsement(
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      impactTags: data.impactTags.present
          ? data.impactTags.value
          : this.impactTags,
      countsAsFormalSignature: data.countsAsFormalSignature.present
          ? data.countsAsFormalSignature.value
          : this.countsAsFormalSignature,
      isResident: data.isResident.present
          ? data.isResident.value
          : this.isResident,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Endorsement(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('impactTags: $impactTags, ')
          ..write('countsAsFormalSignature: $countsAsFormalSignature, ')
          ..write('isResident: $isResident')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    userId,
    createdAt,
    impactTags,
    countsAsFormalSignature,
    isResident,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Endorsement &&
          other.clientUuid == this.clientUuid &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.impactTags == this.impactTags &&
          other.countsAsFormalSignature == this.countsAsFormalSignature &&
          other.isResident == this.isResident);
}

class EndorsementsCompanion extends UpdateCompanion<Endorsement> {
  final Value<String> clientUuid;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> caseId;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<String> impactTags;
  final Value<bool> countsAsFormalSignature;
  final Value<bool> isResident;
  final Value<int> rowid;
  const EndorsementsCompanion({
    this.clientUuid = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.impactTags = const Value.absent(),
    this.countsAsFormalSignature = const Value.absent(),
    this.isResident = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EndorsementsCompanion.insert({
    required String clientUuid,
    this.syncStatus = const Value.absent(),
    required DateTime updatedAt,
    required String id,
    required String caseId,
    required String userId,
    required DateTime createdAt,
    this.impactTags = const Value.absent(),
    this.countsAsFormalSignature = const Value.absent(),
    this.isResident = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientUuid = Value(clientUuid),
       updatedAt = Value(updatedAt),
       id = Value(id),
       caseId = Value(caseId),
       userId = Value(userId),
       createdAt = Value(createdAt);
  static Insertable<Endorsement> custom({
    Expression<String>? clientUuid,
    Expression<String>? syncStatus,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<String>? impactTags,
    Expression<bool>? countsAsFormalSignature,
    Expression<bool>? isResident,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (impactTags != null) 'impact_tags': impactTags,
      if (countsAsFormalSignature != null)
        'counts_as_formal_signature': countsAsFormalSignature,
      if (isResident != null) 'is_resident': isResident,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EndorsementsCompanion copyWith({
    Value<String>? clientUuid,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? caseId,
    Value<String>? userId,
    Value<DateTime>? createdAt,
    Value<String>? impactTags,
    Value<bool>? countsAsFormalSignature,
    Value<bool>? isResident,
    Value<int>? rowid,
  }) {
    return EndorsementsCompanion(
      clientUuid: clientUuid ?? this.clientUuid,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      impactTags: impactTags ?? this.impactTags,
      countsAsFormalSignature:
          countsAsFormalSignature ?? this.countsAsFormalSignature,
      isResident: isResident ?? this.isResident,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $EndorsementsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (impactTags.present) {
      map['impact_tags'] = Variable<String>(impactTags.value);
    }
    if (countsAsFormalSignature.present) {
      map['counts_as_formal_signature'] = Variable<bool>(
        countsAsFormalSignature.value,
      );
    }
    if (isResident.present) {
      map['is_resident'] = Variable<bool>(isResident.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EndorsementsCompanion(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('impactTags: $impactTags, ')
          ..write('countsAsFormalSignature: $countsAsFormalSignature, ')
          ..write('isResident: $isResident, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CaseActionsTable extends CaseActions
    with TableInfo<$CaseActionsTable, CaseAction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaseActionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pendiente.name),
      ).withConverter<SyncStatus>($CaseActionsTable.$convertersyncStatus);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
    'case_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CaseActionType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CaseActionType>($CaseActionsTable.$convertertype);
  static const VerificationMeta _performedByMeta = const VerificationMeta(
    'performedBy',
  );
  @override
  late final GeneratedColumn<String> performedBy = GeneratedColumn<String>(
    'performed_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _performedAtMeta = const VerificationMeta(
    'performedAt',
  );
  @override
  late final GeneratedColumn<DateTime> performedAt = GeneratedColumn<DateTime>(
    'performed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _channelMeta = const VerificationMeta(
    'channel',
  );
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
    'channel',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _documentUrlMeta = const VerificationMeta(
    'documentUrl',
  );
  @override
  late final GeneratedColumn<String> documentUrl = GeneratedColumn<String>(
    'document_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receiptRefMeta = const VerificationMeta(
    'receiptRef',
  );
  @override
  late final GeneratedColumn<String> receiptRef = GeneratedColumn<String>(
    'receipt_ref',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _externalRefMeta = const VerificationMeta(
    'externalRef',
  );
  @override
  late final GeneratedColumn<String> externalRef = GeneratedColumn<String>(
    'external_ref',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    type,
    performedBy,
    performedAt,
    channel,
    documentUrl,
    receiptRef,
    externalRef,
    payload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_actions';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaseAction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(
        _caseIdMeta,
        caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('performed_by')) {
      context.handle(
        _performedByMeta,
        performedBy.isAcceptableOrUnknown(
          data['performed_by']!,
          _performedByMeta,
        ),
      );
    }
    if (data.containsKey('performed_at')) {
      context.handle(
        _performedAtMeta,
        performedAt.isAcceptableOrUnknown(
          data['performed_at']!,
          _performedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_performedAtMeta);
    }
    if (data.containsKey('channel')) {
      context.handle(
        _channelMeta,
        channel.isAcceptableOrUnknown(data['channel']!, _channelMeta),
      );
    }
    if (data.containsKey('document_url')) {
      context.handle(
        _documentUrlMeta,
        documentUrl.isAcceptableOrUnknown(
          data['document_url']!,
          _documentUrlMeta,
        ),
      );
    }
    if (data.containsKey('receipt_ref')) {
      context.handle(
        _receiptRefMeta,
        receiptRef.isAcceptableOrUnknown(data['receipt_ref']!, _receiptRefMeta),
      );
    }
    if (data.containsKey('external_ref')) {
      context.handle(
        _externalRefMeta,
        externalRef.isAcceptableOrUnknown(
          data['external_ref']!,
          _externalRefMeta,
        ),
      );
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseAction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseAction(
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      syncStatus: $CaseActionsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      caseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_id'],
      )!,
      type: $CaseActionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      performedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}performed_by'],
      ),
      performedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}performed_at'],
      )!,
      channel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel'],
      ),
      documentUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document_url'],
      ),
      receiptRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_ref'],
      ),
      externalRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_ref'],
      ),
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      ),
    );
  }

  @override
  $CaseActionsTable createAlias(String alias) {
    return $CaseActionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<CaseActionType, String, String> $convertertype =
      const EnumNameConverter<CaseActionType>(CaseActionType.values);
}

class CaseAction extends DataClass implements Insertable<CaseAction> {
  /// Idempotencia: el servidor deduplica por este uuid (§20.2).
  final String clientUuid;

  /// Estado de sincronización visible por ítem en la UI (§20.2).
  final SyncStatus syncStatus;

  /// Última modificación local (last-write-wins salvo contadores).
  final DateTime updatedAt;
  final String id;
  final String caseId;
  final CaseActionType type;
  final String? performedBy;
  final DateTime performedAt;

  /// email | form | open311 | pdf (§14.2).
  final String? channel;
  final String? documentUrl;
  final String? receiptRef;
  final String? externalRef;
  final String? payload;
  const CaseAction({
    required this.clientUuid,
    required this.syncStatus,
    required this.updatedAt,
    required this.id,
    required this.caseId,
    required this.type,
    this.performedBy,
    required this.performedAt,
    this.channel,
    this.documentUrl,
    this.receiptRef,
    this.externalRef,
    this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_uuid'] = Variable<String>(clientUuid);
    {
      map['sync_status'] = Variable<String>(
        $CaseActionsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    {
      map['type'] = Variable<String>(
        $CaseActionsTable.$convertertype.toSql(type),
      );
    }
    if (!nullToAbsent || performedBy != null) {
      map['performed_by'] = Variable<String>(performedBy);
    }
    map['performed_at'] = Variable<DateTime>(performedAt);
    if (!nullToAbsent || channel != null) {
      map['channel'] = Variable<String>(channel);
    }
    if (!nullToAbsent || documentUrl != null) {
      map['document_url'] = Variable<String>(documentUrl);
    }
    if (!nullToAbsent || receiptRef != null) {
      map['receipt_ref'] = Variable<String>(receiptRef);
    }
    if (!nullToAbsent || externalRef != null) {
      map['external_ref'] = Variable<String>(externalRef);
    }
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    return map;
  }

  CaseActionsCompanion toCompanion(bool nullToAbsent) {
    return CaseActionsCompanion(
      clientUuid: Value(clientUuid),
      syncStatus: Value(syncStatus),
      updatedAt: Value(updatedAt),
      id: Value(id),
      caseId: Value(caseId),
      type: Value(type),
      performedBy: performedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(performedBy),
      performedAt: Value(performedAt),
      channel: channel == null && nullToAbsent
          ? const Value.absent()
          : Value(channel),
      documentUrl: documentUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(documentUrl),
      receiptRef: receiptRef == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptRef),
      externalRef: externalRef == null && nullToAbsent
          ? const Value.absent()
          : Value(externalRef),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
    );
  }

  factory CaseAction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseAction(
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      syncStatus: $CaseActionsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      type: $CaseActionsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      performedBy: serializer.fromJson<String?>(json['performedBy']),
      performedAt: serializer.fromJson<DateTime>(json['performedAt']),
      channel: serializer.fromJson<String?>(json['channel']),
      documentUrl: serializer.fromJson<String?>(json['documentUrl']),
      receiptRef: serializer.fromJson<String?>(json['receiptRef']),
      externalRef: serializer.fromJson<String?>(json['externalRef']),
      payload: serializer.fromJson<String?>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientUuid': serializer.toJson<String>(clientUuid),
      'syncStatus': serializer.toJson<String>(
        $CaseActionsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'type': serializer.toJson<String>(
        $CaseActionsTable.$convertertype.toJson(type),
      ),
      'performedBy': serializer.toJson<String?>(performedBy),
      'performedAt': serializer.toJson<DateTime>(performedAt),
      'channel': serializer.toJson<String?>(channel),
      'documentUrl': serializer.toJson<String?>(documentUrl),
      'receiptRef': serializer.toJson<String?>(receiptRef),
      'externalRef': serializer.toJson<String?>(externalRef),
      'payload': serializer.toJson<String?>(payload),
    };
  }

  CaseAction copyWith({
    String? clientUuid,
    SyncStatus? syncStatus,
    DateTime? updatedAt,
    String? id,
    String? caseId,
    CaseActionType? type,
    Value<String?> performedBy = const Value.absent(),
    DateTime? performedAt,
    Value<String?> channel = const Value.absent(),
    Value<String?> documentUrl = const Value.absent(),
    Value<String?> receiptRef = const Value.absent(),
    Value<String?> externalRef = const Value.absent(),
    Value<String?> payload = const Value.absent(),
  }) => CaseAction(
    clientUuid: clientUuid ?? this.clientUuid,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    type: type ?? this.type,
    performedBy: performedBy.present ? performedBy.value : this.performedBy,
    performedAt: performedAt ?? this.performedAt,
    channel: channel.present ? channel.value : this.channel,
    documentUrl: documentUrl.present ? documentUrl.value : this.documentUrl,
    receiptRef: receiptRef.present ? receiptRef.value : this.receiptRef,
    externalRef: externalRef.present ? externalRef.value : this.externalRef,
    payload: payload.present ? payload.value : this.payload,
  );
  CaseAction copyWithCompanion(CaseActionsCompanion data) {
    return CaseAction(
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      type: data.type.present ? data.type.value : this.type,
      performedBy: data.performedBy.present
          ? data.performedBy.value
          : this.performedBy,
      performedAt: data.performedAt.present
          ? data.performedAt.value
          : this.performedAt,
      channel: data.channel.present ? data.channel.value : this.channel,
      documentUrl: data.documentUrl.present
          ? data.documentUrl.value
          : this.documentUrl,
      receiptRef: data.receiptRef.present
          ? data.receiptRef.value
          : this.receiptRef,
      externalRef: data.externalRef.present
          ? data.externalRef.value
          : this.externalRef,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseAction(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('type: $type, ')
          ..write('performedBy: $performedBy, ')
          ..write('performedAt: $performedAt, ')
          ..write('channel: $channel, ')
          ..write('documentUrl: $documentUrl, ')
          ..write('receiptRef: $receiptRef, ')
          ..write('externalRef: $externalRef, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    type,
    performedBy,
    performedAt,
    channel,
    documentUrl,
    receiptRef,
    externalRef,
    payload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseAction &&
          other.clientUuid == this.clientUuid &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.type == this.type &&
          other.performedBy == this.performedBy &&
          other.performedAt == this.performedAt &&
          other.channel == this.channel &&
          other.documentUrl == this.documentUrl &&
          other.receiptRef == this.receiptRef &&
          other.externalRef == this.externalRef &&
          other.payload == this.payload);
}

class CaseActionsCompanion extends UpdateCompanion<CaseAction> {
  final Value<String> clientUuid;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> caseId;
  final Value<CaseActionType> type;
  final Value<String?> performedBy;
  final Value<DateTime> performedAt;
  final Value<String?> channel;
  final Value<String?> documentUrl;
  final Value<String?> receiptRef;
  final Value<String?> externalRef;
  final Value<String?> payload;
  final Value<int> rowid;
  const CaseActionsCompanion({
    this.clientUuid = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.type = const Value.absent(),
    this.performedBy = const Value.absent(),
    this.performedAt = const Value.absent(),
    this.channel = const Value.absent(),
    this.documentUrl = const Value.absent(),
    this.receiptRef = const Value.absent(),
    this.externalRef = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CaseActionsCompanion.insert({
    required String clientUuid,
    this.syncStatus = const Value.absent(),
    required DateTime updatedAt,
    required String id,
    required String caseId,
    required CaseActionType type,
    this.performedBy = const Value.absent(),
    required DateTime performedAt,
    this.channel = const Value.absent(),
    this.documentUrl = const Value.absent(),
    this.receiptRef = const Value.absent(),
    this.externalRef = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientUuid = Value(clientUuid),
       updatedAt = Value(updatedAt),
       id = Value(id),
       caseId = Value(caseId),
       type = Value(type),
       performedAt = Value(performedAt);
  static Insertable<CaseAction> custom({
    Expression<String>? clientUuid,
    Expression<String>? syncStatus,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? type,
    Expression<String>? performedBy,
    Expression<DateTime>? performedAt,
    Expression<String>? channel,
    Expression<String>? documentUrl,
    Expression<String>? receiptRef,
    Expression<String>? externalRef,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (type != null) 'type': type,
      if (performedBy != null) 'performed_by': performedBy,
      if (performedAt != null) 'performed_at': performedAt,
      if (channel != null) 'channel': channel,
      if (documentUrl != null) 'document_url': documentUrl,
      if (receiptRef != null) 'receipt_ref': receiptRef,
      if (externalRef != null) 'external_ref': externalRef,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CaseActionsCompanion copyWith({
    Value<String>? clientUuid,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? caseId,
    Value<CaseActionType>? type,
    Value<String?>? performedBy,
    Value<DateTime>? performedAt,
    Value<String?>? channel,
    Value<String?>? documentUrl,
    Value<String?>? receiptRef,
    Value<String?>? externalRef,
    Value<String?>? payload,
    Value<int>? rowid,
  }) {
    return CaseActionsCompanion(
      clientUuid: clientUuid ?? this.clientUuid,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      type: type ?? this.type,
      performedBy: performedBy ?? this.performedBy,
      performedAt: performedAt ?? this.performedAt,
      channel: channel ?? this.channel,
      documentUrl: documentUrl ?? this.documentUrl,
      receiptRef: receiptRef ?? this.receiptRef,
      externalRef: externalRef ?? this.externalRef,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $CaseActionsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $CaseActionsTable.$convertertype.toSql(type.value),
      );
    }
    if (performedBy.present) {
      map['performed_by'] = Variable<String>(performedBy.value);
    }
    if (performedAt.present) {
      map['performed_at'] = Variable<DateTime>(performedAt.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(channel.value);
    }
    if (documentUrl.present) {
      map['document_url'] = Variable<String>(documentUrl.value);
    }
    if (receiptRef.present) {
      map['receipt_ref'] = Variable<String>(receiptRef.value);
    }
    if (externalRef.present) {
      map['external_ref'] = Variable<String>(externalRef.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaseActionsCompanion(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('type: $type, ')
          ..write('performedBy: $performedBy, ')
          ..write('performedAt: $performedAt, ')
          ..write('channel: $channel, ')
          ..write('documentUrl: $documentUrl, ')
          ..write('receiptRef: $receiptRef, ')
          ..write('externalRef: $externalRef, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfficialResponsesTable extends OfficialResponses
    with TableInfo<$OfficialResponsesTable, OfficialResponse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfficialResponsesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
    'case_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organismIdMeta = const VerificationMeta(
    'organismId',
  );
  @override
  late final GeneratedColumn<String> organismId = GeneratedColumn<String>(
    'organism_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
    'received_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _documentUrlMeta = const VerificationMeta(
    'documentUrl',
  );
  @override
  late final GeneratedColumn<String> documentUrl = GeneratedColumn<String>(
    'document_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isResolutionMeta = const VerificationMeta(
    'isResolution',
  );
  @override
  late final GeneratedColumn<bool> isResolution = GeneratedColumn<bool>(
    'is_resolution',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_resolution" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _registeredByMeta = const VerificationMeta(
    'registeredBy',
  );
  @override
  late final GeneratedColumn<String> registeredBy = GeneratedColumn<String>(
    'registered_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    caseId,
    organismId,
    receivedAt,
    content,
    documentUrl,
    isResolution,
    registeredBy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'official_responses';
  @override
  VerificationContext validateIntegrity(
    Insertable<OfficialResponse> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(
        _caseIdMeta,
        caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('organism_id')) {
      context.handle(
        _organismIdMeta,
        organismId.isAcceptableOrUnknown(data['organism_id']!, _organismIdMeta),
      );
    } else if (isInserting) {
      context.missing(_organismIdMeta);
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_receivedAtMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('document_url')) {
      context.handle(
        _documentUrlMeta,
        documentUrl.isAcceptableOrUnknown(
          data['document_url']!,
          _documentUrlMeta,
        ),
      );
    }
    if (data.containsKey('is_resolution')) {
      context.handle(
        _isResolutionMeta,
        isResolution.isAcceptableOrUnknown(
          data['is_resolution']!,
          _isResolutionMeta,
        ),
      );
    }
    if (data.containsKey('registered_by')) {
      context.handle(
        _registeredByMeta,
        registeredBy.isAcceptableOrUnknown(
          data['registered_by']!,
          _registeredByMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfficialResponse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfficialResponse(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      caseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_id'],
      )!,
      organismId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organism_id'],
      )!,
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}received_at'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      documentUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document_url'],
      ),
      isResolution: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_resolution'],
      )!,
      registeredBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registered_by'],
      ),
    );
  }

  @override
  $OfficialResponsesTable createAlias(String alias) {
    return $OfficialResponsesTable(attachedDatabase, alias);
  }
}

class OfficialResponse extends DataClass
    implements Insertable<OfficialResponse> {
  final String id;
  final String caseId;
  final String organismId;
  final DateTime receivedAt;
  final String content;
  final String? documentUrl;
  final bool isResolution;
  final String? registeredBy;
  const OfficialResponse({
    required this.id,
    required this.caseId,
    required this.organismId,
    required this.receivedAt,
    required this.content,
    this.documentUrl,
    required this.isResolution,
    this.registeredBy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    map['organism_id'] = Variable<String>(organismId);
    map['received_at'] = Variable<DateTime>(receivedAt);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || documentUrl != null) {
      map['document_url'] = Variable<String>(documentUrl);
    }
    map['is_resolution'] = Variable<bool>(isResolution);
    if (!nullToAbsent || registeredBy != null) {
      map['registered_by'] = Variable<String>(registeredBy);
    }
    return map;
  }

  OfficialResponsesCompanion toCompanion(bool nullToAbsent) {
    return OfficialResponsesCompanion(
      id: Value(id),
      caseId: Value(caseId),
      organismId: Value(organismId),
      receivedAt: Value(receivedAt),
      content: Value(content),
      documentUrl: documentUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(documentUrl),
      isResolution: Value(isResolution),
      registeredBy: registeredBy == null && nullToAbsent
          ? const Value.absent()
          : Value(registeredBy),
    );
  }

  factory OfficialResponse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfficialResponse(
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      organismId: serializer.fromJson<String>(json['organismId']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      content: serializer.fromJson<String>(json['content']),
      documentUrl: serializer.fromJson<String?>(json['documentUrl']),
      isResolution: serializer.fromJson<bool>(json['isResolution']),
      registeredBy: serializer.fromJson<String?>(json['registeredBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'organismId': serializer.toJson<String>(organismId),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'content': serializer.toJson<String>(content),
      'documentUrl': serializer.toJson<String?>(documentUrl),
      'isResolution': serializer.toJson<bool>(isResolution),
      'registeredBy': serializer.toJson<String?>(registeredBy),
    };
  }

  OfficialResponse copyWith({
    String? id,
    String? caseId,
    String? organismId,
    DateTime? receivedAt,
    String? content,
    Value<String?> documentUrl = const Value.absent(),
    bool? isResolution,
    Value<String?> registeredBy = const Value.absent(),
  }) => OfficialResponse(
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    organismId: organismId ?? this.organismId,
    receivedAt: receivedAt ?? this.receivedAt,
    content: content ?? this.content,
    documentUrl: documentUrl.present ? documentUrl.value : this.documentUrl,
    isResolution: isResolution ?? this.isResolution,
    registeredBy: registeredBy.present ? registeredBy.value : this.registeredBy,
  );
  OfficialResponse copyWithCompanion(OfficialResponsesCompanion data) {
    return OfficialResponse(
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      organismId: data.organismId.present
          ? data.organismId.value
          : this.organismId,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      content: data.content.present ? data.content.value : this.content,
      documentUrl: data.documentUrl.present
          ? data.documentUrl.value
          : this.documentUrl,
      isResolution: data.isResolution.present
          ? data.isResolution.value
          : this.isResolution,
      registeredBy: data.registeredBy.present
          ? data.registeredBy.value
          : this.registeredBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfficialResponse(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('organismId: $organismId, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('content: $content, ')
          ..write('documentUrl: $documentUrl, ')
          ..write('isResolution: $isResolution, ')
          ..write('registeredBy: $registeredBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    caseId,
    organismId,
    receivedAt,
    content,
    documentUrl,
    isResolution,
    registeredBy,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfficialResponse &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.organismId == this.organismId &&
          other.receivedAt == this.receivedAt &&
          other.content == this.content &&
          other.documentUrl == this.documentUrl &&
          other.isResolution == this.isResolution &&
          other.registeredBy == this.registeredBy);
}

class OfficialResponsesCompanion extends UpdateCompanion<OfficialResponse> {
  final Value<String> id;
  final Value<String> caseId;
  final Value<String> organismId;
  final Value<DateTime> receivedAt;
  final Value<String> content;
  final Value<String?> documentUrl;
  final Value<bool> isResolution;
  final Value<String?> registeredBy;
  final Value<int> rowid;
  const OfficialResponsesCompanion({
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.organismId = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.content = const Value.absent(),
    this.documentUrl = const Value.absent(),
    this.isResolution = const Value.absent(),
    this.registeredBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OfficialResponsesCompanion.insert({
    required String id,
    required String caseId,
    required String organismId,
    required DateTime receivedAt,
    required String content,
    this.documentUrl = const Value.absent(),
    this.isResolution = const Value.absent(),
    this.registeredBy = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       caseId = Value(caseId),
       organismId = Value(organismId),
       receivedAt = Value(receivedAt),
       content = Value(content);
  static Insertable<OfficialResponse> custom({
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? organismId,
    Expression<DateTime>? receivedAt,
    Expression<String>? content,
    Expression<String>? documentUrl,
    Expression<bool>? isResolution,
    Expression<String>? registeredBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (organismId != null) 'organism_id': organismId,
      if (receivedAt != null) 'received_at': receivedAt,
      if (content != null) 'content': content,
      if (documentUrl != null) 'document_url': documentUrl,
      if (isResolution != null) 'is_resolution': isResolution,
      if (registeredBy != null) 'registered_by': registeredBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OfficialResponsesCompanion copyWith({
    Value<String>? id,
    Value<String>? caseId,
    Value<String>? organismId,
    Value<DateTime>? receivedAt,
    Value<String>? content,
    Value<String?>? documentUrl,
    Value<bool>? isResolution,
    Value<String?>? registeredBy,
    Value<int>? rowid,
  }) {
    return OfficialResponsesCompanion(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      organismId: organismId ?? this.organismId,
      receivedAt: receivedAt ?? this.receivedAt,
      content: content ?? this.content,
      documentUrl: documentUrl ?? this.documentUrl,
      isResolution: isResolution ?? this.isResolution,
      registeredBy: registeredBy ?? this.registeredBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (organismId.present) {
      map['organism_id'] = Variable<String>(organismId.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (documentUrl.present) {
      map['document_url'] = Variable<String>(documentUrl.value);
    }
    if (isResolution.present) {
      map['is_resolution'] = Variable<bool>(isResolution.value);
    }
    if (registeredBy.present) {
      map['registered_by'] = Variable<String>(registeredBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfficialResponsesCompanion(')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('organismId: $organismId, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('content: $content, ')
          ..write('documentUrl: $documentUrl, ')
          ..write('isResolution: $isResolution, ')
          ..write('registeredBy: $registeredBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResolutionsTable extends Resolutions
    with TableInfo<$ResolutionsTable, Resolution> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResolutionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pendiente.name),
      ).withConverter<SyncStatus>($ResolutionsTable.$convertersyncStatus);
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caseIdMeta = const VerificationMeta('caseId');
  @override
  late final GeneratedColumn<String> caseId = GeneratedColumn<String>(
    'case_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _afterPhotoIdMeta = const VerificationMeta(
    'afterPhotoId',
  );
  @override
  late final GeneratedColumn<String> afterPhotoId = GeneratedColumn<String>(
    'after_photo_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _claimedByMeta = const VerificationMeta(
    'claimedBy',
  );
  @override
  late final GeneratedColumn<String> claimedBy = GeneratedColumn<String>(
    'claimed_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _claimedAtMeta = const VerificationMeta(
    'claimedAt',
  );
  @override
  late final GeneratedColumn<DateTime> claimedAt = GeneratedColumn<DateTime>(
    'claimed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confirmationsMeta = const VerificationMeta(
    'confirmations',
  );
  @override
  late final GeneratedColumn<String> confirmations = GeneratedColumn<String>(
    'confirmations',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _confirmedAtMeta = const VerificationMeta(
    'confirmedAt',
  );
  @override
  late final GeneratedColumn<DateTime> confirmedAt = GeneratedColumn<DateTime>(
    'confirmed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    afterPhotoId,
    claimedBy,
    claimedAt,
    confirmations,
    confirmedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resolutions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Resolution> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('case_id')) {
      context.handle(
        _caseIdMeta,
        caseId.isAcceptableOrUnknown(data['case_id']!, _caseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_caseIdMeta);
    }
    if (data.containsKey('after_photo_id')) {
      context.handle(
        _afterPhotoIdMeta,
        afterPhotoId.isAcceptableOrUnknown(
          data['after_photo_id']!,
          _afterPhotoIdMeta,
        ),
      );
    }
    if (data.containsKey('claimed_by')) {
      context.handle(
        _claimedByMeta,
        claimedBy.isAcceptableOrUnknown(data['claimed_by']!, _claimedByMeta),
      );
    } else if (isInserting) {
      context.missing(_claimedByMeta);
    }
    if (data.containsKey('claimed_at')) {
      context.handle(
        _claimedAtMeta,
        claimedAt.isAcceptableOrUnknown(data['claimed_at']!, _claimedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_claimedAtMeta);
    }
    if (data.containsKey('confirmations')) {
      context.handle(
        _confirmationsMeta,
        confirmations.isAcceptableOrUnknown(
          data['confirmations']!,
          _confirmationsMeta,
        ),
      );
    }
    if (data.containsKey('confirmed_at')) {
      context.handle(
        _confirmedAtMeta,
        confirmedAt.isAcceptableOrUnknown(
          data['confirmed_at']!,
          _confirmedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Resolution map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Resolution(
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      syncStatus: $ResolutionsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      caseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_id'],
      )!,
      afterPhotoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}after_photo_id'],
      ),
      claimedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}claimed_by'],
      )!,
      claimedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}claimed_at'],
      )!,
      confirmations: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}confirmations'],
      )!,
      confirmedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}confirmed_at'],
      ),
    );
  }

  @override
  $ResolutionsTable createAlias(String alias) {
    return $ResolutionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class Resolution extends DataClass implements Insertable<Resolution> {
  /// Idempotencia: el servidor deduplica por este uuid (§20.2).
  final String clientUuid;

  /// Estado de sincronización visible por ítem en la UI (§20.2).
  final SyncStatus syncStatus;

  /// Última modificación local (last-write-wins salvo contadores).
  final DateTime updatedAt;
  final String id;
  final String caseId;
  final String? afterPhotoId;
  final String claimedBy;
  final DateTime claimedAt;

  /// JSON: [{userId, at}] — hacen falta 2 confirmaciones (§11).
  final String confirmations;
  final DateTime? confirmedAt;
  const Resolution({
    required this.clientUuid,
    required this.syncStatus,
    required this.updatedAt,
    required this.id,
    required this.caseId,
    this.afterPhotoId,
    required this.claimedBy,
    required this.claimedAt,
    required this.confirmations,
    this.confirmedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_uuid'] = Variable<String>(clientUuid);
    {
      map['sync_status'] = Variable<String>(
        $ResolutionsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['case_id'] = Variable<String>(caseId);
    if (!nullToAbsent || afterPhotoId != null) {
      map['after_photo_id'] = Variable<String>(afterPhotoId);
    }
    map['claimed_by'] = Variable<String>(claimedBy);
    map['claimed_at'] = Variable<DateTime>(claimedAt);
    map['confirmations'] = Variable<String>(confirmations);
    if (!nullToAbsent || confirmedAt != null) {
      map['confirmed_at'] = Variable<DateTime>(confirmedAt);
    }
    return map;
  }

  ResolutionsCompanion toCompanion(bool nullToAbsent) {
    return ResolutionsCompanion(
      clientUuid: Value(clientUuid),
      syncStatus: Value(syncStatus),
      updatedAt: Value(updatedAt),
      id: Value(id),
      caseId: Value(caseId),
      afterPhotoId: afterPhotoId == null && nullToAbsent
          ? const Value.absent()
          : Value(afterPhotoId),
      claimedBy: Value(claimedBy),
      claimedAt: Value(claimedAt),
      confirmations: Value(confirmations),
      confirmedAt: confirmedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmedAt),
    );
  }

  factory Resolution.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Resolution(
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      syncStatus: $ResolutionsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      caseId: serializer.fromJson<String>(json['caseId']),
      afterPhotoId: serializer.fromJson<String?>(json['afterPhotoId']),
      claimedBy: serializer.fromJson<String>(json['claimedBy']),
      claimedAt: serializer.fromJson<DateTime>(json['claimedAt']),
      confirmations: serializer.fromJson<String>(json['confirmations']),
      confirmedAt: serializer.fromJson<DateTime?>(json['confirmedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientUuid': serializer.toJson<String>(clientUuid),
      'syncStatus': serializer.toJson<String>(
        $ResolutionsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'caseId': serializer.toJson<String>(caseId),
      'afterPhotoId': serializer.toJson<String?>(afterPhotoId),
      'claimedBy': serializer.toJson<String>(claimedBy),
      'claimedAt': serializer.toJson<DateTime>(claimedAt),
      'confirmations': serializer.toJson<String>(confirmations),
      'confirmedAt': serializer.toJson<DateTime?>(confirmedAt),
    };
  }

  Resolution copyWith({
    String? clientUuid,
    SyncStatus? syncStatus,
    DateTime? updatedAt,
    String? id,
    String? caseId,
    Value<String?> afterPhotoId = const Value.absent(),
    String? claimedBy,
    DateTime? claimedAt,
    String? confirmations,
    Value<DateTime?> confirmedAt = const Value.absent(),
  }) => Resolution(
    clientUuid: clientUuid ?? this.clientUuid,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    caseId: caseId ?? this.caseId,
    afterPhotoId: afterPhotoId.present ? afterPhotoId.value : this.afterPhotoId,
    claimedBy: claimedBy ?? this.claimedBy,
    claimedAt: claimedAt ?? this.claimedAt,
    confirmations: confirmations ?? this.confirmations,
    confirmedAt: confirmedAt.present ? confirmedAt.value : this.confirmedAt,
  );
  Resolution copyWithCompanion(ResolutionsCompanion data) {
    return Resolution(
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      caseId: data.caseId.present ? data.caseId.value : this.caseId,
      afterPhotoId: data.afterPhotoId.present
          ? data.afterPhotoId.value
          : this.afterPhotoId,
      claimedBy: data.claimedBy.present ? data.claimedBy.value : this.claimedBy,
      claimedAt: data.claimedAt.present ? data.claimedAt.value : this.claimedAt,
      confirmations: data.confirmations.present
          ? data.confirmations.value
          : this.confirmations,
      confirmedAt: data.confirmedAt.present
          ? data.confirmedAt.value
          : this.confirmedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Resolution(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('afterPhotoId: $afterPhotoId, ')
          ..write('claimedBy: $claimedBy, ')
          ..write('claimedAt: $claimedAt, ')
          ..write('confirmations: $confirmations, ')
          ..write('confirmedAt: $confirmedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clientUuid,
    syncStatus,
    updatedAt,
    id,
    caseId,
    afterPhotoId,
    claimedBy,
    claimedAt,
    confirmations,
    confirmedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Resolution &&
          other.clientUuid == this.clientUuid &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.caseId == this.caseId &&
          other.afterPhotoId == this.afterPhotoId &&
          other.claimedBy == this.claimedBy &&
          other.claimedAt == this.claimedAt &&
          other.confirmations == this.confirmations &&
          other.confirmedAt == this.confirmedAt);
}

class ResolutionsCompanion extends UpdateCompanion<Resolution> {
  final Value<String> clientUuid;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> caseId;
  final Value<String?> afterPhotoId;
  final Value<String> claimedBy;
  final Value<DateTime> claimedAt;
  final Value<String> confirmations;
  final Value<DateTime?> confirmedAt;
  final Value<int> rowid;
  const ResolutionsCompanion({
    this.clientUuid = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.caseId = const Value.absent(),
    this.afterPhotoId = const Value.absent(),
    this.claimedBy = const Value.absent(),
    this.claimedAt = const Value.absent(),
    this.confirmations = const Value.absent(),
    this.confirmedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResolutionsCompanion.insert({
    required String clientUuid,
    this.syncStatus = const Value.absent(),
    required DateTime updatedAt,
    required String id,
    required String caseId,
    this.afterPhotoId = const Value.absent(),
    required String claimedBy,
    required DateTime claimedAt,
    this.confirmations = const Value.absent(),
    this.confirmedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clientUuid = Value(clientUuid),
       updatedAt = Value(updatedAt),
       id = Value(id),
       caseId = Value(caseId),
       claimedBy = Value(claimedBy),
       claimedAt = Value(claimedAt);
  static Insertable<Resolution> custom({
    Expression<String>? clientUuid,
    Expression<String>? syncStatus,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? caseId,
    Expression<String>? afterPhotoId,
    Expression<String>? claimedBy,
    Expression<DateTime>? claimedAt,
    Expression<String>? confirmations,
    Expression<DateTime>? confirmedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (caseId != null) 'case_id': caseId,
      if (afterPhotoId != null) 'after_photo_id': afterPhotoId,
      if (claimedBy != null) 'claimed_by': claimedBy,
      if (claimedAt != null) 'claimed_at': claimedAt,
      if (confirmations != null) 'confirmations': confirmations,
      if (confirmedAt != null) 'confirmed_at': confirmedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResolutionsCompanion copyWith({
    Value<String>? clientUuid,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? caseId,
    Value<String?>? afterPhotoId,
    Value<String>? claimedBy,
    Value<DateTime>? claimedAt,
    Value<String>? confirmations,
    Value<DateTime?>? confirmedAt,
    Value<int>? rowid,
  }) {
    return ResolutionsCompanion(
      clientUuid: clientUuid ?? this.clientUuid,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      afterPhotoId: afterPhotoId ?? this.afterPhotoId,
      claimedBy: claimedBy ?? this.claimedBy,
      claimedAt: claimedAt ?? this.claimedAt,
      confirmations: confirmations ?? this.confirmations,
      confirmedAt: confirmedAt ?? this.confirmedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $ResolutionsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (caseId.present) {
      map['case_id'] = Variable<String>(caseId.value);
    }
    if (afterPhotoId.present) {
      map['after_photo_id'] = Variable<String>(afterPhotoId.value);
    }
    if (claimedBy.present) {
      map['claimed_by'] = Variable<String>(claimedBy.value);
    }
    if (claimedAt.present) {
      map['claimed_at'] = Variable<DateTime>(claimedAt.value);
    }
    if (confirmations.present) {
      map['confirmations'] = Variable<String>(confirmations.value);
    }
    if (confirmedAt.present) {
      map['confirmed_at'] = Variable<DateTime>(confirmedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResolutionsCompanion(')
          ..write('clientUuid: $clientUuid, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('caseId: $caseId, ')
          ..write('afterPhotoId: $afterPhotoId, ')
          ..write('claimedBy: $claimedBy, ')
          ..write('claimedAt: $claimedAt, ')
          ..write('confirmations: $confirmations, ')
          ..write('confirmedAt: $confirmedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _homeNeighborhoodIdMeta =
      const VerificationMeta('homeNeighborhoodId');
  @override
  late final GeneratedColumn<String> homeNeighborhoodId =
      GeneratedColumn<String>(
        'home_neighborhood_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _homeGeohashMeta = const VerificationMeta(
    'homeGeohash',
  );
  @override
  late final GeneratedColumn<String> homeGeohash = GeneratedColumn<String>(
    'home_geohash',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 7),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<UserRole, String> role =
      GeneratedColumn<String>(
        'role',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UserRole>($UsersTable.$converterrole);
  static const VerificationMeta _verificationLevelMeta = const VerificationMeta(
    'verificationLevel',
  );
  @override
  late final GeneratedColumn<int> verificationLevel = GeneratedColumn<int>(
    'verification_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _gpsPresenceDaysMeta = const VerificationMeta(
    'gpsPresenceDays',
  );
  @override
  late final GeneratedColumn<int> gpsPresenceDays = GeneratedColumn<int>(
    'gps_presence_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notificationPrefsMeta = const VerificationMeta(
    'notificationPrefs',
  );
  @override
  late final GeneratedColumn<String> notificationPrefs =
      GeneratedColumn<String>(
        'notification_prefs',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('{}'),
      );
  static const VerificationMeta _localeMeta = const VerificationMeta('locale');
  @override
  late final GeneratedColumn<String> locale = GeneratedColumn<String>(
    'locale',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('es'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayName,
    email,
    phone,
    homeNeighborhoodId,
    homeGeohash,
    role,
    verificationLevel,
    gpsPresenceDays,
    notificationPrefs,
    locale,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('home_neighborhood_id')) {
      context.handle(
        _homeNeighborhoodIdMeta,
        homeNeighborhoodId.isAcceptableOrUnknown(
          data['home_neighborhood_id']!,
          _homeNeighborhoodIdMeta,
        ),
      );
    }
    if (data.containsKey('home_geohash')) {
      context.handle(
        _homeGeohashMeta,
        homeGeohash.isAcceptableOrUnknown(
          data['home_geohash']!,
          _homeGeohashMeta,
        ),
      );
    }
    if (data.containsKey('verification_level')) {
      context.handle(
        _verificationLevelMeta,
        verificationLevel.isAcceptableOrUnknown(
          data['verification_level']!,
          _verificationLevelMeta,
        ),
      );
    }
    if (data.containsKey('gps_presence_days')) {
      context.handle(
        _gpsPresenceDaysMeta,
        gpsPresenceDays.isAcceptableOrUnknown(
          data['gps_presence_days']!,
          _gpsPresenceDaysMeta,
        ),
      );
    }
    if (data.containsKey('notification_prefs')) {
      context.handle(
        _notificationPrefsMeta,
        notificationPrefs.isAcceptableOrUnknown(
          data['notification_prefs']!,
          _notificationPrefsMeta,
        ),
      );
    }
    if (data.containsKey('locale')) {
      context.handle(
        _localeMeta,
        locale.isAcceptableOrUnknown(data['locale']!, _localeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      homeNeighborhoodId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_neighborhood_id'],
      ),
      homeGeohash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_geohash'],
      ),
      role: $UsersTable.$converterrole.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}role'],
        )!,
      ),
      verificationLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verification_level'],
      )!,
      gpsPresenceDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gps_presence_days'],
      )!,
      notificationPrefs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notification_prefs'],
      )!,
      locale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locale'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserRole, String, String> $converterrole =
      const EnumNameConverter<UserRole>(UserRole.values);
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String displayName;
  final String? email;
  final String? phone;
  final String? homeNeighborhoodId;

  /// Geohash de 7 caracteres (~150 m). Nunca dirección exacta (§19).
  final String? homeGeohash;
  final UserRole role;
  final int verificationLevel;
  final int gpsPresenceDays;
  final String notificationPrefs;
  final String locale;
  final DateTime createdAt;
  const User({
    required this.id,
    required this.displayName,
    this.email,
    this.phone,
    this.homeNeighborhoodId,
    this.homeGeohash,
    required this.role,
    required this.verificationLevel,
    required this.gpsPresenceDays,
    required this.notificationPrefs,
    required this.locale,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || homeNeighborhoodId != null) {
      map['home_neighborhood_id'] = Variable<String>(homeNeighborhoodId);
    }
    if (!nullToAbsent || homeGeohash != null) {
      map['home_geohash'] = Variable<String>(homeGeohash);
    }
    {
      map['role'] = Variable<String>($UsersTable.$converterrole.toSql(role));
    }
    map['verification_level'] = Variable<int>(verificationLevel);
    map['gps_presence_days'] = Variable<int>(gpsPresenceDays);
    map['notification_prefs'] = Variable<String>(notificationPrefs);
    map['locale'] = Variable<String>(locale);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      displayName: Value(displayName),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      homeNeighborhoodId: homeNeighborhoodId == null && nullToAbsent
          ? const Value.absent()
          : Value(homeNeighborhoodId),
      homeGeohash: homeGeohash == null && nullToAbsent
          ? const Value.absent()
          : Value(homeGeohash),
      role: Value(role),
      verificationLevel: Value(verificationLevel),
      gpsPresenceDays: Value(gpsPresenceDays),
      notificationPrefs: Value(notificationPrefs),
      locale: Value(locale),
      createdAt: Value(createdAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      homeNeighborhoodId: serializer.fromJson<String?>(
        json['homeNeighborhoodId'],
      ),
      homeGeohash: serializer.fromJson<String?>(json['homeGeohash']),
      role: $UsersTable.$converterrole.fromJson(
        serializer.fromJson<String>(json['role']),
      ),
      verificationLevel: serializer.fromJson<int>(json['verificationLevel']),
      gpsPresenceDays: serializer.fromJson<int>(json['gpsPresenceDays']),
      notificationPrefs: serializer.fromJson<String>(json['notificationPrefs']),
      locale: serializer.fromJson<String>(json['locale']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'homeNeighborhoodId': serializer.toJson<String?>(homeNeighborhoodId),
      'homeGeohash': serializer.toJson<String?>(homeGeohash),
      'role': serializer.toJson<String>(
        $UsersTable.$converterrole.toJson(role),
      ),
      'verificationLevel': serializer.toJson<int>(verificationLevel),
      'gpsPresenceDays': serializer.toJson<int>(gpsPresenceDays),
      'notificationPrefs': serializer.toJson<String>(notificationPrefs),
      'locale': serializer.toJson<String>(locale),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  User copyWith({
    String? id,
    String? displayName,
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> homeNeighborhoodId = const Value.absent(),
    Value<String?> homeGeohash = const Value.absent(),
    UserRole? role,
    int? verificationLevel,
    int? gpsPresenceDays,
    String? notificationPrefs,
    String? locale,
    DateTime? createdAt,
  }) => User(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    homeNeighborhoodId: homeNeighborhoodId.present
        ? homeNeighborhoodId.value
        : this.homeNeighborhoodId,
    homeGeohash: homeGeohash.present ? homeGeohash.value : this.homeGeohash,
    role: role ?? this.role,
    verificationLevel: verificationLevel ?? this.verificationLevel,
    gpsPresenceDays: gpsPresenceDays ?? this.gpsPresenceDays,
    notificationPrefs: notificationPrefs ?? this.notificationPrefs,
    locale: locale ?? this.locale,
    createdAt: createdAt ?? this.createdAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      homeNeighborhoodId: data.homeNeighborhoodId.present
          ? data.homeNeighborhoodId.value
          : this.homeNeighborhoodId,
      homeGeohash: data.homeGeohash.present
          ? data.homeGeohash.value
          : this.homeGeohash,
      role: data.role.present ? data.role.value : this.role,
      verificationLevel: data.verificationLevel.present
          ? data.verificationLevel.value
          : this.verificationLevel,
      gpsPresenceDays: data.gpsPresenceDays.present
          ? data.gpsPresenceDays.value
          : this.gpsPresenceDays,
      notificationPrefs: data.notificationPrefs.present
          ? data.notificationPrefs.value
          : this.notificationPrefs,
      locale: data.locale.present ? data.locale.value : this.locale,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('homeNeighborhoodId: $homeNeighborhoodId, ')
          ..write('homeGeohash: $homeGeohash, ')
          ..write('role: $role, ')
          ..write('verificationLevel: $verificationLevel, ')
          ..write('gpsPresenceDays: $gpsPresenceDays, ')
          ..write('notificationPrefs: $notificationPrefs, ')
          ..write('locale: $locale, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    displayName,
    email,
    phone,
    homeNeighborhoodId,
    homeGeohash,
    role,
    verificationLevel,
    gpsPresenceDays,
    notificationPrefs,
    locale,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.homeNeighborhoodId == this.homeNeighborhoodId &&
          other.homeGeohash == this.homeGeohash &&
          other.role == this.role &&
          other.verificationLevel == this.verificationLevel &&
          other.gpsPresenceDays == this.gpsPresenceDays &&
          other.notificationPrefs == this.notificationPrefs &&
          other.locale == this.locale &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> homeNeighborhoodId;
  final Value<String?> homeGeohash;
  final Value<UserRole> role;
  final Value<int> verificationLevel;
  final Value<int> gpsPresenceDays;
  final Value<String> notificationPrefs;
  final Value<String> locale;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.homeNeighborhoodId = const Value.absent(),
    this.homeGeohash = const Value.absent(),
    this.role = const Value.absent(),
    this.verificationLevel = const Value.absent(),
    this.gpsPresenceDays = const Value.absent(),
    this.notificationPrefs = const Value.absent(),
    this.locale = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String displayName,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.homeNeighborhoodId = const Value.absent(),
    this.homeGeohash = const Value.absent(),
    required UserRole role,
    this.verificationLevel = const Value.absent(),
    this.gpsPresenceDays = const Value.absent(),
    this.notificationPrefs = const Value.absent(),
    this.locale = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       displayName = Value(displayName),
       role = Value(role),
       createdAt = Value(createdAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? homeNeighborhoodId,
    Expression<String>? homeGeohash,
    Expression<String>? role,
    Expression<int>? verificationLevel,
    Expression<int>? gpsPresenceDays,
    Expression<String>? notificationPrefs,
    Expression<String>? locale,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (homeNeighborhoodId != null)
        'home_neighborhood_id': homeNeighborhoodId,
      if (homeGeohash != null) 'home_geohash': homeGeohash,
      if (role != null) 'role': role,
      if (verificationLevel != null) 'verification_level': verificationLevel,
      if (gpsPresenceDays != null) 'gps_presence_days': gpsPresenceDays,
      if (notificationPrefs != null) 'notification_prefs': notificationPrefs,
      if (locale != null) 'locale': locale,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? displayName,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? homeNeighborhoodId,
    Value<String?>? homeGeohash,
    Value<UserRole>? role,
    Value<int>? verificationLevel,
    Value<int>? gpsPresenceDays,
    Value<String>? notificationPrefs,
    Value<String>? locale,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      homeNeighborhoodId: homeNeighborhoodId ?? this.homeNeighborhoodId,
      homeGeohash: homeGeohash ?? this.homeGeohash,
      role: role ?? this.role,
      verificationLevel: verificationLevel ?? this.verificationLevel,
      gpsPresenceDays: gpsPresenceDays ?? this.gpsPresenceDays,
      notificationPrefs: notificationPrefs ?? this.notificationPrefs,
      locale: locale ?? this.locale,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (homeNeighborhoodId.present) {
      map['home_neighborhood_id'] = Variable<String>(homeNeighborhoodId.value);
    }
    if (homeGeohash.present) {
      map['home_geohash'] = Variable<String>(homeGeohash.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(
        $UsersTable.$converterrole.toSql(role.value),
      );
    }
    if (verificationLevel.present) {
      map['verification_level'] = Variable<int>(verificationLevel.value);
    }
    if (gpsPresenceDays.present) {
      map['gps_presence_days'] = Variable<int>(gpsPresenceDays.value);
    }
    if (notificationPrefs.present) {
      map['notification_prefs'] = Variable<String>(notificationPrefs.value);
    }
    if (locale.present) {
      map['locale'] = Variable<String>(locale.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('homeNeighborhoodId: $homeNeighborhoodId, ')
          ..write('homeGeohash: $homeGeohash, ')
          ..write('role: $role, ')
          ..write('verificationLevel: $verificationLevel, ')
          ..write('gpsPresenceDays: $gpsPresenceDays, ')
          ..write('notificationPrefs: $notificationPrefs, ')
          ..write('locale: $locale, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncOpsTable extends SyncOps with TableInfo<$SyncOpsTable, SyncOp> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncOpsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
    'entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextAttemptAtMeta = const VerificationMeta(
    'nextAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextAttemptAt =
      GeneratedColumn<DateTime>(
        'next_attempt_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pendiente.name),
      ).withConverter<SyncStatus>($SyncOpsTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entity,
    entityId,
    clientUuid,
    operation,
    payload,
    createdAt,
    attempts,
    nextAttemptAt,
    lastError,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_ops';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncOp> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity')) {
      context.handle(
        _entityMeta,
        entity.isAcceptableOrUnknown(data['entity']!, _entityMeta),
      );
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('next_attempt_at')) {
      context.handle(
        _nextAttemptAtMeta,
        nextAttemptAt.isAcceptableOrUnknown(
          data['next_attempt_at']!,
          _nextAttemptAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextAttemptAtMeta);
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncOp map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncOp(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      nextAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_attempt_at'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      status: $SyncOpsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
    );
  }

  @override
  $SyncOpsTable createAlias(String alias) {
    return $SyncOpsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $converterstatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class SyncOp extends DataClass implements Insertable<SyncOp> {
  final int id;

  /// case | evidence | endorsement | neighborhood | ...
  final String entity;

  /// Id local (uuid) de la entidad.
  final String entityId;

  /// Idempotencia contra el servidor.
  final String clientUuid;

  /// crear | actualizar | borrar.
  final String operation;

  /// JSON del cuerpo a enviar.
  final String payload;
  final DateTime createdAt;
  final int attempts;
  final DateTime nextAttemptAt;
  final String? lastError;
  final SyncStatus status;
  const SyncOp({
    required this.id,
    required this.entity,
    required this.entityId,
    required this.clientUuid,
    required this.operation,
    required this.payload,
    required this.createdAt,
    required this.attempts,
    required this.nextAttemptAt,
    this.lastError,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity'] = Variable<String>(entity);
    map['entity_id'] = Variable<String>(entityId);
    map['client_uuid'] = Variable<String>(clientUuid);
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['attempts'] = Variable<int>(attempts);
    map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    {
      map['status'] = Variable<String>(
        $SyncOpsTable.$converterstatus.toSql(status),
      );
    }
    return map;
  }

  SyncOpsCompanion toCompanion(bool nullToAbsent) {
    return SyncOpsCompanion(
      id: Value(id),
      entity: Value(entity),
      entityId: Value(entityId),
      clientUuid: Value(clientUuid),
      operation: Value(operation),
      payload: Value(payload),
      createdAt: Value(createdAt),
      attempts: Value(attempts),
      nextAttemptAt: Value(nextAttemptAt),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      status: Value(status),
    );
  }

  factory SyncOp.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncOp(
      id: serializer.fromJson<int>(json['id']),
      entity: serializer.fromJson<String>(json['entity']),
      entityId: serializer.fromJson<String>(json['entityId']),
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      attempts: serializer.fromJson<int>(json['attempts']),
      nextAttemptAt: serializer.fromJson<DateTime>(json['nextAttemptAt']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      status: $SyncOpsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entity': serializer.toJson<String>(entity),
      'entityId': serializer.toJson<String>(entityId),
      'clientUuid': serializer.toJson<String>(clientUuid),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'attempts': serializer.toJson<int>(attempts),
      'nextAttemptAt': serializer.toJson<DateTime>(nextAttemptAt),
      'lastError': serializer.toJson<String?>(lastError),
      'status': serializer.toJson<String>(
        $SyncOpsTable.$converterstatus.toJson(status),
      ),
    };
  }

  SyncOp copyWith({
    int? id,
    String? entity,
    String? entityId,
    String? clientUuid,
    String? operation,
    String? payload,
    DateTime? createdAt,
    int? attempts,
    DateTime? nextAttemptAt,
    Value<String?> lastError = const Value.absent(),
    SyncStatus? status,
  }) => SyncOp(
    id: id ?? this.id,
    entity: entity ?? this.entity,
    entityId: entityId ?? this.entityId,
    clientUuid: clientUuid ?? this.clientUuid,
    operation: operation ?? this.operation,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
    attempts: attempts ?? this.attempts,
    nextAttemptAt: nextAttemptAt ?? this.nextAttemptAt,
    lastError: lastError.present ? lastError.value : this.lastError,
    status: status ?? this.status,
  );
  SyncOp copyWithCompanion(SyncOpsCompanion data) {
    return SyncOp(
      id: data.id.present ? data.id.value : this.id,
      entity: data.entity.present ? data.entity.value : this.entity,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      nextAttemptAt: data.nextAttemptAt.present
          ? data.nextAttemptAt.value
          : this.nextAttemptAt,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncOp(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('clientUuid: $clientUuid, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entity,
    entityId,
    clientUuid,
    operation,
    payload,
    createdAt,
    attempts,
    nextAttemptAt,
    lastError,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncOp &&
          other.id == this.id &&
          other.entity == this.entity &&
          other.entityId == this.entityId &&
          other.clientUuid == this.clientUuid &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.attempts == this.attempts &&
          other.nextAttemptAt == this.nextAttemptAt &&
          other.lastError == this.lastError &&
          other.status == this.status);
}

class SyncOpsCompanion extends UpdateCompanion<SyncOp> {
  final Value<int> id;
  final Value<String> entity;
  final Value<String> entityId;
  final Value<String> clientUuid;
  final Value<String> operation;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<int> attempts;
  final Value<DateTime> nextAttemptAt;
  final Value<String?> lastError;
  final Value<SyncStatus> status;
  const SyncOpsCompanion({
    this.id = const Value.absent(),
    this.entity = const Value.absent(),
    this.entityId = const Value.absent(),
    this.clientUuid = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.attempts = const Value.absent(),
    this.nextAttemptAt = const Value.absent(),
    this.lastError = const Value.absent(),
    this.status = const Value.absent(),
  });
  SyncOpsCompanion.insert({
    this.id = const Value.absent(),
    required String entity,
    required String entityId,
    required String clientUuid,
    required String operation,
    required String payload,
    required DateTime createdAt,
    this.attempts = const Value.absent(),
    required DateTime nextAttemptAt,
    this.lastError = const Value.absent(),
    this.status = const Value.absent(),
  }) : entity = Value(entity),
       entityId = Value(entityId),
       clientUuid = Value(clientUuid),
       operation = Value(operation),
       payload = Value(payload),
       createdAt = Value(createdAt),
       nextAttemptAt = Value(nextAttemptAt);
  static Insertable<SyncOp> custom({
    Expression<int>? id,
    Expression<String>? entity,
    Expression<String>? entityId,
    Expression<String>? clientUuid,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<int>? attempts,
    Expression<DateTime>? nextAttemptAt,
    Expression<String>? lastError,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entity != null) 'entity': entity,
      if (entityId != null) 'entity_id': entityId,
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (attempts != null) 'attempts': attempts,
      if (nextAttemptAt != null) 'next_attempt_at': nextAttemptAt,
      if (lastError != null) 'last_error': lastError,
      if (status != null) 'status': status,
    });
  }

  SyncOpsCompanion copyWith({
    Value<int>? id,
    Value<String>? entity,
    Value<String>? entityId,
    Value<String>? clientUuid,
    Value<String>? operation,
    Value<String>? payload,
    Value<DateTime>? createdAt,
    Value<int>? attempts,
    Value<DateTime>? nextAttemptAt,
    Value<String?>? lastError,
    Value<SyncStatus>? status,
  }) {
    return SyncOpsCompanion(
      id: id ?? this.id,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      clientUuid: clientUuid ?? this.clientUuid,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      attempts: attempts ?? this.attempts,
      nextAttemptAt: nextAttemptAt ?? this.nextAttemptAt,
      lastError: lastError ?? this.lastError,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (nextAttemptAt.present) {
      map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $SyncOpsTable.$converterstatus.toSql(status.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncOpsCompanion(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('clientUuid: $clientUuid, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$BaseDatos extends GeneratedDatabase {
  _$BaseDatos(QueryExecutor e) : super(e);
  $BaseDatosManager get managers => $BaseDatosManager(this);
  late final $CountriesTable countries = $CountriesTable(this);
  late final $RegionsTable regions = $RegionsTable(this);
  late final $CitiesTable cities = $CitiesTable(this);
  late final $NeighborhoodsTable neighborhoods = $NeighborhoodsTable(this);
  late final $JurisdictionsTable jurisdictions = $JurisdictionsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $CategoryProposalsTable categoryProposals =
      $CategoryProposalsTable(this);
  late final $CasesTable cases = $CasesTable(this);
  late final $EvidencesTable evidences = $EvidencesTable(this);
  late final $EndorsementsTable endorsements = $EndorsementsTable(this);
  late final $CaseActionsTable caseActions = $CaseActionsTable(this);
  late final $OfficialResponsesTable officialResponses =
      $OfficialResponsesTable(this);
  late final $ResolutionsTable resolutions = $ResolutionsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $SyncOpsTable syncOps = $SyncOpsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    countries,
    regions,
    cities,
    neighborhoods,
    jurisdictions,
    categories,
    categoryProposals,
    cases,
    evidences,
    endorsements,
    caseActions,
    officialResponses,
    resolutions,
    users,
    syncOps,
  ];
}

typedef $$CountriesTableCreateCompanionBuilder =
    CountriesCompanion Function({
      required String id,
      required String name,
      required String defaultLanguage,
      required String defaultTimezone,
      Value<int> rowid,
    });
typedef $$CountriesTableUpdateCompanionBuilder =
    CountriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> defaultLanguage,
      Value<String> defaultTimezone,
      Value<int> rowid,
    });

class $$CountriesTableFilterComposer
    extends Composer<_$BaseDatos, $CountriesTable> {
  $$CountriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultLanguage => $composableBuilder(
    column: $table.defaultLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultTimezone => $composableBuilder(
    column: $table.defaultTimezone,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CountriesTableOrderingComposer
    extends Composer<_$BaseDatos, $CountriesTable> {
  $$CountriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultLanguage => $composableBuilder(
    column: $table.defaultLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultTimezone => $composableBuilder(
    column: $table.defaultTimezone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CountriesTableAnnotationComposer
    extends Composer<_$BaseDatos, $CountriesTable> {
  $$CountriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get defaultLanguage => $composableBuilder(
    column: $table.defaultLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultTimezone => $composableBuilder(
    column: $table.defaultTimezone,
    builder: (column) => column,
  );
}

class $$CountriesTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $CountriesTable,
          Country,
          $$CountriesTableFilterComposer,
          $$CountriesTableOrderingComposer,
          $$CountriesTableAnnotationComposer,
          $$CountriesTableCreateCompanionBuilder,
          $$CountriesTableUpdateCompanionBuilder,
          (Country, BaseReferences<_$BaseDatos, $CountriesTable, Country>),
          Country,
          PrefetchHooks Function()
        > {
  $$CountriesTableTableManager(_$BaseDatos db, $CountriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> defaultLanguage = const Value.absent(),
                Value<String> defaultTimezone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CountriesCompanion(
                id: id,
                name: name,
                defaultLanguage: defaultLanguage,
                defaultTimezone: defaultTimezone,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String defaultLanguage,
                required String defaultTimezone,
                Value<int> rowid = const Value.absent(),
              }) => CountriesCompanion.insert(
                id: id,
                name: name,
                defaultLanguage: defaultLanguage,
                defaultTimezone: defaultTimezone,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CountriesTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $CountriesTable,
      Country,
      $$CountriesTableFilterComposer,
      $$CountriesTableOrderingComposer,
      $$CountriesTableAnnotationComposer,
      $$CountriesTableCreateCompanionBuilder,
      $$CountriesTableUpdateCompanionBuilder,
      (Country, BaseReferences<_$BaseDatos, $CountriesTable, Country>),
      Country,
      PrefetchHooks Function()
    >;
typedef $$RegionsTableCreateCompanionBuilder =
    RegionsCompanion Function({
      required String id,
      required String countryId,
      required String name,
      Value<int?> geonamesId,
      Value<int> rowid,
    });
typedef $$RegionsTableUpdateCompanionBuilder =
    RegionsCompanion Function({
      Value<String> id,
      Value<String> countryId,
      Value<String> name,
      Value<int?> geonamesId,
      Value<int> rowid,
    });

class $$RegionsTableFilterComposer
    extends Composer<_$BaseDatos, $RegionsTable> {
  $$RegionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get geonamesId => $composableBuilder(
    column: $table.geonamesId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RegionsTableOrderingComposer
    extends Composer<_$BaseDatos, $RegionsTable> {
  $$RegionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get geonamesId => $composableBuilder(
    column: $table.geonamesId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RegionsTableAnnotationComposer
    extends Composer<_$BaseDatos, $RegionsTable> {
  $$RegionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get countryId =>
      $composableBuilder(column: $table.countryId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get geonamesId => $composableBuilder(
    column: $table.geonamesId,
    builder: (column) => column,
  );
}

class $$RegionsTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $RegionsTable,
          Region,
          $$RegionsTableFilterComposer,
          $$RegionsTableOrderingComposer,
          $$RegionsTableAnnotationComposer,
          $$RegionsTableCreateCompanionBuilder,
          $$RegionsTableUpdateCompanionBuilder,
          (Region, BaseReferences<_$BaseDatos, $RegionsTable, Region>),
          Region,
          PrefetchHooks Function()
        > {
  $$RegionsTableTableManager(_$BaseDatos db, $RegionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RegionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RegionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RegionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> countryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> geonamesId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RegionsCompanion(
                id: id,
                countryId: countryId,
                name: name,
                geonamesId: geonamesId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String countryId,
                required String name,
                Value<int?> geonamesId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RegionsCompanion.insert(
                id: id,
                countryId: countryId,
                name: name,
                geonamesId: geonamesId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RegionsTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $RegionsTable,
      Region,
      $$RegionsTableFilterComposer,
      $$RegionsTableOrderingComposer,
      $$RegionsTableAnnotationComposer,
      $$RegionsTableCreateCompanionBuilder,
      $$RegionsTableUpdateCompanionBuilder,
      (Region, BaseReferences<_$BaseDatos, $RegionsTable, Region>),
      Region,
      PrefetchHooks Function()
    >;
typedef $$CitiesTableCreateCompanionBuilder =
    CitiesCompanion Function({
      required String id,
      required String regionId,
      required String name,
      Value<int?> geonamesId,
      Value<String?> jurisdictionId,
      Value<int?> osmRelationId,
      Value<int?> population,
      Value<int> rowid,
    });
typedef $$CitiesTableUpdateCompanionBuilder =
    CitiesCompanion Function({
      Value<String> id,
      Value<String> regionId,
      Value<String> name,
      Value<int?> geonamesId,
      Value<String?> jurisdictionId,
      Value<int?> osmRelationId,
      Value<int?> population,
      Value<int> rowid,
    });

class $$CitiesTableFilterComposer extends Composer<_$BaseDatos, $CitiesTable> {
  $$CitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regionId => $composableBuilder(
    column: $table.regionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get geonamesId => $composableBuilder(
    column: $table.geonamesId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jurisdictionId => $composableBuilder(
    column: $table.jurisdictionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get osmRelationId => $composableBuilder(
    column: $table.osmRelationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CitiesTableOrderingComposer
    extends Composer<_$BaseDatos, $CitiesTable> {
  $$CitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regionId => $composableBuilder(
    column: $table.regionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get geonamesId => $composableBuilder(
    column: $table.geonamesId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jurisdictionId => $composableBuilder(
    column: $table.jurisdictionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get osmRelationId => $composableBuilder(
    column: $table.osmRelationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CitiesTableAnnotationComposer
    extends Composer<_$BaseDatos, $CitiesTable> {
  $$CitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get regionId =>
      $composableBuilder(column: $table.regionId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get geonamesId => $composableBuilder(
    column: $table.geonamesId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jurisdictionId => $composableBuilder(
    column: $table.jurisdictionId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get osmRelationId => $composableBuilder(
    column: $table.osmRelationId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => column,
  );
}

class $$CitiesTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $CitiesTable,
          City,
          $$CitiesTableFilterComposer,
          $$CitiesTableOrderingComposer,
          $$CitiesTableAnnotationComposer,
          $$CitiesTableCreateCompanionBuilder,
          $$CitiesTableUpdateCompanionBuilder,
          (City, BaseReferences<_$BaseDatos, $CitiesTable, City>),
          City,
          PrefetchHooks Function()
        > {
  $$CitiesTableTableManager(_$BaseDatos db, $CitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> regionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> geonamesId = const Value.absent(),
                Value<String?> jurisdictionId = const Value.absent(),
                Value<int?> osmRelationId = const Value.absent(),
                Value<int?> population = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CitiesCompanion(
                id: id,
                regionId: regionId,
                name: name,
                geonamesId: geonamesId,
                jurisdictionId: jurisdictionId,
                osmRelationId: osmRelationId,
                population: population,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String regionId,
                required String name,
                Value<int?> geonamesId = const Value.absent(),
                Value<String?> jurisdictionId = const Value.absent(),
                Value<int?> osmRelationId = const Value.absent(),
                Value<int?> population = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CitiesCompanion.insert(
                id: id,
                regionId: regionId,
                name: name,
                geonamesId: geonamesId,
                jurisdictionId: jurisdictionId,
                osmRelationId: osmRelationId,
                population: population,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $CitiesTable,
      City,
      $$CitiesTableFilterComposer,
      $$CitiesTableOrderingComposer,
      $$CitiesTableAnnotationComposer,
      $$CitiesTableCreateCompanionBuilder,
      $$CitiesTableUpdateCompanionBuilder,
      (City, BaseReferences<_$BaseDatos, $CitiesTable, City>),
      City,
      PrefetchHooks Function()
    >;
typedef $$NeighborhoodsTableCreateCompanionBuilder =
    NeighborhoodsCompanion Function({
      required String clientUuid,
      Value<SyncStatus> syncStatus,
      required DateTime updatedAt,
      required String id,
      required String cityId,
      required String name,
      required String nameNormalized,
      Value<String> aliases,
      required String polygon,
      required double centroidLat,
      required double centroidLng,
      required double areaKm2,
      required NeighborhoodStatus status,
      Value<String?> createdBy,
      required DateTime createdAt,
      Value<String?> validationSource,
      Value<String?> validationPayload,
      Value<int> verifiedUserCount,
      Value<int> caseCount,
      Value<String?> mergedInto,
      Value<int> rowid,
    });
typedef $$NeighborhoodsTableUpdateCompanionBuilder =
    NeighborhoodsCompanion Function({
      Value<String> clientUuid,
      Value<SyncStatus> syncStatus,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> cityId,
      Value<String> name,
      Value<String> nameNormalized,
      Value<String> aliases,
      Value<String> polygon,
      Value<double> centroidLat,
      Value<double> centroidLng,
      Value<double> areaKm2,
      Value<NeighborhoodStatus> status,
      Value<String?> createdBy,
      Value<DateTime> createdAt,
      Value<String?> validationSource,
      Value<String?> validationPayload,
      Value<int> verifiedUserCount,
      Value<int> caseCount,
      Value<String?> mergedInto,
      Value<int> rowid,
    });

class $$NeighborhoodsTableFilterComposer
    extends Composer<_$BaseDatos, $NeighborhoodsTable> {
  $$NeighborhoodsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameNormalized => $composableBuilder(
    column: $table.nameNormalized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get polygon => $composableBuilder(
    column: $table.polygon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get centroidLat => $composableBuilder(
    column: $table.centroidLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get centroidLng => $composableBuilder(
    column: $table.centroidLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get areaKm2 => $composableBuilder(
    column: $table.areaKm2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<NeighborhoodStatus, NeighborhoodStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get validationSource => $composableBuilder(
    column: $table.validationSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get validationPayload => $composableBuilder(
    column: $table.validationPayload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verifiedUserCount => $composableBuilder(
    column: $table.verifiedUserCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get caseCount => $composableBuilder(
    column: $table.caseCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mergedInto => $composableBuilder(
    column: $table.mergedInto,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NeighborhoodsTableOrderingComposer
    extends Composer<_$BaseDatos, $NeighborhoodsTable> {
  $$NeighborhoodsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameNormalized => $composableBuilder(
    column: $table.nameNormalized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get polygon => $composableBuilder(
    column: $table.polygon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get centroidLat => $composableBuilder(
    column: $table.centroidLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get centroidLng => $composableBuilder(
    column: $table.centroidLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get areaKm2 => $composableBuilder(
    column: $table.areaKm2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get validationSource => $composableBuilder(
    column: $table.validationSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get validationPayload => $composableBuilder(
    column: $table.validationPayload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verifiedUserCount => $composableBuilder(
    column: $table.verifiedUserCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get caseCount => $composableBuilder(
    column: $table.caseCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mergedInto => $composableBuilder(
    column: $table.mergedInto,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NeighborhoodsTableAnnotationComposer
    extends Composer<_$BaseDatos, $NeighborhoodsTable> {
  $$NeighborhoodsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cityId =>
      $composableBuilder(column: $table.cityId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameNormalized => $composableBuilder(
    column: $table.nameNormalized,
    builder: (column) => column,
  );

  GeneratedColumn<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => column);

  GeneratedColumn<String> get polygon =>
      $composableBuilder(column: $table.polygon, builder: (column) => column);

  GeneratedColumn<double> get centroidLat => $composableBuilder(
    column: $table.centroidLat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get centroidLng => $composableBuilder(
    column: $table.centroidLng,
    builder: (column) => column,
  );

  GeneratedColumn<double> get areaKm2 =>
      $composableBuilder(column: $table.areaKm2, builder: (column) => column);

  GeneratedColumnWithTypeConverter<NeighborhoodStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get validationSource => $composableBuilder(
    column: $table.validationSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get validationPayload => $composableBuilder(
    column: $table.validationPayload,
    builder: (column) => column,
  );

  GeneratedColumn<int> get verifiedUserCount => $composableBuilder(
    column: $table.verifiedUserCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get caseCount =>
      $composableBuilder(column: $table.caseCount, builder: (column) => column);

  GeneratedColumn<String> get mergedInto => $composableBuilder(
    column: $table.mergedInto,
    builder: (column) => column,
  );
}

class $$NeighborhoodsTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $NeighborhoodsTable,
          Neighborhood,
          $$NeighborhoodsTableFilterComposer,
          $$NeighborhoodsTableOrderingComposer,
          $$NeighborhoodsTableAnnotationComposer,
          $$NeighborhoodsTableCreateCompanionBuilder,
          $$NeighborhoodsTableUpdateCompanionBuilder,
          (
            Neighborhood,
            BaseReferences<_$BaseDatos, $NeighborhoodsTable, Neighborhood>,
          ),
          Neighborhood,
          PrefetchHooks Function()
        > {
  $$NeighborhoodsTableTableManager(_$BaseDatos db, $NeighborhoodsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NeighborhoodsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NeighborhoodsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NeighborhoodsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clientUuid = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> cityId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nameNormalized = const Value.absent(),
                Value<String> aliases = const Value.absent(),
                Value<String> polygon = const Value.absent(),
                Value<double> centroidLat = const Value.absent(),
                Value<double> centroidLng = const Value.absent(),
                Value<double> areaKm2 = const Value.absent(),
                Value<NeighborhoodStatus> status = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> validationSource = const Value.absent(),
                Value<String?> validationPayload = const Value.absent(),
                Value<int> verifiedUserCount = const Value.absent(),
                Value<int> caseCount = const Value.absent(),
                Value<String?> mergedInto = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NeighborhoodsCompanion(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                cityId: cityId,
                name: name,
                nameNormalized: nameNormalized,
                aliases: aliases,
                polygon: polygon,
                centroidLat: centroidLat,
                centroidLng: centroidLng,
                areaKm2: areaKm2,
                status: status,
                createdBy: createdBy,
                createdAt: createdAt,
                validationSource: validationSource,
                validationPayload: validationPayload,
                verifiedUserCount: verifiedUserCount,
                caseCount: caseCount,
                mergedInto: mergedInto,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientUuid,
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime updatedAt,
                required String id,
                required String cityId,
                required String name,
                required String nameNormalized,
                Value<String> aliases = const Value.absent(),
                required String polygon,
                required double centroidLat,
                required double centroidLng,
                required double areaKm2,
                required NeighborhoodStatus status,
                Value<String?> createdBy = const Value.absent(),
                required DateTime createdAt,
                Value<String?> validationSource = const Value.absent(),
                Value<String?> validationPayload = const Value.absent(),
                Value<int> verifiedUserCount = const Value.absent(),
                Value<int> caseCount = const Value.absent(),
                Value<String?> mergedInto = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NeighborhoodsCompanion.insert(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                cityId: cityId,
                name: name,
                nameNormalized: nameNormalized,
                aliases: aliases,
                polygon: polygon,
                centroidLat: centroidLat,
                centroidLng: centroidLng,
                areaKm2: areaKm2,
                status: status,
                createdBy: createdBy,
                createdAt: createdAt,
                validationSource: validationSource,
                validationPayload: validationPayload,
                verifiedUserCount: verifiedUserCount,
                caseCount: caseCount,
                mergedInto: mergedInto,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NeighborhoodsTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $NeighborhoodsTable,
      Neighborhood,
      $$NeighborhoodsTableFilterComposer,
      $$NeighborhoodsTableOrderingComposer,
      $$NeighborhoodsTableAnnotationComposer,
      $$NeighborhoodsTableCreateCompanionBuilder,
      $$NeighborhoodsTableUpdateCompanionBuilder,
      (
        Neighborhood,
        BaseReferences<_$BaseDatos, $NeighborhoodsTable, Neighborhood>,
      ),
      Neighborhood,
      PrefetchHooks Function()
    >;
typedef $$JurisdictionsTableCreateCompanionBuilder =
    JurisdictionsCompanion Function({
      required String id,
      required String countryId,
      required String name,
      required String timezone,
      required String language,
      required int defaultResponseDays,
      required String config,
      Value<int> rowid,
    });
typedef $$JurisdictionsTableUpdateCompanionBuilder =
    JurisdictionsCompanion Function({
      Value<String> id,
      Value<String> countryId,
      Value<String> name,
      Value<String> timezone,
      Value<String> language,
      Value<int> defaultResponseDays,
      Value<String> config,
      Value<int> rowid,
    });

class $$JurisdictionsTableFilterComposer
    extends Composer<_$BaseDatos, $JurisdictionsTable> {
  $$JurisdictionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultResponseDays => $composableBuilder(
    column: $table.defaultResponseDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JurisdictionsTableOrderingComposer
    extends Composer<_$BaseDatos, $JurisdictionsTable> {
  $$JurisdictionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultResponseDays => $composableBuilder(
    column: $table.defaultResponseDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JurisdictionsTableAnnotationComposer
    extends Composer<_$BaseDatos, $JurisdictionsTable> {
  $$JurisdictionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get countryId =>
      $composableBuilder(column: $table.countryId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<int> get defaultResponseDays => $composableBuilder(
    column: $table.defaultResponseDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);
}

class $$JurisdictionsTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $JurisdictionsTable,
          Jurisdiction,
          $$JurisdictionsTableFilterComposer,
          $$JurisdictionsTableOrderingComposer,
          $$JurisdictionsTableAnnotationComposer,
          $$JurisdictionsTableCreateCompanionBuilder,
          $$JurisdictionsTableUpdateCompanionBuilder,
          (
            Jurisdiction,
            BaseReferences<_$BaseDatos, $JurisdictionsTable, Jurisdiction>,
          ),
          Jurisdiction,
          PrefetchHooks Function()
        > {
  $$JurisdictionsTableTableManager(_$BaseDatos db, $JurisdictionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JurisdictionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JurisdictionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JurisdictionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> countryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<int> defaultResponseDays = const Value.absent(),
                Value<String> config = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JurisdictionsCompanion(
                id: id,
                countryId: countryId,
                name: name,
                timezone: timezone,
                language: language,
                defaultResponseDays: defaultResponseDays,
                config: config,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String countryId,
                required String name,
                required String timezone,
                required String language,
                required int defaultResponseDays,
                required String config,
                Value<int> rowid = const Value.absent(),
              }) => JurisdictionsCompanion.insert(
                id: id,
                countryId: countryId,
                name: name,
                timezone: timezone,
                language: language,
                defaultResponseDays: defaultResponseDays,
                config: config,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JurisdictionsTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $JurisdictionsTable,
      Jurisdiction,
      $$JurisdictionsTableFilterComposer,
      $$JurisdictionsTableOrderingComposer,
      $$JurisdictionsTableAnnotationComposer,
      $$JurisdictionsTableCreateCompanionBuilder,
      $$JurisdictionsTableUpdateCompanionBuilder,
      (
        Jurisdiction,
        BaseReferences<_$BaseDatos, $JurisdictionsTable, Jurisdiction>,
      ),
      Jurisdiction,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String id,
      required String scope,
      Value<String?> countryId,
      required String nameI18n,
      required String icon,
      required int orderIndex,
      required String guidedTree,
      required String templateKey,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> id,
      Value<String> scope,
      Value<String?> countryId,
      Value<String> nameI18n,
      Value<String> icon,
      Value<int> orderIndex,
      Value<String> guidedTree,
      Value<String> templateKey,
      Value<String> status,
      Value<int> rowid,
    });

class $$CategoriesTableFilterComposer
    extends Composer<_$BaseDatos, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameI18n => $composableBuilder(
    column: $table.nameI18n,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guidedTree => $composableBuilder(
    column: $table.guidedTree,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$BaseDatos, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameI18n => $composableBuilder(
    column: $table.nameI18n,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guidedTree => $composableBuilder(
    column: $table.guidedTree,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$BaseDatos, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get countryId =>
      $composableBuilder(column: $table.countryId, builder: (column) => column);

  GeneratedColumn<String> get nameI18n =>
      $composableBuilder(column: $table.nameI18n, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guidedTree => $composableBuilder(
    column: $table.guidedTree,
    builder: (column) => column,
  );

  GeneratedColumn<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, BaseReferences<_$BaseDatos, $CategoriesTable, Category>),
          Category,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$BaseDatos db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> scope = const Value.absent(),
                Value<String?> countryId = const Value.absent(),
                Value<String> nameI18n = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> guidedTree = const Value.absent(),
                Value<String> templateKey = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                scope: scope,
                countryId: countryId,
                nameI18n: nameI18n,
                icon: icon,
                orderIndex: orderIndex,
                guidedTree: guidedTree,
                templateKey: templateKey,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String scope,
                Value<String?> countryId = const Value.absent(),
                required String nameI18n,
                required String icon,
                required int orderIndex,
                required String guidedTree,
                required String templateKey,
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                scope: scope,
                countryId: countryId,
                nameI18n: nameI18n,
                icon: icon,
                orderIndex: orderIndex,
                guidedTree: guidedTree,
                templateKey: templateKey,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, BaseReferences<_$BaseDatos, $CategoriesTable, Category>),
      Category,
      PrefetchHooks Function()
    >;
typedef $$CategoryProposalsTableCreateCompanionBuilder =
    CategoryProposalsCompanion Function({
      required String clientUuid,
      Value<SyncStatus> syncStatus,
      required DateTime updatedAt,
      required String id,
      required String caseId,
      required String countryId,
      required String rawLabel,
      required String structuredAnswers,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$CategoryProposalsTableUpdateCompanionBuilder =
    CategoryProposalsCompanion Function({
      Value<String> clientUuid,
      Value<SyncStatus> syncStatus,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> caseId,
      Value<String> countryId,
      Value<String> rawLabel,
      Value<String> structuredAnswers,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$CategoryProposalsTableFilterComposer
    extends Composer<_$BaseDatos, $CategoryProposalsTable> {
  $$CategoryProposalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawLabel => $composableBuilder(
    column: $table.rawLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get structuredAnswers => $composableBuilder(
    column: $table.structuredAnswers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryProposalsTableOrderingComposer
    extends Composer<_$BaseDatos, $CategoryProposalsTable> {
  $$CategoryProposalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawLabel => $composableBuilder(
    column: $table.rawLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get structuredAnswers => $composableBuilder(
    column: $table.structuredAnswers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryProposalsTableAnnotationComposer
    extends Composer<_$BaseDatos, $CategoryProposalsTable> {
  $$CategoryProposalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<String> get countryId =>
      $composableBuilder(column: $table.countryId, builder: (column) => column);

  GeneratedColumn<String> get rawLabel =>
      $composableBuilder(column: $table.rawLabel, builder: (column) => column);

  GeneratedColumn<String> get structuredAnswers => $composableBuilder(
    column: $table.structuredAnswers,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CategoryProposalsTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $CategoryProposalsTable,
          CategoryProposal,
          $$CategoryProposalsTableFilterComposer,
          $$CategoryProposalsTableOrderingComposer,
          $$CategoryProposalsTableAnnotationComposer,
          $$CategoryProposalsTableCreateCompanionBuilder,
          $$CategoryProposalsTableUpdateCompanionBuilder,
          (
            CategoryProposal,
            BaseReferences<
              _$BaseDatos,
              $CategoryProposalsTable,
              CategoryProposal
            >,
          ),
          CategoryProposal,
          PrefetchHooks Function()
        > {
  $$CategoryProposalsTableTableManager(
    _$BaseDatos db,
    $CategoryProposalsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryProposalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryProposalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryProposalsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> clientUuid = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> caseId = const Value.absent(),
                Value<String> countryId = const Value.absent(),
                Value<String> rawLabel = const Value.absent(),
                Value<String> structuredAnswers = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoryProposalsCompanion(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                countryId: countryId,
                rawLabel: rawLabel,
                structuredAnswers: structuredAnswers,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientUuid,
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime updatedAt,
                required String id,
                required String caseId,
                required String countryId,
                required String rawLabel,
                required String structuredAnswers,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CategoryProposalsCompanion.insert(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                countryId: countryId,
                rawLabel: rawLabel,
                structuredAnswers: structuredAnswers,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryProposalsTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $CategoryProposalsTable,
      CategoryProposal,
      $$CategoryProposalsTableFilterComposer,
      $$CategoryProposalsTableOrderingComposer,
      $$CategoryProposalsTableAnnotationComposer,
      $$CategoryProposalsTableCreateCompanionBuilder,
      $$CategoryProposalsTableUpdateCompanionBuilder,
      (
        CategoryProposal,
        BaseReferences<_$BaseDatos, $CategoryProposalsTable, CategoryProposal>,
      ),
      CategoryProposal,
      PrefetchHooks Function()
    >;
typedef $$CasesTableCreateCompanionBuilder =
    CasesCompanion Function({
      required String clientUuid,
      Value<SyncStatus> syncStatus,
      required DateTime updatedAt,
      required String id,
      Value<String?> publicRef,
      required String neighborhoodId,
      Value<String?> cityId,
      Value<String?> jurisdictionId,
      required String categoryId,
      required String subtypeId,
      required String guidedAnswers,
      Value<String?> freeText,
      Value<String> generatedBody,
      required CaseStatus status,
      Value<int> severityComputed,
      required double lat,
      required double lng,
      required String geohash,
      Value<String?> addressText,
      Value<bool> pinOffsetApplied,
      Value<String?> createdBy,
      required DateTime createdAt,
      Value<String?> occurredSince,
      Value<String?> organismId,
      Value<DateTime?> submittedAt,
      Value<DateTime?> deadlineAt,
      Value<DateTime?> resolvedAt,
      Value<int> endorsementCount,
      Value<int> verifiedEndorsementCount,
      Value<int> evidenceCount,
      Value<int> disputeCount,
      Value<String?> moderationStatus,
      Value<String?> moderationNotes,
      Value<int> rowid,
    });
typedef $$CasesTableUpdateCompanionBuilder =
    CasesCompanion Function({
      Value<String> clientUuid,
      Value<SyncStatus> syncStatus,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String?> publicRef,
      Value<String> neighborhoodId,
      Value<String?> cityId,
      Value<String?> jurisdictionId,
      Value<String> categoryId,
      Value<String> subtypeId,
      Value<String> guidedAnswers,
      Value<String?> freeText,
      Value<String> generatedBody,
      Value<CaseStatus> status,
      Value<int> severityComputed,
      Value<double> lat,
      Value<double> lng,
      Value<String> geohash,
      Value<String?> addressText,
      Value<bool> pinOffsetApplied,
      Value<String?> createdBy,
      Value<DateTime> createdAt,
      Value<String?> occurredSince,
      Value<String?> organismId,
      Value<DateTime?> submittedAt,
      Value<DateTime?> deadlineAt,
      Value<DateTime?> resolvedAt,
      Value<int> endorsementCount,
      Value<int> verifiedEndorsementCount,
      Value<int> evidenceCount,
      Value<int> disputeCount,
      Value<String?> moderationStatus,
      Value<String?> moderationNotes,
      Value<int> rowid,
    });

class $$CasesTableFilterComposer extends Composer<_$BaseDatos, $CasesTable> {
  $$CasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publicRef => $composableBuilder(
    column: $table.publicRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get neighborhoodId => $composableBuilder(
    column: $table.neighborhoodId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jurisdictionId => $composableBuilder(
    column: $table.jurisdictionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subtypeId => $composableBuilder(
    column: $table.subtypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guidedAnswers => $composableBuilder(
    column: $table.guidedAnswers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get freeText => $composableBuilder(
    column: $table.freeText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get generatedBody => $composableBuilder(
    column: $table.generatedBody,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CaseStatus, CaseStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get severityComputed => $composableBuilder(
    column: $table.severityComputed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get geohash => $composableBuilder(
    column: $table.geohash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressText => $composableBuilder(
    column: $table.addressText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pinOffsetApplied => $composableBuilder(
    column: $table.pinOffsetApplied,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occurredSince => $composableBuilder(
    column: $table.occurredSince,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organismId => $composableBuilder(
    column: $table.organismId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadlineAt => $composableBuilder(
    column: $table.deadlineAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endorsementCount => $composableBuilder(
    column: $table.endorsementCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verifiedEndorsementCount => $composableBuilder(
    column: $table.verifiedEndorsementCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get evidenceCount => $composableBuilder(
    column: $table.evidenceCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get disputeCount => $composableBuilder(
    column: $table.disputeCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moderationStatus => $composableBuilder(
    column: $table.moderationStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moderationNotes => $composableBuilder(
    column: $table.moderationNotes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CasesTableOrderingComposer extends Composer<_$BaseDatos, $CasesTable> {
  $$CasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publicRef => $composableBuilder(
    column: $table.publicRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get neighborhoodId => $composableBuilder(
    column: $table.neighborhoodId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jurisdictionId => $composableBuilder(
    column: $table.jurisdictionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subtypeId => $composableBuilder(
    column: $table.subtypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guidedAnswers => $composableBuilder(
    column: $table.guidedAnswers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get freeText => $composableBuilder(
    column: $table.freeText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get generatedBody => $composableBuilder(
    column: $table.generatedBody,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get severityComputed => $composableBuilder(
    column: $table.severityComputed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get geohash => $composableBuilder(
    column: $table.geohash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressText => $composableBuilder(
    column: $table.addressText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pinOffsetApplied => $composableBuilder(
    column: $table.pinOffsetApplied,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occurredSince => $composableBuilder(
    column: $table.occurredSince,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organismId => $composableBuilder(
    column: $table.organismId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadlineAt => $composableBuilder(
    column: $table.deadlineAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endorsementCount => $composableBuilder(
    column: $table.endorsementCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verifiedEndorsementCount => $composableBuilder(
    column: $table.verifiedEndorsementCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get evidenceCount => $composableBuilder(
    column: $table.evidenceCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get disputeCount => $composableBuilder(
    column: $table.disputeCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moderationStatus => $composableBuilder(
    column: $table.moderationStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moderationNotes => $composableBuilder(
    column: $table.moderationNotes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CasesTableAnnotationComposer
    extends Composer<_$BaseDatos, $CasesTable> {
  $$CasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get publicRef =>
      $composableBuilder(column: $table.publicRef, builder: (column) => column);

  GeneratedColumn<String> get neighborhoodId => $composableBuilder(
    column: $table.neighborhoodId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cityId =>
      $composableBuilder(column: $table.cityId, builder: (column) => column);

  GeneratedColumn<String> get jurisdictionId => $composableBuilder(
    column: $table.jurisdictionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get subtypeId =>
      $composableBuilder(column: $table.subtypeId, builder: (column) => column);

  GeneratedColumn<String> get guidedAnswers => $composableBuilder(
    column: $table.guidedAnswers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get freeText =>
      $composableBuilder(column: $table.freeText, builder: (column) => column);

  GeneratedColumn<String> get generatedBody => $composableBuilder(
    column: $table.generatedBody,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<CaseStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get severityComputed => $composableBuilder(
    column: $table.severityComputed,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get geohash =>
      $composableBuilder(column: $table.geohash, builder: (column) => column);

  GeneratedColumn<String> get addressText => $composableBuilder(
    column: $table.addressText,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get pinOffsetApplied => $composableBuilder(
    column: $table.pinOffsetApplied,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get occurredSince => $composableBuilder(
    column: $table.occurredSince,
    builder: (column) => column,
  );

  GeneratedColumn<String> get organismId => $composableBuilder(
    column: $table.organismId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deadlineAt => $composableBuilder(
    column: $table.deadlineAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endorsementCount => $composableBuilder(
    column: $table.endorsementCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get verifiedEndorsementCount => $composableBuilder(
    column: $table.verifiedEndorsementCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get evidenceCount => $composableBuilder(
    column: $table.evidenceCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get disputeCount => $composableBuilder(
    column: $table.disputeCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get moderationStatus => $composableBuilder(
    column: $table.moderationStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get moderationNotes => $composableBuilder(
    column: $table.moderationNotes,
    builder: (column) => column,
  );
}

class $$CasesTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $CasesTable,
          Case,
          $$CasesTableFilterComposer,
          $$CasesTableOrderingComposer,
          $$CasesTableAnnotationComposer,
          $$CasesTableCreateCompanionBuilder,
          $$CasesTableUpdateCompanionBuilder,
          (Case, BaseReferences<_$BaseDatos, $CasesTable, Case>),
          Case,
          PrefetchHooks Function()
        > {
  $$CasesTableTableManager(_$BaseDatos db, $CasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clientUuid = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String?> publicRef = const Value.absent(),
                Value<String> neighborhoodId = const Value.absent(),
                Value<String?> cityId = const Value.absent(),
                Value<String?> jurisdictionId = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<String> subtypeId = const Value.absent(),
                Value<String> guidedAnswers = const Value.absent(),
                Value<String?> freeText = const Value.absent(),
                Value<String> generatedBody = const Value.absent(),
                Value<CaseStatus> status = const Value.absent(),
                Value<int> severityComputed = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
                Value<String> geohash = const Value.absent(),
                Value<String?> addressText = const Value.absent(),
                Value<bool> pinOffsetApplied = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> occurredSince = const Value.absent(),
                Value<String?> organismId = const Value.absent(),
                Value<DateTime?> submittedAt = const Value.absent(),
                Value<DateTime?> deadlineAt = const Value.absent(),
                Value<DateTime?> resolvedAt = const Value.absent(),
                Value<int> endorsementCount = const Value.absent(),
                Value<int> verifiedEndorsementCount = const Value.absent(),
                Value<int> evidenceCount = const Value.absent(),
                Value<int> disputeCount = const Value.absent(),
                Value<String?> moderationStatus = const Value.absent(),
                Value<String?> moderationNotes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CasesCompanion(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                publicRef: publicRef,
                neighborhoodId: neighborhoodId,
                cityId: cityId,
                jurisdictionId: jurisdictionId,
                categoryId: categoryId,
                subtypeId: subtypeId,
                guidedAnswers: guidedAnswers,
                freeText: freeText,
                generatedBody: generatedBody,
                status: status,
                severityComputed: severityComputed,
                lat: lat,
                lng: lng,
                geohash: geohash,
                addressText: addressText,
                pinOffsetApplied: pinOffsetApplied,
                createdBy: createdBy,
                createdAt: createdAt,
                occurredSince: occurredSince,
                organismId: organismId,
                submittedAt: submittedAt,
                deadlineAt: deadlineAt,
                resolvedAt: resolvedAt,
                endorsementCount: endorsementCount,
                verifiedEndorsementCount: verifiedEndorsementCount,
                evidenceCount: evidenceCount,
                disputeCount: disputeCount,
                moderationStatus: moderationStatus,
                moderationNotes: moderationNotes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientUuid,
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime updatedAt,
                required String id,
                Value<String?> publicRef = const Value.absent(),
                required String neighborhoodId,
                Value<String?> cityId = const Value.absent(),
                Value<String?> jurisdictionId = const Value.absent(),
                required String categoryId,
                required String subtypeId,
                required String guidedAnswers,
                Value<String?> freeText = const Value.absent(),
                Value<String> generatedBody = const Value.absent(),
                required CaseStatus status,
                Value<int> severityComputed = const Value.absent(),
                required double lat,
                required double lng,
                required String geohash,
                Value<String?> addressText = const Value.absent(),
                Value<bool> pinOffsetApplied = const Value.absent(),
                Value<String?> createdBy = const Value.absent(),
                required DateTime createdAt,
                Value<String?> occurredSince = const Value.absent(),
                Value<String?> organismId = const Value.absent(),
                Value<DateTime?> submittedAt = const Value.absent(),
                Value<DateTime?> deadlineAt = const Value.absent(),
                Value<DateTime?> resolvedAt = const Value.absent(),
                Value<int> endorsementCount = const Value.absent(),
                Value<int> verifiedEndorsementCount = const Value.absent(),
                Value<int> evidenceCount = const Value.absent(),
                Value<int> disputeCount = const Value.absent(),
                Value<String?> moderationStatus = const Value.absent(),
                Value<String?> moderationNotes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CasesCompanion.insert(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                publicRef: publicRef,
                neighborhoodId: neighborhoodId,
                cityId: cityId,
                jurisdictionId: jurisdictionId,
                categoryId: categoryId,
                subtypeId: subtypeId,
                guidedAnswers: guidedAnswers,
                freeText: freeText,
                generatedBody: generatedBody,
                status: status,
                severityComputed: severityComputed,
                lat: lat,
                lng: lng,
                geohash: geohash,
                addressText: addressText,
                pinOffsetApplied: pinOffsetApplied,
                createdBy: createdBy,
                createdAt: createdAt,
                occurredSince: occurredSince,
                organismId: organismId,
                submittedAt: submittedAt,
                deadlineAt: deadlineAt,
                resolvedAt: resolvedAt,
                endorsementCount: endorsementCount,
                verifiedEndorsementCount: verifiedEndorsementCount,
                evidenceCount: evidenceCount,
                disputeCount: disputeCount,
                moderationStatus: moderationStatus,
                moderationNotes: moderationNotes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CasesTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $CasesTable,
      Case,
      $$CasesTableFilterComposer,
      $$CasesTableOrderingComposer,
      $$CasesTableAnnotationComposer,
      $$CasesTableCreateCompanionBuilder,
      $$CasesTableUpdateCompanionBuilder,
      (Case, BaseReferences<_$BaseDatos, $CasesTable, Case>),
      Case,
      PrefetchHooks Function()
    >;
typedef $$EvidencesTableCreateCompanionBuilder =
    EvidencesCompanion Function({
      required String clientUuid,
      Value<SyncStatus> syncStatus,
      required DateTime updatedAt,
      required String id,
      required String caseId,
      required EvidenceType type,
      Value<String?> localPath,
      Value<String?> storageUrl,
      Value<String?> thumbUrl,
      required String sha256,
      required DateTime capturedAt,
      Value<double?> lat,
      Value<double?> lng,
      Value<String?> uploadedBy,
      Value<bool> exifStripped,
      Value<bool> facesBlurred,
      Value<String?> classifierScores,
      Value<String?> moderationStatus,
      Value<int> rowid,
    });
typedef $$EvidencesTableUpdateCompanionBuilder =
    EvidencesCompanion Function({
      Value<String> clientUuid,
      Value<SyncStatus> syncStatus,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> caseId,
      Value<EvidenceType> type,
      Value<String?> localPath,
      Value<String?> storageUrl,
      Value<String?> thumbUrl,
      Value<String> sha256,
      Value<DateTime> capturedAt,
      Value<double?> lat,
      Value<double?> lng,
      Value<String?> uploadedBy,
      Value<bool> exifStripped,
      Value<bool> facesBlurred,
      Value<String?> classifierScores,
      Value<String?> moderationStatus,
      Value<int> rowid,
    });

class $$EvidencesTableFilterComposer
    extends Composer<_$BaseDatos, $EvidencesTable> {
  $$EvidencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EvidenceType, EvidenceType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get storageUrl => $composableBuilder(
    column: $table.storageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbUrl => $composableBuilder(
    column: $table.thumbUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uploadedBy => $composableBuilder(
    column: $table.uploadedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get exifStripped => $composableBuilder(
    column: $table.exifStripped,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get facesBlurred => $composableBuilder(
    column: $table.facesBlurred,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get classifierScores => $composableBuilder(
    column: $table.classifierScores,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moderationStatus => $composableBuilder(
    column: $table.moderationStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EvidencesTableOrderingComposer
    extends Composer<_$BaseDatos, $EvidencesTable> {
  $$EvidencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storageUrl => $composableBuilder(
    column: $table.storageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbUrl => $composableBuilder(
    column: $table.thumbUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uploadedBy => $composableBuilder(
    column: $table.uploadedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get exifStripped => $composableBuilder(
    column: $table.exifStripped,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get facesBlurred => $composableBuilder(
    column: $table.facesBlurred,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get classifierScores => $composableBuilder(
    column: $table.classifierScores,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moderationStatus => $composableBuilder(
    column: $table.moderationStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EvidencesTableAnnotationComposer
    extends Composer<_$BaseDatos, $EvidencesTable> {
  $$EvidencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EvidenceType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get storageUrl => $composableBuilder(
    column: $table.storageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thumbUrl =>
      $composableBuilder(column: $table.thumbUrl, builder: (column) => column);

  GeneratedColumn<String> get sha256 =>
      $composableBuilder(column: $table.sha256, builder: (column) => column);

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get uploadedBy => $composableBuilder(
    column: $table.uploadedBy,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get exifStripped => $composableBuilder(
    column: $table.exifStripped,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get facesBlurred => $composableBuilder(
    column: $table.facesBlurred,
    builder: (column) => column,
  );

  GeneratedColumn<String> get classifierScores => $composableBuilder(
    column: $table.classifierScores,
    builder: (column) => column,
  );

  GeneratedColumn<String> get moderationStatus => $composableBuilder(
    column: $table.moderationStatus,
    builder: (column) => column,
  );
}

class $$EvidencesTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $EvidencesTable,
          Evidence,
          $$EvidencesTableFilterComposer,
          $$EvidencesTableOrderingComposer,
          $$EvidencesTableAnnotationComposer,
          $$EvidencesTableCreateCompanionBuilder,
          $$EvidencesTableUpdateCompanionBuilder,
          (Evidence, BaseReferences<_$BaseDatos, $EvidencesTable, Evidence>),
          Evidence,
          PrefetchHooks Function()
        > {
  $$EvidencesTableTableManager(_$BaseDatos db, $EvidencesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EvidencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EvidencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EvidencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clientUuid = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> caseId = const Value.absent(),
                Value<EvidenceType> type = const Value.absent(),
                Value<String?> localPath = const Value.absent(),
                Value<String?> storageUrl = const Value.absent(),
                Value<String?> thumbUrl = const Value.absent(),
                Value<String> sha256 = const Value.absent(),
                Value<DateTime> capturedAt = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<String?> uploadedBy = const Value.absent(),
                Value<bool> exifStripped = const Value.absent(),
                Value<bool> facesBlurred = const Value.absent(),
                Value<String?> classifierScores = const Value.absent(),
                Value<String?> moderationStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EvidencesCompanion(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                type: type,
                localPath: localPath,
                storageUrl: storageUrl,
                thumbUrl: thumbUrl,
                sha256: sha256,
                capturedAt: capturedAt,
                lat: lat,
                lng: lng,
                uploadedBy: uploadedBy,
                exifStripped: exifStripped,
                facesBlurred: facesBlurred,
                classifierScores: classifierScores,
                moderationStatus: moderationStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientUuid,
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime updatedAt,
                required String id,
                required String caseId,
                required EvidenceType type,
                Value<String?> localPath = const Value.absent(),
                Value<String?> storageUrl = const Value.absent(),
                Value<String?> thumbUrl = const Value.absent(),
                required String sha256,
                required DateTime capturedAt,
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<String?> uploadedBy = const Value.absent(),
                Value<bool> exifStripped = const Value.absent(),
                Value<bool> facesBlurred = const Value.absent(),
                Value<String?> classifierScores = const Value.absent(),
                Value<String?> moderationStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EvidencesCompanion.insert(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                type: type,
                localPath: localPath,
                storageUrl: storageUrl,
                thumbUrl: thumbUrl,
                sha256: sha256,
                capturedAt: capturedAt,
                lat: lat,
                lng: lng,
                uploadedBy: uploadedBy,
                exifStripped: exifStripped,
                facesBlurred: facesBlurred,
                classifierScores: classifierScores,
                moderationStatus: moderationStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EvidencesTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $EvidencesTable,
      Evidence,
      $$EvidencesTableFilterComposer,
      $$EvidencesTableOrderingComposer,
      $$EvidencesTableAnnotationComposer,
      $$EvidencesTableCreateCompanionBuilder,
      $$EvidencesTableUpdateCompanionBuilder,
      (Evidence, BaseReferences<_$BaseDatos, $EvidencesTable, Evidence>),
      Evidence,
      PrefetchHooks Function()
    >;
typedef $$EndorsementsTableCreateCompanionBuilder =
    EndorsementsCompanion Function({
      required String clientUuid,
      Value<SyncStatus> syncStatus,
      required DateTime updatedAt,
      required String id,
      required String caseId,
      required String userId,
      required DateTime createdAt,
      Value<String> impactTags,
      Value<bool> countsAsFormalSignature,
      Value<bool> isResident,
      Value<int> rowid,
    });
typedef $$EndorsementsTableUpdateCompanionBuilder =
    EndorsementsCompanion Function({
      Value<String> clientUuid,
      Value<SyncStatus> syncStatus,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> caseId,
      Value<String> userId,
      Value<DateTime> createdAt,
      Value<String> impactTags,
      Value<bool> countsAsFormalSignature,
      Value<bool> isResident,
      Value<int> rowid,
    });

class $$EndorsementsTableFilterComposer
    extends Composer<_$BaseDatos, $EndorsementsTable> {
  $$EndorsementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get impactTags => $composableBuilder(
    column: $table.impactTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get countsAsFormalSignature => $composableBuilder(
    column: $table.countsAsFormalSignature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isResident => $composableBuilder(
    column: $table.isResident,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EndorsementsTableOrderingComposer
    extends Composer<_$BaseDatos, $EndorsementsTable> {
  $$EndorsementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get impactTags => $composableBuilder(
    column: $table.impactTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get countsAsFormalSignature => $composableBuilder(
    column: $table.countsAsFormalSignature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isResident => $composableBuilder(
    column: $table.isResident,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EndorsementsTableAnnotationComposer
    extends Composer<_$BaseDatos, $EndorsementsTable> {
  $$EndorsementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get impactTags => $composableBuilder(
    column: $table.impactTags,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get countsAsFormalSignature => $composableBuilder(
    column: $table.countsAsFormalSignature,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isResident => $composableBuilder(
    column: $table.isResident,
    builder: (column) => column,
  );
}

class $$EndorsementsTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $EndorsementsTable,
          Endorsement,
          $$EndorsementsTableFilterComposer,
          $$EndorsementsTableOrderingComposer,
          $$EndorsementsTableAnnotationComposer,
          $$EndorsementsTableCreateCompanionBuilder,
          $$EndorsementsTableUpdateCompanionBuilder,
          (
            Endorsement,
            BaseReferences<_$BaseDatos, $EndorsementsTable, Endorsement>,
          ),
          Endorsement,
          PrefetchHooks Function()
        > {
  $$EndorsementsTableTableManager(_$BaseDatos db, $EndorsementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EndorsementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EndorsementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EndorsementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clientUuid = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> caseId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> impactTags = const Value.absent(),
                Value<bool> countsAsFormalSignature = const Value.absent(),
                Value<bool> isResident = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EndorsementsCompanion(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                userId: userId,
                createdAt: createdAt,
                impactTags: impactTags,
                countsAsFormalSignature: countsAsFormalSignature,
                isResident: isResident,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientUuid,
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime updatedAt,
                required String id,
                required String caseId,
                required String userId,
                required DateTime createdAt,
                Value<String> impactTags = const Value.absent(),
                Value<bool> countsAsFormalSignature = const Value.absent(),
                Value<bool> isResident = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EndorsementsCompanion.insert(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                userId: userId,
                createdAt: createdAt,
                impactTags: impactTags,
                countsAsFormalSignature: countsAsFormalSignature,
                isResident: isResident,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EndorsementsTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $EndorsementsTable,
      Endorsement,
      $$EndorsementsTableFilterComposer,
      $$EndorsementsTableOrderingComposer,
      $$EndorsementsTableAnnotationComposer,
      $$EndorsementsTableCreateCompanionBuilder,
      $$EndorsementsTableUpdateCompanionBuilder,
      (
        Endorsement,
        BaseReferences<_$BaseDatos, $EndorsementsTable, Endorsement>,
      ),
      Endorsement,
      PrefetchHooks Function()
    >;
typedef $$CaseActionsTableCreateCompanionBuilder =
    CaseActionsCompanion Function({
      required String clientUuid,
      Value<SyncStatus> syncStatus,
      required DateTime updatedAt,
      required String id,
      required String caseId,
      required CaseActionType type,
      Value<String?> performedBy,
      required DateTime performedAt,
      Value<String?> channel,
      Value<String?> documentUrl,
      Value<String?> receiptRef,
      Value<String?> externalRef,
      Value<String?> payload,
      Value<int> rowid,
    });
typedef $$CaseActionsTableUpdateCompanionBuilder =
    CaseActionsCompanion Function({
      Value<String> clientUuid,
      Value<SyncStatus> syncStatus,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> caseId,
      Value<CaseActionType> type,
      Value<String?> performedBy,
      Value<DateTime> performedAt,
      Value<String?> channel,
      Value<String?> documentUrl,
      Value<String?> receiptRef,
      Value<String?> externalRef,
      Value<String?> payload,
      Value<int> rowid,
    });

class $$CaseActionsTableFilterComposer
    extends Composer<_$BaseDatos, $CaseActionsTable> {
  $$CaseActionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CaseActionType, CaseActionType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get performedBy => $composableBuilder(
    column: $table.performedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentUrl => $composableBuilder(
    column: $table.documentUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptRef => $composableBuilder(
    column: $table.receiptRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get externalRef => $composableBuilder(
    column: $table.externalRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CaseActionsTableOrderingComposer
    extends Composer<_$BaseDatos, $CaseActionsTable> {
  $$CaseActionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get performedBy => $composableBuilder(
    column: $table.performedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentUrl => $composableBuilder(
    column: $table.documentUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptRef => $composableBuilder(
    column: $table.receiptRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get externalRef => $composableBuilder(
    column: $table.externalRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CaseActionsTableAnnotationComposer
    extends Composer<_$BaseDatos, $CaseActionsTable> {
  $$CaseActionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CaseActionType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get performedBy => $composableBuilder(
    column: $table.performedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<String> get documentUrl => $composableBuilder(
    column: $table.documentUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receiptRef => $composableBuilder(
    column: $table.receiptRef,
    builder: (column) => column,
  );

  GeneratedColumn<String> get externalRef => $composableBuilder(
    column: $table.externalRef,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CaseActionsTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $CaseActionsTable,
          CaseAction,
          $$CaseActionsTableFilterComposer,
          $$CaseActionsTableOrderingComposer,
          $$CaseActionsTableAnnotationComposer,
          $$CaseActionsTableCreateCompanionBuilder,
          $$CaseActionsTableUpdateCompanionBuilder,
          (
            CaseAction,
            BaseReferences<_$BaseDatos, $CaseActionsTable, CaseAction>,
          ),
          CaseAction,
          PrefetchHooks Function()
        > {
  $$CaseActionsTableTableManager(_$BaseDatos db, $CaseActionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaseActionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaseActionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaseActionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clientUuid = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> caseId = const Value.absent(),
                Value<CaseActionType> type = const Value.absent(),
                Value<String?> performedBy = const Value.absent(),
                Value<DateTime> performedAt = const Value.absent(),
                Value<String?> channel = const Value.absent(),
                Value<String?> documentUrl = const Value.absent(),
                Value<String?> receiptRef = const Value.absent(),
                Value<String?> externalRef = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CaseActionsCompanion(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                type: type,
                performedBy: performedBy,
                performedAt: performedAt,
                channel: channel,
                documentUrl: documentUrl,
                receiptRef: receiptRef,
                externalRef: externalRef,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientUuid,
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime updatedAt,
                required String id,
                required String caseId,
                required CaseActionType type,
                Value<String?> performedBy = const Value.absent(),
                required DateTime performedAt,
                Value<String?> channel = const Value.absent(),
                Value<String?> documentUrl = const Value.absent(),
                Value<String?> receiptRef = const Value.absent(),
                Value<String?> externalRef = const Value.absent(),
                Value<String?> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CaseActionsCompanion.insert(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                type: type,
                performedBy: performedBy,
                performedAt: performedAt,
                channel: channel,
                documentUrl: documentUrl,
                receiptRef: receiptRef,
                externalRef: externalRef,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CaseActionsTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $CaseActionsTable,
      CaseAction,
      $$CaseActionsTableFilterComposer,
      $$CaseActionsTableOrderingComposer,
      $$CaseActionsTableAnnotationComposer,
      $$CaseActionsTableCreateCompanionBuilder,
      $$CaseActionsTableUpdateCompanionBuilder,
      (CaseAction, BaseReferences<_$BaseDatos, $CaseActionsTable, CaseAction>),
      CaseAction,
      PrefetchHooks Function()
    >;
typedef $$OfficialResponsesTableCreateCompanionBuilder =
    OfficialResponsesCompanion Function({
      required String id,
      required String caseId,
      required String organismId,
      required DateTime receivedAt,
      required String content,
      Value<String?> documentUrl,
      Value<bool> isResolution,
      Value<String?> registeredBy,
      Value<int> rowid,
    });
typedef $$OfficialResponsesTableUpdateCompanionBuilder =
    OfficialResponsesCompanion Function({
      Value<String> id,
      Value<String> caseId,
      Value<String> organismId,
      Value<DateTime> receivedAt,
      Value<String> content,
      Value<String?> documentUrl,
      Value<bool> isResolution,
      Value<String?> registeredBy,
      Value<int> rowid,
    });

class $$OfficialResponsesTableFilterComposer
    extends Composer<_$BaseDatos, $OfficialResponsesTable> {
  $$OfficialResponsesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organismId => $composableBuilder(
    column: $table.organismId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentUrl => $composableBuilder(
    column: $table.documentUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isResolution => $composableBuilder(
    column: $table.isResolution,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registeredBy => $composableBuilder(
    column: $table.registeredBy,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OfficialResponsesTableOrderingComposer
    extends Composer<_$BaseDatos, $OfficialResponsesTable> {
  $$OfficialResponsesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organismId => $composableBuilder(
    column: $table.organismId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentUrl => $composableBuilder(
    column: $table.documentUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isResolution => $composableBuilder(
    column: $table.isResolution,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registeredBy => $composableBuilder(
    column: $table.registeredBy,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OfficialResponsesTableAnnotationComposer
    extends Composer<_$BaseDatos, $OfficialResponsesTable> {
  $$OfficialResponsesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<String> get organismId => $composableBuilder(
    column: $table.organismId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get documentUrl => $composableBuilder(
    column: $table.documentUrl,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isResolution => $composableBuilder(
    column: $table.isResolution,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registeredBy => $composableBuilder(
    column: $table.registeredBy,
    builder: (column) => column,
  );
}

class $$OfficialResponsesTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $OfficialResponsesTable,
          OfficialResponse,
          $$OfficialResponsesTableFilterComposer,
          $$OfficialResponsesTableOrderingComposer,
          $$OfficialResponsesTableAnnotationComposer,
          $$OfficialResponsesTableCreateCompanionBuilder,
          $$OfficialResponsesTableUpdateCompanionBuilder,
          (
            OfficialResponse,
            BaseReferences<
              _$BaseDatos,
              $OfficialResponsesTable,
              OfficialResponse
            >,
          ),
          OfficialResponse,
          PrefetchHooks Function()
        > {
  $$OfficialResponsesTableTableManager(
    _$BaseDatos db,
    $OfficialResponsesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfficialResponsesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfficialResponsesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfficialResponsesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> caseId = const Value.absent(),
                Value<String> organismId = const Value.absent(),
                Value<DateTime> receivedAt = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String?> documentUrl = const Value.absent(),
                Value<bool> isResolution = const Value.absent(),
                Value<String?> registeredBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OfficialResponsesCompanion(
                id: id,
                caseId: caseId,
                organismId: organismId,
                receivedAt: receivedAt,
                content: content,
                documentUrl: documentUrl,
                isResolution: isResolution,
                registeredBy: registeredBy,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String caseId,
                required String organismId,
                required DateTime receivedAt,
                required String content,
                Value<String?> documentUrl = const Value.absent(),
                Value<bool> isResolution = const Value.absent(),
                Value<String?> registeredBy = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OfficialResponsesCompanion.insert(
                id: id,
                caseId: caseId,
                organismId: organismId,
                receivedAt: receivedAt,
                content: content,
                documentUrl: documentUrl,
                isResolution: isResolution,
                registeredBy: registeredBy,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OfficialResponsesTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $OfficialResponsesTable,
      OfficialResponse,
      $$OfficialResponsesTableFilterComposer,
      $$OfficialResponsesTableOrderingComposer,
      $$OfficialResponsesTableAnnotationComposer,
      $$OfficialResponsesTableCreateCompanionBuilder,
      $$OfficialResponsesTableUpdateCompanionBuilder,
      (
        OfficialResponse,
        BaseReferences<_$BaseDatos, $OfficialResponsesTable, OfficialResponse>,
      ),
      OfficialResponse,
      PrefetchHooks Function()
    >;
typedef $$ResolutionsTableCreateCompanionBuilder =
    ResolutionsCompanion Function({
      required String clientUuid,
      Value<SyncStatus> syncStatus,
      required DateTime updatedAt,
      required String id,
      required String caseId,
      Value<String?> afterPhotoId,
      required String claimedBy,
      required DateTime claimedAt,
      Value<String> confirmations,
      Value<DateTime?> confirmedAt,
      Value<int> rowid,
    });
typedef $$ResolutionsTableUpdateCompanionBuilder =
    ResolutionsCompanion Function({
      Value<String> clientUuid,
      Value<SyncStatus> syncStatus,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> caseId,
      Value<String?> afterPhotoId,
      Value<String> claimedBy,
      Value<DateTime> claimedAt,
      Value<String> confirmations,
      Value<DateTime?> confirmedAt,
      Value<int> rowid,
    });

class $$ResolutionsTableFilterComposer
    extends Composer<_$BaseDatos, $ResolutionsTable> {
  $$ResolutionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get afterPhotoId => $composableBuilder(
    column: $table.afterPhotoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get claimedBy => $composableBuilder(
    column: $table.claimedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get claimedAt => $composableBuilder(
    column: $table.claimedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get confirmations => $composableBuilder(
    column: $table.confirmations,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get confirmedAt => $composableBuilder(
    column: $table.confirmedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ResolutionsTableOrderingComposer
    extends Composer<_$BaseDatos, $ResolutionsTable> {
  $$ResolutionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseId => $composableBuilder(
    column: $table.caseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get afterPhotoId => $composableBuilder(
    column: $table.afterPhotoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get claimedBy => $composableBuilder(
    column: $table.claimedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get claimedAt => $composableBuilder(
    column: $table.claimedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get confirmations => $composableBuilder(
    column: $table.confirmations,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get confirmedAt => $composableBuilder(
    column: $table.confirmedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ResolutionsTableAnnotationComposer
    extends Composer<_$BaseDatos, $ResolutionsTable> {
  $$ResolutionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseId =>
      $composableBuilder(column: $table.caseId, builder: (column) => column);

  GeneratedColumn<String> get afterPhotoId => $composableBuilder(
    column: $table.afterPhotoId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get claimedBy =>
      $composableBuilder(column: $table.claimedBy, builder: (column) => column);

  GeneratedColumn<DateTime> get claimedAt =>
      $composableBuilder(column: $table.claimedAt, builder: (column) => column);

  GeneratedColumn<String> get confirmations => $composableBuilder(
    column: $table.confirmations,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get confirmedAt => $composableBuilder(
    column: $table.confirmedAt,
    builder: (column) => column,
  );
}

class $$ResolutionsTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $ResolutionsTable,
          Resolution,
          $$ResolutionsTableFilterComposer,
          $$ResolutionsTableOrderingComposer,
          $$ResolutionsTableAnnotationComposer,
          $$ResolutionsTableCreateCompanionBuilder,
          $$ResolutionsTableUpdateCompanionBuilder,
          (
            Resolution,
            BaseReferences<_$BaseDatos, $ResolutionsTable, Resolution>,
          ),
          Resolution,
          PrefetchHooks Function()
        > {
  $$ResolutionsTableTableManager(_$BaseDatos db, $ResolutionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResolutionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResolutionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResolutionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clientUuid = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> caseId = const Value.absent(),
                Value<String?> afterPhotoId = const Value.absent(),
                Value<String> claimedBy = const Value.absent(),
                Value<DateTime> claimedAt = const Value.absent(),
                Value<String> confirmations = const Value.absent(),
                Value<DateTime?> confirmedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResolutionsCompanion(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                afterPhotoId: afterPhotoId,
                claimedBy: claimedBy,
                claimedAt: claimedAt,
                confirmations: confirmations,
                confirmedAt: confirmedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientUuid,
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime updatedAt,
                required String id,
                required String caseId,
                Value<String?> afterPhotoId = const Value.absent(),
                required String claimedBy,
                required DateTime claimedAt,
                Value<String> confirmations = const Value.absent(),
                Value<DateTime?> confirmedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResolutionsCompanion.insert(
                clientUuid: clientUuid,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                id: id,
                caseId: caseId,
                afterPhotoId: afterPhotoId,
                claimedBy: claimedBy,
                claimedAt: claimedAt,
                confirmations: confirmations,
                confirmedAt: confirmedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ResolutionsTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $ResolutionsTable,
      Resolution,
      $$ResolutionsTableFilterComposer,
      $$ResolutionsTableOrderingComposer,
      $$ResolutionsTableAnnotationComposer,
      $$ResolutionsTableCreateCompanionBuilder,
      $$ResolutionsTableUpdateCompanionBuilder,
      (Resolution, BaseReferences<_$BaseDatos, $ResolutionsTable, Resolution>),
      Resolution,
      PrefetchHooks Function()
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String displayName,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> homeNeighborhoodId,
      Value<String?> homeGeohash,
      required UserRole role,
      Value<int> verificationLevel,
      Value<int> gpsPresenceDays,
      Value<String> notificationPrefs,
      Value<String> locale,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> displayName,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> homeNeighborhoodId,
      Value<String?> homeGeohash,
      Value<UserRole> role,
      Value<int> verificationLevel,
      Value<int> gpsPresenceDays,
      Value<String> notificationPrefs,
      Value<String> locale,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$UsersTableFilterComposer extends Composer<_$BaseDatos, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeNeighborhoodId => $composableBuilder(
    column: $table.homeNeighborhoodId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeGeohash => $composableBuilder(
    column: $table.homeGeohash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UserRole, UserRole, String> get role =>
      $composableBuilder(
        column: $table.role,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get verificationLevel => $composableBuilder(
    column: $table.verificationLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gpsPresenceDays => $composableBuilder(
    column: $table.gpsPresenceDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notificationPrefs => $composableBuilder(
    column: $table.notificationPrefs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locale => $composableBuilder(
    column: $table.locale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer extends Composer<_$BaseDatos, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeNeighborhoodId => $composableBuilder(
    column: $table.homeNeighborhoodId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeGeohash => $composableBuilder(
    column: $table.homeGeohash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verificationLevel => $composableBuilder(
    column: $table.verificationLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gpsPresenceDays => $composableBuilder(
    column: $table.gpsPresenceDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notificationPrefs => $composableBuilder(
    column: $table.notificationPrefs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locale => $composableBuilder(
    column: $table.locale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$BaseDatos, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get homeNeighborhoodId => $composableBuilder(
    column: $table.homeNeighborhoodId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get homeGeohash => $composableBuilder(
    column: $table.homeGeohash,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<UserRole, String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<int> get verificationLevel => $composableBuilder(
    column: $table.verificationLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get gpsPresenceDays => $composableBuilder(
    column: $table.gpsPresenceDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notificationPrefs => $composableBuilder(
    column: $table.notificationPrefs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locale =>
      $composableBuilder(column: $table.locale, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$BaseDatos, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$BaseDatos db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> homeNeighborhoodId = const Value.absent(),
                Value<String?> homeGeohash = const Value.absent(),
                Value<UserRole> role = const Value.absent(),
                Value<int> verificationLevel = const Value.absent(),
                Value<int> gpsPresenceDays = const Value.absent(),
                Value<String> notificationPrefs = const Value.absent(),
                Value<String> locale = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                displayName: displayName,
                email: email,
                phone: phone,
                homeNeighborhoodId: homeNeighborhoodId,
                homeGeohash: homeGeohash,
                role: role,
                verificationLevel: verificationLevel,
                gpsPresenceDays: gpsPresenceDays,
                notificationPrefs: notificationPrefs,
                locale: locale,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String displayName,
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> homeNeighborhoodId = const Value.absent(),
                Value<String?> homeGeohash = const Value.absent(),
                required UserRole role,
                Value<int> verificationLevel = const Value.absent(),
                Value<int> gpsPresenceDays = const Value.absent(),
                Value<String> notificationPrefs = const Value.absent(),
                Value<String> locale = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                displayName: displayName,
                email: email,
                phone: phone,
                homeNeighborhoodId: homeNeighborhoodId,
                homeGeohash: homeGeohash,
                role: role,
                verificationLevel: verificationLevel,
                gpsPresenceDays: gpsPresenceDays,
                notificationPrefs: notificationPrefs,
                locale: locale,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$BaseDatos, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;
typedef $$SyncOpsTableCreateCompanionBuilder =
    SyncOpsCompanion Function({
      Value<int> id,
      required String entity,
      required String entityId,
      required String clientUuid,
      required String operation,
      required String payload,
      required DateTime createdAt,
      Value<int> attempts,
      required DateTime nextAttemptAt,
      Value<String?> lastError,
      Value<SyncStatus> status,
    });
typedef $$SyncOpsTableUpdateCompanionBuilder =
    SyncOpsCompanion Function({
      Value<int> id,
      Value<String> entity,
      Value<String> entityId,
      Value<String> clientUuid,
      Value<String> operation,
      Value<String> payload,
      Value<DateTime> createdAt,
      Value<int> attempts,
      Value<DateTime> nextAttemptAt,
      Value<String?> lastError,
      Value<SyncStatus> status,
    });

class $$SyncOpsTableFilterComposer
    extends Composer<_$BaseDatos, $SyncOpsTable> {
  $$SyncOpsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$SyncOpsTableOrderingComposer
    extends Composer<_$BaseDatos, $SyncOpsTable> {
  $$SyncOpsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncOpsTableAnnotationComposer
    extends Composer<_$BaseDatos, $SyncOpsTable> {
  $$SyncOpsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entity =>
      $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$SyncOpsTableTableManager
    extends
        RootTableManager<
          _$BaseDatos,
          $SyncOpsTable,
          SyncOp,
          $$SyncOpsTableFilterComposer,
          $$SyncOpsTableOrderingComposer,
          $$SyncOpsTableAnnotationComposer,
          $$SyncOpsTableCreateCompanionBuilder,
          $$SyncOpsTableUpdateCompanionBuilder,
          (SyncOp, BaseReferences<_$BaseDatos, $SyncOpsTable, SyncOp>),
          SyncOp,
          PrefetchHooks Function()
        > {
  $$SyncOpsTableTableManager(_$BaseDatos db, $SyncOpsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncOpsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncOpsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncOpsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entity = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> clientUuid = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime> nextAttemptAt = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<SyncStatus> status = const Value.absent(),
              }) => SyncOpsCompanion(
                id: id,
                entity: entity,
                entityId: entityId,
                clientUuid: clientUuid,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                attempts: attempts,
                nextAttemptAt: nextAttemptAt,
                lastError: lastError,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entity,
                required String entityId,
                required String clientUuid,
                required String operation,
                required String payload,
                required DateTime createdAt,
                Value<int> attempts = const Value.absent(),
                required DateTime nextAttemptAt,
                Value<String?> lastError = const Value.absent(),
                Value<SyncStatus> status = const Value.absent(),
              }) => SyncOpsCompanion.insert(
                id: id,
                entity: entity,
                entityId: entityId,
                clientUuid: clientUuid,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                attempts: attempts,
                nextAttemptAt: nextAttemptAt,
                lastError: lastError,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncOpsTableProcessedTableManager =
    ProcessedTableManager<
      _$BaseDatos,
      $SyncOpsTable,
      SyncOp,
      $$SyncOpsTableFilterComposer,
      $$SyncOpsTableOrderingComposer,
      $$SyncOpsTableAnnotationComposer,
      $$SyncOpsTableCreateCompanionBuilder,
      $$SyncOpsTableUpdateCompanionBuilder,
      (SyncOp, BaseReferences<_$BaseDatos, $SyncOpsTable, SyncOp>),
      SyncOp,
      PrefetchHooks Function()
    >;

class $BaseDatosManager {
  final _$BaseDatos _db;
  $BaseDatosManager(this._db);
  $$CountriesTableTableManager get countries =>
      $$CountriesTableTableManager(_db, _db.countries);
  $$RegionsTableTableManager get regions =>
      $$RegionsTableTableManager(_db, _db.regions);
  $$CitiesTableTableManager get cities =>
      $$CitiesTableTableManager(_db, _db.cities);
  $$NeighborhoodsTableTableManager get neighborhoods =>
      $$NeighborhoodsTableTableManager(_db, _db.neighborhoods);
  $$JurisdictionsTableTableManager get jurisdictions =>
      $$JurisdictionsTableTableManager(_db, _db.jurisdictions);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$CategoryProposalsTableTableManager get categoryProposals =>
      $$CategoryProposalsTableTableManager(_db, _db.categoryProposals);
  $$CasesTableTableManager get cases =>
      $$CasesTableTableManager(_db, _db.cases);
  $$EvidencesTableTableManager get evidences =>
      $$EvidencesTableTableManager(_db, _db.evidences);
  $$EndorsementsTableTableManager get endorsements =>
      $$EndorsementsTableTableManager(_db, _db.endorsements);
  $$CaseActionsTableTableManager get caseActions =>
      $$CaseActionsTableTableManager(_db, _db.caseActions);
  $$OfficialResponsesTableTableManager get officialResponses =>
      $$OfficialResponsesTableTableManager(_db, _db.officialResponses);
  $$ResolutionsTableTableManager get resolutions =>
      $$ResolutionsTableTableManager(_db, _db.resolutions);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$SyncOpsTableTableManager get syncOps =>
      $$SyncOpsTableTableManager(_db, _db.syncOps);
}
