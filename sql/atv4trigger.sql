create database atv7;

use atv7;

create table produtos (

	 id_produto int primary key auto_increment,
     nome varchar(50) not null,
     quantidade_estoque int not null

);

create table vendas (

	id_venda int primary key,
    data_venda datetime

);

create table itens_venda (

	id_item_venda int primary key auto_increment,
    quantidade int not null,
    vendaid int,
    foreign key(vendaid) references vendas(id_venda),
    produtoid int,
    foreign key(produtoid) references produtos(id_produto)

);


delimiter //

create trigger tg_itens_vendas before insert on itens_venda 
for each row
		begin
        declare estoque int;
        select quantidade_estoque into estoque
        from produtos
        
        where id_produto = new.produtoid;
        
        if estoque < new.quantidade then
        signal sqlstate '45000'
        set message_text = 'Erro: o produto está fora de estoque';
        end if;
        end;
        
        


// delimiter ;


drop database atv7;