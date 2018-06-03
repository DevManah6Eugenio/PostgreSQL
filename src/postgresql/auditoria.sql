--retorna todas as tabelas no banco de dados 
SELECT tablename AS tabela FROM pg_catalog.pg_tables WHERE schemaname NOT IN ('pg_catalog', 'information_schema', 'pg_toast') ORDER BY schemaname, tablename

--retorna nome das tabelas e todas as colunas que pertecem as tabelas
select c.relname as Tabela, a.attname as Coluna from pg_catalog.pg_attribute a
inner join pg_stat_user_tables c on a.attrelid = c.relid
WHERE a.attnum > 0 AND NOT a.attisdropped and c.relname <> 'dicionario_dados'
order by c.relname, a.attname

--retorna as tabelas que faltam serem adicionadas dicionario_dados
select c.relname as Tabela, a.attname as Coluna, b.nome_tabela, b.nome_coluna 
from  pg_catalog.pg_attribute a 
inner join pg_stat_user_tables c
on (a.attrelid = c.relid)
inner join dicionario_dados b 
on (b.nome_tabela = c.relname)
WHERE a.attnum > 0 AND NOT a.attisdropped 
and (c.relname <> b.nome_tabela or attname <> b.nome_coluna)
order by c.relname, a.attname limit 1000
