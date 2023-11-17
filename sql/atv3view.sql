create database atv6;

use atv6;

create table funcionarios (

	id_funcionario int auto_increment primary key,
    nome varchar (50) not null,
    cargo varchar (40) not null,
    salario decimal (10, 2) not null

);

create table vendas (

	id_venda int auto_increment primary key,
    data_venda datetime not null,
    valor_venda decimal (10, 2),
    funcionarioid int, 
    foreign key(funcionarioid) references funcionarios(id_funcionario)

);


insert into funcionarios (nome, cargo, salario) values
('Alice', 'Vendedora', 3200.45),
('Carlos', 'Gerente', 5500.89),
('Mariana', 'Vendedora', 3400.75),
('Rafael', 'Coordenador', 7800.60);


insert into vendas (data_venda, valor_venda, funcionarioid) values
('2023-09-15', 800.30, 1),
('2023-04-20', 1200.10, 4),
('2023-06-25', 600.50, 3),
('2023-12-12', 1500.25, 3);


create view relatorio_vendas_funcionario as 
select f.nome as nome_funcionario,
count(v.id_venda) as numero_vendas,
sum(v.valor_venda) as valor_total
from  vendas v
join funcionarios f on f.id_funcionario = v.funcionarioid
group by f.id_funcionario, f.nome;

select * from relatorio_vendas_funcionario;

drop database atv6;