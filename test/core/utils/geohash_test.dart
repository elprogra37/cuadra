import 'package:cuadra/core/utils/geohash.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('codifica el vector clásico de referencia', () {
    // Ejemplo canónico de la especificación geohash.
    expect(Geohash.codificar(57.64911, 10.40744, precision: 11), 'u4pruydqqvj');
  });

  test('codifica Buenos Aires con precisión de domicilio (7 chars ~150 m)', () {
    final gh = Geohash.codificar(
      -34.6037,
      -58.3816,
      precision: Geohash.precisionDomicilio,
    );
    expect(gh.length, 7);
    // La celda de 7 caracteres debe decodificar a menos de ~150 m del punto.
    final centro = Geohash.decodificar(gh);
    expect((centro.lat - -34.6037).abs(), lessThan(0.002));
    expect((centro.lng - -58.3816).abs(), lessThan(0.002));
  });

  test('decodificar es inversa aproximada de codificar', () {
    const lat = -31.4201;
    const lng = -64.1888; // Córdoba
    final centro = Geohash.decodificar(
      Geohash.codificar(lat, lng, precision: 9),
    );
    expect((centro.lat - lat).abs(), lessThan(0.0001));
    expect((centro.lng - lng).abs(), lessThan(0.0001));
  });

  test('rechaza caracteres inválidos', () {
    expect(() => Geohash.decodificar('abci'), throwsArgumentError);
  });
}
