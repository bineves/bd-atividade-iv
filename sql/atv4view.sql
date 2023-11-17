create database atv8;

use atv8;

create table categorias (

	id_categoria int primary key auto_increment,
    nome_categoria varchar (30) not null,
	descricao varchar(255) not null

);

create table produtos (

	id_produto int primary key auto_increment,
    nome varchar(30) not null,
    preco_unitario decimal (10, 2)not null,
    categoriaid int,
    foreign key(categoriaid) references categorias(id_categoria)

);


create view relatorio_produtos_categoria as 
select c.nome_categoria as nome,
count(p.id_produto) as quantidade_produto
from categorias c
join produtos p on c.id_categoria = p.categoriaid
group by c.id_categoria;

insert into categorias (id_categoria, nome_categoria, descricao) values
(5, 'Livros', 'Livros de diversos gêneros'),
(6, 'Culinária', 'Utensílios e ingredientes culinários'),
(7, 'Decoração', 'Itens decorativos para o lar'),
(8, 'Calçados', 'Calçados para todas as ocasiões');

insert into produtos (id_produto, nome, preco_unitario, categoriaid) values
(5, 'Kindle', 399.99, 5),
(6, 'Panela de Pressão', 89.90, 6),
(7, 'Almofadas', 15.75, 8),
(8, 'Tênis Esportivo', 120.50, 8);

select * from relatorio_produtos_categoria;



drop database atv8;