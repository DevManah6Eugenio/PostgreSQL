--tabela de dicionario de dados
create table dicionario_dados (
id serial primary key,
nome_tabela varchar(30),
nome_coluna varchar(30),
descricao varchar(30)
);

--retorna todas as tabelas no banco de dados 
SELECT tablename AS tabela FROM pg_catalog.pg_tables 
	WHERE schemaname NOT IN ('pg_catalog', 'information_schema', 'pg_toast') 
	ORDER BY schemaname, tablename;

--retorna nome das tabelas e todas as colunas que pertecem as tabelas
select c.relname as Tabela, a.attname as Coluna 
        from pg_catalog.pg_attribute a
        inner join pg_stat_user_tables c on a.attrelid = c.relid
        WHERE a.attnum > 0 AND NOT a.attisdropped 
        order by c.relname, a.attname;
