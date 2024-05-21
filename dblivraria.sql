drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbGenero(
idGenero int not null auto_increment,
descricao varchar(100),
primary key(idGenero)
);

create table tbAutor(
idAutor int not null auto_increment,
nome varchar(100),
email varchar(100),
primary key(idAutor)
);


create table tbCliente(
idCliente int not null auto_increment,
nome varchar(100),
telefone char(9),
primary key(idCliente)
);

create table tbLivro(
idLivro int not null auto_increment,
titulo varchar(100),
preco decimal(9,2),
estoque int,
idGenero int not null,
primary key(idLivro),
foreign key(idGenero) references tbGenero(idGenero)
);

create table tbVenda(
idVenda int not null auto_increment,
data date,
total decimal(9,2),
idCliente int not null,
primary key(idVenda),
foreign key(idCliente) references tbCliente(idCliente)
);

create table tbItensDaVenda(
idLivro int not null,
idVenda int not null,
quantidade int,
subtotal decimal(9,2),
foreign key(idLivro) references tbLivro(idLivro),
foreign key(idVenda) references tbVenda(idVenda)
);

create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key(idLivro) references tbLivro(idLivro),
foreign key(idAutor) references tbAutor(idAutor)
);

desc tbGenero;
desc tbAutor;
desc tbCliente;
desc tbLivro;
desc tbVenda;
desc tbItensDaVenda;
desc tbEscreve;

-- cadastrando os registros nas tabelas

insert into tbGenero(descricao)
	values('Acao');
insert into tbGenero(descricao)
	values('ficcao');
insert into tbGenero(descricao)
	values('aventura');
insert into tbGenero(descricao)
	values('terror');
insert into tbGenero(descricao)
	values('comedia');
insert into tbGenero(descricao)
	values('romance');
insert into tbGenero(descricao)
	values('documentario');

insert into tbAutor(nome,email)
	values('Agatha Christie','agatha_c@gmail.com');
insert into tbAutor(nome,email)
	values('Jack Kerouac','jackk@gmail.com');
insert into tbAutor(nome,email)
	values('Melina Marchetta', 'melinama@gmail.com');
insert into tbAutor(nome,email)
	values('Philip Pullman','philpull@gmail.com');
insert into tbAutor(nome,email)
	values('F. Scott Fitzgerald','fitz@gmail.com');
insert into tbAutor(nome,email)
	values('Leigh Bardugo','leightb@gmail.com');
insert into tbAutor(nome,email)
	values('Jennifer L. Armenttrout','jenni@gmail.com');

insert into tbCliente(nome,telefone)
	values('Beatriz','9995-9987');
insert into tbCliente(nome,telefone)
	values('Gabrielly','9995-9922');
insert into tbCliente(nome,telefone)
	values('Lidy','5595-9922');

insert into tbLivro(titulo,preco,estoque,idGenero)
	values('On the Road',32.84,20,7);
insert into tbLivro(titulo,preco,estoque,idGenero)
	values('Saving Francesca',41.30,56,6);
insert into tbLivro(titulo,preco,estoque,idGenero)
	values('Shadow and Bone',25.60,41,2);
insert into tbLivro(titulo,preco,estoque,idGenero)
	values('Hercule Poirots Christmas', 57.30,30,1);

insert into tbVenda(data,total,idCliente)
	values('2024-05-16', 120.50,2);
insert into tbVenda(data,total,idCliente)
	values('2024-05-15', 200.30,1);
insert into tbVenda(data,total,idCliente)
	values('2024-05-14', 90.67,3);

insert into tbItensDaVenda(idLivro,idVenda,quantidade,subtotal)
	values(4,2,1,57.30);
insert into tbItensDaVenda(idLivro,idVenda,quantidade,subtotal)
	values(1,2,1,32.84);
insert into tbItensDaVenda(idLivro,idVenda,quantidade,subtotal)
	values(2,2,1,41.30);

insert into tbEscreve(idLivro,idAutor)
	values(4,1);
insert into tbEscreve(idLivro,idAutor)
	values(1,2);
insert into tbEscreve(idLivro,idAutor)
	values(3,6);

-- pesquisar os campos das tabelas

select * from tbGenero;
select * from tbAutor;
select * from tbCliente;
select * from tbLivro;
select * from tbVenda;
select * from tbItensDaVenda;
select * from tbEscreve;

-- alterando registros das tabelas

update tbCliente set nome = 'Mike' where idCliente = 2;
update tbCliente set nome = 'Bea', telefone = '9852-7542' where idCliente = 1;

select * from tbCliente;

update tbLivro set titulo = 'Saving Francesca', preco = 59.02, estoque = 50, idGenero = 1 where idLivro = 1;
update tbLivro set titulo = 'On the Road', preco = 72.50, estoque = 75, idGenero = 7 where idLivro = 2;


select * from tbLivro;

-- apagando os registros da tabela

--delete from tbVenda where idVenda = 1;


--delete from tbItensDaVenda where idVenda = 2;
 
--delete from tbVenda where idCliente = 1;
 
--delete from tbCliente where idCliente = 2;

select * from tbItensDaVenda;
select * from tbVenda;
select * from tbCliente;