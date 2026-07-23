-- Casos y su ciclo de vida (§12, §19).

create table public.cases (
  id uuid primary key default uuid_generate_v4(),
  public_ref text unique,               -- #4417, la asigna el trigger
  neighborhood_id uuid not null references public.neighborhoods (id),
  city_id text references public.cities (id),
  jurisdiction_id text references public.jurisdictions (id),
  category_id text not null references public.categories (id),
  subtype_id text not null,
  guided_answers jsonb not null default '{}',
  free_text text check (char_length(free_text) <= 200),
  generated_body text not null default '',
  status text not null default 'abierto'
    check (status in ('borrador', 'abierto', 'presentado', 'respondido',
                      'sinRespuesta', 'enEjecucion', 'resuelto', 'archivado',
                      'enRevision', 'disputado', 'fusionado', 'rechazado')),
  severity_computed integer not null default 0,
  location geography (point, 4326) not null,
  geohash text not null,
  address_text text,
  pin_offset_applied boolean not null default false,
  created_by uuid references auth.users (id),
  created_at timestamptz not null default now(),
  occurred_since text,
  organism_id text,
  submitted_at timestamptz,
  deadline_at timestamptz,
  resolved_at timestamptz,
  endorsement_count integer not null default 0,
  verified_endorsement_count integer not null default 0,
  evidence_count integer not null default 0,
  dispute_count integer not null default 0,
  moderation_status text not null default 'ok',
  moderation_notes text,
  client_uuid uuid unique,
  updated_at timestamptz not null default now()
);

create index idx_cases_location on public.cases using gist (location);
create index idx_cases_neighborhood on public.cases (neighborhood_id, status);
create index idx_cases_geohash on public.cases (geohash);
create index idx_cases_deadline on public.cases (deadline_at)
  where status = 'presentado';

alter table public.category_proposals
  add constraint proposals_case_fk
  foreign key (case_id) references public.cases (id);

-- Referencia corta compartible: #<n> secuencial global.
create sequence public.case_ref_seq;
create or replace function public.asignar_public_ref()
returns trigger language plpgsql as $$
begin
  if new.public_ref is null then
    new.public_ref := '#' || nextval('public.case_ref_seq');
  end if;
  return new;
end $$;
create trigger trg_case_ref before insert on public.cases
  for each row execute function public.asignar_public_ref();

create table public.evidences (
  id uuid primary key default uuid_generate_v4(),
  case_id uuid not null references public.cases (id) on delete cascade,
  type text not null default 'foto' check (type in ('foto', 'video', 'documento')),
  storage_url text,
  thumb_url text,
  sha256 text not null,                 -- integridad (§10.2)
  captured_at timestamptz not null default now(),  -- timestamp del SERVIDOR
  lat double precision,
  lng double precision,
  uploaded_by uuid references auth.users (id),
  exif_stripped boolean not null default false,
  faces_blurred boolean not null default false,
  classifier_scores jsonb,
  moderation_status text not null default 'pendiente',
  client_uuid uuid unique,
  updated_at timestamptz not null default now()
);
create index idx_evidences_case on public.evidences (case_id);

create table public.endorsements (
  id uuid primary key default uuid_generate_v4(),
  case_id uuid not null references public.cases (id) on delete cascade,
  user_id uuid not null references auth.users (id),
  created_at timestamptz not null default now(),
  impact_tags text[] not null default '{}',
  counts_as_formal_signature boolean not null default false,
  is_resident boolean not null default false,
  client_uuid uuid unique,
  updated_at timestamptz not null default now(),
  -- Anti-brigading (§22): una adhesión por usuario por caso.
  constraint una_adhesion_por_usuario unique (case_id, user_id)
);
create index idx_endorsements_case on public.endorsements (case_id);

create table public.case_actions (
  id uuid primary key default uuid_generate_v4(),
  case_id uuid not null references public.cases (id) on delete cascade,
  type text not null
    check (type in ('presentar', 'reiterar', 'prontoDespacho', 'accesoInformacion',
                    'defensoria', 'concejal', 'prensa', 'datoAbierto')),
  performed_by uuid references auth.users (id),
  performed_at timestamptz not null default now(),
  channel text,
  document_url text,
  receipt_ref text,
  external_ref text,
  payload jsonb,
  client_uuid uuid unique,
  updated_at timestamptz not null default now()
);
create index idx_case_actions_case on public.case_actions (case_id);

create table public.official_responses (
  id uuid primary key default uuid_generate_v4(),
  case_id uuid not null references public.cases (id) on delete cascade,
  organism_id text not null,
  received_at timestamptz not null default now(),
  content text not null,
  document_url text,
  is_resolution boolean not null default false,
  registered_by uuid references auth.users (id)
);

create table public.resolutions (
  id uuid primary key default uuid_generate_v4(),
  case_id uuid not null references public.cases (id) on delete cascade,
  after_photo_id uuid references public.evidences (id),
  claimed_by uuid not null references auth.users (id),
  claimed_at timestamptz not null default now(),
  confirmations jsonb not null default '[]',
  confirmed_at timestamptz,
  client_uuid uuid unique,
  updated_at timestamptz not null default now()
);

-- ── Contadores: autoridad del servidor (§20.2) ─────────────────────────

create or replace function public.actualizar_contadores_adhesion()
returns trigger language plpgsql as $$
begin
  if tg_op = 'INSERT' then
    update public.cases set
      endorsement_count = endorsement_count + 1,
      verified_endorsement_count = verified_endorsement_count
        + case when new.counts_as_formal_signature then 1 else 0 end,
      updated_at = now()
    where id = new.case_id;
  elsif tg_op = 'DELETE' then
    update public.cases set
      endorsement_count = greatest(endorsement_count - 1, 0),
      verified_endorsement_count = greatest(verified_endorsement_count
        - case when old.counts_as_formal_signature then 1 else 0 end, 0),
      updated_at = now()
    where id = old.case_id;
  end if;
  return null;
end $$;
create trigger trg_contadores_adhesion
  after insert or delete on public.endorsements
  for each row execute function public.actualizar_contadores_adhesion();

create or replace function public.actualizar_contador_evidencia()
returns trigger language plpgsql as $$
begin
  update public.cases
    set evidence_count = evidence_count + 1, updated_at = now()
    where id = new.case_id;
  return null;
end $$;
create trigger trg_contador_evidencia
  after insert on public.evidences
  for each row execute function public.actualizar_contador_evidencia();

create or replace function public.actualizar_contador_casos_barrio()
returns trigger language plpgsql as $$
begin
  update public.neighborhoods
    set case_count = case_count + 1, updated_at = now()
    where id = new.neighborhood_id;
  return null;
end $$;
create trigger trg_contador_casos_barrio
  after insert on public.cases
  for each row execute function public.actualizar_contador_casos_barrio();

-- ── RLS ────────────────────────────────────────────────────────────────
-- Lectura pública de lo publicado (modo visitante §15). El borrador y lo
-- retenido por moderación solo lo ve su autor.

alter table public.cases enable row level security;
alter table public.evidences enable row level security;
alter table public.endorsements enable row level security;
alter table public.case_actions enable row level security;
alter table public.official_responses enable row level security;
alter table public.resolutions enable row level security;

create policy cases_lectura on public.cases
  for select using (
    (status not in ('borrador', 'enRevision', 'rechazado') and moderation_status = 'ok')
    or created_by = auth.uid()
  );

create policy cases_alta on public.cases
  for insert to authenticated
  with check (created_by = auth.uid());

create policy cases_edicion_autor on public.cases
  for update to authenticated
  using (created_by = auth.uid())
  with check (created_by = auth.uid());

create policy evidences_lectura on public.evidences
  for select using (
    moderation_status in ('ok', 'aprobada') or uploaded_by = auth.uid()
  );
create policy evidences_alta on public.evidences
  for insert to authenticated with check (uploaded_by = auth.uid());

create policy endorsements_lectura on public.endorsements
  for select using (true);
create policy endorsements_alta on public.endorsements
  for insert to authenticated with check (user_id = auth.uid());
create policy endorsements_baja on public.endorsements
  for delete to authenticated using (user_id = auth.uid());

create policy case_actions_lectura on public.case_actions
  for select using (true);
create policy case_actions_alta on public.case_actions
  for insert to authenticated with check (performed_by = auth.uid());

create policy official_responses_lectura on public.official_responses
  for select using (true);

create policy resolutions_lectura on public.resolutions
  for select using (true);
create policy resolutions_alta on public.resolutions
  for insert to authenticated with check (claimed_by = auth.uid());

-- ── Deduplicación (§10.3): casos cercanos ──────────────────────────────
create or replace function public.casos_cercanos(
  lat double precision,
  lng double precision,
  radio_m double precision default 80,
  categoria text default null
)
returns setof public.cases
language sql stable
as $$
  select c.*
  from public.cases c
  where st_dwithin(
          c.location,
          st_setsrid(st_makepoint(lng, lat), 4326)::geography,
          radio_m)
    and (categoria is null or c.category_id = categoria)
    and c.status not in ('archivado', 'rechazado', 'fusionado')
    and c.created_at > now() - interval '30 days'
$$;
