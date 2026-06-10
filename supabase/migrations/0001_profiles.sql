-- GorditOS — 0001: profiles + RLS + trigger de alta (UC-002, AC-04/AC-05/AC-06)
--
-- ⚠️ Constraint de diseño innegociable (PRD §3.1): este esquema JAMÁS tendrá
-- columnas de peso, altura, IMC ni medidas corporales. Verificado por
-- tool/schema_guard.dart en CI.

create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  display_name text,
  avatar_config jsonb not null default '{}'::jsonb,
  preferences jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

comment on table public.profiles is
  'Perfil de usuario. Sin datos corporales por diseño (GorditOS PRD §3.1).';

-- RLS: cada usuario solo ve y toca su propia fila (AC-05).
alter table public.profiles enable row level security;

create policy profiles_select_own
  on public.profiles for select
  using (auth.uid() = id);

create policy profiles_insert_own
  on public.profiles for insert
  with check (auth.uid() = id);

create policy profiles_update_own
  on public.profiles for update
  using (auth.uid() = id)
  with check (auth.uid() = id);

-- Alta automática del perfil al crearse el usuario (AC-06).
create function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, display_name)
  values (new.id, new.raw_user_meta_data ->> 'display_name');
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();
