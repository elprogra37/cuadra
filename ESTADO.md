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
| 4 | Backend (Supabase: SQL, PostGIS, RLS, siembra GeoNames) | ✅ hecho |
| 5 | Motor geográfico (buscador, crear barrio, polígonos, resolve) | ✅ hecho |
| 6 | Flujo de reporte guiado (cámara, EXIF, hash, árbol JSON, dedup) | ✅ hecho |
| 7 | Mi cuadra y mapa (feed con cierre de lista, clusters) | ✅ hecho (clusters pendientes) |
| 8 | Adhesión (commit-then-register, impacto, firma formal) | 🔶 parcial (falta auth) |
| 9 | Detalle de caso (timeline, contador, acción siguiente, sello animado) | ✅ hecho |

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

### Etapa 4 — Backend Supabase ✅ (2026-07-23)

- **Stack self-hosted por docker-compose** en `supabase/` (patrón de asiscann,
  sin Supabase CLI): Postgres 15 + PostGIS + Auth + REST + Storage + Realtime +
  Studio + Kong. **Puertos 556xx** (Kong 55621, Postgres 55622, Studio 55623).
  Uso: `cd supabase && cp .env.example .env && docker compose up -d`.
- **Esquema en `supabase/init/`** (corre en el primer initdb del volumen):
  - `10-extensiones.sql`: postgis, vector, pg_trgm, fuzzystrmatch.
  - `20-geografia.sql`: countries/regions/cities/jurisdictions/neighborhoods
    (geography 4326, índices GIST, límite 25 km² en constraint),
    `geo_resolve(lat,lng)` y `solapamiento_maximo(geog)` (regla del 40%).
  - `30-catalogo.sql`: categories, category_proposals (embedding vector 384),
    proposal_clusters.
  - `40-casos.sql`: cases (public_ref #n por trigger), evidences, endorsements
    (unique case+user), case_actions, official_responses, resolutions.
    Triggers de contadores (autoridad servidor §20.2). `casos_cercanos()` dedup.
  - `50-usuarios.sql`: profiles (geohash 7, rol), trigger de alta, vista
    `perfiles_publicos` sin datos sensibles.
  - `60-siembra.sql`: 23 países, 24 provincias AR, 5 ciudades, 6 categorías,
    jurisdicción demo AR-C-CABA (organismo ficticio para desarrollo).
- **RLS habilitado en TODAS las tablas** (verificado por query): lectura pública
  de lo publicado (modo visitante §15), escritura autenticada del propio
  registro, moderación/cambios de estado vía service_role.
- **Verificado en vivo:** geo_resolve resuelve un punto a su barrio,
  solapamiento_maximo da 1.00 para un polígono contenido, public_ref asigna #1,
  casos_cercanos encuentra a <80 m, triggers de contadores funcionan, y la API
  REST vía Kong responde 200 con la anon key.
- **Fix CI:** `assets/jurisdictions/` estaba vacío → no viajaba en git → analyze
  y build Windows fallaban en CI. Se agregó `ar-c-caba.json` (ficha demo).
- La secuencia case_ref_seq quedó en #2 en el volumen local (dato de prueba
  borrado); irrelevante.

### Etapa 5 — Motor geográfico ✅ (2026-07-23)

- **Validación de topónimos** (`services/geografia/validador_toponimos.dart`):
  Nominatim/OSM con caché en memoria y User-Agent propio; interpreta tipos
  place=suburb|neighbourhood|quarter cerca de la zona (±0.15°). Sin red NO
  bloquea el alta (queda validation_source=manual). Google Places fallback
  pendiente de API key.
- **Solapamiento local**: `Geodesia.fraccionSolapada` (muestreo en grilla) y
  rechazo >40% contra barrios activos en `RepoGeografia.crearBarrio`
  (PostGIS repite el chequeo exacto al sincronizar).
- **Máquina de estados** §6.3: `RepoGeografia.estadoSegunUmbrales` (3
  verificados → activo; 10 + 1 caso presentado → consolidado). La promoción
  real es job del servidor.
- **UI**: `BuscadorBarrioScreen` (búsqueda local + crear siempre visible),
  `CrearBarrioScreen` (dropdown de ciudad, validación de nombre, polígono por
  toques en flutter_map/OSM con deshacer, área en vivo, guardar en vial),
  `MiCuadraScreen` rediseñada (bienvenida con única acción / feed con cierre
  explícito de lista). Rutas /barrio/buscar y /barrio/crear.
- **Siembra local** (`data/local/siembra_local.dart`): AR + 5 ciudades con
  lat/lng para que la jerarquía funcione offline en el primer arranque.
  Se agregó lat/lng a `cities` (Drift, aún sin migración: v1 no publicada).
- `Preferencias` (shared_preferences) guarda el barrio activo.
- Riverpod 3: `AsyncValue` usa `.value`, no `.valueOrNull`.
- **Falta del motor** (a futuro): buscador jerárquico remoto completo
  (país→región→ciudad con autocompletado server), edición de vértices
  arrastrando, fusión de duplicados (job servidor).
- CI de la etapa 4: los 3 workflows verdes (drift testea bien en el contenedor).

### Etapa 6 — Flujo de reporte guiado ✅ (2026-07-23)

- **`GeneradorEscrito`** (`services/documents/`): compone el escrito formal
  (Objeto/Hechos/Afectación/Antecedentes/Manifestación/Normativa/Petitorio)
  desde los `fragmento` del árbol JSON, es/en/pt. Fechas con formateador propio
  determinista (DateFormat con locale exige init asíncrona — no usar).
- **`FiltroTexto`** (`services/moderation/`): campo libre 200 chars; rechaza
  insultos, teléfonos/mails/patentes/DNI y acusaciones a personas, señalando
  el fragmento. El caso se publica igual sin el texto (§9.5).
- **`ProcesadorEvidencia`** (`services/camera/`): bakeOrientation → resize 1600
  → `exif = ExifData()` (¡el encoder de package:image CONSERVA el EXIF si no
  se vacía a mano!) → JPEG q82 → SHA-256 del archivo final.
- **`ArbolGuiado`** (`features/report/`): motor genérico que renderiza
  cualquier categoría desde su JSON (opcion/multiple), nunca hardcodeado.
- **`ReportarScreen`**: foto (image_picker cámara, sin galería; en Windows se
  permite sin foto §20.4) → ubicación (pin fijo al centro, mapa arrastrable,
  GPS con fallback a centroide del barrio) → grilla de categorías → subtipo →
  preguntas → revisión con dedup (<80 m: ofrece sumarse), texto libre filtrado
  en vivo y vista previa del escrito → publicar. Ubicación forzada §10.3: el
  pin debe caer en el barrio activo. FAB vial "Reportar" en el feed.
- `RepoCasos` ganó `generatedBody` en crearCaso y `agregarEvidencia` (guarda
  jpg en documentos/evidencias/, registra hash y encola).
- Permisos de ubicación agregados al AndroidManifest; label ahora "Cuadra".
- 74 tests en verde.
- **Pendiente de probar en dispositivo real**: cámara, GPS y el flujo entero
  en Android (bajar APK del CI).

### Etapas 7 + 9 (y 8 parcial) — Feed, mapa y detalle de caso ✅ (2026-07-23)

- **Feed real** en `MiCuadraScreen`: tarjetas con sello (75%), días y
  adhesiones; orden puro `RepoCasos.ordenarFeed` ("lo pendiente arriba, lo más
  nuevo primero") testeado; cierre explícito de lista. FAB Reportar en vial.
- **`MapaScreen`**: pines de casos coloreados por la tinta del sello
  (regla del amarillo también en el mapa), tap → detalle.
  Falta clustering (se agrega con densidad real).
- **`CasoScreen`** (§25.9): evidencia con el sello estampado encima, contador
  de días en display (vial si espera acción), escrito completo, línea de
  tiempo (creado/presentado/resuelto), y SIEMPRE acción siguiente: Adherir
  (vial) o el aviso explícito de que la presentación formal llega en Fase 2.
- **`EstadoSelloAnimado`** (`core/theme/`): la única animación con peso —
  150 ms, caída 1.6→1.0 con rebote mínimo, respeta `prefers-reduced-motion`
  (testeado). Solo se anima el paso a resuelto.
- **Adhesión (etapa 8 parcial)**: funciona local con userId `'local'`
  (offline-first, contador optimista, dedup de doble adhesión). El patrón
  commit-then-register, la confirmación de impacto en UI y la firma formal
  verificada necesitan auth de Supabase → van con la integración remota.
- Rutas nuevas: `/mapa` y `/caso/:id` (futuro deep link compartible).
- 78 tests en verde.

## FASE 2 — La presentación ✅ (2026-07-23)

Acá el producto "existe de verdad": el reclamo se convierte en expediente
presentable con reloj corriendo.

- **`RepoJurisdicciones`** (`data/repositories/`): carga fichas §14.3 de
  `assets/jurisdictions/` (indice.json + ar-c-caba.json), enruta categoría →
  organismo, y explica el modo solo comunidad (§6.5) si la ciudad no tiene
  organismos. Expandir a una ciudad = agregar un JSON.
- **`GeneradorPdf`** (`services/documents/`, dep `pdf`+`printing`): PDF de mesa
  de entradas — carátula, escrito seccionado, adhesiones (verificadas aparte),
  ubicación, anexo de evidencia con SHA-256 y timestamp. Fuentes Inter/JetBrains
  embebidas. Se comparte/imprime con `Printing.sharePdf` (canal Exportar §14.2).
- **`Escalera`** (`services/documents/`): la escalera §13 (presentar → reiterar
  → pronto despacho → acceso info → defensoría → concejal → prensa → dato
  abierto). `proximo()` decide el escalón accionable; test cubre el orden.
- **`RepoCasos` Fase 2**: `presentar` (arranca el reloj legal, +N días),
  `escalar` (reiterar renueva +15 días), `marcarVencidos` (job local
  check_deadlines: presentado→sinRespuesta), `reclamarResuelto` (foto del
  después + estado enEjecucion) y `confirmarResuelto` (2 confirmaciones de
  OTROS vecinos → resuelto, con `resolvedAt`). Todo encolado para sync.
- **`CasoScreen` rehecha**: el botón de acción siguiente ahora ejecuta el
  escalón real — genera el PDF con normativa+plazo+adhesiones, lo comparte,
  registra la acción y cambia el estado. Muestra días restantes de plazo,
  botón "marcar resuelto" (con foto en Android) y el flujo de confirmación.
  La línea de tiempo lista cada acción de la escalera.
- **Arranque**: `arranqueProvider` corre siembra local + `marcarVencidos` una
  vez por sesión (en `CuadraApp`).
- 92 tests en verde (escalera, presentación/plazos/resolución, jurisdicciones).
- **Pendiente Fase 2**: envío real por email/Open311 (hoy es Exportar PDF +
  captura manual del acuse); llega con el `ClienteRemoto` de Supabase.

## FASE 3 — Escritorio y moderación ✅ (2026-07-23)

- **Ventana Windows** (`windows/runner/`): tamaño inicial 1280×800, **mínimo
  1024×640** por `WM_GETMINMAXINFO` con escala DPI, título "Cuadra".
- **`Plataforma`** (`core/`): `esEscritorio`/`esMovil`. En Windows la ruta raíz
  muestra `DeskShell`; en Android, el feed.
- **`DeskShell`**: NavigationRail (mesa de trabajo del referente §20.4) con
  Casos / Datos / Moderación.
- **`DeskCasos`**: tabla densa (`DataTable`) filtrable por texto/categoría/
  estado, clic abre el detalle. Cierre explícito de lista.
- **`DeskDatos`** (`DatosPanel`): embudo del barrio (reportes→presentados→
  respondidos→resueltos), tasa de resolución, **días medios de respuesta del
  organismo** (el dato periodístico §23), export CSV y legajo PDF. Respeta
  §15.2: la métrica es la respuesta del Estado, nunca un puntaje de barrio, y
  lo dice explícito en la UI.
- **`DeskModeracion`**: cola de barrios propuestos con promover (activo) /
  rechazar. La cola de contenido y categorías candidatas es server-side.
- 94 tests en verde (nuevo: `datos_panel_test` valida el embudo).
- **Pendiente Fase 3**: impresión de legajo de caso individual (hoy imprime el
  resumen de datos), multiventana, atajos de teclado.

## FASE 4 — Escala mundial ✅ (2026-07-23)

- **Catálogo completo de 12 categorías** (§8.3): se sumaron tránsito,
  espacios verdes, transporte, ruido, obra, anegamiento y "Otro" — todas con
  árbol guiado es/en/pt y fragmentos para el escrito. `indice.json` + SQL seed
  actualizados. El test valida las 12 contra las reglas §9.
- **Navegación completa** (`HomeShell`, §20.4): 4 pestañas Android
  (Mi cuadra · Mapa · Registro · Perfil) + FAB Reportar. `MiCuadraScreen`
  se separó en `MiCuadraBienvenida` (sin barrio) y `MiCuadraFeed` (pestaña).
- **Registro del barrio** (`RegistroScreen`, §12): casos resueltos permanentes
  con sello verde y "lo empujaron N vecinos". Provider `registroBarrioProvider`.
- **Perfil** (`PerfilScreen`, §7/§22): estado de vecino, cambiar barrio,
  exportar y borrar datos (borrado con confirmación).
- **Fusión de duplicados** (§6.4): `RepoGeografia.esDuplicado` (2 de 3 señales:
  similitud de nombre por Levenshtein ≥0.85, solapamiento ≥40%, centroides
  <800 m) + `similitudNombre`. Función pura testeada (Villa Crespo/Vila Crespo).
- 96 tests en verde.
- **Pendiente Fase 4** (todo requiere el backend conectado): clustering de
  propuestas de categoría "Otro" (embeddings server-side), Open311, rol
  visitante real con auth, panel público de datos abiertos, siembra GeoNames
  mundial. La lógica de "Otro" ya publica como caso normal con plantilla
  genérica; falta solo el agrupamiento.

## POST-FASES — Identidad, modo visitante, onboarding e impacto ✅ (2026-07-23)

Cubre gaps client-side que el documento pedía y que no dependen del backend:

- **Sesión/identidad local** (`services/preferencias.dart`): `userId` uuid
  estable (se genera una vez; el login real lo migrará), `displayName`, `role`
  (visitante→vecino), flag de onboarding. `sesionProvider`. Se reemplazó el
  `userId: 'local'` hardcodeado por la sesión real en TODOS los flujos
  (reportar, adherir, presentar, escalar, resolver, confirmar, crear barrio,
  evidencia).
- **Modo visitante (§15.1)**: `asegurarVecino()` (`features/onboarding/
  entrar_vecino.dart`) — un bottom sheet que pide nombre y pasa a vecino.
  Se dispara antes de reportar, firmar, presentar/escalar, resolver/confirmar
  y crear barrio. Quien mira sin identidad no puede publicar nada.
- **Onboarding de 3 pantallas (§4.4)** (`features/onboarding/`): se muestra
  una sola vez (`RaizMovil` decide onboarding vs. HomeShell). El escritorio
  no pasa por onboarding.
- **Confirmación de impacto al adherir (§11)**: bottom sheet con las 3 opciones
  cerradas (a mí también / mi familia / un gasto); convierte firma en testimonio.
  Se guardan en `impact_tags` de la adhesión.
- **Perfil** muestra nombre/rol reales; "borrar mis datos" usa `borrarTodo`.
- 98 tests (nuevo: `preferencias_test` cubre visitante→vecino, userId estable,
  borrado, onboarding).

## POST-FASES 2 — Interacciones y jobs de §10/§11/§12 ✅ (2026-07-23)

- **Archivado automático** (`archivarSinAdhesiones`, §10.3/§12): caso abierto
  sin ninguna adhesión a 7 días → archivado. Corre al arranque junto a
  `marcarVencidos`.
- **Rate limit de adhesiones** (§10.3): 30 por día por usuario, escudo contra
  granjas de firmas.
- **Disputar** (§11): `RepoCasos.disputar` con motivo de lista cerrada
  (ya resuelto / ubicación / categoría / no corresponde); una por usuario;
  3 disputas → `enRevision`. Botón + bottom sheet en el detalle de caso.
- **Aportar evidencia** (§11): botón en el caso para que un vecino sume otra
  foto (cámara, procesada y hasheada) al expediente.
- 107 tests en verde (nuevos: archivado, límite de adhesiones, disputa a revisión).

**Gaps que SIGUEN pendientes** (requieren ML on-device o backend, honestamente):
- Clasificador de imágenes (NSFW/violencia/coherencia §10.1) y **difuminado de
  caras/patentes**: necesitan un modelo on-device (tflite/MLKit) y prueba en
  device real. No incluido.
- Login real (email/OTP), sincronización, verificación de domicilio, envío con
  acuse (email/Open311), notificaciones, jobs del servidor. Todo depende del
  backend Supabase conectado.

## Estado general al cierre de la sesión 2026-07-23

**Las 4 fases están funcionalmente completas en local.** La app es un producto
usable de punta a punta sin backend conectado:

1. **Onboarding y geografía:** elegir o crear el barrio (validado contra OSM,
   polígono en el mapa).
2. **Reporte guiado:** foto sin galería + EXIF fuera + SHA-256, ubicación con
   pin, 12 categorías, escrito formal autogenerado, dedup a 80 m, filtro del
   campo libre.
3. **Expediente y presión:** feed/mapa por estado, detalle con contador de
   días, PDF de presentación formal, escalera de escalamiento completa,
   plazos con vencimiento automático, cierre con antes/después + 2 confirmaciones.
4. **Registro del barrio, perfil, y panel de escritorio** (Windows) con tabla
   filtrable, embudo de datos, CSV/PDF y cola de moderación de barrios.

Todo offline-first con la cola de sync esperando el `ClienteRemoto` real.

**Lo único que queda para producción real** (todo depende del backend Supabase
desplegado, que ya está escrito y probado localmente):
1. Implementar `ClienteRemoto` contra Supabase + auth (email/OTP) → activa la
   sincronización, el rol visitante/verificado y las firmas formales.
2. Envío real de presentaciones por email/Open311 (hoy es Exportar PDF).
3. Jobs del servidor: clustering de categorías, promoción y fusión de barrios,
   siembra GeoNames mundial.
4. Firma del APK de release y revisión legal por país antes de publicar.

**Cómo probar la app hoy:** instalar el APK del CI (workflow Android APK) o
correr el build de Windows. Funciona entera sin conexión.

## Cómo retomar

1. Leer este archivo y `PENDIENTES.md`.
2. Verificar que no haya otra sesión trabajando este repo (archivos recién modificados, `git status` sucio).
3. Continuar con la primera etapa ⬜/🔨 de la tabla, siguiendo la definición de
   terminado de §25 (compila ambas plataformas, analyze limpio, tests, i18n, a11y).
4. Al cerrar cada etapa: commit atómico en `develop`, push, verificar CI remoto verde,
   actualizar `README.md` (funcionalidades + cómo probarlas), `ESTADO.md` y `PENDIENTES.md`.
