# PENDIENTES — Cuadra

> Deuda conocida y tareas que no bloquean la etapa en curso.
> El plan grande vive en `ESTADO.md`; acá va lo puntual.

## Técnicos

- [ ] **Firma release Android:** el APK de release sale sin keystore propio.
      Generar keystore + secrets en GitHub antes de publicar en tienda.
- [ ] **Ventana Windows:** mínimo 1024×640 + estado persistente (§20.4) — toca
      `windows/runner/main.cpp`. Corresponde a Fase 3, pero anotado desde ya.
- [ ] **Ícono y splash:** hoy usa el ícono default de Flutter. Diseñar sello
      "mesa de entradas" como ícono (flutter_launcher_icons + flutter_native_splash).
- [ ] **`prefers-reduced-motion`:** respetarlo en la animación del sello (etapa 9).
- [x] **Supabase local:** puertos 556xx asignados (Kong 55621, Postgres 55622,
      Studio 55623). `cd supabase && cp .env.example .env && docker compose up -d`.
- [ ] **Siembra GeoNames completa:** hoy hay 23 países + AR completo + 5 ciudades.
      Falta el job que siembra regiones/ciudades del mundo desde el dump de
      GeoNames (admin1 + cities15000) — hacerlo cuando haya backend desplegado.
- [ ] **Cliente Supabase en la app:** `ClienteRemoto` real contra Kong/PostgREST
      (hoy es `ClienteRemotoNulo`); llega con auth en Fase 1-2.
- [ ] **CI no se dispara por push desde ~2026-07-17** (toda la cuenta): los
      workflows tienen `workflow_dispatch` y se disparan por API tras cada push.
      Revisar el estado de la cuenta GitHub (¿flag de Actions?).

## De producto (post Fase 1)

- [ ] Fase 2: generador de PDF, plantillas por jurisdicción, envío con acuse,
      escalera de escalamiento, cierre con antes/después.
- [ ] Fase 3: panel Windows (mesa de trabajo del referente), moderación, CSV, impresión.
- [ ] Fase 4: 12 categorías, promoción de categorías, fusión de barrios, Open311,
      modo visitante completo, panel público de datos.
- [ ] Decidir nombre definitivo (§24: Cuadra / Constancia / Vereda / Aviso / Pronto Despacho)
      antes de publicar en tienda.

## Verificaciones pendientes

- [ ] Primer run de CI remoto (se verifica al pushear la etapa 1).
- [ ] Probar el APK en un dispositivo Android real.
- [ ] Probar el build de Windows en esta máquina (bajar el zip del CI).
