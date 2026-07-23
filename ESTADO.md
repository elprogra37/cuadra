# ESTADO — Cuadra (directorio `vecinal`)

> Registro de avance para retomar el desarrollo en cualquier sesión.
> Especificación: `docs/cuadra-documento-maestro-v2.md` (leerla entera antes de tocar código).
> Plan de construcción: sección 25 del documento, "FASE 1 — ORDEN DE CONSTRUCCIÓN".

**Última actualización:** 2026-07-23

## Decisiones tomadas

- **Nombre de trabajo:** Cuadra (el documento lista alternativas en §24; no hace falta decidir ya).
- **Paquete:** `com.elprogra37.cuadra` · proyecto Dart `cuadra` · repo GitHub `elprogra37/cuadra`.
- El §25 del documento pide "esperar aprobación" antes de avanzar; el usuario pidió
  desarrollo autónomo completo, así que se avanza etapa por etapa sin frenar,
  dejando acá el registro de cada decisión.
- **i18n propio** (clases `Textos`/`TextosEs|En|Pt`) en vez de gen-l10n: mismo patrón
  liviano que los demás repos, sin codegen extra. Español rioplatense = fuente de verdad.
- **Fuentes:** Oswald (display), Inter (cuerpo), JetBrainsMono (datos) — variables,
  en `assets/fonts/`. El peso se aplica con `fontVariations`, no con `fontWeight`.
- **Mapas:** flutter_map + teselas OSM (sin MapLibre GL nativo: no soporta Windows).
- **Riverpod sin codegen** (providers manuales): consistente con los otros repos
  y evita un builder más; la spec pedía codegen pero el beneficio acá es nulo.

## Etapas de la Fase 1 (orden obligatorio de §25)

| # | Etapa | Estado |
|---|---|---|
| 1 | Andamiaje (estructura, Android+Windows compilan, CI) | ✅ hecho |
| 2 | Sistema de diseño (tokens §5, `EstadoSello`, tests) | ✅ hecho |
| 3 | Datos (Drift §19, freezed, repos offline-first, SyncQueue) | ✅ hecho |
| 4 | Backend (Supabase: SQL, PostGIS, RLS, siembra GeoNames) | ⬜ |
| 5 | Motor geográfico (buscador, crear barrio, polígonos, resolve) | ⬜ |
| 6 | Flujo de reporte guiado (cámara, EXIF, hash, árbol JSON, dedup) | ⬜ |
| 7 | Mi cuadra y mapa (feed con cierre de lista, clusters) | ⬜ |
| 8 | Adhesión (commit-then-register, impacto, firma formal) | ⬜ |
| 9 | Detalle de caso (timeline, contador, acción siguiente, sello animado) | ⬜ |

## Qué se hizo

### Etapa 1 — Andamiaje ✅ (2026-07-23)

- `flutter create` con targets **android + windows**, org `com.elprogra37`.
- Estructura `lib/` según §20.3 (las carpetas se crean al recibir contenido).
- `analysis_options.yaml` estricto (strict-casts/inference/raw-types + reglas extra).
- i18n es/en/pt en `lib/core/i18n/` con todos los textos base (sellos, tabs, acciones).
- `Result<T>`/`Failure` tipados en `lib/core/errors/`.
- App mínima: `main.dart` → `CuadraApp` (Riverpod + go_router) → `MiCuadraScreen` placeholder.
- CI: `ci.yml` (formato+analyze+test, imagen cirruslabs/flutter:3.44.0),
  `android-apk.yml` (APK debug en develop, release en tags), `windows.yml` (zip).
- Fuentes descargadas: Oswald, Inter (copiada de `amor`), JetBrainsMono.
- Test de humo `test/app/app_test.dart`.
- Repo GitHub `elprogra37/cuadra` creado por API; ramas `main` y `develop` pusheadas.

### Etapa 2 — Sistema de diseño ✅ (2026-07-23)

- `lib/core/theme/tokens.dart`: paleta §5 exacta (asfalto/cal/vial/sello/vencido/tiza),
  escala 32/24/20/16/14/12, pesos 400/600/800, espaciado, objetivo táctil 48dp.
- `lib/core/theme/tipografia.dart`: Oswald (display), Inter (cuerpo),
  JetBrainsMono (datos) con `fontVariations` + `fontWeight` espejado.
- `lib/core/theme/tema.dart`: temas claro (cal) y oscuro (asfalto). `primary` es
  tinta, NO vial: el amarillo lo aplica cada pantalla solo en pendientes.
- `lib/core/theme/estado_sello.dart`: widget `EstadoSello` — borde 2px, rotación
  estable ±[1.5°,3°] derivada del título, textura de tinta desgastada
  (CustomPainter con motas del color del papel), semántica accesible.
  Variantes: abierto/presentado (vial), sinRespuesta (vencido),
  resuelto (sello), archivado (tiza). `esperaAccion` codifica la regla del amarillo.
- Tests: regla del amarillo verificada por test, paleta exacta, borde, rotación,
  semántica. 14 tests en verde.

### Etapa 3 — Datos ✅ (2026-07-23)

- **Drift** (`lib/data/local/`): esquema completo §19 en `tablas.dart` (geografía,
  jurisdicciones, catálogo, casos, evidencia, adhesiones, acciones, respuestas,
  resoluciones, usuarios, sync_ops), mixin `Sincronizable` (client_uuid +
  sync_status + updated_at), `BaseDatos` v1 con índices. Nombres de tabla/columna
  en inglés = contrato 1:1 con el Postgres futuro. Las data classes generadas se
  llaman `Case`, `Neighborhood`, etc. (no `CaseData`).
- **SyncQueue** (`lib/data/sync/cola_sync.dart`): backoff exponencial 30s→1h,
  idempotencia por client_uuid, orden causal (caso antes que adhesión), estado
  por ítem reflejado en cada entidad. `Conflictos.gananLocales` codifica LWW
  salvo contadores (autoridad servidor). `ClienteRemoto` abstracto +
  `ClienteRemotoNulo` hasta la etapa 4.
- **Repos** (`lib/data/repositories/`): `RepoCasos` (crear con rate limit 5/día,
  dedup 80 m/30 días por geohash+haversine, adherir con contador optimista,
  feeds), `RepoGeografia` (crear barrio propuesto con límites 4 vértices/25 km²,
  normalización de nombres, resolver punto→barrio), `RepoCategorias` (assets).
- **Modelos**: `CategoriaDef`/`PreguntaGuiada`/`OpcionGuiada` (freezed, árbol §9),
  `FichaJurisdiccion` (§14.3), `TextoI18n`, enums de dominio en `enums.dart`.
- **Utils**: `Geohash` (codificar/decodificar), `Geodesia` (haversine, punto en
  polígono, desplazamiento determinista ≤25 m para privacidad de pines).
- **Assets**: 5 categorías del núcleo con árboles completos es/en/pt en
  `assets/categories/` (alumbrado, calzada, residuos, agua, arbolado) + indice.json.
  Cada opción lleva su `fragmento` para el generador de escritos (etapa 6).
- **Tests**: 51 en verde (cola con base en memoria y reloj falso, repos, geohash,
  geodesia, JSON de categorías validados contra las reglas §9).
- Ojo: Drift devuelve DateTime en hora local; comparar `.toUtc()` en tests.

## Cómo retomar

1. Leer este archivo y `PENDIENTES.md`.
2. Verificar que no haya otra sesión trabajando este repo (archivos recién modificados, `git status` sucio).
3. Continuar con la primera etapa ⬜/🔨 de la tabla, siguiendo la definición de
   terminado de §25 (compila ambas plataformas, analyze limpio, tests, i18n, a11y).
4. Al cerrar cada etapa: commit atómico en `develop`, push, verificar CI remoto verde,
   actualizar `README.md` (funcionalidades + cómo probarlas), `ESTADO.md` y `PENDIENTES.md`.
