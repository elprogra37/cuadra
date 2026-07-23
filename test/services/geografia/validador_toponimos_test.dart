import 'package:cuadra/services/geografia/validador_toponimos.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> _lugar({
  required String tipo,
  String categoria = 'place',
  double lat = -34.60,
  double lng = -58.44,
  String nombre = 'Villa Crespo, Buenos Aires, Argentina',
}) => {
  'type': tipo,
  'category': categoria,
  'lat': '$lat',
  'lon': '$lng',
  'display_name': nombre,
};

void main() {
  group('interpretarRespuesta (Nominatim)', () {
    test('encuentra un barrio cerca de las coordenadas', () {
      final v = NominatimValidador.interpretarRespuesta(
        [_lugar(tipo: 'suburb')],
        lat: -34.60,
        lng: -58.44,
      );
      expect(v.encontrado, isTrue);
      expect(v.fuente, 'osm');
      expect(v.nombreCanonico, 'Villa Crespo');
      expect(v.lat, closeTo(-34.60, 0.001));
    });

    test('acepta los tipos OSM de barrio y rechaza el resto', () {
      for (final tipo in ['suburb', 'neighbourhood', 'quarter']) {
        final v = NominatimValidador.interpretarRespuesta(
          [_lugar(tipo: tipo)],
          lat: -34.60,
          lng: -58.44,
        );
        expect(v.encontrado, isTrue, reason: tipo);
      }
      // Una calle con el mismo nombre no valida un barrio.
      final calle = NominatimValidador.interpretarRespuesta(
        [_lugar(tipo: 'residential', categoria: 'highway')],
        lat: -34.60,
        lng: -58.44,
      );
      expect(calle.encontrado, isFalse);
    });

    test('rechaza un topónimo demasiado lejos de la zona del usuario', () {
      // El barrio existe pero en otra ciudad (a ~7° de distancia).
      final v = NominatimValidador.interpretarRespuesta(
        [_lugar(tipo: 'suburb', lat: -27.5, lng: -58.9)],
        lat: -34.60,
        lng: -58.44,
      );
      expect(v.encontrado, isFalse);
    });

    test('respuesta vacía = no encontrado (y no bloquea el alta)', () {
      final v = NominatimValidador.interpretarRespuesta(
        const [],
        lat: -34.60,
        lng: -58.44,
      );
      expect(v.encontrado, isFalse);
    });
  });
}
