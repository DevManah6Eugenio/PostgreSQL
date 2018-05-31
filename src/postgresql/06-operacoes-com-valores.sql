--valor total de todos os gastos de 2010
select sum(valor) from compras where data between '2010-01-01' and '2010-12-31'

--quantidade de compras feitas em 2010
select count(valor) from compras where data between '2010-01-01' and '2010-12-31'

--media de compras feitas em 2010
select avg(valor) from compras where data between '2010-01-01' and '2010-12-31'

--tabela com as informações de total, quantidade e media das compras feitas em 2010
select sum(valor) as total, count(*) as quantidade, avg(valor) as media from compras where data between '2010-01-01' and '2010-12-31'

--consulta que traz a soma das compras com observacao diferente de roupas e valor acima de 500.
select sum(valor) as valor_total from compras where observacao <> 'ROUPAS' and valor > 500;

--selecionar a compra com o valor mais alto
select max(valor) as valor_mais_alto from compras;

--data mais antiga de compra
select min(data) as data_mais_antiga from compras;

