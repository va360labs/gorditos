-- GorditOS — Test de aislamiento RLS para profiles (AC-05)
-- Ejecutar contra una base con 0001_profiles.sql aplicada:
--   supabase db reset && psql "$DB_URL" -f supabase/tests/rls_isolation_profiles.sql
-- El script falla (raise exception) si el usuario B puede leer o escribir
-- el perfil del usuario A.

begin;

-- Dos usuarios de prueba directamente en auth.users
insert into auth.users (id, email, raw_user_meta_data)
values
  ('00000000-0000-0000-0000-00000000000a', 'a@test.gorditos', '{"display_name":"Usuaria A"}'::jsonb),
  ('00000000-0000-0000-0000-00000000000b', 'b@test.gorditos', '{"display_name":"Usuario B"}'::jsonb);

-- El trigger handle_new_user debe haber creado ambos perfiles
do $$
begin
  if (select count(*) from public.profiles where id in
      ('00000000-0000-0000-0000-00000000000a','00000000-0000-0000-0000-00000000000b')) <> 2 then
    raise exception 'FALLO: handle_new_user no creó los perfiles (AC-06)';
  end if;
end $$;

-- Simular al usuario B (rol authenticated + claim sub = B)
set local role authenticated;
set local request.jwt.claims to '{"sub":"00000000-0000-0000-0000-00000000000b","role":"authenticated"}';

-- B NO debe ver el perfil de A (0 filas)
do $$
begin
  if exists (select 1 from public.profiles
             where id = '00000000-0000-0000-0000-00000000000a') then
    raise exception 'FALLO RLS: el usuario B puede LEER el perfil de A (AC-05)';
  end if;
end $$;

-- B NO debe poder actualizar el perfil de A (0 filas afectadas)
do $$
declare updated int;
begin
  update public.profiles set display_name = 'hackeado'
   where id = '00000000-0000-0000-0000-00000000000a';
  get diagnostics updated = row_count;
  if updated > 0 then
    raise exception 'FALLO RLS: el usuario B puede ESCRIBIR el perfil de A (AC-05)';
  end if;
end $$;

-- B SÍ debe ver su propio perfil (exactamente 1 fila)
do $$
begin
  if (select count(*) from public.profiles
      where id = '00000000-0000-0000-0000-00000000000b') <> 1 then
    raise exception 'FALLO RLS: el usuario B no ve su propio perfil';
  end if;
end $$;

select 'RLS profiles: AISLAMIENTO OK (AC-05) + trigger OK (AC-06)' as resultado;

rollback;
