-- Extensiones que usa Cuadra (§20.1).
create extension if not exists postgis;        -- polígonos de barrios, GIST
create extension if not exists vector;         -- clustering de propuestas (§8.4)
create extension if not exists pg_trgm;        -- similitud de nombres (§6.4)
create extension if not exists fuzzystrmatch;  -- levenshtein (§6.4)
create extension if not exists "uuid-ossp";
