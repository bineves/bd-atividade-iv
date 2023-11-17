create database atv1;

use atv1;

create table livros (

	id_livro int primary key auto_increment,
    titulo varchar (30) not null,
    autor varchar(20) not null,
    quantidade_estoque int not null

);

create table emprestimos (

	id_emprestimo int primary key auto_increment,
    data_emprestimo datetime not null,
    data_devolucao datetime not null,
    livroid int not null,
    foreign key (livroid) references livros(id_livro)

);


delimiter //

create trigger tg_emprestimo after insert on emprestimos 
for each row 
begin
		update livros
        set quantidade_estoque = quantidade_estoque - 1
        where id_livro = new.livroid;
        end 
        
// delimiter ;

insert into livros (titulo, autor, quantidade_estoque) values ('As mil partes do meu coração', 'Colleen Hoover', 14),
('O Jogo', 'Elle Kennedy', 10),
('A Rainha Vermelha', 'Victoria Aveyard', 8),
('Corte de Espinhos e Rosas', 'Sarah J. Maas', 21),
('Um tom mais escuro de magia', 'V.E. Schwab', 24);

insert into emprestimos (data_emprestimo, data_devolucao, livroid) values 
('2023-09-30', '2023-10-12', 1),
('2023-09-30', '2023-10-05', 2), 
('2023-09-30', '2023-10-06', 3), 
('2023-09-30', '2023-10-07', 4), 
('2023-09-30', '2023-10-08', 5);


select * from livros;


     drop database atv1;
