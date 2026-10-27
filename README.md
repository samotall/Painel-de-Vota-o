# Dilema da Humanidade — Terra ou Espaço?

Site de votação ao vivo. Telas:
- `index.html` — votação (tablet)
- `index.html#painel` — placar para o datashow

## 1. Banco de dados (Supabase, gratuito)
1. Crie um projeto em https://supabase.com
2. Abra **SQL Editor**, cole o conteúdo de `supabase-setup.sql` e clique em **Run**
3. Em **Project Settings > API**, copie a **Project URL** e a chave **anon public**
4. No `index.html`, substitua `COLE_AQUI_A_PROJECT_URL` e `COLE_AQUI_A_ANON_PUBLIC_KEY`

> A chave anon é pública por design; a segurança vem das regras (RLS) do SQL, que só permitem ler e inserir.

## 2. Publicar no GitHub Pages
1. Crie um repositório (ex.: `dilema-da-humanidade`) e envie `index.html` e `README.md`
2. **Settings > Pages > Build and deployment**: Source = *Deploy from a branch*, Branch = `main`, pasta `/ (root)`
3. Em ~1 minuto o site abre em `https://SEU-USUARIO.github.io/dilema-da-humanidade/`
4. Datashow: o mesmo endereço terminando em `#painel`

## Uso na sala
Deixe o tablet em tela cheia no endereço principal. Cada voto libera a tela após 4 segundos.
Para zerar a contagem: Supabase > Table Editor > `votes` > selecione tudo > Delete.
