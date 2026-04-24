create extension if not exists "pgcrypto";

create table if not exists public.lists (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  share_code text unique not null,
  created_at timestamp with time zone not null default now()
);

create table if not exists public.items (
  id uuid primary key default gen_random_uuid(),
  list_id uuid not null references public.lists(id) on delete cascade,
  text text not null,
  checked boolean not null default false,
  created_at timestamp with time zone not null default now()
);

create index if not exists items_list_id_created_at_idx
  on public.items (list_id, created_at);

alter table public.items replica identity full;

alter table public.lists enable row level security;
alter table public.items enable row level security;

drop policy if exists "Anyone can create lists" on public.lists;
create policy "Anyone can create lists"
  on public.lists for insert
  to anon, authenticated
  with check (true);

drop policy if exists "Anyone can read lists by share link" on public.lists;
create policy "Anyone can read lists by share link"
  on public.lists for select
  to anon, authenticated
  using (true);

drop policy if exists "Anyone can create items" on public.items;
create policy "Anyone can create items"
  on public.items for insert
  to anon, authenticated
  with check (true);

drop policy if exists "Anyone can read items" on public.items;
create policy "Anyone can read items"
  on public.items for select
  to anon, authenticated
  using (true);

drop policy if exists "Anyone can update items" on public.items;
create policy "Anyone can update items"
  on public.items for update
  to anon, authenticated
  using (true)
  with check (true);

drop policy if exists "Anyone can delete items" on public.items;
create policy "Anyone can delete items"
  on public.items for delete
  to anon, authenticated
  using (true);

do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'items'
  ) then
    alter publication supabase_realtime add table public.items;
  end if;
end $$;
