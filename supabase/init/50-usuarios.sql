-- Perfiles de usuario (§7, §19). La identidad vive en auth.users; el perfil
-- guarda rol, verificación y SOLO un geohash de 7 caracteres del domicilio
-- (~150 m): nunca la dirección exacta (§19, privacidad en el modelo).

create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  display_name text not null default 'vecino',
  home_neighborhood_id uuid references public.neighborhoods (id),
  home_geohash char(7),
  role text not null default 'registrado'
    check (role in ('registrado', 'vecino', 'verificado', 'referente',
                    'moderador', 'admin')),
  verification_level integer not null default 0,
  gps_presence_days integer not null default 0,
  notification_prefs jsonb not null default '{}',
  locale text not null default 'es',
  strikes integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Perfil automático al registrarse.
create or replace function public.crear_perfil()
returns trigger language plpgsql security definer as $$
begin
  insert into public.profiles (id) values (new.id)
  on conflict (id) do nothing;
  return new;
end $$;
create trigger trg_crear_perfil
  after insert on auth.users
  for each row execute function public.crear_perfil();

-- Contador de verificados del barrio (para propuesto→activo→consolidado §6.3).
create or replace function public.actualizar_verificados_barrio()
returns trigger language plpgsql as $$
begin
  if new.home_neighborhood_id is distinct from old.home_neighborhood_id
     or new.role is distinct from old.role then
    update public.neighborhoods n set verified_user_count = (
      select count(*) from public.profiles p
      where p.home_neighborhood_id = n.id
        and p.role in ('verificado', 'referente')
    ), updated_at = now()
    where n.id in (new.home_neighborhood_id, old.home_neighborhood_id);
  end if;
  return null;
end $$;
create trigger trg_verificados_barrio
  after update on public.profiles
  for each row execute function public.actualizar_verificados_barrio();

-- ── RLS ────────────────────────────────────────────────────────────────

alter table public.profiles enable row level security;

-- El display_name de los adherentes es público; el geohash del domicilio NO:
-- se filtra por columna en la API (la app solo selecciona campos públicos)
-- y la fila completa solo la ve su dueño.
create policy profiles_lectura_propia on public.profiles
  for select using (id = auth.uid());

-- Vista pública sin datos sensibles, para listar adherentes.
create view public.perfiles_publicos
  with (security_invoker = off) as
  select id, display_name, role, created_at
  from public.profiles;
grant select on public.perfiles_publicos to anon, authenticated;

create policy profiles_edicion_propia on public.profiles
  for update to authenticated
  using (id = auth.uid())
  with check (
    id = auth.uid()
    -- El rol y la verificación los cambia solo el sistema (service_role).
    and role = (select role from public.profiles where id = auth.uid())
    and verification_level = (select verification_level from public.profiles where id = auth.uid())
  );
