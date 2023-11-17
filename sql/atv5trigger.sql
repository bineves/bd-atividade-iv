create database atv9;

use atv9;

create table alunos (
    id_aluno int primary key auto_increment,
    nome varchar(50) not null,
    data_nascimento date,
    serie int
);

create table matriculas (
    id_matricula int primary key auto_increment,
    id_aluno int,
    data_matricula date,
    status varchar(50),
    foreign key (id_aluno) references alunos(id_aluno)
);


insert into alunos (nome, data_nascimento, serie) values
('Helena', '2005-01-01', 6),
('Marcelo', '2008-05-15', 3),
('Luísa', '2010-09-20', 1);

insert into matriculas (id_aluno, data_matricula, status) values
(1, '2023-08-15', 'ativa'),
(2, '2023-08-16', 'inativa'),
(3, '2023-08-17', 'ativa');

delimiter //

create trigger tr_verificar_idade_serie
before insert on matriculas
for each row
begin
    declare idade_aluno int;

    select year(curdate()) - year(a.data_nascimento) - (right(curdate(), 5) < right(a.data_nascimento, 5))
    into idade_aluno
    from alunos a
    where a.id_aluno = new.id_aluno;

    if idade_aluno < new.serie + 5 then
        signal sqlstate '45000'
        set message_text = 'Erro: O aluno não atende aos requisitos de idade para a série.';
    end if;
end;
//

delimiter ;
