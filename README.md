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

---

## Desarrollo

```bash
flutter pub get
flutter test          # tests unitarios y de widgets
flutter analyze       # sin warnings
dart format lib test  # formato del CI
```

Ramas: Git Flow (`develop` para trabajo, `main` estable, tags `v*` → release con APK).
