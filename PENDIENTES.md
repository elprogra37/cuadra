# PENDIENTES — Cuadra

> Deuda conocida y tareas que no bloquean lo hecho.
> El plan grande y el estado por fase viven en `ESTADO.md`; acá va lo puntual.

## Estado: las 4 fases están completas en local (2026-07-23)

Lo que resta es todo lo que **depende del backend conectado o de un despliegue
real**. El esquema Supabase ya está escrito y probado localmente; falta el
cliente que lo consuma y el deploy.

## Bloqueantes para producción

- [ ] **Cliente Supabase (`ClienteRemoto`) + auth:** hoy es `ClienteRemotoNulo`
      (todo queda en la cola local). Implementarlo contra Kong/PostgREST activa
      la sincronización, el rol visitante/verificado y las firmas formales.
- [ ] **Envío real de presentaciones:** email a mesa de entradas / formulario /
      Open311. Hoy el canal es Exportar PDF + compartir (§14.2).
- [ ] **Firma release Android:** el APK de release sale sin keystore propio.
      Generar keystore + secrets en GitHub antes de publicar en tienda.
- [ ] **Revisión legal por país** (difamación, datos personales) antes de lanzar.

## Jobs del servidor (post-deploy)

- [ ] Clustering de propuestas de categoría "Otro" (embeddings) → promoción.
      La "Otro" ya publica como caso normal con plantilla genérica; falta agrupar.
- [ ] Promoción de barrios (propuesto→activo→consolidado) y cola de fusión de
      duplicados. La detección pura ya existe (`RepoGeografia.esDuplicado`).
- [ ] Siembra GeoNames mundial (hoy: 23 países + AR completo + 5 ciudades).
- [ ] `check_deadlines` server-side (hoy corre local en cada arranque).

## Pulido

- [ ] **Splash screen** con el sello (flutter_native_splash). El ícono ya está.
- [ ] Clustering de pines en el mapa con densidad real.
- [ ] Editor de vértices del polígono arrastrando (hoy: tocar + deshacer).
- [ ] Multiventana y atajos de teclado en el panel de Windows.
- [ ] Impresión de legajo de caso individual (hoy imprime el resumen de datos).
- [ ] Decidir nombre definitivo (§24: Cuadra / Constancia / Vereda / Aviso).

## Hechos (ya no pendientes)

- [x] Supabase local en puertos 556xx.
- [x] Ventana Windows mínimo 1024×640.
- [x] Ícono de la app (sello de mesa de entradas).
- [x] `prefers-reduced-motion` en la animación del sello.
- [x] CI verde (formato+analyze+tests, APK Android, zip Windows) por etapa.
- [x] Workaround al no-disparo por push: `workflow_dispatch` por API.

## Nota operativa

**CI no se dispara por push desde ~2026-07-17** (toda la cuenta elprogra37): los
workflows tienen `workflow_dispatch` y se disparan por API tras cada push.
Revisar el estado de Actions de la cuenta (cuota de storage / flag).
