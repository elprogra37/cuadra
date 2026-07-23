/// Filtro del único campo libre (§9.5): 200 caracteres, sin insultos, sin
/// datos de personas. Si no pasa, la UI explica qué parte es el problema y
/// el caso se publica igual SIN ese campo — el reclamo nunca se pierde por
/// culpa del texto libre.
///
/// Etapa 1 de moderación (§20.1): reglas. El clasificador llega después.
class ResultadoFiltro {
  const ResultadoFiltro({required this.aprobado, this.motivo, this.fragmento});

  final bool aprobado;

  /// Qué regla falló, para el mensaje al usuario.
  final String? motivo;

  /// La parte del texto que disparó la regla.
  final String? fragmento;
}

abstract final class FiltroTexto {
  static const maxCaracteres = 200;

  /// Insultos y descalificaciones frecuentes (es/en/pt, lista corta inicial;
  /// crece con datos reales). Palabra completa, insensible a mayúsculas.
  static final _insultos = RegExp(
    r'\b(?:'
    r'mierda|pelotudo|boludo|forro|sorete|garca|hijo de puta|hdp|'
    r'puto|puta|trolo|conchudo|malparido|imbecil|imbécil|idiota|'
    r'corrupto|chorro|ladron|ladrón|inutil|inútil|vago de mierda|'
    r'fuck|shit|asshole|bastard|'
    r'merda|caralho|babaca|otario'
    r')\b',
    caseSensitive: false,
  );

  /// Datos que identifican personas (§10.4): teléfonos, mails, patentes,
  /// documentos. La infraestructura no tiene DNI.
  static final _telefono = RegExp(r'(?<!\d)(?:\+?\d[\d\s().-]{7,}\d)(?!\d)');
  static final _email = RegExp(r'[\w.+-]+@[\w-]+\.[\w.]+');
  static final _patente = RegExp(
    r'\b(?:[A-Z]{3}\s?\d{3}|[A-Z]{2}\s?\d{3}\s?[A-Z]{2})\b',
  );
  static final _documento = RegExp(
    r'\b(?:dni|cuil|cuit)\s*:?\s*\d',
    caseSensitive: false,
  );

  /// Acusaciones dirigidas a personas (§10.4): nombre propio + verbo de
  /// acusación es imposible de detectar perfecto por reglas; se cubren los
  /// patrones más comunes y el resto lo agarra la cola humana.
  static final _acusacion = RegExp(
    r'\b(?:el|la|los)\s+(?:vecino|vecina|dueño|dueña|encargado|encargada|portero|portera)\s+(?:de[l]?\s+\S+\s+)?(?:rob|afan|vend|amenaz|golpe)',
    caseSensitive: false,
  );

  static ResultadoFiltro evaluar(String texto) {
    final limpio = texto.trim();
    if (limpio.length > maxCaracteres) {
      return const ResultadoFiltro(
        aprobado: false,
        motivo: 'largo',
        fragmento: null,
      );
    }
    final insulto = _insultos.firstMatch(limpio);
    if (insulto != null) {
      return ResultadoFiltro(
        aprobado: false,
        motivo: 'lenguaje',
        fragmento: insulto.group(0),
      );
    }
    for (final (regla, patron) in [
      ('telefono', _telefono),
      ('email', _email),
      ('patente', _patente),
      ('documento', _documento),
      ('persona', _acusacion),
    ]) {
      final m = patron.firstMatch(limpio);
      if (m != null) {
        return ResultadoFiltro(
          aprobado: false,
          motivo: regla,
          fragmento: m.group(0),
        );
      }
    }
    return const ResultadoFiltro(aprobado: true);
  }
}
