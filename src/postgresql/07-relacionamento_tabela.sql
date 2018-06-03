--tabela de lojas
create table lojas (
id serial,
nome varchar(100),
endereco varchar(100),
telefone varchar(20),
primary key(id)
);

--inserindo dados na tabela de lojas
insert into lojas (nome, endereco, telefone) values ('pao de açucar', 'rua vergueiro 3102', '1234567890');
insert into lojas (nome, endereco, telefone) values ('Americanas', 'Boa Viagem', '1234567890');


--adicionado a coluna loja_id na tabela compras
alter table compras add column loja_id int;

update compras set loja_id = 1 where id < 20;
update compras set loja_id = 2 where id > 20;

--chave estrangeira da tabela lojas
alter table compras add foreign key(loja_id) references lojas(id);

--juntando tabela de compras e lojas
select * from compras, lojas where loja_id = lojas.id;
-- ou com join
select * from compras join lojas on loja_id = lojas.id;

--todas as compras feita do pao de açucar
select * from compras c join lojas l on c.loja_id = l.id and l.nome = 'pao de açucar';

--
select c1.id, c1.valor, c2.id, c2.valor from compras c1, compras c2 where c1.valor <> c2.valor;