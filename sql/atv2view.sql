create database atv4;

use atv4;

create table produtos (

	id_produto int primary key auto_increment,
    nome varchar (50) not null,
    preco_unitario decimal (10, 2) not null,
    categoria varchar (50) not null

);

create table estoque (
	
	quantidade int  not null,
    produtoid int,
    foreign key(produtoid) references produtos(id_produto)

);


create view estoque_critico as 
select p.nome as nome_produto, e.quantidade as quantidade_estoque
from produtos p
join estoque e on p.id_produto = e.produtoid
where e.quantidade < 5; 

insert into produtos (nome, preco_unitario, categoria)  values
('Fones de Ouvido', 49.99, 'Eletrônicos'),
('Caneta Esferográfica', 1.50, 'Papelaria'),
('HD Externo', 129.90, 'Informática'),
('Chocolate Amargo', 3.75, 'Comida');

insert  into estoque (quantidade) values
(150),
(75),
(600),
(200);

drop database atv4;
