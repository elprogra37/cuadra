# Cuadra — Tu barrio deja constancia

Plataforma de acción vecinal para **Android y Windows**: convierte reclamos de
barrio en expedientes con evidencia fechada, firmas de vecinos verificados,
destinatario concreto en el Estado y un contador público de días sin respuesta.

> No es un grupo de quejas. Es un expediente.

- **Stack:** Flutter 3.44 (Android + Windows) · Riverpod · go_router · Drift (offline-first) · Supabase (Postgres + PostGIS)
- **Idiomas:** español (rioplatense), inglés, portugués
- **Especificación:** [`docs/cuadra-documento-maestro-v2.md`](docs/cuadra-documento-maestro-v2.md) · **Estado:** [`ESTADO.md`](ESTADO.md) · **Pendientes:** [`PENDIENTES.md`](PENDIENTES.md)

---

## Descargas — v0.2.0 (probá la app ya)

**[⬇ Última release](../../releases/latest)** — las 4 fases completas + identidad/modo visitante, onboarding, disputas y jobs de archivado. Funciona 100% offline.

| Plataforma | Descarga directa |
|---|---|
| **Android** | [`app-release.apk`](../../releases/latest/download/app-release.apk) — instalar y abrir |
| **Windows** | [`cuadra-windows-x64.zip`](../../releases/latest/download/cuadra-windows-x64.zip) — descomprimir y abrir `cuadra.exe` |

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

## Funcionalidades para probar (lista rápida)

Cada ítem es algo concreto que podés ver funcionando en la app.

### Onboarding e identidad
- [ ] **Onboarding de 3 pantallas** la primera vez que abrís la app.
- [ ] **Entrás como visitante** (solo lectura); al intentar reportar o firmar te
  pide un nombre para **entrar como vecino**.
- [ ] En **Perfil**: cambiar de barrio, exportar o **borrar tus datos**.

### Crear tu barrio
- [ ] **Buscador de barrio**; si no existe, lo creás vos.
- [ ] **Validación del nombre contra OpenStreetMap** (el ícono de lupa lo verifica).
- [ ] **Dibujás el polígono tocando el mapa** (mín. 4 esquinas), con **área en vivo** y deshacer.
- [ ] Rechaza polígonos **> 25 km²** o que se **superponen > 40 %** con otro barrio activo.

### Reportar (el corazón de la app)
- [ ] **Cámara obligatoria, sin galería** — la foto se saca en el momento.
- [ ] La foto pierde **todo el EXIF** (GPS, cámara) y queda con **hash SHA-256**.
- [ ] **Ubicación con pin arrastrable**; solo te deja reportar **dentro de tu barrio**.
- [ ] **12 categorías** (alumbrado, calzada, residuos, agua, arbolado, tránsito,
  espacios verdes, transporte, ruido, obra, anegamiento, otro).
- [ ] **Preguntas de opción** (nunca escribís el reclamo) → la app **redacta el
  escrito formal** y te lo muestra antes de publicar.
- [ ] **Campo libre de 200 caracteres filtrado:** probá poner un insulto, un
  teléfono o una patente → te avisa y el reclamo se publica igual sin ese texto.
- [ ] **Deduplicación:** si ya hay un caso igual a menos de 80 m, te ofrece sumarte.
- [ ] Rate limit: **máximo 5 reportes por día**.

### El expediente y la presión
- [ ] **Presentar reclamo formal** → genera y **comparte un PDF** de mesa de
  entradas y **arranca el contador de días**.
- [ ] Cuando **vence el plazo**, el caso pasa solo a **"sin respuesta · N días"**.
- [ ] **Escalera de escalamiento:** reiterar (renueva 15 días) → pronto despacho
  → acceso a la información → Defensoría → concejal → prensa → dato abierto.
- [ ] **Adherir** (firmar) una sola vez por caso, con **confirmación de impacto**
  (a mí también / afecta a mi familia / me generó un gasto).
- [ ] **Aportar evidencia:** sumar otra foto al mismo caso.
- [ ] **Disputar** con motivo cerrado (ya resuelto / ubicación / categoría / no corresponde).
- [ ] **Marcar resuelto** con foto del después → con **2 confirmaciones de otros
  vecinos** el caso se resuelve y **el sello se estampa** (la única animación).

### Ver el barrio
- [ ] **Feed** ordenado: lo pendiente arriba, lo más nuevo primero, y la lista
  **termina** ("Eso es todo lo que hay abierto cerca tuyo").
- [ ] **Mapa** con pines de color por estado (amarillo = espera acción, rojo =
  sin respuesta, verde = resuelto).
- [ ] **Detalle del caso:** foto con el sello, contador de días en tipografía de
  cartel, el escrito, la línea de tiempo y siempre un paso siguiente.
- [ ] **Registro del barrio:** lo resuelto, permanente, con quiénes lo empujaron.

### Automático (corre solo)
- [ ] Un caso **sin ninguna adhesión a 7 días se archiva** solo.
- [ ] Rate limit de **30 adhesiones por día** (anti-granja de firmas).

### En Windows (panel del referente)
- [ ] `cuadra.exe` abre un **panel de escritorio** (no el feed móvil).
- [ ] **Tabla de casos filtrable** por texto, categoría o estado.
- [ ] **Datos:** embudo del barrio + **días medios de respuesta del organismo**,
  con **export CSV y PDF**. Nunca un puntaje de barrio.
- [ ] **Moderación:** cola de barrios propuestos para promover o rechazar.
- [ ] La ventana **no baja de 1024×640**.

### Transversal
- [ ] **Tres idiomas** (español, inglés, portugués) según el idioma del sistema.
- [ ] **Funciona 100 % sin conexión** — probá con el modo avión: todo se guarda
  y se sincroniza cuando vuelve la señal.
- [ ] **Estética de trámite oficial:** el amarillo aparece **solo** donde hay
  algo pendiente que espera acción.

---

## Desarrollo

```bash
flutter pub get
flutter test          # 107 tests: dominio, sync, geografía, escrito, escalera, sesión, e2e
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
