create database atv3;

use atv3;

create table contas(

	id_conta int primary key unique auto_increment,
    nome varchar(40) not null,
    saldo decimal(10, 2)
    
); 

create table transacoes (

	id_transacoes int primary key unique auto_increment,
	tipo varchar(10),
    valor decimal (10, 2),
    contaid int,
    foreign key(contaid) references contas(id_conta)

);

delimiter //

create trigger tg_transacao after insert on transacoes
for each row
begin
	if new.tipo = 'entrada' then
    update contas
    set saldo = saldo + new.valor
    where id_conta = new.contaid;
    
    elseif new.tipo = 'saída' then
    update contas
    set saldo = saldo - new.valor
    where id_conta = new.contaid;
end if;
end;

// delimiter ;