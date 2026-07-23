import 'package:cuadra/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('la app arranca y muestra la bienvenida con su única acción', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const ProviderScope(child: CuadraApp()));
    await tester.pumpAndSettle();

    // El entorno de test corre con locale en_US: el nombre es igual en todos
    // los idiomas; el resto sale de TextosEn.
    expect(find.text('Cuadra'), findsOneWidget);
    expect(find.text('Your block, on the record.'), findsOneWidget);
    expect(find.text('Find your neighborhood'), findsOneWidget);
  });
}
