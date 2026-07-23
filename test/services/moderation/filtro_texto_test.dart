import 'package:cuadra/services/moderation/filtro_texto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('aprueba texto vecinal normal', () {
    for (final texto in [
      'Hace cinco meses que está apagada, cruzamos a oscuras.',
      'El agua llega hasta la puerta cuando llueve fuerte.',
      '',
    ]) {
      expect(FiltroTexto.evaluar(texto).aprobado, isTrue, reason: texto);
    }
  });

  test('rechaza insultos y señala el fragmento', () {
    final r = FiltroTexto.evaluar('el intendente es un inútil');
    expect(r.aprobado, isFalse);
    expect(r.motivo, 'lenguaje');
    expect(r.fragmento, 'inútil');
  });

  test('rechaza datos que identifican personas (§10.4)', () {
    expect(FiltroTexto.evaluar('llamen al 11 4567-8901').aprobado, isFalse);
    expect(FiltroTexto.evaluar('escriban a juan@mail.com').aprobado, isFalse);
    expect(
      FiltroTexto.evaluar('el auto AB 123 CD siempre ahí').aprobado,
      isFalse,
    );
    expect(FiltroTexto.evaluar('su DNI: 30123456').aprobado, isFalse);
  });

  test('rechaza acusaciones a personas', () {
    final r = FiltroTexto.evaluar('el vecino del fondo roba cables');
    expect(r.aprobado, isFalse);
    expect(r.motivo, 'persona');
  });

  test('rechaza textos más largos que 200 caracteres', () {
    final r = FiltroTexto.evaluar('a' * 201);
    expect(r.aprobado, isFalse);
    expect(r.motivo, 'largo');
  });
}
