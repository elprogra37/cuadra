import 'dart:convert';

import 'package:flutter/services.dart' show AssetBundle;

import '../../core/errors/failures.dart';
import '../../core/errors/result.dart';
import '../models/ficha_jurisdiccion.dart';

/// Fichas de jurisdicción (§14.3): configuración, no código. Se cargan de
/// assets (siembra local) y a futuro también de la tabla `jurisdictions`
/// sincronizada. Expandir a una ciudad = agregar un JSON.
class RepoJurisdicciones {
  RepoJurisdicciones(this._bundle);

  final AssetBundle _bundle;
  List<FichaJurisdiccion>? _cache;

  static const _indice = 'assets/jurisdictions/indice.json';

  Future<Result<List<FichaJurisdiccion>>> todas() async {
    if (_cache != null) return Ok(_cache!);
    try {
      final indiceRaw = await _bundle.loadString(_indice);
      final archivos = (jsonDecode(indiceRaw) as List<dynamic>).cast<String>();
      final fichas = <FichaJurisdiccion>[];
      for (final archivo in archivos) {
        final raw = await _bundle.loadString('assets/jurisdictions/$archivo');
        fichas.add(
          FichaJurisdiccion.fromJson(jsonDecode(raw) as Map<String, dynamic>),
        );
      }
      _cache = List.unmodifiable(fichas);
      return Ok(_cache!);
    } on FormatException catch (e) {
      return Err(
        ValidationFailure('Una ficha de jurisdicción está rota: ${e.message}'),
      );
    } catch (e) {
      return Err(
        UnknownFailure('No se pudieron cargar las jurisdicciones: $e'),
      );
    }
  }

  Future<Result<FichaJurisdiccion>> porId(String id) async {
    final r = await todas();
    return r.fold(Err.new, (fichas) {
      for (final f in fichas) {
        if (f.jurisdictionId == id) return Ok(f);
      }
      return const Err(
        NotFoundFailure(
          'Todavía no cargamos los organismos de tu ciudad. Tu caso queda '
          'registrado y lo presentamos apenas estén.',
        ),
      );
    });
  }

  /// Organismo que atiende una categoría en la jurisdicción (§14.3). Modo
  /// solo comunidad (§6.5) si no hay: se explica, nunca se bloquea el reporte.
  Future<Result<({FichaJurisdiccion ficha, Organismo organismo})>>
  organismoPara({
    required String jurisdictionId,
    required String categoryId,
  }) async {
    final r = await porId(jurisdictionId);
    return r.fold(Err.new, (ficha) {
      for (final o in ficha.organisms) {
        if (o.categories.contains(categoryId)) {
          return Ok((ficha: ficha, organismo: o));
        }
      }
      // Categoría sin organismo específico: reclamo administrativo genérico
      // al primer organismo (plantilla genérica §8.4).
      if (ficha.organisms.isNotEmpty) {
        return Ok((ficha: ficha, organismo: ficha.organisms.first));
      }
      return const Err(
        NotFoundFailure(
          'Esta ciudad no tiene organismos cargados todavía. El caso queda '
          'en modo comunidad hasta que estén.',
        ),
      );
    });
  }
}
