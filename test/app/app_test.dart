import 'package:cuadra/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('sin onboarding visto, la app muestra el onboarding', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const ProviderScope(child: CuadraApp()));
    await tester.pumpAndSettle();

    // Locale en_US en test: el nombre es igual en todos los idiomas y la
    // primera frase del onboarding sale de TextosEn.
    expect(find.text('Cuadra'), findsOneWidget);
    expect(
      find.text("This isn't for complaining. It's for leaving a record."),
      findsOneWidget,
    );
    // Primera de tres pantallas: el botón avanza ("Next").
    expect(find.text('Next'), findsOneWidget);
  });

  testWidgets('con onboarding visto y sin barrio, muestra la bienvenida', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({'onboarding_visto': true});
    await tester.pumpWidget(const ProviderScope(child: CuadraApp()));
    await tester.pumpAndSettle();

    expect(find.text('Your block, on the record.'), findsOneWidget);
    expect(find.text('Find your neighborhood'), findsOneWidget);
    // El texto de bienvenida usa el widget StatelessWidget MiCuadraBienvenida.
    expect(find.byType(FilledButton), findsWidgets);
  });
}
