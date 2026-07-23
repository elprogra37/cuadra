import 'dart:convert';

import 'package:flutter/services.dart' show AssetBundle;

import '../../core/errors/failures.dart';
import '../../core/errors/result.dart';
import '../models/categoria_def.dart';

/// Catálogo de categorías (§8). El núcleo global vive en assets/categories/:
/// agregar una categoría es agregar un JSON y sumarla al índice, nunca tocar
/// código. Las extensiones nacionales/locales llegarán por sincronización
/// (tabla `categories`) en fases posteriores.
class RepoCategorias {
  RepoCategorias(this._bundle);

  final AssetBundle _bundle;
  List<CategoriaDef>? _cache;

  static const _indice = 'assets/categories/indice.json';

  /// Todas las categorías activas, ordenadas para la grilla de reporte.
  Future<Result<List<CategoriaDef>>> todas() async {
    if (_cache != null) return Ok(_cache!);
    try {
      final indiceRaw = await _bundle.loadString(_indice);
      final archivos = (jsonDecode(indiceRaw) as List<dynamic>).cast<String>();
      final categorias = <CategoriaDef>[];
      for (final archivo in archivos) {
        final raw = await _bundle.loadString('assets/categories/$archivo');
        categorias.add(
          CategoriaDef.fromJson(jsonDecode(raw) as Map<String, dynamic>),
        );
      }
      categorias.sort((a, b) => a.orden.compareTo(b.orden));
      _cache = List.unmodifiable(categorias);
      return Ok(_cache!);
    } on FormatException catch (e) {
      return Err(
        ValidationFailure('Un JSON de categoría está roto: ${e.message}'),
      );
    } catch (e) {
      return Err(UnknownFailure('No se pudo cargar el catálogo: $e'));
    }
  }

  Future<Result<CategoriaDef>> porId(String id) async {
    final resultado = await todas();
    return resultado.fold(Err.new, (categorias) {
      for (final c in categorias) {
        if (c.id == id) return Ok(c);
      }
      return const Err(NotFoundFailure('Esa categoría no existe.'));
    });
  }
}
