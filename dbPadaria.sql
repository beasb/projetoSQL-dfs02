drop database dbPadaria;

create database dbPadaria;

use dbPadaria;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(50),
email varchar(20),
telefone char(10),
endereco varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(20),
estado char(2),
primary key(codFunc)
);

insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado)
	values('Anabela','anab@gmail.com','91254-9876','Rua Diaz',27,'050-15-040','Vila Buarque','Sao Paulo','SP');

insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado)
	values('Estella','estella@gmail.com','92154-9876','Rua Bela Vista',32,'080-10-030','Santa Cecilia','Sao Paulo','SP');

insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado)
	values('Marta','marta@gmail.com','92154-2376','Avenida Abelardo',200,'030-50-030','Santo Amaro','Sao Paulo','SP');

insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado)
	values('Angela','angela@gmail.com','92152-2776','Avenida Campo Lindo',756,'080-10-050','Vila Madalena','Sao Paulo','SP');

insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado)
	values('Flora','flora@gmail.com','92652-8776','Rua Borba Gato',938,'020-80-090','Higienopolis','Sao Paulo','SP');

select * from tbFuncionarios;



update tbFuncionarios set endereco = 'Avenida Diaz' where codFunc = 1;

update tbFuncionarios set cep = '040-19-020' where codFunc = 3;

update tbFuncionarios set telefone = '92115-1741' where codFunc = 5;



select * from tbFuncionarios;


delete from tbFuncionarios where codFunc = 4;

select * from tbFuncionarios;


select codFunc as 'Código', 
nome as 'Nome',
email as 'Email',
telefone as 'Telefone',
endereco as 'Endereço',
numero as 'Número',
cep as 'CEP',
bairro as 'Bairro',
cidade as 'Cidade',
estado as 'Estado' from tbFuncionarios;


select codFunc,nome,'sobrenome' as 'Sobrenome', email,telefone,endereco,numero,cep,bairro,cidade,estado from tbFuncionarios;

select cep * 2 as 'Cep' from tbFuncionarios;


--