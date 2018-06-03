--retorna as tabelas que faltam serem adicionadas dicionario_dados
select c.relname as Tabela, a.attname as Coluna--, d.nome_tabela, d.nome_coluna
from pg_catalog.pg_attribute a
inner join pg_stat_user_tables c on a.attrelid = c.relid
inner join dicionario_dados d on c.relname = d.nome_tabela
WHERE a.attnum > 0 AND NOT a.attisdropped
order by c.relname, a.attname

select * from dicionario_dados  

insert into dicionario_dados(nome_tabela, nome_coluna, descricao) values ('', '', '');