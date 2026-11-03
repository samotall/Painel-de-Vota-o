-- 1. Tabela de Votos Públicos
CREATE TABLE IF NOT EXISTS public.public_votes (
    id BIGSERIAL PRIMARY KEY,
    choice VARCHAR(10) NOT NULL,
    voter_first_name VARCHAR(50) NOT NULL,
    user_hash VARCHAR(64) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Tabela de Comentários da Comunidade
CREATE TABLE IF NOT EXISTS public.public_comments (
    id BIGSERIAL PRIMARY KEY,
    author_name VARCHAR(60) NOT NULL,
    choice_tag VARCHAR(10) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Habilitar RLS (Row Level Security)
ALTER TABLE public.public_votes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.public_comments ENABLE ROW LEVEL SECURITY;

-- Permissões de Leitura e Escrita Públicas
CREATE POLICY "Leitura Pública Votos" ON public.public_votes FOR SELECT USING (true);
CREATE POLICY "Inserção Pública Votos" ON public.public_votes FOR INSERT WITH CHECK (true);

CREATE POLICY "Leitura Pública Comentários" ON public.public_comments FOR SELECT USING (true);
CREATE POLICY "Inserção Pública Comentários" ON public.public_comments FOR INSERT WITH CHECK (true);
