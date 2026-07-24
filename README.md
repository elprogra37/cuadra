# Cuadra — Tu barrio deja constancia

Plataforma de acción vecinal para **Android y Windows**: convierte reclamos de
barrio en expedientes con evidencia fechada, firmas de vecinos verificados,
destinatario concreto en el Estado y un contador público de días sin respuesta.

> No es un grupo de quejas. Es un expediente.

- **Stack:** Flutter 3.44 (Android + Windows) · Riverpod · go_router · Drift (offline-first) · Supabase (Postgres + PostGIS)
- **Idiomas:** español (rioplatense), inglés, portugués
- **Especificación:** [`docs/cuadra-documento-maestro-v2.md`](docs/cuadra-documento-maestro-v2.md) · **Estado:** [`ESTADO.md`](ESTADO.md) · **Pendientes:** [`PENDIENTES.md`](PENDIENTES.md)

---

## Descargas — v0.1.0 (probá la app ya)

**[⬇ Release v0.1.0](../../releases/tag/v0.1.0)** — las 4 fases completas, funciona 100% offline.

| Plataforma | Descarga directa |
|---|---|
| **Android** | [`app-release.apk`](../../releases/download/v0.1.0/app-release.apk) (70 MB) — instalar y abrir |
| **Windows** | [`cuadra-windows-x64.zip`](../../releases/download/v0.1.0/cuadra-windows-x64.zip) (19 MB) — descomprimir y abrir `cuadra.exe` |

> APK de release sin firma de tienda todavía (Android puede pedir permitir apps
> de orígenes desconocidos). Los builds salen de CI: esta máquina de desarrollo
> no tiene JDK ni Visual Studio.

### Probá el camino completo

1. **Buscá tu barrio → Crear mi barrio:** elegí una ciudad, nombralo, tocá 4
   esquinas en el mapa (se valida contra OpenStreetMap) y proponelo.
2. **Reportá** (botón amarillo): foto con la cámara → confirmá la ubicación con
   el pin → elegí una de las 12 categorías → respondé 3-5 preguntas → mirá el
   escrito formal que arma la app → publicá.
3. **Presentá:** en el caso, "Presentar reclamo formal" genera y comparte el PDF
   y arranca el contador de días. Si vence el plazo, aparece el siguiente escalón.
4. **Cerrá:** "Marcar como resuelto" con foto del después; con 2 confirmaciones
   de otros vecinos el sello se estampa y el caso pasa al Registro del barrio.
5. **Windows:** `cuadra.exe` abre el panel del referente (tabla de casos, datos
   con embudo y CSV/PDF, cola de moderación de barrios).

---

## Qué hace la app

**Reporte guiado, el vecino elige y la app redacta.** Cámara nativa obligatoria
(sin galería), EXIF eliminado y hash SHA-256 al capturar, ubicación con pin
ajustable, 12 categorías con árbol de preguntas de opción (nunca texto libre
salvo un campo de 200 caracteres filtrado). La app genera el escrito
administrativo formal y lo muestra antes de publicar. Deduplicación a 80 m.

**Expediente y presión sobre el Estado.** Generación del PDF de mesa de entradas
(carátula, hechos, ubicación, adhesiones verificadas aparte, evidencia con hash
y timestamp, normativa, petitorio), plazo legal con vencimiento automático, y la
escalera de escalamiento completa: reiteración (renueva 15 días) → pronto
despacho → acceso a la información → Defensoría → concejal → prensa → dato
abierto. Siempre hay un paso siguiente con el escrito armado.

**El barrio a la vista.** Feed ordenado (lo pendiente arriba, lo más nuevo
primero) con cierre explícito de lista, mapa con pines de color por estado,
detalle con contador de días en tipografía de cartel y la línea de tiempo de
acciones. La única animación del producto: el sello que se estampa al resolverse.

**Registro del barrio.** El archivo permanente de lo que se arregló, con el
nombre de quienes lo empujaron.

**Panel de escritorio (Windows).** Mesa de trabajo del referente: tabla densa
filtrable de casos, embudo del barrio (reportes → presentados → respondidos →
resueltos), días medios de respuesta del organismo, export CSV/PDF, y cola de
moderación de barrios. **Nunca un puntaje de barrio:** la métrica es la respuesta
del Estado, no la cantidad de problemas.

**Diseño de trámite oficial.** Paleta y tipografías del expediente
(asfalto/cal/vial/sello/vencido/tiza; Oswald, Inter, JetBrains Mono). El
amarillo `vial` aparece solo donde hay algo abierto que espera acción —
verificado por test.

**Offline-first de verdad.** Drift (SQLite) es la fuente de verdad; todo el flujo
funciona sin conexión y una cola de sincronización con backoff exponencial e
idempotencia empuja los cambios cuando vuelve la señal. Privacidad en el modelo:
domicilios como geohash de 7 caracteres (~150 m), pines sobre viviendas
desplazados hasta 25 m.

---

## Desarrollo

```bash
flutter pub get
flutter test          # 97 tests: dominio, sync, geografía, escrito, escalera, e2e
flutter analyze       # sin warnings
dart format lib test  # formato del CI
```

**Backend local (Supabase self-hosted, puertos 556xx):**

```bash
cd supabase && cp .env.example .env && docker compose up -d
# API REST http://localhost:55621 · Studio http://localhost:55623 · Postgres localhost:55622
```

**Regenerar** código (`dart run build_runner build`), íconos
(`dart run flutter_launcher_icons`) o el ícono fuente
(`dart run tool/generar_icono.dart`).

Ramas: Git Flow (`develop` trabajo, `main` estable, tags `v*` → release con APK+zip).

> **Nota CI:** desde ~2026-07-17 los push no disparan GitHub Actions en la
> cuenta; los workflows tienen `workflow_dispatch` y se disparan por API tras
> cada push (ver `PENDIENTES.md`).
