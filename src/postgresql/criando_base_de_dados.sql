--criação da base de dados
CREATE DATABASE controle_compras;

--primeira tabela da base de dados
CREATE TABLE compras (
id serial primary key,
valor numeric,
data date, 
observacao varchar(255), 
recebido smallint);

--inserindo elemento na tebela compras
INSERT INTO compras(valor, data, observacao, recebido) 
	VALUES (100, '2018-05-29', 'presente de aniversario', 1);

select * from compras;  