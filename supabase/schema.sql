-- Table behind the shopping list app.
-- Applied to the Supabase project as the migration "create_shopping_items".

create table public.shopping_items (
  id uuid primary key default gen_random_uuid(),
  text text not null check (char_length(btrim(text)) between 1 and 100),
  done boolean not null default false,
  created_at timestamptz not null default now()
);

create index shopping_items_created_at_idx on public.shopping_items (created_at);

alter table public.shopping_items enable row level security;

-- The app has no login yet, so the browser (anon role) manages one shared list.
-- Anyone who opens the page can read, add, change and delete items.
create policy "anon can read items"   on public.shopping_items for select to anon using (true);
create policy "anon can add items"    on public.shopping_items for insert to anon with check (true);
create policy "anon can update items" on public.shopping_items for update to anon using (true) with check (true);
create policy "anon can delete items" on public.shopping_items for delete to anon using (true);
