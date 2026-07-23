import '../../data/models/categoria_def.dart';
import '../../data/models/texto_i18n.dart';

/// Datos que el escrito necesita además de las selecciones del árbol.
class ContextoEscrito {
  const ContextoEscrito({
    required this.idioma,
    this.direccion,
    required this.lat,
    required this.lng,
    required this.fechaCaptura,
    this.adhesiones = 0,
    this.adhesionesVerificadas = 0,
    this.normativa = const [],
    this.plazoDias,
  });

  final String idioma;
  final String? direccion;
  final double lat;
  final double lng;
  final DateTime fechaCaptura;
  final int adhesiones;
  final int adhesionesVerificadas;
  final List<String> normativa;
  final int? plazoDias;
}

/// Redacta el escrito administrativo formal a partir de las selecciones
/// guiadas (§9): el vecino elige, la app redacta. Cada opción del árbol JSON
/// aporta su `fragmento`; esto solo los compone. Nunca inventa hechos.
abstract final class GeneradorEscrito {
  /// El escrito completo, en secciones de mesa de entradas (§9.3).
  static String generar({
    required CategoriaDef categoria,
    required String subtipoId,
    required Map<String, dynamic> respuestas,
    required ContextoEscrito ctx,
    String? textoLibre,
  }) {
    final idioma = ctx.idioma;
    final subtipo = categoria.subtipos.firstWhere(
      (s) => s.id == subtipoId,
      orElse: () => categoria.subtipos.first,
    );

    final hechosExtra = <String>[];
    final afectaciones = <String>[];
    final antecedentes = <String>[];

    for (final pregunta in categoria.preguntas) {
      final respuesta = respuestas[pregunta.id];
      if (respuesta == null) continue;
      final elegidas = respuesta is List
          ? respuesta.cast<String>()
          : [respuesta as String];
      for (final opcionId in elegidas) {
        final opcion = pregunta.opciones.where((o) => o.id == opcionId);
        if (opcion.isEmpty) continue;
        final fragmento = opcion.first.fragmento?.resolver(idioma);
        if (fragmento == null || fragmento.isEmpty) continue;
        // Convención de los JSON: los fragmentos que son oración completa
        // (mayúscula inicial + punto) van a afectación/antecedentes; los
        // fragmentos en minúscula complementan el hecho principal.
        if (pregunta.id == 'reclamo_previo') {
          antecedentes.add(fragmento);
        } else if (fragmento.endsWith('.')) {
          afectaciones.add(fragmento);
        } else {
          hechosExtra.add(fragmento);
        }
      }
    }

    final fecha = _fecha(ctx.fechaCaptura, idioma);
    final coordenadas =
        '${ctx.lat.toStringAsFixed(5)}, ${ctx.lng.toStringAsFixed(5)}';
    final lugar = ctx.direccion == null
        ? _t(
            idioma,
            es: 'en las coordenadas indicadas',
            en: 'at the indicated coordinates',
            pt: 'nas coordenadas indicadas',
          )
        : _t(
            idioma,
            es: 'sita en ${ctx.direccion}',
            en: 'located at ${ctx.direccion}',
            pt: 'situada em ${ctx.direccion}',
          );

    final b = StringBuffer();

    // Objeto
    b.writeln(_titulo(idioma, es: 'Objeto', en: 'Subject', pt: 'Objeto'));
    b.writeln(
      _t(
        idioma,
        es: 'Solicitud de intervención por ${subtipo.fragmento.resolver(idioma)}.',
        en: 'Request for intervention regarding ${subtipo.fragmento.resolver(idioma)}.',
        pt: 'Solicitação de intervenção por ${subtipo.fragmento.resolver(idioma)}.',
      ),
    );
    b.writeln();

    // Hechos
    b.writeln(_titulo(idioma, es: 'Hechos', en: 'Facts', pt: 'Fatos'));
    final complemento = hechosExtra.isEmpty
        ? ''
        : ', ${hechosExtra.join(', ')}';
    b.writeln(
      _t(
        idioma,
        es:
            'Se constata ${subtipo.fragmento.resolver(idioma)}$complemento, '
            '$lugar, coordenadas $coordenadas, según registro fotográfico '
            'adjunto captado el $fecha con geolocalización verificada.',
        en:
            'It is recorded: ${subtipo.fragmento.resolver(idioma)}$complemento, '
            '$lugar, coordinates $coordenadas, per the attached photographic '
            'record captured on $fecha with verified geolocation.',
        pt:
            'Constata-se ${subtipo.fragmento.resolver(idioma)}$complemento, '
            '$lugar, coordenadas $coordenadas, conforme registro fotográfico '
            'anexo captado em $fecha com geolocalização verificada.',
      ),
    );
    b.writeln();

    // Afectación
    if (afectaciones.isNotEmpty || ctx.adhesiones > 0) {
      b.writeln(
        _titulo(idioma, es: 'Afectación', en: 'Impact', pt: 'Afetação'),
      );
      b.writeln(afectaciones.join(' '));
      if (ctx.adhesiones > 0) {
        b.writeln(
          _t(
            idioma,
            es:
                'Se registran ${ctx.adhesiones} adhesiones de vecinos, de las '
                'cuales ${ctx.adhesionesVerificadas} corresponden a domicilio verificado.',
            en:
                '${ctx.adhesiones} neighbor endorsements are on record, of which '
                '${ctx.adhesionesVerificadas} correspond to verified addresses.',
            pt:
                'Registram-se ${ctx.adhesiones} adesões de vizinhos, das quais '
                '${ctx.adhesionesVerificadas} correspondem a domicílio verificado.',
          ),
        );
      }
      b.writeln();
    }

    // Antecedentes
    if (antecedentes.isNotEmpty) {
      b.writeln(
        _titulo(
          idioma,
          es: 'Antecedentes',
          en: 'Background',
          pt: 'Antecedentes',
        ),
      );
      b.writeln(antecedentes.join(' '));
      b.writeln();
    }

    // Manifestación adicional (único campo libre, ya filtrado §9.5)
    if (textoLibre != null && textoLibre.trim().isNotEmpty) {
      b.writeln(
        _titulo(
          idioma,
          es: 'Manifestación del presentante',
          en: "Filer's statement",
          pt: 'Manifestação do apresentante',
        ),
      );
      b.writeln('"${textoLibre.trim()}"');
      b.writeln();
    }

    // Normativa
    if (ctx.normativa.isNotEmpty) {
      b.writeln(
        _titulo(
          idioma,
          es: 'Normativa invocada',
          en: 'Legal basis',
          pt: 'Normativa invocada',
        ),
      );
      b.writeln(ctx.normativa.join('; '));
      b.writeln();
    }

    // Petitorio
    b.writeln(_titulo(idioma, es: 'Petitorio', en: 'Request', pt: 'Petitório'));
    final plazo = ctx.plazoDias;
    b.writeln(
      _t(
        idioma,
        es: plazo == null
            ? 'Se solicita la intervención del organismo competente y respuesta '
                  'formal dentro del plazo legal.'
            : 'Se solicita la intervención del organismo competente y respuesta '
                  'formal dentro del plazo legal de $plazo días.',
        en: plazo == null
            ? 'Intervention by the competent body is requested, with formal '
                  'response within the legal deadline.'
            : 'Intervention by the competent body is requested, with formal '
                  'response within the legal deadline of $plazo days.',
        pt: plazo == null
            ? 'Solicita-se a intervenção do órgão competente e resposta formal '
                  'dentro do prazo legal.'
            : 'Solicita-se a intervenção do órgão competente e resposta formal '
                  'dentro do prazo legal de $plazo dias.',
      ),
    );

    return b.toString().trimRight();
  }

  /// Fecha formal sin depender de datos de locale de intl (que exigen
  /// inicialización asíncrona): un documento legal necesita determinismo.
  static String _fecha(DateTime f, String idioma) {
    const meses = {
      'es': [
        'enero',
        'febrero',
        'marzo',
        'abril',
        'mayo',
        'junio',
        'julio',
        'agosto',
        'septiembre',
        'octubre',
        'noviembre',
        'diciembre',
      ],
      'en': [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ],
      'pt': [
        'janeiro',
        'fevereiro',
        'março',
        'abril',
        'maio',
        'junho',
        'julho',
        'agosto',
        'setembro',
        'outubro',
        'novembro',
        'dezembro',
      ],
    };
    final idiomaBase = idioma.split(RegExp('[-_]')).first;
    final mes = (meses[idiomaBase] ?? meses['es']!)[f.month - 1];
    return switch (idiomaBase) {
      'en' => '$mes ${f.day}, ${f.year}',
      _ => '${f.day} de $mes de ${f.year}',
    };
  }

  static String _titulo(
    String idioma, {
    required String es,
    required String en,
    required String pt,
  }) => '**${_t(idioma, es: es, en: en, pt: pt)}:**';

  static String _t(
    String idioma, {
    required String es,
    required String en,
    required String pt,
  }) => switch (idioma.split(RegExp('[-_]')).first) {
    'en' => en,
    'pt' => pt,
    _ => es,
  };
}
