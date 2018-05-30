--modificar todas as linhas da tabela onde observacao for ingual a "SALGADO NO AEROPORTO" para "gasto pequeno"
update compras set observacao = 'gasto pequeno' where observacao = 'SALGADO NO AEROPORTO'

--seleciona todas os gastos do ano de 2019
select valor, data, observacao from compras where data between '01-01-2009' and '31-12-2009'

--seleciona todas os gastos do ano de 2019 que não tenham o valor de observação de "LANCHONETE"
select valor, data, observacao from compras where data between '01-01-2009' and '31-12-2009' and not observacao = 'LANCHONETE'

--deletar as colunas com o intervalo de data de 01/01/2009 ate 31/12/2009
delete from compras where data between '01-01-2009' and '31-12-2009'




select * from compras  