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

### Capa de datos offline-first (Etapa 3) ✅

- **Base local Drift (SQLite)** con el esquema completo del expediente:
  barrios con polígono, casos con evidencia hasheada, adhesiones, acciones de
  escalamiento, resoluciones. La app funciona 100% sin conexión.
- **Cola de sincronización** con reintentos exponenciales (30 s → 1 h),
  idempotencia por `client_uuid` y estado visible por registro. Los contadores
  son autoridad del servidor; el resto resuelve por último-en-escribir.
- **Reglas antifraude locales:** máximo 5 casos por día, deduplicación a menos
  de 80 m + misma categoría + 30 días, adhesión única por usuario.
- **Catálogo guiado:** 5 categorías (alumbrado, calzada, residuos, agua,
  arbolado) definidas en JSON con árboles de preguntas en es/en/pt — agregar
  una categoría es agregar un JSON, sin tocar código.
- **Privacidad en el modelo:** domicilios como geohash de 7 caracteres (~150 m)
  y pines sobre viviendas desplazados hasta 25 m de forma estable.

**Cómo probarlo:** `flutter test test/data/` (cola, repos y esquema contra una
base en memoria). La UI de reporte que consume esto llega en la etapa 6.

### Catálogo completo, registro y navegación (Fase 4) ✅

- **12 categorías de reclamo:** alumbrado, calzada, residuos, agua, arbolado,
  tránsito, espacios verdes, transporte, ruido, obra, anegamiento y "Otro".
- **App con sus cuatro pestañas:** Mi cuadra · Mapa · Registro · Perfil, con el
  botón de reportar siempre a mano.
- **Registro del barrio:** el archivo permanente de lo que se resolvió, con el
  nombre de quienes lo empujaron.
- **Perfil:** cambiar de barrio, exportar o borrar tus datos.
- **Detección de barrios duplicados** para fusionarlos (Villa Crespo / Vila
  Crespo) por nombre, superposición y cercanía.

**Cómo probarlo:** navegá entre las cuatro pestañas de abajo; en Reportar
elegí cualquiera de las 12 categorías; los casos resueltos aparecen en Registro.

### Panel de escritorio (Fase 3) ✅

El build de Windows es la **mesa de trabajo del referente**: al abrirlo aparece
un panel de tres secciones en vez del feed móvil.

- **Casos:** tabla densa filtrable de todos los casos del barrio.
- **Datos:** el embudo del barrio (reportes → presentados → respondidos →
  resueltos), la tasa de resolución y los **días medios que tarda el organismo
  en responder** — con exportación a CSV y a PDF para llevar a la prensa. Nunca
  hay un puntaje de barrio; la métrica es la respuesta del Estado.
- **Moderación:** cola de barrios propuestos para promover o rechazar.

**Cómo probarlo:** abrir `cuadra.exe` en Windows con un barrio ya elegido desde
el teléfono (o creado). La ventana no baja de 1024×640.

### Presentación formal y escalamiento (Fase 2) ✅

- **De reclamo a expediente presentable:** la app genera el PDF formal
  (carátula de mesa de entradas, hechos, ubicación, adhesiones, evidencia con
  su hash SHA-256) y lo comparte o imprime para presentarlo ante el organismo.
- **El reloj corre a la vista:** al presentar, arranca el plazo legal; cuando
  vence, el caso pasa solo a "sin respuesta · N días".
- **La escalera de escalamiento:** siempre hay un paso siguiente con el escrito
  armado — reiteración (renueva 15 días), pronto despacho, acceso a la
  información, Defensoría, concejal, prensa, dato abierto.
- **Cierre con antes/después:** marcás resuelto con una foto del después; cuando
  dos vecinos lo confirman, el caso pasa a resuelto y su sello se estampa.

**Cómo probarlo:** en un caso, botón "Presentar reclamo formal" → se genera y
comparte el PDF, y el caso queda presentado con el contador de días. El botón
"Marcar como resolvido" inicia el cierre; hace falta la confirmación de otros
dos vecinos.

### Feed, mapa y expediente (Etapas 7–9) ✅

- **Mi cuadra:** los casos del barrio con su sello de estado, días abiertos y
  adhesiones. Lo pendiente arriba, lo más nuevo primero — y la lista termina:
  "Eso es todo lo que hay abierto cerca tuyo".
- **Mapa:** cada caso es un pin del color de su estado (amarillo = espera
  acción, rojo óxido = sin respuesta, verde = resuelto).
- **Detalle del caso:** la foto con el sello estampado, el contador de días en
  tipografía de cartel, el escrito completo, la línea de tiempo y siempre un
  paso siguiente (adherir, o el aviso de qué llega en la próxima fase).
- **El sello se estampa:** al abrir un caso resuelto, la única animación del
  producto (150 ms, respeta la reducción de movimiento del sistema).

**Cómo probarlo:** publicar un reporte → aparece en el feed → tocarlo abre el
expediente → "Adherir" suma la firma (una sola vez por usuario). El ícono de
mapa en la barra superior muestra los pines.

### Reporte guiado (Etapa 6) ✅

- **Reportá en 40 segundos sin escribir:** foto con la cámara (sin galería),
  ubicación con pin ajustable sobre el mapa, categoría y subtipo de una grilla,
  y 3–5 preguntas de opción. La app redacta el escrito formal y te lo muestra
  antes de publicar.
- **Evidencia con integridad:** la foto pierde todo el EXIF (GPS, cámara), se
  comprime a 1600 px y queda hasheada con SHA-256 en el momento.
- **Deduplicación:** si ya hay un caso igual a menos de 80 metros, la app
  ofrece sumarte en vez de duplicar.
- **Único campo libre (200 caracteres) filtrado:** insultos, teléfonos,
  patentes o acusaciones a personas no pasan — y el reclamo se publica igual.
- **Todo funciona sin conexión** y sincroniza cuando vuelve la señal.

**Cómo probarlo (Android):** con un barrio elegido, botón amarillo "Reportar" →
foto → confirmar ubicación → elegir "Alumbrado público" → subtipo y preguntas →
ver el escrito generado → "Publicar en mi cuadra". En Windows el flujo corre
sin captura de cámara.

### Motor geográfico (Etapa 5) ✅

- **Buscá tu barrio o crealo:** buscador local + alta de barrio con validación
  automática del nombre contra OpenStreetMap (Nominatim). Si el nombre no
  aparece, se puede dibujar igual: nada bloquea al vecino.
- **Dibujo del polígono en el mapa:** tocás las esquinas del barrio sobre el
  mapa OSM (mínimo 4 vértices, máximo 25 km², rechazo si se superpone más del
  40% con un barrio activo). Área calculada en vivo y deshacer por punto.
- **Estados de barrio:** propuesto → activo (3 vecinos verificados) →
  consolidado (10 + un caso presentado).

**Cómo probarlo:** abrir la app → "Buscá tu barrio" → "Crear mi barrio" →
elegir ciudad, escribir el nombre (el ícono de la lupa lo valida contra OSM),
tocar 4+ esquinas en el mapa y "Proponer este barrio". La pantalla principal
pasa a mostrar el barrio con su estado.

### Backend Supabase local (Etapa 4) ✅

- **Stack completo self-hosted** (Postgres 15 + PostGIS + Auth + REST + Storage
  + Realtime + Studio) con RLS en todas las tablas, triggers de contadores del
  lado del servidor, `geo_resolve` (punto → barrio), `casos_cercanos`
  (deduplicación por radio) y regla del 40% de solapamiento de polígonos.
- **Siembra inicial:** 23 países, las 24 provincias argentinas, 5 ciudades y
  las categorías del núcleo.

**Cómo probarlo:**

```bash
cd supabase && cp .env.example .env && docker compose up -d
# API REST:   http://localhost:55621  (anon key en .env.example)
# Studio:     http://localhost:55623
# Postgres:   localhost:55622 (postgres / postgres-dev-password)
```

---

## Desarrollo

```bash
flutter pub get
flutter test          # tests unitarios y de widgets
flutter analyze       # sin warnings
dart format lib test  # formato del CI
```

Ramas: Git Flow (`develop` para trabajo, `main` estable, tags `v*` → release con APK).
