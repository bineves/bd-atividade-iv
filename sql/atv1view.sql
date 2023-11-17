create database atv2;

use atv2;

create table clientes (

	id_cliente int primary key auto_increment not null,
    nome varchar (30) not null,
    email varchar (255) not null unique,
    telefone varchar (25) not null unique

);

create table pedidos (
	
    id_pedidos int primary key auto_increment,
    data_pedido datetime not null,
    valor_total decimal(10, 2) not null,
    clienteid int not null,
    foreign key (clienteid) references clientes(id_cliente)

);


insert into clientes(nome, email, telefone) values 
('Ana Julia', 'anaju@gmail.com', '(71)8796-1232'),
('Robert', 'robertr@gmail.com', '(71)98700-1446'),
('Larissa', 'lari@gmail.com', '(71)97823-1432'),
('Maurício', 'mauricio@gmail.com', '(71)9871-0001');

insert into pedidos (data_pedido, valor_total, clienteid) values 
('2023/01/12', 56.90, 2),
('2023/04/22', 89.90, 1),
('2023/05/30', 21.50, 3),
('2023/11/11', 65.70, 1),
('2023/03/18', 12.90, 4),
('2023/10/27', 10.00, 2);


create view relatorio_pedidos_clientes as 
select c.nome as nome_cliente, c.id_cliente, COUNT(p.id_pedidos) as num_pedidos, 
sum(p.valor_total) as t_gasto from clientes c
join pedidos p on  c.id_cliente = p.clienteid
group by c.id_cliente, c.nome;


select * from relatorio_pedidos_clientes;



drop database atv2;









