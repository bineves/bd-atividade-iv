create database atv10;

use atv10;

create table clientes (
    id_cliente int primary key auto_increment,
    nome varchar(50) not null,
    endereco varchar(100) not null,
    cidade varchar(50) not null
);

create table pagamentos (
    id_pagamento int primary key auto_increment,
    id_cliente int,
    data_pagamento date not null,
    valor_pagamento decimal(10, 2) not null,
    foreign key (id_cliente) references clientes(id_cliente)
);

insert into clientes (nome, endereco, cidade) values
('Vitor', 'rua a, 123', 'São Paulo'),
('Maria', 'rua b, 456', 'Rio de Janeiro'),
('Lucas', 'rua c, 789', 'São Paulo'),
('Luísa', 'rua d, 1011', 'Belo Horizonte');

insert into pagamentos (id_cliente, data_pagamento, valor_pagamento) values
(1, '2023-01-15', 100.50),
(2, '2023-02-20', 150.75),
(1, '2023-03-10', 200.25),
(3, '2023-04-05', 50.00),
(4, '2023-05-12', 120.30);

create view relatorio_pagamentos_cidade as
select c.cidade as nome_cidade,
sum(p.valor_pagamento) as valor_total_pagamentos
from clientes c
join pagamentos p on c.id_cliente = p.id_cliente
group by c.cidade;

select * from relatorio_pagamentos_cidade;

drop database atv10;
