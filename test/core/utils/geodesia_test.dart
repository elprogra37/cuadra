import 'package:cuadra/core/utils/geodesia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('distanciaMetros', () {
    test('mismo punto = 0', () {
      expect(Geodesia.distanciaMetros(-34.6, -58.4, -34.6, -58.4), 0);
    });

    test('un grado de latitud ≈ 111.2 km', () {
      final d = Geodesia.distanciaMetros(-34.0, -58.4, -35.0, -58.4);
      expect(d, closeTo(111200, 1000));
    });

    test('detecta el radio de deduplicación (80 m)', () {
      // ~0.0007° de latitud ≈ 78 m.
      final cerca = Geodesia.distanciaMetros(-34.6, -58.4, -34.6007, -58.4);
      expect(cerca, lessThan(80));
      final lejos = Geodesia.distanciaMetros(-34.6, -58.4, -34.601, -58.4);
      expect(lejos, greaterThan(80));
    });
  });

  group('puntoEnPoligono', () {
    final cuadrado = [
      (lat: -34.60, lng: -58.45),
      (lat: -34.60, lng: -58.43),
      (lat: -34.62, lng: -58.43),
      (lat: -34.62, lng: -58.45),
    ];

    test('detecta punto adentro', () {
      expect(Geodesia.puntoEnPoligono(-34.61, -58.44, cuadrado), isTrue);
    });

    test('detecta punto afuera', () {
      expect(Geodesia.puntoEnPoligono(-34.59, -58.44, cuadrado), isFalse);
      expect(Geodesia.puntoEnPoligono(-34.61, -58.42, cuadrado), isFalse);
    });

    test('un polígono degenerado nunca contiene', () {
      expect(
        Geodesia.puntoEnPoligono(-34.6, -58.4, [(lat: -34.6, lng: -58.4)]),
        isFalse,
      );
    });
  });

  group('desplazar (privacidad de pines, §19)', () {
    test('nunca supera el máximo de metros', () {
      for (var semilla = 0; semilla < 200; semilla++) {
        final d = Geodesia.desplazar(-34.6, -58.4, semilla: semilla);
        final dist = Geodesia.distanciaMetros(-34.6, -58.4, d.lat, d.lng);
        expect(dist, lessThanOrEqualTo(25.5), reason: 'semilla $semilla');
      }
    });

    test('es determinista por semilla: el pin no baila entre renders', () {
      final a = Geodesia.desplazar(-34.6, -58.4, semilla: 42);
      final b = Geodesia.desplazar(-34.6, -58.4, semilla: 42);
      expect(a, b);
      final c = Geodesia.desplazar(-34.6, -58.4, semilla: 43);
      expect(a == c, isFalse);
    });
  });
}
