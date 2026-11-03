-- 1. Apagar tabelas antigas que possam estar com nomes desalinhados
DROP TABLE IF EXISTS public_votes;
DROP TABLE IF EXISTS public_comments;

-- 2. Criar a tabela de votos com as colunas esperadas pelo código
CREATE TABLE public_votes (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    first_name TEXT NOT NULL,
    choice TEXT NOT NULL,
    fingerprint TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Criar a tabela de comentários com as colunas esperadas pelo código
CREATE TABLE public_comments (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    first_name TEXT NOT NULL,
    category TEXT NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 4. Liberar permissões públicas de leitura e escrita (RLS)
ALTER TABLE public_votes ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Permitir leitura publica votos" ON public_votes FOR SELECT USING (true);
CREATE POLICY "Permitir insercao publica votos" ON public_votes FOR INSERT WITH CHECK (true);

ALTER TABLE public_comments ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Permitir leitura publica comentarios" ON public_comments FOR SELECT USING (true);
CREATE POLICY "Permitir insercao publica comentarios" ON public_comments FOR INSERT WITH CHECK (true);
