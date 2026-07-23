# CUADRA — Documento maestro de producto y arquitectura

**Plataforma de acción vecinal · Android + Windows · Alcance mundial**
Versión 2.0 · Documento completo de especificación
*(“Cuadra” es nombre de trabajo. Alternativas en la sección 24.)*

---

# ÍNDICE

**PARTE I — QUÉ ES**
1. Tesis del producto
2. Principio rector de diseño
3. Qué gana el vecino (respuesta concreta)
4. Material de promoción
5. Dirección visual

**PARTE II — CÓMO FUNCIONA**
6. Motor de geografía colaborativa
7. Roles y permisos
8. Catálogo estandarizado de asuntos
9. Composición guiada: el vecino elige, la app redacta
10. Evidencia y control de contenido
11. Interacciones estructuradas
12. Ciclo de vida del caso
13. Escalera de escalamiento
14. Presentación formal ante organismos
15. Modo visitante y prevención de estigma
16. Notificaciones
17. Panel del dueño
18. Modelo de negocio

**PARTE III — CÓMO SE CONSTRUYE**
19. Modelo de datos
20. Arquitectura técnica
21. API y servicios
22. Seguridad, privacidad y marco legal
23. Métricas
24. Roadmap, riesgos y nombres

**PARTE IV — EJECUCIÓN**
25. Prompt profesional para Claude Code

---
---

# PARTE I — QUÉ ES

## 1. Tesis del producto

> **Cuadra convierte el enojo del barrio en expedientes que alguien tiene que responder.**

Todos los días pasa algo en tu cuadra que está mal: la luminaria apagada hace cinco meses, el pozo que ya rompió tres autos, el basural que nadie levanta, el semáforo muerto en la esquina de la escuela. Esa bronca hoy termina en un grupo de WhatsApp, se recicla veinte veces y muere ahí.

Cuadra le da un lugar donde **terminar**: un caso con evidencia fechada, con firmas de vecinos verificados, con un destinatario concreto en el Estado, con un reloj corriendo a la vista de todos, y con un estado final que dice *resuelto* o *sin respuesta desde hace 47 días*.

Ambas cosas son útiles. La segunda, a veces, más.

**Diferencia con todo lo existente:**

| Producto | Qué hace | Qué le falta |
|---|---|---|
| Grupo de WhatsApp | Conversación | Nada sale de ahí |
| Nextdoor / grupos de Facebook | Red social barrial | Deriva en peleas y vigilancia vecinal |
| App municipal oficial | Recibe reclamos | El municipio controla el reloj y la estadística |
| Change.org | Firmas | No hay destinatario técnico ni seguimiento |
| **Cuadra** | **Expediente + presión + registro público** | — |

La diferencia estructural: **el municipio no controla el contador**. Ese solo hecho cambia el poder de negociación de un barrio.

---

## 2. Principio rector de diseño

**La indignación es energía moral bloqueada.** Ves algo mal, sentís urgencia, no tenés dónde ponerla. Las plataformas de atención se financian dejándola sin salida: si la resolvieras, te irías.

Cuadra hace exactamente lo contrario, y esa es toda la tesis:

| El modelo del bucle | El modelo de Cuadra |
|---|---|
| La bronca entra y no sale | La bronca entra y sale convertida en un acto |
| Métrica: tiempo en pantalla | Métrica: casos cerrados |
| Vuelve porque no puede soltar | Vuelve porque le sirvió |
| Escala la dosis hasta quemar la base | Escala la capacidad hasta cambiar la cuadra |
| Gente que te odia mientras te usa | Gente que te defiende |

**Regla de oro, aplicable a cada decisión de producto:**

> Cada sesión debe terminar en **un acto concreto** o en **la constancia visible de que otro no actuó**. Si una pantalla no acerca a ninguna de las dos, no va.

---

## 3. Qué gana el vecino

Situación real: hace cinco meses que la luminaria de la esquina de la escuela está apagada. Ya llamaron tres vecinos. Nadie vino.

**Sin la app:** bronca y un grupo de WhatsApp.

**Con la app:**

1. **El destinatario correcto.** No “el municipio” — el organismo que específicamente atiende alumbrado en su jurisdicción, con su mesa de entradas y su plazo legal. La mayoría de los reclamos mueren porque llegan al lugar equivocado, no porque los ignoren.

2. **Las palabras correctas.** La app redacta el escrito formal: hechos, fechas, ubicación, normativa invocada, petitorio. Un reclamo bien redactado y uno mal redactado reciben trato distinto, y esa asimetría es desigualdad de acceso pura. La app la borra.

3. **Peso colectivo.** Su reclamo solo es una queja. Con 40 firmas verificadas de gente que vive ahí, es un expediente que no se archiva igual.

4. **Prueba fechada.** Foto con timestamp, coordenadas y hash SHA-256. Cinco meses después nadie puede decir “eso es reciente”.

5. **Un reloj público.** Al vencer el plazo el estado cambia solo a *sin respuesta*, visible para cualquiera, incluido el propio organismo.

6. **Un paso siguiente que nunca falta.** Lo más importante. El vecino solo llega hasta “ya llamé, no vinieron” y se rinde. La app siempre tiene el botón del escalón siguiente, con el escrito ya armado.

**En una frase: la app le da a una persona sola el kit de herramientas que hoy solo tiene alguien con abogado, tiempo libre y contactos.**

Y cuando nada funciona, queda la constancia pública de que se pidió siete veces en 200 días sin respuesta. Eso es exactamente lo que un periodista local o un concejal necesita — y es la razón por la que a veces el sexto reclamo se resuelve en dos días.

---

## 4. Material de promoción

### 4.1 Tagline

**Cuadra — Tu barrio deja constancia.**

Alternativas: *La bronca sola no arregla nada.* · *De reclamo a expediente.* · *Alguien tiene que contestar.*

### 4.2 Landing / bienvenida

> **Ese pozo lleva cinco meses.**
> Vos lo sabés. Tus vecinos lo saben. El municipio dice que no le consta.
>
> **Cuadra hace que le conste.**
>
> Sacás una foto. Elegís qué pasa de una lista. La app escribe el reclamo formal, lo manda al organismo que corresponde, junta las firmas de tu cuadra y empieza a contar los días.
>
> Todo a la vista: qué pediste, cuándo, a quién, y cuánto hace que no te contestan.
>
> No es un grupo de quejas. Es un expediente.
>
> **[ Ver qué pasa en mi cuadra ]**

### 4.3 Ficha de tienda

**Título:** Cuadra — Reclamos vecinales que sí llegan
**Descripción corta:** Reportá un problema del barrio, sumá a tus vecinos y seguí el reclamo hasta que lo resuelvan.

**Descripción larga:**

Cuadra es la herramienta para arreglar lo que en tu barrio nadie arregla.

**Reportá en 40 segundos.** Foto, ubicación automática, y elegís de una lista qué pasa. No hace falta que escribas nada.

**Va al lugar correcto.** Cuadra sabe qué organismo se ocupa de cada problema en tu ciudad y arma el escrito con el formato que ese organismo exige.

**Sumá a tu cuadra.** Un reclamo firmado por cuarenta vecinos no se archiva igual que uno solo.

**Mirá el reloj.** Cada caso muestra los días sin respuesta. Público. Para todos.

**Cerrá el círculo.** Cuando se resuelve, subís la foto del después. Queda en el registro del barrio, con el nombre de quienes lo empujaron.

**¿Tu barrio no aparece?** Creálo. La app verifica que exista y lo suma al mapa mundial.

Sin scroll infinito. Sin peleas. Sin comentarios. Sin algoritmo decidiendo qué te enoja hoy. Entrás, hacés algo, salís.

### 4.4 Onboarding — tres pantallas, tres frases

1. **Esto no es para quejarse. Es para dejar constancia.**
2. **Solo vas a ver lo que pasa cerca tuyo.**
3. **Te avisamos cuando haya novedad, no para que vuelvas.**

---

## 5. Dirección visual

El vocabulario sale del mundo real del producto: señalética urbana, pintura vial, chapas de calle, formularios municipales, sellos de mesa de entradas. Nada de gradientes, ilustraciones redondeadas ni estética de app de bienestar.

**La estética es funcional, no decorativa:** cuando el producto parece un trámite oficial y no una red social, la gente se comporta como en una mesa de entradas. La forma condiciona la conducta más que las reglas.

### Paleta

| Token | Hex | Uso |
|---|---|---|
| `asfalto` | `#1C1C1A` | Fondo oscuro, tipografía sobre claro |
| `cal` | `#F2F0E9` | Fondo claro, papel de expediente |
| `vial` | `#F2B705` | Amarillo de pintura vial. Acento primario, estado abierto, CTA |
| `sello` | `#1F5C3A` | Verde tinta. Resuelto, verificado |
| `vencido` | `#B33A1A` | Rojo óxido. Plazo vencido, sin respuesta |
| `tiza` | `#8C8A82` | Metadatos, texto secundario |

**Regla del amarillo:** `vial` aparece **solo** donde hay algo abierto que espera acción. Si una pantalla no tiene amarillo, no hay nada pendiente. Es información, no marca.

### Tipografía

| Rol | Familia | Uso |
|---|---|---|
| Display | Archivo Narrow / Oswald / Barlow Condensed | Títulos de caso y contador de días. Nada más. |
| Cuerpo | Inter / Source Sans 3 | Todo el texto. Legible a la intemperie. |
| Datos | JetBrains Mono / IBM Plex Mono | Números de expediente, fechas, contadores, sellos |

Escala: 32 / 24 / 20 / 16 / 14 / 12. Pesos 400, 600, 800. Sin excepciones.

### Elemento de firma: el sello de estado

Rectángulo tipo mesa de entradas, rotado 1.5–3°, borde de 2 px, tinta con textura desgastada. Cambia según estado:

```
┌────────────────────────┐   ┌────────────────────────┐   ┌────────────────────────┐
│  PRESENTADO            │   │  SIN RESPUESTA · 47 D  │   │  RESUELTO              │
│  12·05·26 · #4417      │   │  vencido 12·06·26      │   │  03·07·26 · verificado │
└────────────────────────┘   └────────────────────────┘   └────────────────────────┘
        vial                          vencido                        sello
```

Es lo único memorable de la interfaz; todo lo demás se mantiene callado alrededor. También es la unidad compartible: el sello estampado sobre la foto del problema, listo para WhatsApp.

### Movimiento

Casi nada. **Una sola animación con peso:** cuando un caso pasa a *resuelto*, el sello cae y se estampa (150 ms, rebote mínimo, con un sonido corto opcional). Es la recompensa del producto entero. Respetar `prefers-reduced-motion`.

---
---

# PARTE II — CÓMO FUNCIONA

## 6. Motor de geografía colaborativa

Es la pieza que permite alcance mundial sin cargar nada a mano.

### 6.1 Jerarquía

```
País  →  Región/Provincia/Estado  →  Ciudad/Municipio  →  Barrio  →  [Cuadra]
```

Los tres primeros niveles se siembran desde datos abiertos (GeoNames + OpenStreetMap admin boundaries). **El nivel de barrio es el que crea la comunidad**, porque es el que ninguna base de datos tiene bien en el mundo entero.

### 6.2 Búsqueda y alta de barrio

```
Usuario busca su barrio
        │
        ├── Existe y está ACTIVO ──────────────► entra
        ├── Existe pero PROPUESTO ─────────────► entra y suma al umbral
        └── No existe ──► [ Crear mi barrio ]
                              │
                              ▼
                    1. Nombre del barrio
                    2. Validación externa automática:
                       · Google Places Autocomplete (type: neighborhood, sublocality)
                       · Nominatim / OSM (place=suburb|neighbourhood|quarter)
                       · ¿El topónimo existe en esas coordenadas?
                              │
                    ┌─────────┴─────────┐
                 VALIDADO           NO ENCONTRADO
                    │                   │
                    ▼                   ▼
        Polígono sugerido       Dibujo manual del polígono
        (editable por el        (mín. 4 vértices, máx. 25 km²,
         usuario)                sin solapar >40% con otro activo)
                    │                   │
                    └─────────┬─────────┘
                              ▼
                    Estado: PROPUESTO
```

### 6.3 Estados de un barrio

| Estado | Condición | Visibilidad |
|---|---|---|
| **Propuesto** | Recién creado | Solo su creador y quienes caen dentro por GPS |
| **Activo** | 3+ usuarios verificados dentro del polígono | Aparece en el buscador público |
| **Consolidado** | 10+ usuarios y ≥1 caso presentado formalmente | Aparece destacado, habilita panel de datos |
| **Fusionado** | Duplicado detectado | Redirige al canónico |
| **Rechazado** | Falla validación o abuso | Oculto |

**Ningún barrio propuesto bloquea a nadie.** El usuario puede reportar desde el momento cero; el estado solo afecta la visibilidad pública.

### 6.4 Fusión de duplicados

Detección automática cuando se cumplen dos de tres:

- Similitud de nombre ≥ 0.85 (Levenshtein normalizado + fonético, tolerante a “Villa Crespo” / “Vila Crespo”)
- Solapamiento de polígonos ≥ 40% (PostGIS `ST_Overlaps` + `ST_Area`)
- Centroides a menos de 800 m

Resultado → cola de fusión en el panel. El canónico es el de más usuarios verificados. Todo el contenido migra; el otro queda como alias de búsqueda.

### 6.5 Herencia jurisdiccional — la regla crítica

> **El mapa crece solo. La capa legal crece a mano. Nunca se mezclan.**

Un barrio hereda de su ciudad: organismos, plazos legales, normativa y plantillas. Si la ciudad no tiene ficha jurisdiccional cargada, el barrio funciona en:

**Modo solo comunidad**
- ✅ Reportar, adherir, aportar evidencia, marcar resuelto, ver el registro
- ❌ Presentación formal (no hay a quién mandarla)
- 🔔 Banner: *“Todavía no cargamos los organismos de tu ciudad. Tu caso queda registrado y lo presentamos apenas estén.”*
- 📊 Contador visible de cuánta gente espera lo mismo → así priorizás qué ciudad cargar

Cuando cargás la jurisdicción, **todos los casos acumulados se presentan en lote**. Ese día el barrio explota de actividad y es tu mejor momento de retención.

### 6.6 Prioridad de expansión

El panel identifica automáticamente **ciudades a punto**: masa de usuarios sin ficha jurisdiccional. Ahí se pone el esfuerzo manual, no en adivinar.

---

## 7. Roles y permisos

| Rol | Ver | Adherir | Reportar | Presentar | Crear barrio | Moderar |
|---|---|---|---|---|---|---|
| **Visitante** (sin cuenta) | ✅ solo lectura | ❌ | ❌ | ❌ | ❌ | ❌ |
| **Registrado** | ✅ | ✅ fuera de su barrio: no computa | ❌ | ❌ | ❌ | ❌ |
| **Vecino** (GPS ≥7 días en el polígono) | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ |
| **Verificado** (documento o factura) | ✅ | ✅ **firma formal** | ✅ | ✅ | ✅ | ❌ |
| **Referente** (designado, 5+ casos resueltos) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ primer nivel de su barrio |
| **Moderador** (equipo) | ✅ | — | — | — | ✅ | ✅ total |
| **Admin** | todo | | | | | |

**Definiciones clave:**

- **Visitante:** puede ver todo sin cuenta, no puede publicar ni firmar absolutamente nada. Es el modo de descubrimiento y el de quien va a viajar a un barrio.
- **Vecino:** verificación pasiva. El dispositivo estuvo dentro del polígono en ≥7 días distintos, en franjas horarias variadas (evita a quien solo trabaja ahí). Es automático y silencioso.
- **Verificado:** subió factura de servicio, documento con domicilio, o pasó verificación por padrón. **Solo su adhesión cuenta como firma formal en el escrito**. Este es el escudo contra granjas de firmas y lo que hace que un organismo tome en serio el listado.
- **Referente:** el que empuja. Se le dan herramientas, no privilegios sociales. Modera en primer nivel su propio barrio y accede al panel de escritorio.

---

## 8. Catálogo estandarizado de asuntos

### 8.1 Por qué es cerrado

**Una categoría no es una etiqueta: es una regla de ruteo.** Cada una está atada a un organismo, un plazo legal y una plantilla de escrito. Si alguien inventa “problema raro de mi cuadra”, la app no tiene a dónde mandarlo.

Por eso el catálogo es cerrado y estandarizado. Pero — regla igual de importante:

> **La cola de aprobación nunca frena un caso.** Si el vecino tiene que esperar una revisión para reclamar, se va y no vuelve.

### 8.2 Tres niveles de catálogo

| Nivel | Qué es | Quién aprueba |
|---|---|---|
| **Núcleo global** | Existe en todo el mundo. Inmutable. | Nadie. Es tuyo. |
| **Extensión nacional** | Solo aplica en ciertos países (cables colgando, zanjas a cielo abierto, quema de basura, animales sueltos) | Equipo, por país |
| **Variante local** | Misma categoría, distinto organismo/plazo según ciudad | Pura configuración |

### 8.3 Núcleo global — 12 categorías

| # | Categoría | Icono | Subtipos |
|---|---|---|---|
| 1 | Alumbrado público | 💡 | Luminaria apagada · intermitente · columna caída · cableado expuesto |
| 2 | Calzada y veredas | 🛣 | Bache · hundimiento · vereda rota · rampa faltante · tapa de servicio |
| 3 | Residuos | 🗑 | Basural · contenedor roto/faltante · recolección no pasa · escombros |
| 4 | Agua y cloacas | 💧 | Pérdida · falta de suministro · desborde cloacal · boca de tormenta tapada |
| 5 | Arbolado | 🌳 | Rama en riesgo · árbol caído · raíz levantando vereda · poda necesaria |
| 6 | Tránsito y señalización | 🚦 | Semáforo fuera de servicio · señal faltante/dañada · senda peatonal borrada |
| 7 | Espacios verdes | 🏞 | Juego roto · plaza sin mantenimiento · falta de iluminación |
| 8 | Transporte público | 🚌 | Parada sin refugio · recorrido suprimido · frecuencia |
| 9 | Ruido y contaminación | 🔊 | Ruido industrial · obra fuera de horario · olor · humo |
| 10 | Obra y edificación | 🏗 | Obra sin cartel · vereda obstruida · edificio en riesgo de derrumbe |
| 11 | Anegamiento e inundación | 🌊 | Zona que se inunda · desagüe obstruido |
| 12 | Otro | ➕ | Va al motor de propuestas (8.4) |

### 8.4 Promoción de categorías nuevas — por frecuencia, no por revisión

No se moderan propuestas una por una: eso te sepulta. Se moderan **patrones**.

```
Usuario elige "Otro"
        │
        ▼
Descripción por campos guiados (no texto libre):
  ¿Sobre qué es?      → infraestructura / servicio / ambiente / seguridad edilicia
  ¿Dónde ocurre?      → calle / vereda / plaza / edificio público / domicilio
  ¿Con qué frecuencia?→ permanente / diaria / esporádica
  Etiqueta corta      → máx. 40 caracteres, filtrado
        │
        ▼
El caso SE PUBLICA Y SE PRESENTA IGUAL con plantilla genérica
de reclamo administrativo. No espera nada.
        │
        ▼
En paralelo: el sistema agrupa propuestas similares
(embedding semántico + proximidad geográfica + país)
        │
        ▼
Umbral: 25 casos · 3+ barrios · 60 días
        │
        ▼
Salta al panel como CATEGORÍA CANDIDATA
        │
        ▼
Aprobás el grupo entero de una vez:
nombre, icono, organismo, plazo, plantilla
        │
        ▼
Reclasificación retroactiva automática de todos los casos "Otro" del grupo
```

**Detalle de interfaz:** cuando alguien elige “Otro”, mostrar *“Ya hay 14 vecinos reportando algo parecido”*. Convierte una espera en señal de que no está solo.

---

## 9. Composición guiada: el vecino elige, la app redacta

### 9.1 La decisión de arquitectura

**El vecino no escribe. Selecciona.** La app redacta.

Un campo de texto vacío es la puerta de entrada de las mentiras, los insultos, las acusaciones a personas y el ruido. Un árbol de selecciones no lo es. Y de paso el escrito sale mejor que el 95% de lo que escribiría una persona enojada a las 11 de la noche.

### 9.2 El flujo

```
Cámara (nativa, obligatoria)
        │
        ▼
Ubicación automática · ajustable arrastrando el pin
        │
        ▼
Categoría (grilla de 12 iconos)
        │
        ▼
Subtipo (lista corta)
        │
        ▼
Preguntas guiadas específicas de la categoría (3 a 5, todas de opción)
        │
        ▼
Vista previa del escrito generado  ← el usuario ve exactamente qué se va a decir
        │
        ▼
[ Publicar en mi cuadra ]  +  [ ✓ Presentar reclamo formal ]
```

### 9.3 Ejemplo completo — Alumbrado

**Lo que ve el usuario:**

```
¿Qué pasa?           → Luminaria apagada ▾
¿Dónde exactamente?  → Columna de esquina ▾
¿Desde cuándo?       → Más de 3 meses ▾
¿Qué consecuencia?   → [✓] Zona escolar
                       [✓] Sensación de inseguridad
                       [ ] Caídas o accidentes
                       [ ] Zona sin otra iluminación
¿Reclamaste antes?   → Sí, por teléfono, sin respuesta ▾
```

**Lo que genera la app:**

> **Objeto:** Solicitud de reparación de luminaria pública inoperativa.
>
> **Hechos:** Se constata la falta de funcionamiento de la luminaria emplazada en columna de esquina, sita en [dirección], coordenadas [lat, lng], según registro fotográfico adjunto captado el [fecha] con geolocalización verificada. La situación se extiende por un plazo superior a noventa (90) días.
>
> **Afectación:** El punto se encuentra en zona escolar y carece de fuente alternativa de iluminación, configurando riesgo para la circulación peatonal y afectando las condiciones de seguridad del sector. Se registran [N] adhesiones de vecinos residentes, de las cuales [M] corresponden a domicilio verificado.
>
> **Antecedentes:** Se registran reclamos previos por vía telefónica sin respuesta acreditada.
>
> **Normativa invocada:** [Ordenanza X, art. Y; Ley Z de procedimiento administrativo]
>
> **Petitorio:** Se solicita la reparación de la luminaria y se requiere respuesta formal dentro del plazo legal de [N] días.

Nadie puede insultar en un menú desplegable.

### 9.4 Otro ejemplo — Bache

```
¿Qué tipo?           → Bache profundo ▾
¿Tamaño aproximado?  → Más grande que una tapa de alcantarilla ▾
¿Dónde?              → Carril de circulación ▾
¿Desde cuándo?       → Entre 1 y 3 meses ▾
¿Consecuencias?      → [✓] Daños a vehículos
                       [✓] Los autos esquivan e invaden el otro carril
                       [ ] Se llena de agua
```

Cada categoría tiene su propio árbol, definido en el archivo JSON de la categoría — **no en código**. Agregar una categoría es agregar un JSON.

### 9.5 El único campo libre

Uno solo, opcional, **máximo 200 caracteres**, con filtro de lenguaje + clasificador antes de enviar.

Si no pasa el filtro: la app **no rechaza en seco**. Muestra qué parte es el problema y ofrece reformular. Si el usuario insiste, **el caso se publica sin ese campo**. El reclamo nunca se pierde por culpa del texto libre.

---

## 10. Evidencia y control de contenido

### 10.1 Fotos — cuatro capas en orden

1. **Cámara nativa obligatoria** para la evidencia principal. Sin acceso a galería. Elimina de un saque casi todo lo obsceno y todas las imágenes descargadas de internet.
2. **Clasificador automático al subir:**
   - Desnudez / contenido sexual → rechazo duro
   - Violencia / gore → rechazo duro
   - Coherencia con la categoría: ¿la imagen contiene calle, infraestructura, espacio público? Si no hay nada de eso → rechazo con explicación
3. **Difuminado automático e irreversible** de caras y patentes. Sin opción de desactivar.
4. **Cola humana** para lo dudoso. El caso queda en *pendiente de revisión*, no publicado. SLA: 4 horas.

### 10.2 Integridad de la evidencia

- Hash SHA-256 al momento de captura, guardado con el registro.
- Timestamp del servidor, no del dispositivo (evita manipular la fecha del teléfono).
- Coordenadas de captura guardadas por separado.
- **EXIF eliminado** antes de almacenar; los metadatos útiles se conservan en la base, no en el archivo.
- Compresión a máx. 1600 px lado largo, calidad 82.

### 10.3 Frenos contra la mentira — sin necesidad de moderador

| Freno | Cómo funciona |
|---|---|
| **Ubicación forzada** | Solo se reporta dentro del polígono donde el usuario está verificado. Se acabó el troll de otra ciudad. |
| **Confirmación cruzada** | Un caso sin ninguna adhesión en 7 días se archiva solo. Un problema real siempre tiene un segundo vecino. |
| **Foto in situ** | Una mentira necesitaría pararse en el lugar y fotografiar algo que no está. |
| **Deduplicación** | 80 m + misma categoría + 30 días → se ofrece sumarse al caso existente, no crear otro. |
| **Rate limiting** | 5 casos nuevos/día, 30 adhesiones/día por usuario. |
| **Disputa estructurada** | Cualquiera puede marcar “esto ya se arregló” o “esto no es así” con motivo de lista. 3 disputas → revisión. |

### 10.4 Prohibiciones absolutas, implementadas en el clasificador

- ❌ **Reportes sobre personas.** Solo infraestructura y servicios. Sin excepciones. Es lo único que separa esto de una app de vigilancia vecinal.
- ❌ Matrículas, caras, nombres propios de particulares.
- ❌ Acusaciones penales. Se redirige a los canales que corresponden con un mensaje explicativo.
- ❌ Contenido partidario o electoral.
- ❌ Comercio, venta, promoción.

---

## 11. Interacciones estructuradas

**No hay comentarios. No hay chat. No hay mensajería entre usuarios. No hay hilos.** La única conversación es la del barrio con el organismo.

Las cinco interacciones posibles sobre un caso:

| Acción | Quién | Qué produce |
|---|---|---|
| **Adherir** | Registrado+ | Un toque. Suma al contador. Si es Verificado, cuenta como firma formal. |
| **Confirmar impacto** | Al adherir, opcional | Opciones cerradas: “a mí también me pasó” / “afecta a mi familia” / “me generó un gasto”. Convierte una firma en testimonio. |
| **Aportar evidencia** | Vecino+ | Otra foto del mismo problema, otro día. Es lo que hace fuerte al expediente en el tiempo. |
| **Disputar** | Vecino+ | Motivo de lista: ya resuelto / ubicación incorrecta / categoría incorrecta / no corresponde. |
| **Marcar resuelto** | Vecino+ | Foto del después + confirmación de otros 2 vecinos. |

### Patrón commit-then-register

La adhesión desde un link compartido **no requiere cuenta previa**: se registra la intención, se pide identidad después. La adhesión queda pendiente 24 h y se descarta si no se confirma. Sube la conversión 3–4×.

---

## 12. Ciclo de vida del caso

```
   BORRADOR
      │ publicar
      ▼
   ABIERTO ─────────► sin adhesiones en 7 días ──► ARCHIVADO AUTOMÁTICO
      │ presentar
      ▼
  PRESENTADO  (arranca el reloj legal)
      │
      ├── respuesta oficial dentro del plazo ──► RESPONDIDO ──┐
      │                                                        │
      └── vence el plazo ──► SIN RESPUESTA ──► escalamiento ───┤
                                  │                            │
                                  └── se reitera ──────────────┤
                                                               ▼
                                                        EN EJECUCIÓN
                                                               │ foto del después
                                                               ▼
                                                        RESUELTO (2 confirmaciones)
                                                               │
                                                               ▼
                                                   REGISTRO DEL BARRIO (permanente)
```

Estados adicionales: `EN_REVISION` (moderación), `DISPUTADO`, `FUSIONADO`, `RECHAZADO`.

**Al resolverse:**
1. Se estampa el sello (única animación del producto)
2. Se genera la tarjeta *antes / después* compartible
3. Se notifica a todos los adherentes: *“Lo que firmaste hace 62 días está arreglado.”*
4. El caso pasa al Registro del barrio, permanente, con los nombres de quienes lo empujaron

Esa notificación es el mejor activo de retención de la app, y es completamente honesta.

---

## 13. Escalera de escalamiento

**La mecánica de retención central.** Nunca hay callejón sin salida: siempre existe un botón que dice qué se puede hacer ahora, con el escrito ya armado.

```
1. Reclamo inicial                    plazo del organismo
2. Reiteración                        +15 días
3. Pronto despacho                    figura formal, obliga a expedirse
4. Pedido de acceso a información     "¿qué se hizo con el expediente N?"
5. Defensoría del Pueblo              organismo de control
6. Concejal / representante local     contacto directo, escrito armado
7. Prensa local                       dossier completo listo para enviar
8. Dato público abierto               entra al panel público de la ciudad
```

Cada escalón:
- Es un trámite **real y existente** que el vecino no sabía que podía hacer
- Tiene su plantilla, su destinatario y su plazo cargados por jurisdicción
- Queda registrado en la línea de tiempo del caso

El paso 8 es el que le cambia el cálculo al organismo: **el silencio deja de ser gratis.**

---

## 14. Presentación formal ante organismos

### 14.1 Documento generado

PDF con: carátula formal, hechos y fechas, ubicación exacta y mapa, evidencia paginada con hash y timestamp, lista de adherentes (verificados y no verificados por separado), normativa invocada, petitorio, datos de contacto para respuesta.

### 14.2 Canales de envío

| Canal | Cuándo | Acuse |
|---|---|---|
| **Email a mesa de entradas** | Default universal | Webhook de entrega + lectura |
| **Formulario web oficial** | Deep link asistido, el usuario pega y envía | Captura manual del número |
| **Open311 API** | Ciudades que lo implementan | Número de expediente automático |
| **Exportar PDF** | Presentación en persona o por correo postal | Foto del sello de recepción |

**Open311** es un estándar abierto ya usado por varias ciudades del mundo. Donde exista, la integración es directa y el caso recibe número oficial automáticamente.

### 14.3 Ficha de jurisdicción — configuración, no código

```json
{
  "jurisdiction_id": "AR-C-CABA",
  "name": "Ciudad Autónoma de Buenos Aires",
  "country": "AR",
  "timezone": "America/Argentina/Buenos_Aires",
  "language": "es-AR",
  "default_response_days": 30,
  "organisms": [
    {
      "id": "emui",
      "name": "Ente de Mantenimiento Urbano Integral",
      "categories": ["alumbrado", "calzada", "arbolado"],
      "channels": {
        "email": "mesadeentradas@ejemplo.gob",
        "form_url": "https://...",
        "open311": null
      },
      "response_days": 30,
      "normativa": ["Ley 104 de Acceso a la Información Pública", "Ordenanza ..."],
      "escalation": ["defensoria_pueblo", "concejal_comuna"]
    }
  ],
  "templates": {
    "reclamo": "...",
    "reiteracion": "...",
    "pronto_despacho": "...",
    "acceso_informacion": "...",
    "defensoria": "..."
  }
}
```

**Expandir a una ciudad nueva = agregar un JSON. Nunca tocar código.**

---

## 15. Modo visitante y prevención de estigma

### 15.1 Qué ve un visitante

Sin cuenta, solo lectura:

- Estado de infraestructura del barrio por categoría: qué está abierto, qué se resolvió
- **Tiempo medio de respuesta del municipio ahí** y tasa de resolución
- Registro del barrio: el antes/después de lo arreglado
- Avisos vigentes de servicio: corte de agua, obra en la calle, corte de tránsito

No puede: adherir, reportar, aportar evidencia, disputar, crear barrio. Nada.

### 15.2 El riesgo, y cómo se ataca

Un mapa de reclamos abiertos se lee automáticamente como un ranking de “barrios malos”. Eso estigmatiza, afecta alquileres y valor de propiedad, y castiga justo a los barrios que más se organizan. **SketchFactor murió exactamente por esto.**

Tres reglas obligatorias:

1. **Nunca un puntaje único de barrio.** Ni estrellas, ni semáforo, ni ranking comparativo entre barrios. En ningún lado del producto.
2. **La métrica visible es la respuesta del Estado, no la cantidad de problemas.** “El municipio tarda 62 días acá” señala al responsable. “47 reclamos abiertos” señala al vecino.
3. **Muchos reportes = barrio organizado.** Decirlo explícito en la interfaz. Un barrio con cero casos casi siempre es un barrio sin nadie que reclame, no un barrio sin problemas.

### 15.3 Tablón de avisos [v2]

Si se implementa, con tipos de publicación **cerrados**, vencimiento automático a 30 días y **sin comentarios**:

`Corte de servicio` · `Obra en la calle` · `Evento vecinal` · `Objeto perdido/encontrado` · `Corte de tránsito`

Un tablón de anuncios, no un foro. Si empieza a parecerse a un foro, se apaga.

---

## 16. Notificaciones

**Presupuesto estricto: máximo 3 por semana.** Toda notificación debe contener novedad real. Prohibido “volvé a ver qué pasó” o “tu barrio te extraña”.

Permitidas:

| Evento | Prioridad |
|---|---|
| Respuesta oficial recibida en un caso tuyo | Alta |
| Caso que firmaste, resuelto | Alta |
| Plazo vencido en tu caso, con acción siguiente cargada | Alta |
| Caso nuevo a menos de 300 m | Media, agrupada, 1/día máx. |
| Tu barrio pasó a Activo / tu ciudad ya tiene organismos cargados | Alta, una sola vez |

Cada notificación abre **directamente en la acción**, nunca en el feed.

---

## 17. Panel del dueño

### 17.1 Operación

- **Cola de moderación:** contenido marcado por clasificador, reportes con personas, acusaciones, spam. SLA 4 h.
- **Cola de barrios:** propuestos, fusiones sugeridas, polígonos sospechosos.
- **Cola de categorías candidatas:** grupos que superaron el umbral, listos para aprobar en lote.
- **Editor de jurisdicciones:** organismos, mails, plazos, normativa, plantillas. Todo sin tocar código.
- **Gestión de usuarios:** verificaciones, sanciones, rate limits, designación de referentes.
- **Estado de envíos:** qué salió, qué rebotó, qué recibió acuse, qué está por vencer.

### 17.2 Inteligencia

- **Mapa de calor mundial:** dónde hay masa crítica y dónde no.
- **Ranking de organismos por tiempo de respuesta.** *Tu principal activo periodístico.*
- **Embudo por barrio:** reportes → presentados → respondidos → resueltos.
- **Ciudades a punto:** masa de usuarios sin ficha jurisdiccional cargada. Ahí va el esfuerzo manual.
- **Alertas de abuso:** brigading, granjas de firmas, polígonos falsos, patrones anómalos.
- **Exportación CSV/JSON** de todo.

### 17.3 Crecimiento

- **Feature flags** por país, ciudad y barrio.
- **Detección de referentes:** quién empuja casos en cada barrio, para reclutarlo y darle herramientas.
- **Panel público de datos abiertos:** trae prensa gratis y presiona al organismo sin que digas nada.

---

## 18. Modelo de negocio

Ninguna de estas fuentes toca el feed del vecino:

1. **Licencia a municipios** — el panel del otro lado: reciben, responden y cierran casos desde ahí. Modelo SeeClickFix/Accela. Es el que más ingreso deja.
2. **Datos agregados y anonimizados** — medios, universidades, aseguradoras, urbanistas, inmobiliarias (con las restricciones de 15.2).
3. **Cuenta Organización** — ONG, cámaras vecinales, defensorías, consorcios: multi-caso, exportación, marca propia.
4. **Aporte del barrio** — donación voluntaria. Funciona sorprendentemente bien cuando el barrio ya vio una victoria.
5. **Servicios de implementación** — carga de jurisdicción y capacitación para municipios chicos.

**Nunca:** publicidad, venta de datos individuales, contenido promocionado. Rompe la confianza, que es todo el producto.

---
---

# PARTE III — CÓMO SE CONSTRUYE

## 19. Modelo de datos

### Geografía

```
Country
  id (ISO 3166-1 alpha-2), name, default_language, default_timezone

Region
  id, country_id, name, geonames_id, polygon (geography)

City
  id, region_id, name, geonames_id, polygon, jurisdiction_id?, 
  osm_relation_id, population?

Neighborhood
  id, city_id, name, name_normalized, aliases[],
  polygon (geography, SRID 4326), centroid, area_km2,
  status (proposed|active|consolidated|merged|rejected),
  created_by, created_at,
  validation_source (google_places|osm|manual),
  validation_payload (jsonb),
  verified_user_count, case_count, merged_into?

Jurisdiction
  id, country_id, name, timezone, language,
  default_response_days, config (jsonb)   -- ficha completa, sección 14.3
```

### Casos

```
Case
  id, public_ref (corto, compartible),
  neighborhood_id, city_id, jurisdiction_id,
  category_id, subtype_id,
  guided_answers (jsonb),          -- las selecciones del árbol
  free_text (max 200, nullable),
  generated_body (text),           -- el escrito redactado por la app
  status, severity_computed,
  lat, lng, geohash, address_text, pin_offset_applied (bool),
  created_by, created_at, occurred_since,
  organism_id, submitted_at, deadline_at,
  days_open (computed), resolved_at,
  endorsement_count, verified_endorsement_count,
  evidence_count, dispute_count,
  moderation_status, moderation_notes

Evidence
  id, case_id, type (photo|video|doc),
  storage_url, thumb_url, sha256,
  captured_at (server time), lat, lng,
  uploaded_by, exif_stripped (bool), faces_blurred (bool),
  classifier_scores (jsonb), moderation_status

Endorsement
  id, case_id, user_id, created_at,
  impact_tags[],                   -- opciones cerradas
  counts_as_formal_signature (bool),
  is_resident (bool)               -- dentro del polígono o no

Action
  id, case_id, type (submit|reiterate|prompt_dispatch|foi|
                     ombudsman|councilor|press|open_data),
  performed_by, performed_at, channel,
  document_url, receipt_ref, external_ref, payload (jsonb)

OfficialResponse
  id, case_id, organism_id, received_at,
  content, document_url, is_resolution (bool), registered_by

Resolution
  id, case_id, after_photo_id, claimed_by, claimed_at,
  confirmations[] (user_id, at), confirmed_at
```

### Catálogo

```
Category
  id, scope (global|national|local), country_id?, 
  name_i18n (jsonb), icon, order,
  guided_tree (jsonb),             -- el árbol de preguntas, sección 9
  template_key, status (active|candidate|retired)

CategoryProposal
  id, case_id, country_id, raw_label, structured_answers (jsonb),
  embedding (vector), cluster_id, created_at

ProposalCluster
  id, country_id, centroid_embedding (vector),
  label_suggested, case_count, neighborhood_count,
  first_seen, status (accumulating|candidate|approved|rejected),
  promoted_category_id?
```

### Usuarios

```
User
  id, display_name, email?, phone?,
  home_neighborhood_id, home_geohash (7 chars, precisión reducida),
  role (visitor|registered|resident|verified|leader|moderator|admin),
  verification_level, verification_evidence_url?,
  gps_presence_days (int), presence_log_summary (jsonb),
  notification_prefs (jsonb), locale, created_at,
  strikes (int), rate_limit_state (jsonb)
```

### Reglas de privacidad en el modelo, no en la política

- El domicilio se guarda como **geohash de 7 caracteres** (~150 m). Nunca dirección exacta.
- Los pines de casos sobre domicilios particulares se **desplazan aleatoriamente hasta 25 m**.
- **EXIF eliminado** en el servidor antes de almacenar.
- Exportación y borrado total a pedido del usuario. Los casos ya presentados formalmente se **anonimizan, no se eliminan**: forman parte de un expediente público.

---

## 20. Arquitectura técnica

### 20.1 Stack

```
CLIENTE
  Flutter 3.x (Dart)          Android + Windows desde una base
  Riverpod                    estado
  go_router                   navegación, deep links
  Drift (SQLite)              persistencia local, offline completo
  flutter_map + MapLibre      mapas, teselas OSM
  camera + image              captura, compresión, borrado EXIF
  dio                         HTTP con reintentos

BACKEND
  Supabase                    Postgres 15 + PostGIS + Auth + Storage + Realtime
  pgvector                    clustering de propuestas de categoría
  Edge Functions (Deno)       generación de PDF, envíos, webhooks
  
SERVICIOS
  Google Places API           validación de topónimos al crear barrio
  Nominatim / OSM             validación alternativa gratuita, fallback
  GeoNames                    siembra inicial de países/regiones/ciudades
  Postmark                    email transaccional con webhooks de acuse
  Firebase Cloud Messaging    push Android
  Sentry                      errores
  
MODERACIÓN
  Etapa 1: reglas             lista de términos, patrones, rate limits
  Etapa 2: clasificador       NSFW + violencia + detección de personas
  Etapa 3: cola humana        lo dudoso
```

**Por qué Flutter:** Android y Windows desde una sola base, rendimiento nativo real en ambos, una sola definición del sistema de diseño. React Native queda descartado: su soporte de Windows es de segunda. .NET MAUI es válido solo si ya hay equipo C#.

### 20.2 Requisito no negociable: offline-first

Se reporta en la calle, con mala señal, a veces en un sótano. **Todo el flujo de reporte debe funcionar sin conexión y sincronizar después.** Esto define la estructura del cliente entero, así que se decide ahora, no después.

```
UI ──► Repositorio ──► Drift (fuente de verdad local)
                          │
                          └──► SyncQueue ──► API
                                   │
                                   ├── reintentos con backoff exponencial
                                   ├── resolución de conflictos: last-write-wins
                                   │   excepto en contadores (server authoritative)
                                   └── estado visible por ítem en la UI
```

### 20.3 Estructura del proyecto

```
lib/
  core/
    theme/          tokens, tipografía, EstadoSello, componentes base
    i18n/           es, en, pt como mínimo
    errors/         tipos de error, mapeo a mensajes de usuario
    utils/          geohash, formateo de fechas, validadores
  data/
    models/         freezed + json_serializable
    local/          esquema Drift, DAOs, migraciones
    remote/         clientes API, Supabase
    repositories/   una por dominio, offline-first
    sync/           cola, reintentos, conflictos
  features/
    onboarding/
    geography/      buscador jerárquico, crear barrio, dibujar polígono
    report/         flujo guiado de reporte
    case/           detalle, timeline, acciones, escalamiento
    feed/           mi cuadra
    map/
    registry/       registro del barrio
    visitor/        modo solo lectura
    profile/        verificación, preferencias, exportar datos
    desk/           SOLO WINDOWS: panel, editor, presentaciones, datos
  services/
    location/       GPS, geofencing, presencia acumulada
    camera/
    moderation/     clasificación en cliente (primera pasada)
    documents/      previsualización del escrito generado
    notifications/
    sharing/        tarjeta de caso para WhatsApp
  jurisdictions/    JSON por ciudad (assets)
  categories/       JSON por categoría con su árbol guiado (assets)

platform/
  android/
  windows/          ventanas múltiples, menús, atajos, impresión
```

### 20.4 Diferencias Android / Windows

| | Android | Windows |
|---|---|---|
| **Rol** | Reportar en la calle | Mesa de trabajo del referente |
| **Layout** | Una columna, alcance de pulgar | Tres columnas, alta densidad |
| **Entrada** | Cámara, GPS, toque | Teclado, atajos, arrastrar archivos |
| **Navegación** | 4 pestañas + botón flotante | Barra lateral + pestañas |
| **Exclusivo** | Captura, geofencing | Panel, CSV, impresión de legajo, multiventana |
| **Ventana** | — | Mínimo 1024×640, estado persistente |

**Pantallas Android:** Mi cuadra · Mapa · Reportar · Caso · Mis casos · Registro del barrio · Perfil · Buscador geográfico · Crear barrio

**Pantallas Windows:** Panel (tabla densa filtrable) · Editor de caso · Presentaciones (cola, acuses, vencimientos) · Datos (estadísticas, mapa de calor, exportación) · Impresión de legajo

La sección **Datos** convierte la app en fuente para medios locales, que es la mejor distribución gratuita que existe.

---

## 21. API y servicios

### Endpoints principales

```
GEOGRAFÍA
  GET    /geo/search?q=&level=            búsqueda jerárquica con autocompletado
  GET    /geo/neighborhoods?bbox=         barrios en un área
  POST   /geo/neighborhoods               crear (dispara validación externa)
  POST   /geo/neighborhoods/:id/validate  revalidar
  GET    /geo/resolve?lat=&lng=           qué barrio/ciudad corresponde a un punto

CASOS
  GET    /cases?neighborhood=&status=&category=&cursor=
  POST   /cases                           crear (idempotente por client_uuid)
  GET    /cases/:id
  POST   /cases/:id/endorse
  POST   /cases/:id/evidence
  POST   /cases/:id/dispute
  POST   /cases/:id/resolve
  POST   /cases/:id/actions               presentar / escalar
  GET    /cases/nearby?lat=&lng=&r=       deduplicación

CATÁLOGO
  GET    /categories?country=             incluye árbol guiado
  POST   /categories/proposals

DOCUMENTOS
  POST   /documents/preview               genera el escrito sin enviar
  POST   /documents/submit                genera, envía y registra
  GET    /documents/:id.pdf

USUARIO
  POST   /auth/*
  POST   /users/me/verify
  GET    /users/me/export
  DELETE /users/me
```

### Jobs programados

| Job | Frecuencia | Qué hace |
|---|---|---|
| `check_deadlines` | cada hora | Marca *sin respuesta*, dispara notificación con acción siguiente |
| `archive_stale` | diario | Archiva casos sin adhesión a 7 días |
| `cluster_proposals` | diario | Agrupa propuestas de categoría, evalúa umbrales |
| `detect_duplicates` | diario | Barrios y casos duplicados → cola |
| `promote_neighborhoods` | diario | Propuesto → Activo → Consolidado según umbrales |
| `update_presence` | diario | Recalcula días de presencia GPS → rol Vecino |
| `refresh_stats` | diario | Estadísticas por barrio, ciudad y organismo |

---

## 22. Seguridad, privacidad y marco legal

- **Autenticación:** email/OTP o teléfono. Sin contraseñas. Sesiones con refresh token rotativo.
- **Autorización:** Row Level Security en Postgres, no solo en el cliente. Cada política escrita y testeada.
- **Verificación de domicilio:** los documentos subidos se procesan y **se borran a los 30 días**; solo queda el flag de verificado.
- **Anti-brigading:** una adhesión por usuario; las de fuera del polígono se cuentan y se muestran aparte.
- **Escudo legal:** los casos son **afirmaciones de hecho con evidencia fechada**, no acusaciones. Las plantillas están redactadas para eso. Revisión de abogado local sobre difamación y datos personales antes de lanzar en cada país.
- **Seguridad del usuario:** nunca mostrar el domicilio de quien reporta. Opción de figurar como *vecino de la cuadra* sin nombre visible, manteniendo la verificación interna.
- **Cumplimiento:** GDPR/LGPD/leyes locales de datos. Consentimiento explícito para ubicación. Exportación y borrado siempre disponibles.

---

## 23. Métricas

**Métrica del norte: casos resueltos por mes.**

| Métrica | Qué mide |
|---|---|
| Tasa de resolución | resueltos / presentados |
| Días medios hasta la respuesta, por organismo | el dato que interesa a la prensa |
| Adhesiones por caso | fuerza de la red |
| Presentaciones / reportes | si la app convierte bronca en acto |
| Regreso tras resolución | si la victoria retiene |
| Barrios que pasan a Activo por semana | crecimiento del mapa |
| Ciudades a punto sin jurisdicción | deuda operativa |
| Coeficiente viral vía WhatsApp | crecimiento real |

**Métricas prohibidas como objetivo:** tiempo en pantalla, sesiones por día, profundidad de scroll. Se miden para diagnóstico, **jamás para optimizar**. Si el equipo empieza a subir esas, el producto ya se convirtió en lo que quería evitar.

---

## 24. Roadmap, riesgos y nombres

### Roadmap

**Fase 1 — Núcleo (8 semanas)**
Auth · geografía con siembra GeoNames · buscador jerárquico · crear barrio con validación · reportar guiado offline · mapa · feed · adherir · detalle de caso · 5 categorías del núcleo. Una ciudad.

**Fase 2 — La presentación (6 semanas)**
Generador de PDF · plantillas por jurisdicción · envío con acuse · contador de días · escalera de escalamiento completa · cierre verificado con antes/después. **Acá el producto existe de verdad.**

**Fase 3 — Escritorio y moderación (5 semanas)**
Build de Windows · panel · editor · presentaciones · datos y CSV · impresión de legajo · panel de moderación · colas.

**Fase 4 — Escala mundial (continuo)**
12 categorías completas · motor de promoción de categorías · fusión automática de barrios · Open311 · modo visitante · i18n · segunda y tercera ciudad · panel público de datos abiertos.

### Riesgos

| Riesgo | Respuesta |
|---|---|
| Ciudad fantasma | Lanzar en **un solo barrio**, con 3–5 referentes reclutados a mano antes del día 1 |
| El municipio ignora todo | El silencio es producto: el contador y los datos públicos son la palanca |
| Se convierte en pelea vecinal | Sin comentarios, sin reportes sobre personas, interacciones cerradas |
| Estigmatización de barrios | Sección 15.2, implementada en el producto y no solo en la política |
| Captura política en año electoral | Prohibición de contenido partidario, moderación activa, transparencia de financiamiento |
| Un solo usuario hace el 90% y se quema | Rotación visible de créditos, reconocimiento también a adherentes |
| Barrios falsos o polígonos absurdos | Validación externa + umbral de usuarios + límite de área + cola de fusión |
| Costo de Google Places | Nominatim/OSM como fuente primaria, Places solo como fallback y con caché agresiva |

### Nombres

| Nombre | Nota |
|---|---|
| **Cuadra** | Corto, universal en LatAm, físico |
| **Constancia** | ⭐ Doble sentido perfecto: el documento y la persistencia. El sello es literalmente el logo. |
| **Vereda** | Cálido, cotidiano |
| **Aviso** | Directo, cívico |
| **Pronto Despacho** | Término jurídico real, ideal para público que ya milita |

---
---

# PARTE IV — EJECUCIÓN

## 25. Prompt profesional para Claude Code

> Copiar desde acá, junto con este documento completo en el repositorio.

---

### CONTEXTO

Vas a construir **Cuadra**, una plataforma de acción vecinal para **Android y Windows** con alcance mundial. La especificación completa está en `docs/cuadra-documento-maestro-v2.md`. **Leela entera antes de escribir una línea de código.** Este prompt no la reemplaza: la ejecuta.

En una frase: la app permite a un vecino reportar un problema de infraestructura de su barrio mediante selecciones guiadas (nunca texto libre), genera automáticamente un escrito administrativo formal, lo presenta ante el organismo público que corresponde según la jurisdicción, y hace público el contador de días sin respuesta hasta que el caso se resuelve o escala.

### STACK OBLIGATORIO

- **Cliente:** Flutter 3.x, Dart 3.x, targets Android y Windows compilando desde el primer commit
- **Estado:** Riverpod (code generation)
- **Navegación:** go_router, con deep links para compartir casos
- **Local:** Drift sobre SQLite — fuente de verdad local, la app funciona 100% offline
- **Modelos:** freezed + json_serializable
- **Mapas:** flutter_map con MapLibre y teselas OpenStreetMap
- **Backend:** Supabase (Postgres 15 + PostGIS + pgvector + Auth + Storage + Realtime + Edge Functions)
- **HTTP:** dio con interceptores de reintento
- **Tests:** flutter_test, mocktail, integration_test

### PRINCIPIOS DE PRODUCTO — NO NEGOCIABLES

Estos condicionan decisiones técnicas. Si una implementación los viola, está mal aunque funcione:

1. **Offline-first real.** Todo el flujo de reporte funciona sin conexión y sincroniza después. Drift es la fuente de verdad; la red es un detalle de sincronización. Esto define la arquitectura entera, no es un agregado posterior.
2. **El usuario no escribe: selecciona.** El reporte se compone con árboles de opciones definidos en JSON. Existe un único campo libre, opcional, de 200 caracteres, filtrado. Si el filtro lo rechaza, el caso se publica igual sin ese campo.
3. **Sin comentarios, sin chat, sin mensajería, sin hilos.** Las únicas interacciones son: adherir, confirmar impacto, aportar evidencia, disputar, marcar resuelto. Todas con opciones cerradas.
4. **Sin feed infinito.** La lista de la cuadra termina y muestra: *“Eso es todo lo que hay abierto cerca tuyo.”*
5. **Sin gamificación.** Nada de puntos, rachas, niveles, insignias ni ranking de usuarios.
6. **Sin recomendación algorítmica.** El orden es geográfico y temporal, y debe poder explicarse en una frase.
7. **Nunca un puntaje de barrio.** Ni estrellas, ni semáforo, ni comparación entre barrios. En ningún lado.
8. **Cada pantalla ofrece una acción concreta o muestra constancia de inacción ajena.** Si no hace ninguna de las dos, no va.
9. **Nada de reportes sobre personas.** Solo infraestructura y servicios públicos. Implementado en el clasificador, no solo en los términos de uso.
10. **La cola de aprobación nunca bloquea un caso.** Barrios propuestos y categorías propuestas no impiden reportar ni presentar.

### FASE 1 — ORDEN DE CONSTRUCCIÓN

Construí en este orden exacto. No avances al siguiente punto sin que el anterior compile en ambas plataformas y tenga tests.

**1. Andamiaje**
Estructura de carpetas de la sección 20.3. Targets Android y Windows compilando. CI que corre `flutter analyze` y `flutter test`. Sin warnings.

**2. Sistema de diseño**
`core/theme` con los tokens exactos de la sección 5 (colores, tipografía, escala). Implementá el widget `EstadoSello`: rectángulo rotado 1.5–3°, borde 2 px, textura de tinta desgastada, tipografía monoespaciada, con variantes `presentado`, `sinRespuesta`, `resuelto`. Regla estricta: el color `vial` (#F2B705) se usa **exclusivamente** donde hay algo abierto que espera acción. Escribí un widget test que lo verifique.

**3. Datos**
Esquema Drift completo según la sección 19, con migraciones versionadas. Modelos freezed. Repositorios offline-first por dominio. `SyncQueue` con backoff exponencial, idempotencia por `client_uuid`, resolución last-write-wins salvo en contadores (autoridad del servidor). Estado de sincronización visible por ítem en la UI.

**4. Backend**
Migraciones SQL con PostGIS habilitado. Row Level Security en cada tabla, con políticas escritas y testeadas. Índices GIST sobre las columnas geográficas. Siembra de países, regiones y ciudades desde GeoNames.

**5. Motor geográfico**
- Buscador jerárquico con autocompletado (país → región → ciudad → barrio)
- Alta de barrio con validación externa: primero Nominatim/OSM, Google Places solo como fallback, con caché agresiva
- Dibujo y edición de polígono sobre el mapa: mínimo 4 vértices, máximo 25 km², rechazo si solapa más del 40% con un barrio activo
- Máquina de estados: propuesto → activo → consolidado, con los umbrales de la sección 6.3
- `GET /geo/resolve` para determinar barrio y ciudad desde un punto

**6. Flujo de reporte guiado**
- Cámara nativa obligatoria, sin acceso a galería para la evidencia principal
- Borrado de EXIF y compresión en cliente (máx. 1600 px, calidad 82)
- Hash SHA-256 en captura
- Ubicación automática con pin arrastrable
- Selección de categoría y subtipo desde los JSON de `categories/`
- Motor de árbol guiado que renderiza preguntas desde el JSON — genérico, nunca hardcodeado por categoría
- Deduplicación por proximidad: 80 m + misma categoría + 30 días, primero contra la base local
- Previsualización del escrito generado antes de publicar
- Funciona completo sin conexión

**7. Mi cuadra y mapa**
Feed ordenado por cercanía × urgencia, con cierre explícito de lista. Mapa con clusters, pines por categoría, color por estado, filtros. Desplazamiento aleatorio de hasta 25 m en pines sobre domicilios particulares.

**8. Adhesión**
Patrón commit-then-register: se registra la intención sin cuenta previa, se pide identidad después, expira a las 24 h sin confirmar. Confirmación de impacto con opciones cerradas. Diferenciar adhesión de residente verificado (firma formal) de las demás.

**9. Detalle de caso**
Foto, sello de estado, contador de días en tipografía display, línea de tiempo de acciones, adherentes, y **siempre** un botón de acción siguiente. La animación de estampado del sello al resolverse (150 ms, rebote mínimo) es la única animación con peso del producto. Respetá `prefers-reduced-motion`.

### DEFINICIÓN DE TERMINADO

Para cada punto:
- Compila en Android y Windows sin warnings
- `flutter analyze` limpio
- Tests unitarios de la lógica de dominio
- Widget tests de los componentes del sistema de diseño
- Funciona con el avión encendido, si aplica
- Textos en `core/i18n`, ninguna cadena hardcodeada en la UI
- Accesible: foco de teclado visible, contraste AA, objetivos táctiles ≥48 dp

### CONVENCIONES

- Dart estricto, `analysis_options.yaml` con `flutter_lints` + reglas adicionales
- Sin lógica de negocio en widgets: todo en repositorios y notifiers
- Sin llamadas de red directas desde la UI, jamás
- Errores tipados con `Result<T, E>`, nunca excepciones sin capturar en la capa de UI
- Textos de interfaz en español rioplatense neutro, voz activa, oración capitalizada. Los botones dicen exactamente qué pasa: “Publicar en mi cuadra”, no “Enviar”
- Los mensajes de error explican qué pasó y cómo se arregla. No se disculpan y no son vagos
- Commits atómicos con mensajes descriptivos

### CÓMO EMPEZAR

No escribas código todavía. Primero devolveme:

1. La estructura de carpetas completa que vas a crear
2. El archivo de tokens del tema (`core/theme/tokens.dart`)
3. El esquema Drift propuesto para las tablas de geografía y casos
4. El formato JSON del árbol guiado de una categoría, usando **Alumbrado** como ejemplo completo
5. Cualquier decisión donde veas ambigüedad en la especificación, con tu recomendación

Esperá mi aprobación antes de seguir con el punto 4 en adelante.

---

*Fin del documento maestro · v2.0*
