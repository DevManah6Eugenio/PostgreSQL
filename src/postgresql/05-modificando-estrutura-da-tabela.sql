--modificando valor para preenchimento nao nullo
alter table compras alter column valor set not null;

--valor padão da coluna valor ingual a 0
alter table compras alter column valor set default 0 ;

--criaçao do tipo enum_pagamento onde so aceita valores do tipo cartao, boleto e dinheiro
create type enum_pagamento as enum('cartao', 'boleto', 'dinheiro');

--adiciona a coluna form_pagamento do tipo enum_pagamento
alter table compras add column form_pagamento enum_pagamento;

--preencendo todos os campos form_pagamento como cartao
update compras set form_pagamento = 'cartao';

--modificando form_pagamento para não aceitar valores null
alter table compras alter column form_pagamento set not null;

--coluna recebido com valor padão de 0
alter table compras alter COLUMN recebido set default 0;

--criaçao do tipo de dado enum_satisfacao que aceita valore como muito_satisfeito, satisfeito' e 'insatisfeito
create type enum_satisfacao as enum('muito_satisfeito', 'satisfeito', 'insatisfeito');

--adicionando coluna satisfação na tabela compras
alter table compras add column satisfacao enum_satisfacao;

--modificando o nome da coluna form_pagamento para forma_pagamento
alter table compras rename form_pagamento to forma_pagamento;