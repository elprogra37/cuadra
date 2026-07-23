-- Catálogo estandarizado de asuntos (§8, §19).

create table public.categories (
  id text primary key,
  scope text not null default 'global'
    check (scope in ('global', 'national', 'local')),
  country_id char(2) references public.countries (id),
  name_i18n jsonb not null,
  icon text not null,
  order_index integer not null default 0,
  guided_tree jsonb not null,           -- CategoriaDef completa (§9)
  template_key text not null,
  status text not null default 'active'
    check (status in ('active', 'candidate', 'retired'))
);

-- Propuestas de categoría vía "Otro" (§8.4). El caso se publica igual;
-- esto solo alimenta el clustering.
create table public.category_proposals (
  id uuid primary key default uuid_generate_v4(),
  case_id uuid not null,                -- FK se agrega en 40-casos.sql
  country_id char(2) not null references public.countries (id),
  raw_label text not null check (char_length(raw_label) <= 40),
  structured_answers jsonb not null,
  embedding vector (384),               -- lo calcula un job del servidor
  cluster_id uuid,
  created_at timestamptz not null default now(),
  client_uuid uuid unique
);

create table public.proposal_clusters (
  id uuid primary key default uuid_generate_v4(),
  country_id char(2) not null references public.countries (id),
  centroid_embedding vector (384),
  label_suggested text,
  case_count integer not null default 0,
  neighborhood_count integer not null default 0,
  first_seen timestamptz not null default now(),
  status text not null default 'accumulating'
    check (status in ('accumulating', 'candidate', 'approved', 'rejected')),
  promoted_category_id text references public.categories (id)
);

alter table public.category_proposals
  add constraint proposals_cluster_fk
  foreign key (cluster_id) references public.proposal_clusters (id);

-- ── RLS ────────────────────────────────────────────────────────────────

alter table public.categories enable row level security;
alter table public.category_proposals enable row level security;
alter table public.proposal_clusters enable row level security;

create policy categories_lectura on public.categories
  for select using (status = 'active');

create policy proposals_alta on public.category_proposals
  for insert to authenticated with check (true);

-- El umbral "ya hay 14 vecinos reportando algo parecido" (§8.4) se lee
-- agregado, no fila por fila: los clusters son públicos, las propuestas no.
create policy clusters_lectura on public.proposal_clusters
  for select using (true);
