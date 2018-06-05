--retorna as tabelas que faltam serem adicionadas dicionario_dados
select c.relname as Tabela, a.attname as Coluna--, d.nome_tabela, d.nome_coluna
from pg_catalog.pg_attribute a
inner join pg_stat_user_tables c on a.attrelid = c.relid
inner join dicionario_dados d on c.relname = d.nome_tabela
WHERE a.attnum > 0 AND NOT a.attisdropped
order by c.relname, a.attname

select * from dicionario_dados  

insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('', '', '');



--retorna todas as tabelas que faltam ser cadastradas em dicionario_dados
select c.relname as Tabela, a.attname as Coluna, d.nome_tabela, d.nome_coluna 
from pg_catalog.pg_attribute a
inner join pg_stat_user_tables c on (a.attrelid = c.relid)
left join dicionario_dados d on (d.nome_tabela = c.relname)
WHERE a.attnum > 0 AND NOT a.attisdropped
and (d.nome_tabela is null or d.nome_coluna is null)
and c.schemaname = 'public'
order by c.relname, a.attname;
