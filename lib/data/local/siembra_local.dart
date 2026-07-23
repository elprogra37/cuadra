import 'package:drift/drift.dart';

import 'base_datos.dart';

/// Siembra local mínima para que la jerarquía geográfica funcione offline
/// desde el primer arranque (espejo del 60-siembra.sql del servidor; la
/// siembra mundial llega por sincronización). Idempotente.
Future<void> sembrarGeografiaLocal(BaseDatos db) async {
  final hayPaises =
      await (db.select(db.countries)..limit(1)).getSingleOrNull() != null;
  if (hayPaises) return;

  await db.batch((b) {
    b.insertAll(db.countries, [
      CountriesCompanion.insert(
        id: 'AR',
        name: 'Argentina',
        defaultLanguage: 'es',
        defaultTimezone: 'America/Argentina/Buenos_Aires',
      ),
    ], mode: InsertMode.insertOrIgnore);

    b.insertAll(db.regions, [
      RegionsCompanion.insert(
        id: 'AR-C',
        countryId: 'AR',
        name: 'Ciudad Autónoma de Buenos Aires',
        geonamesId: const Value(3433955),
      ),
      RegionsCompanion.insert(
        id: 'AR-X',
        countryId: 'AR',
        name: 'Córdoba',
        geonamesId: const Value(3860255),
      ),
      RegionsCompanion.insert(
        id: 'AR-S',
        countryId: 'AR',
        name: 'Santa Fe',
        geonamesId: const Value(3836276),
      ),
      RegionsCompanion.insert(
        id: 'AR-B',
        countryId: 'AR',
        name: 'Buenos Aires',
        geonamesId: const Value(3435907),
      ),
      RegionsCompanion.insert(
        id: 'AR-M',
        countryId: 'AR',
        name: 'Mendoza',
        geonamesId: const Value(3844419),
      ),
    ], mode: InsertMode.insertOrIgnore);

    b.insertAll(db.cities, [
      CitiesCompanion.insert(
        id: 'AR-C-CABA',
        regionId: 'AR-C',
        name: 'Ciudad Autónoma de Buenos Aires',
        jurisdictionId: const Value('AR-C-CABA'),
        lat: const Value(-34.6037),
        lng: const Value(-58.3816),
      ),
      CitiesCompanion.insert(
        id: 'AR-X-CBA',
        regionId: 'AR-X',
        name: 'Córdoba',
        lat: const Value(-31.4201),
        lng: const Value(-64.1888),
      ),
      CitiesCompanion.insert(
        id: 'AR-S-ROS',
        regionId: 'AR-S',
        name: 'Rosario',
        lat: const Value(-32.9442),
        lng: const Value(-60.6505),
      ),
      CitiesCompanion.insert(
        id: 'AR-B-LP',
        regionId: 'AR-B',
        name: 'La Plata',
        lat: const Value(-34.9215),
        lng: const Value(-57.9545),
      ),
      CitiesCompanion.insert(
        id: 'AR-M-MDZ',
        regionId: 'AR-M',
        name: 'Mendoza',
        lat: const Value(-32.8895),
        lng: const Value(-68.8458),
      ),
    ], mode: InsertMode.insertOrIgnore);
  });
}
