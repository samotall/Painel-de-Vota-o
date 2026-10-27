-- Rode este script no Supabase: SQL Editor > New query > Run

create table if not exists votes (
  id bigint generated always as identity primary key,
  choice text not null check (choice in ('terra','espaco')),
  created_at timestamptz not null default now()
);
create table if not exists comments (
  id bigint generated always as identity primary key,
  name text check (char_length(name) <= 30),
  tag text not null check (tag in ('terra','espaco')),
  text text not null check (char_length(text) between 1 and 240),
  created_at timestamptz not null default now()
);

-- Segurança: visitantes (chave anon) só podem LER e INSERIR; nunca alterar ou apagar.
alter table votes enable row level security;
alter table comments enable row level security;
create policy "ler votos"        on votes    for select to anon using (true);
create policy "inserir votos"    on votes    for insert to anon with check (true);
create policy "ler comentarios"  on comments for select to anon using (true);
create policy "inserir comentarios" on comments for insert to anon with check (true);
