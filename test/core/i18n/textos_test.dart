import 'package:cuadra/core/i18n/textos.dart';
import 'package:cuadra/core/i18n/textos_en.dart';
import 'package:cuadra/core/i18n/textos_es.dart';
import 'package:cuadra/core/i18n/textos_pt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'el delegate resuelve cada locale soportado a su implementación',
    () async {
      expect(await Textos.delegate.load(const Locale('es')), isA<TextosEs>());
      expect(await Textos.delegate.load(const Locale('en')), isA<TextosEn>());
      expect(await Textos.delegate.load(const Locale('pt')), isA<TextosPt>());
      // Un idioma no soportado cae al español (fuente de verdad).
      expect(await Textos.delegate.load(const Locale('fr')), isA<TextosEs>());
    },
  );

  test('isSupported acepta es/en/pt y rechaza el resto', () {
    expect(Textos.delegate.isSupported(const Locale('es')), isTrue);
    expect(Textos.delegate.isSupported(const Locale('es', 'AR')), isTrue);
    expect(Textos.delegate.isSupported(const Locale('en')), isTrue);
    expect(Textos.delegate.isSupported(const Locale('pt')), isTrue);
    expect(Textos.delegate.isSupported(const Locale('fr')), isFalse);
  });

  test('los textos con parámetros interpolan bien en los tres idiomas', () {
    expect(const TextosEs().selloSinRespuesta(47), 'SIN RESPUESTA · 47 D');
    expect(const TextosEn().selloSinRespuesta(47), 'NO RESPONSE · 47 D');
    expect(const TextosPt().selloSinRespuesta(47), 'SEM RESPOSTA · 47 D');
  });
}
