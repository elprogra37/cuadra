import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/i18n/textos.dart';
import '../core/theme/tema.dart';
import 'router.dart';

/// Raíz de la aplicación: tema, i18n y navegación.
class CuadraApp extends ConsumerWidget {
  const CuadraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Cuadra',
      routerConfig: router,
      theme: TemaCuadra.claro,
      darkTheme: TemaCuadra.oscuro,
      localizationsDelegates: const [
        Textos.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Textos.soportados,
      debugShowCheckedModeBanner: false,
    );
  }
}
