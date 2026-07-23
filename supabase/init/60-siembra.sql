-- Siembra inicial (§25 etapa 4).
--
-- Países: Latinoamérica completa + los mercados iniciales probables. La
-- siembra mundial completa (GeoNames dump) es un job operativo posterior:
-- ver PENDIENTES.md. Regiones/ciudades: Argentina como país de arranque
-- (§24: lanzar en un solo barrio).

insert into public.countries (id, name, default_language, default_timezone) values
  ('AR', 'Argentina', 'es', 'America/Argentina/Buenos_Aires'),
  ('BO', 'Bolivia', 'es', 'America/La_Paz'),
  ('BR', 'Brasil', 'pt', 'America/Sao_Paulo'),
  ('CL', 'Chile', 'es', 'America/Santiago'),
  ('CO', 'Colombia', 'es', 'America/Bogota'),
  ('CR', 'Costa Rica', 'es', 'America/Costa_Rica'),
  ('CU', 'Cuba', 'es', 'America/Havana'),
  ('DO', 'República Dominicana', 'es', 'America/Santo_Domingo'),
  ('EC', 'Ecuador', 'es', 'America/Guayaquil'),
  ('SV', 'El Salvador', 'es', 'America/El_Salvador'),
  ('GT', 'Guatemala', 'es', 'America/Guatemala'),
  ('HN', 'Honduras', 'es', 'America/Tegucigalpa'),
  ('MX', 'México', 'es', 'America/Mexico_City'),
  ('NI', 'Nicaragua', 'es', 'America/Managua'),
  ('PA', 'Panamá', 'es', 'America/Panama'),
  ('PY', 'Paraguay', 'es', 'America/Asuncion'),
  ('PE', 'Perú', 'es', 'America/Lima'),
  ('PR', 'Puerto Rico', 'es', 'America/Puerto_Rico'),
  ('UY', 'Uruguay', 'es', 'America/Montevideo'),
  ('VE', 'Venezuela', 'es', 'America/Caracas'),
  ('ES', 'España', 'es', 'Europe/Madrid'),
  ('US', 'Estados Unidos', 'en', 'America/New_York'),
  ('PT', 'Portugal', 'pt', 'Europe/Lisbon');

-- Provincias argentinas (GeoNames admin1).
insert into public.regions (id, country_id, name, geonames_id) values
  ('AR-C', 'AR', 'Ciudad Autónoma de Buenos Aires', 3433955),
  ('AR-B', 'AR', 'Buenos Aires', 3435907),
  ('AR-K', 'AR', 'Catamarca', 3862286),
  ('AR-H', 'AR', 'Chaco', 3861887),
  ('AR-U', 'AR', 'Chubut', 3861244),
  ('AR-X', 'AR', 'Córdoba', 3860255),
  ('AR-W', 'AR', 'Corrientes', 3435214),
  ('AR-E', 'AR', 'Entre Ríos', 3434137),
  ('AR-P', 'AR', 'Formosa', 3433896),
  ('AR-Y', 'AR', 'Jujuy', 3853403),
  ('AR-L', 'AR', 'La Pampa', 3849574),
  ('AR-F', 'AR', 'La Rioja', 3848949),
  ('AR-M', 'AR', 'Mendoza', 3844419),
  ('AR-N', 'AR', 'Misiones', 3430657),
  ('AR-Q', 'AR', 'Neuquén', 3843122),
  ('AR-R', 'AR', 'Río Negro', 3838828),
  ('AR-A', 'AR', 'Salta', 3838231),
  ('AR-J', 'AR', 'San Juan', 3837152),
  ('AR-D', 'AR', 'San Luis', 3837029),
  ('AR-Z', 'AR', 'Santa Cruz', 3836350),
  ('AR-S', 'AR', 'Santa Fe', 3836276),
  ('AR-G', 'AR', 'Santiago del Estero', 3835859),
  ('AR-V', 'AR', 'Tierra del Fuego', 3834546),
  ('AR-T', 'AR', 'Tucumán', 3833576);

-- Ciudades de arranque.
insert into public.cities (id, region_id, name, geonames_id, population) values
  ('AR-C-CABA', 'AR-C', 'Ciudad Autónoma de Buenos Aires', 3435910, 3075646),
  ('AR-X-CBA', 'AR-X', 'Córdoba', 3860259, 1330023),
  ('AR-S-ROS', 'AR-S', 'Rosario', 3838583, 1173533),
  ('AR-B-LP', 'AR-B', 'La Plata', 3432043, 694253),
  ('AR-M-MDZ', 'AR-M', 'Mendoza', 3844421, 115041);

-- Categorías del núcleo (§8.3). El árbol guiado completo vive en los assets
-- del cliente (assets/categories/*.json) y acá como jsonb para el panel y
-- las extensiones futuras; la clave es que cases.category_id tenga FK.
insert into public.categories (id, scope, name_i18n, icon, order_index, guided_tree, template_key) values
  ('alumbrado', 'global',
   '{"es": "Alumbrado público", "en": "Street lighting", "pt": "Iluminação pública"}',
   '💡', 1, '{"ref": "assets/categories/alumbrado.json"}', 'reclamo_infraestructura'),
  ('calzada', 'global',
   '{"es": "Calzada y veredas", "en": "Road and sidewalks", "pt": "Rua e calçadas"}',
   '🛣️', 2, '{"ref": "assets/categories/calzada.json"}', 'reclamo_infraestructura'),
  ('residuos', 'global',
   '{"es": "Residuos", "en": "Waste", "pt": "Resíduos"}',
   '🗑️', 3, '{"ref": "assets/categories/residuos.json"}', 'reclamo_servicio'),
  ('agua', 'global',
   '{"es": "Agua y cloacas", "en": "Water and sewage", "pt": "Água e esgoto"}',
   '💧', 4, '{"ref": "assets/categories/agua.json"}', 'reclamo_servicio'),
  ('arbolado', 'global',
   '{"es": "Arbolado", "en": "Trees", "pt": "Arborização"}',
   '🌳', 5, '{"ref": "assets/categories/arbolado.json"}', 'reclamo_infraestructura'),
  ('otro', 'global',
   '{"es": "Otro", "en": "Other", "pt": "Outro"}',
   '➕', 99, '{"ref": "motor de propuestas §8.4"}', 'reclamo_generico');

-- Jurisdicción de ejemplo (§14.3) para desarrollo: CABA con un organismo
-- ficticio. La ficha real la carga el panel antes de lanzar.
insert into public.jurisdictions (id, country_id, name, timezone, language, default_response_days, config) values
  ('AR-C-CABA', 'AR', 'Ciudad Autónoma de Buenos Aires',
   'America/Argentina/Buenos_Aires', 'es-AR', 30,
   '{
      "jurisdiction_id": "AR-C-CABA",
      "organisms": [
        {
          "id": "demo-mantenimiento",
          "name": "Organismo demo de mantenimiento urbano (DESARROLLO)",
          "categories": ["alumbrado", "calzada", "arbolado"],
          "channels": {"email": "demo@example.invalid", "form_url": null, "open311": null},
          "response_days": 30,
          "normativa": ["Ley 104 de Acceso a la Información Pública"],
          "escalation": ["defensoria_pueblo"]
        }
      ],
      "templates": {
        "reclamo": "pendiente de redacción legal",
        "reiteracion": "pendiente",
        "pronto_despacho": "pendiente",
        "acceso_informacion": "pendiente",
        "defensoria": "pendiente"
      }
    }');

update public.cities set jurisdiction_id = 'AR-C-CABA' where id = 'AR-C-CABA';
