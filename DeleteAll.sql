-- ============================================================
-- LIMPEZA COMPLETA DO SCHEMA PUBLIC
-- APAGA TABELAS, VIEWS, MATERIALIZED VIEWS, FUNÇÕES E TIPOS ENUM
-- NÃO MEXE EM AUTH, STORAGE OU SCHEMAS INTERNOS DO SUPABASE
-- ============================================================

begin;

-- 1. LISTAR TABELAS
select
  schemaname as schema,
  tablename as tabela
from pg_tables
where schemaname = 'public'
order by tablename;

-- 2. LISTAR VIEWS
select
  schemaname as schema,
  viewname as view
from pg_views
where schemaname = 'public'
order by viewname;

-- 3. APAGAR VIEWS
do $$
declare
  item record;
begin
  for item in
    select viewname
    from pg_views
    where schemaname = 'public'
  loop
    raise notice 'Apagando view: public.%', item.viewname;

    execute format(
      'drop view if exists public.%I cascade;',
      item.viewname
    );
  end loop;
end $$;

-- 4. APAGAR MATERIALIZED VIEWS
do $$
declare
  item record;
begin
  for item in
    select matviewname
    from pg_matviews
    where schemaname = 'public'
  loop
    raise notice 'Apagando materialized view: public.%', item.matviewname;

    execute format(
      'drop materialized view if exists public.%I cascade;',
      item.matviewname
    );
  end loop;
end $$;

-- 5. APAGAR TABELAS
do $$
declare
  item record;
begin
  for item in
    select tablename
    from pg_tables
    where schemaname = 'public'
  loop
    raise notice 'Apagando tabela: public.%', item.tablename;

    execute format(
      'drop table if exists public.%I cascade;',
      item.tablename
    );
  end loop;
end $$;

-- 6. APAGAR FUNÇÕES DO SCHEMA PUBLIC
do $$
declare
  item record;
begin
  for item in
    select
      p.oid::regprocedure as funcao
    from pg_proc p
    join pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'public'
  loop
    raise notice 'Apagando função: %', item.funcao;

    execute format(
      'drop function if exists %s cascade;',
      item.funcao
    );
  end loop;
end $$;

-- 7. APAGAR TIPOS CUSTOMIZADOS / ENUMS DO SCHEMA PUBLIC
do $$
declare
  item record;
begin
  for item in
    select
      t.typname as tipo
    from pg_type t
    join pg_namespace n on n.oid = t.typnamespace
    where n.nspname = 'public'
      and t.typtype in ('e', 'c')
  loop
    raise notice 'Apagando tipo: public.%', item.tipo;

    execute format(
      'drop type if exists public.%I cascade;',
      item.tipo
    );
  end loop;
end $$;

-- 8. CONFERÊNCIA FINAL
select
  'tabelas_restantes' as item,
  count(*) as quantidade
from pg_tables
where schemaname = 'public'

union all

select
  'views_restantes' as item,
  count(*) as quantidade
from pg_views
where schemaname = 'public'

union all

select
  'materialized_views_restantes' as item,
  count(*) as quantidade
from pg_matviews
where schemaname = 'public';

commit;