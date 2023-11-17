create database atv5;

use atv5;


create table funcionarios (

	id_funcionario int primary key auto_increment,
    nome varchar(50) not null,
    data_admissao datetime

);

 delimiter // 
 
create trigger tg_admissao_funcionarios before insert on funcionarios
for each row
begin 
	if new.data_admissao <= current_date then
    signal sqlstate '45000'
    set message_text = 'Erro: A data de admissão deverá maior que a data atual.';
    end if;
    end;
    

// delimiter ;

drop database atv5;