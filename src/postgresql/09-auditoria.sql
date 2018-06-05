--retorna todas as tabelas no banco de dados 
SELECT tablename AS tabela FROM pg_catalog.pg_tables 
	WHERE schemaname NOT IN ('pg_catalog', 'information_schema', 'pg_toast') 
	ORDER BY schemaname, tablename

--todas as colunas e tabelas que faltam na tabela dicionario_dados
select c.relname as Tabela, a.attname as Coluna, d.nome_tabela, d.nome_coluna 
	from pg_catalog.pg_attribute a
	inner join pg_stat_user_tables c on (a.attrelid = c.relid)
	left join dicionario_dados d on (d.nome_tabela = c.relname
	and d.nome_coluna = a.attname)
	where a.attnum > 0 AND NOT a.attisdropped
	and (d.nome_tabela is null or d.nome_coluna is null)
	and c.schemaname = 'public'
	order by c.relname, a.attname;

--compras
insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('compras', 'data', 'Data');
insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('compras', 'observacao', 'Observação');
insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('compras', 'recebido', 'Recebido');
insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('compras', 'forma_pagamento', 'Forma Pagamento');
insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('compras', 'satisfacao', 'Satisfação');

--lojas
insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('lojas', 'endereco', 'Endereço');
insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('lojas', 'nome', 'Nome');
insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('lojas', 'telefone', 'Telefone');
