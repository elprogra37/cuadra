-- Alinea la contraseña de los roles internos de Supabase con POSTGRES_PASSWORD
-- (mismo mecanismo que roles.sql del compose oficial de supabase/supabase).
-- Corre solo en el primer initdb del volumen.
\set pgpass `echo "$POSTGRES_PASSWORD"`

-- Solo los roles que existen en esta versión de la imagen.
SELECT format('ALTER USER %I WITH PASSWORD %L', rolname, :'pgpass')
FROM pg_roles
WHERE rolname IN ('authenticator', 'pgbouncer', 'supabase_auth_admin',
                  'supabase_functions_admin', 'supabase_storage_admin')
\gexec

-- GoTrue y storage-api corren sus migraciones como supabase_auth_admin /
-- supabase_storage_admin, pero la imagen crea los objetos de esos schemas como
-- supabase_admin: sin esta transferencia fallan con "must be owner of ...".
DO $$
DECLARE r record;
BEGIN
  FOR r IN
    SELECT p.proname, pg_get_function_identity_arguments(p.oid) AS args
    FROM pg_proc p JOIN pg_namespace n ON n.oid = p.pronamespace
    WHERE n.nspname = 'auth'
  LOOP
    EXECUTE format(
      'ALTER FUNCTION auth.%I(%s) OWNER TO supabase_auth_admin', r.proname, r.args);
  END LOOP;
  FOR r IN SELECT tablename FROM pg_tables WHERE schemaname = 'auth' LOOP
    EXECUTE format('ALTER TABLE auth.%I OWNER TO supabase_auth_admin', r.tablename);
  END LOOP;
  FOR r IN
    SELECT sequencename FROM pg_sequences WHERE schemaname = 'auth'
  LOOP
    EXECUTE format(
      'ALTER SEQUENCE auth.%I OWNER TO supabase_auth_admin', r.sequencename);
  END LOOP;

  FOR r IN
    SELECT p.proname, pg_get_function_identity_arguments(p.oid) AS args
    FROM pg_proc p JOIN pg_namespace n ON n.oid = p.pronamespace
    WHERE n.nspname = 'storage'
  LOOP
    EXECUTE format(
      'ALTER FUNCTION storage.%I(%s) OWNER TO supabase_storage_admin',
      r.proname, r.args);
  END LOOP;
  FOR r IN SELECT tablename FROM pg_tables WHERE schemaname = 'storage' LOOP
    EXECUTE format(
      'ALTER TABLE storage.%I OWNER TO supabase_storage_admin', r.tablename);
  END LOOP;
END $$;
