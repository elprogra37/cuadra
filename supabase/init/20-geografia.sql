-- Geografía colaborativa (§6, §19).
-- Los tres primeros niveles se siembran desde datos abiertos; el nivel de
-- barrio lo crea la comunidad.

create table public.countries (
  id char(2) primary key,               -- ISO 3166-1 alpha-2
  name text not null,
  default_language text not null default 'es',
  default_timezone text not null default 'UTC'
);

create table public.regions (
  id text primary key,
  country_id char(2) not null references public.countries (id),
  name text not null,
  geonames_id integer
);

create table public.cities (
  id text primary key,
  region_id text not null references public.regions (id),
  name text not null,
  geonames_id integer,
  jurisdiction_id text,                 -- null = modo solo comunidad (§6.5)
  osm_relation_id bigint,
  population integer
);

create table public.jurisdictions (
  id text primary key,
  country_id char(2) not null references public.countries (id),
  name text not null,
  timezone text not null,
  language text not null default 'es',
  default_response_days integer not null default 30,
  config jsonb not null                 -- ficha completa (§14.3)
);

alter table public.cities
  add constraint cities_jurisdiction_fk
  foreign key (jurisdiction_id) references public.jurisdictions (id);

create table public.neighborhoods (
  id uuid primary key default uuid_generate_v4(),
  city_id text not null references public.cities (id),
  name text not null,
  name_normalized text not null,
  aliases text[] not null default '{}',
  polygon geography (polygon, 4326) not null,
  centroid geography (point, 4326) not null,
  area_km2 double precision not null,
  status text not null default 'propuesto'
    check (status in ('propuesto', 'activo', 'consolidado', 'fusionado', 'rechazado')),
  created_by uuid references auth.users (id),
  created_at timestamptz not null default now(),
  validation_source text
    check (validation_source in ('google_places', 'osm', 'manual')),
  validation_payload jsonb,
  verified_user_count integer not null default 0,
  case_count integer not null default 0,
  merged_into uuid references public.neighborhoods (id),
  client_uuid uuid unique,              -- idempotencia de la SyncQueue
  updated_at timestamptz not null default now(),
  -- Límites del alta (§6.2), también en el servidor.
  constraint area_maxima check (area_km2 <= 25)
);

-- Índices GIST sobre las columnas geográficas (§25 etapa 4).
create index idx_neighborhoods_polygon on public.neighborhoods using gist (polygon);
create index idx_neighborhoods_centroid on public.neighborhoods using gist (centroid);
create index idx_neighborhoods_name_trgm
  on public.neighborhoods using gin (name_normalized gin_trgm_ops);
create index idx_neighborhoods_city on public.neighborhoods (city_id, status);

-- ── RLS ────────────────────────────────────────────────────────────────
-- Lectura pública (modo visitante §15); escritura solo autenticada y del
-- propio registro. La moderación pasa por service_role (panel).

alter table public.countries enable row level security;
alter table public.regions enable row level security;
alter table public.cities enable row level security;
alter table public.jurisdictions enable row level security;
alter table public.neighborhoods enable row level security;

create policy countries_lectura on public.countries
  for select using (true);
create policy regions_lectura on public.regions
  for select using (true);
create policy cities_lectura on public.cities
  for select using (true);
create policy jurisdictions_lectura on public.jurisdictions
  for select using (true);

-- Barrios rechazados: ocultos al público (§6.3); su creador los sigue viendo.
create policy neighborhoods_lectura on public.neighborhoods
  for select using (status <> 'rechazado' or created_by = auth.uid());

create policy neighborhoods_alta on public.neighborhoods
  for insert to authenticated
  with check (created_by = auth.uid() and status = 'propuesto');

-- Solo el creador edita su barrio propuesto; los cambios de estado
-- (activo/consolidado/fusionado) los hace el sistema con service_role.
create policy neighborhoods_edicion on public.neighborhoods
  for update to authenticated
  using (created_by = auth.uid() and status = 'propuesto')
  with check (created_by = auth.uid() and status = 'propuesto');

-- ── Funciones ──────────────────────────────────────────────────────────

-- /geo/resolve: ¿qué barrio contiene este punto? (§21)
create or replace function public.geo_resolve(lat double precision, lng double precision)
returns setof public.neighborhoods
language sql stable
as $$
  select n.*
  from public.neighborhoods n
  where n.status in ('propuesto', 'activo', 'consolidado')
    and st_covers(n.polygon, st_setsrid(st_makepoint(lng, lat), 4326)::geography)
  order by n.verified_user_count desc
$$;

-- Solapamiento entre un polígono candidato y los barrios activos (§6.2:
-- rechazo si solapa >40% con un activo).
create or replace function public.solapamiento_maximo(candidato geography)
returns double precision
language sql stable
as $$
  select coalesce(max(
    st_area(st_intersection(n.polygon, candidato)) / nullif(st_area(candidato), 0)
  ), 0)
  from public.neighborhoods n
  where n.status in ('activo', 'consolidado')
    and st_intersects(n.polygon, candidato)
$$;
