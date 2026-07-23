import 'package:cuadra/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('la app arranca y muestra la pantalla principal', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: CuadraApp()));
    await tester.pumpAndSettle();

    // El entorno de test corre con locale en_US: el nombre es igual en todos
    // los idiomas; el tagline sale de TextosEn.
    expect(find.text('Cuadra'), findsOneWidget);
    expect(find.text('Your block, on the record.'), findsOneWidget);
  });
}
