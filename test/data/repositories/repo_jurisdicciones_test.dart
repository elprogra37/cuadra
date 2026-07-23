import 'package:cuadra/data/repositories/repo_jurisdicciones.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late RepoJurisdicciones repo;

  setUp(() => repo = RepoJurisdicciones(rootBundle));

  test('carga las fichas de jurisdicción de los assets', () async {
    final r = await repo.todas();
    expect(r.isOk, isTrue, reason: r.failureOrNull?.message);
    expect(r.valueOrNull!.map((f) => f.jurisdictionId), contains('AR-C-CABA'));
  });

  test('porId falla con mensaje de modo comunidad si no existe', () async {
    final r = await repo.porId('XX-INEXISTENTE');
    expect(r.isOk, isFalse);
    expect(r.failureOrNull!.message, contains('organismos de tu ciudad'));
  });

  test('organismoPara enruta la categoría al organismo correcto', () async {
    final r = await repo.organismoPara(
      jurisdictionId: 'AR-C-CABA',
      categoryId: 'alumbrado',
    );
    expect(r.isOk, isTrue, reason: r.failureOrNull?.message);
    final org = r.valueOrNull!;
    expect(org.organismo.categories, contains('alumbrado'));
    expect(org.organismo.responseDays, greaterThan(0));
  });

  test(
    'una categoría sin organismo específico cae al primero (genérico)',
    () async {
      final r = await repo.organismoPara(
        jurisdictionId: 'AR-C-CABA',
        categoryId: 'ruido',
      );
      // La ficha demo solo tiene un organismo: el genérico lo cubre.
      expect(r.isOk, isTrue, reason: r.failureOrNull?.message);
    },
  );
}
