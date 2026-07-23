import 'dart:convert';
import 'dart:io';

import 'package:cuadra/data/models/categoria_def.dart';
import 'package:cuadra/services/documents/generador_escrito.dart';
import 'package:flutter_test/flutter_test.dart';

Future<CategoriaDef> _alumbrado() async {
  final raw = await File('assets/categories/alumbrado.json').readAsString();
  return CategoriaDef.fromJson(jsonDecode(raw) as Map<String, dynamic>);
}

void main() {
  test(
    'compone el escrito del ejemplo §9.3 con los fragmentos elegidos',
    () async {
      final categoria = await _alumbrado();
      final escrito = GeneradorEscrito.generar(
        categoria: categoria,
        subtipoId: 'luminaria_apagada',
        respuestas: {
          'donde_exactamente': 'columna_esquina',
          'desde_cuando': 'mas_3_meses',
          'consecuencias': ['zona_escolar', 'sin_otra_iluminacion'],
          'reclamo_previo': 'telefono_sin_respuesta',
        },
        ctx: ContextoEscrito(
          idioma: 'es',
          lat: -34.6,
          lng: -58.44,
          fechaCaptura: DateTime.utc(2026, 7, 23),
          adhesiones: 40,
          adhesionesVerificadas: 12,
          normativa: const ['Ley 104 de Acceso a la Información Pública'],
          plazoDias: 30,
        ),
      );

      // Secciones del escrito formal.
      expect(escrito, contains('**Objeto:**'));
      expect(escrito, contains('**Hechos:**'));
      expect(escrito, contains('**Afectación:**'));
      expect(escrito, contains('**Antecedentes:**'));
      expect(escrito, contains('**Normativa invocada:**'));
      expect(escrito, contains('**Petitorio:**'));

      // Los fragmentos del árbol, compuestos.
      expect(escrito, contains('la falta de funcionamiento de la luminaria'));
      expect(escrito, contains('emplazada en columna de esquina'));
      expect(escrito, contains('noventa (90) días'));
      expect(escrito, contains('zona escolar'));
      expect(escrito, contains('vía telefónica sin respuesta acreditada'));
      expect(escrito, contains('40 adhesiones'));
      expect(escrito, contains('12 corresponden a domicilio verificado'));
      expect(escrito, contains('plazo legal de 30 días'));
      expect(escrito, contains('-34.60000, -58.44000'));
    },
  );

  test('sin adhesiones ni antecedentes omite esas secciones', () async {
    final categoria = await _alumbrado();
    final escrito = GeneradorEscrito.generar(
      categoria: categoria,
      subtipoId: 'luminaria_apagada',
      respuestas: {'desde_cuando': 'menos_1_semana'},
      ctx: ContextoEscrito(
        idioma: 'es',
        lat: -34.6,
        lng: -58.44,
        fechaCaptura: DateTime.utc(2026, 7, 23),
      ),
    );
    expect(escrito, isNot(contains('**Antecedentes:**')));
    expect(escrito, isNot(contains('adhesiones')));
    expect(escrito, contains('**Petitorio:**'));
  });

  test('el texto libre filtrado entra como manifestación citada', () async {
    final categoria = await _alumbrado();
    final escrito = GeneradorEscrito.generar(
      categoria: categoria,
      subtipoId: 'luminaria_apagada',
      respuestas: const {},
      textoLibre: 'Hace meses que cruzamos a oscuras con los chicos.',
      ctx: ContextoEscrito(
        idioma: 'es',
        lat: -34.6,
        lng: -58.44,
        fechaCaptura: DateTime.utc(2026, 7, 23),
      ),
    );
    expect(escrito, contains('**Manifestación del presentante:**'));
    expect(escrito, contains('"Hace meses que cruzamos a oscuras'));
  });

  test('genera en inglés cuando la jurisdicción lo pide', () async {
    final categoria = await _alumbrado();
    final escrito = GeneradorEscrito.generar(
      categoria: categoria,
      subtipoId: 'luminaria_apagada',
      respuestas: {'desde_cuando': 'mas_3_meses'},
      ctx: ContextoEscrito(
        idioma: 'en',
        lat: 40.7,
        lng: -74.0,
        fechaCaptura: DateTime.utc(2026, 7, 23),
      ),
    );
    expect(escrito, contains('**Subject:**'));
    expect(escrito, contains('ninety (90) days'));
  });
}
