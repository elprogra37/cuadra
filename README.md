# Cuadra — Tu barrio deja constancia

Plataforma de acción vecinal: convierte reclamos de barrio en expedientes con
evidencia fechada, firmas de vecinos verificados, destinatario concreto en el
Estado y un contador público de días sin respuesta.

**Especificación completa:** [`docs/cuadra-documento-maestro-v2.md`](docs/cuadra-documento-maestro-v2.md)
**Estado del desarrollo:** [`ESTADO.md`](ESTADO.md) · **Pendientes:** [`PENDIENTES.md`](PENDIENTES.md)

- **Stack:** Flutter 3.44 (Android + Windows) · Riverpod · go_router · Drift (offline-first) · Supabase (Postgres + PostGIS)
- **Idiomas:** español (rioplatense), inglés, portugués

---

## Descargas

| Plataforma | Dónde |
|---|---|
| Android (APK debug) | Artifact `cuadra-debug-apk` del workflow [Android APK](../../actions/workflows/android-apk.yml) (último run verde de `develop`) |
| Windows (zip) | Artifact `cuadra-windows-x64` del workflow [Windows](../../actions/workflows/windows.yml) |

> Los builds salen de CI: esta máquina de desarrollo no tiene JDK ni Visual Studio.

---

## Funcionalidades

### Andamiaje (Etapa 1) ✅

- **App base Android + Windows** con navegación (go_router), estado (Riverpod)
  e i18n propio en es/en/pt (`lib/core/i18n`, ninguna cadena hardcodeada).
- **Errores tipados** `Result<T>`/`Failure` (`lib/core/errors`): la UI nunca ve
  excepciones sueltas.
- **CI:** formato + análisis + tests en cada push; APK Android y zip Windows
  por cada push a `develop`.

**Cómo probarla:** instalar el APK (o descomprimir el zip de Windows y abrir
`cuadra.exe`). Se ve la pantalla inicial con el nombre y el tagline.

### Sistema de diseño (Etapa 2) ✅

- **Paleta y tipografías del expediente:** asfalto/cal/vial/sello/vencido/tiza,
  Oswald (display), Inter (cuerpo), JetBrains Mono (datos). Temas claro y oscuro.
- **Sello de estado (`EstadoSello`):** el elemento de firma del producto —
  rectángulo rotado 1.5–3°, borde 2 px, tinta desgastada, con variantes
  abierto/presentado (amarillo vial), sin respuesta (rojo óxido),
  resuelto (verde tinta) y archivado (tiza).
- **Regla del amarillo verificada por test:** el color vial aparece solo donde
  hay algo abierto que espera acción.

**Cómo probarlo:** la pantalla inicial usa el tema; el sello se ve en las
pantallas de caso a partir de la etapa 7. Mientras tanto:
`flutter test test/core/theme/` corre los tests del sistema de diseño.

---

## Desarrollo

```bash
flutter pub get
flutter test          # tests unitarios y de widgets
flutter analyze       # sin warnings
dart format lib test  # formato del CI
```

Ramas: Git Flow (`develop` para trabajo, `main` estable, tags `v*` → release con APK).
