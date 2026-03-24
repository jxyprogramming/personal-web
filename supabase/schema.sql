create extension if not exists pgcrypto;

create table if not exists public.site_likes (
  id uuid primary key default gen_random_uuid(),
  entry_slug text not null,
  entry_type text not null check (entry_type in ('note', 'post', 'photo')),
  visitor_token text not null,
  created_at timestamptz not null default now(),
  unique (entry_slug, entry_type, visitor_token)
);

create table if not exists public.site_comments (
  id uuid primary key default gen_random_uuid(),
  entry_slug text not null,
  entry_type text not null check (entry_type in ('note', 'post', 'photo')),
  nickname text not null check (char_length(nickname) between 1 and 24),
  content text not null check (char_length(content) between 1 and 500),
  created_at timestamptz not null default now()
);

alter table public.site_likes enable row level security;
alter table public.site_comments enable row level security;

drop policy if exists "public can read likes" on public.site_likes;
create policy "public can read likes"
on public.site_likes
for select
to anon, authenticated
using (true);

drop policy if exists "public can insert likes" on public.site_likes;
create policy "public can insert likes"
on public.site_likes
for insert
to anon, authenticated
with check (true);

drop policy if exists "public can delete likes" on public.site_likes;
create policy "public can delete likes"
on public.site_likes
for delete
to anon, authenticated
using (true);

drop policy if exists "public can read comments" on public.site_comments;
create policy "public can read comments"
on public.site_comments
for select
to anon, authenticated
using (true);

drop policy if exists "public can insert comments" on public.site_comments;
create policy "public can insert comments"
on public.site_comments
for insert
to anon, authenticated
with check (true);
