/// Texto multiidioma tal como viene en los JSON de categorías y
/// jurisdicciones: `{"es": "...", "en": "...", "pt": "..."}`.
///
/// El español es la fuente de verdad: si falta el idioma pedido se cae a `es`
/// y, en última instancia, a cualquier valor presente.
typedef TextoI18n = Map<String, String>;

extension TextoI18nX on TextoI18n {
  String resolver(String idioma) =>
      this[idioma] ?? this['es'] ?? (isEmpty ? '' : values.first);
}
