-- apagando bd se existir 
drop database dbLoja;

-- criando banco de dados
create database dbLoja;

-- acessando bd
use dbLoja;

-- visualizando banco de dados
show databases;

-- criando as tabelas no bd
create table tbUsuarios(
codUsu int,
nome varchar(50),
senha varchar(20)
);

create table tbFuncionarios(
codFunc int,
nome varchar(100),
email varchar(100),
cpf char(14),
telCel char(10)
);

-- visualizando as tabelas criadas
show tables;

-- visualizando as estruturas das tabelas
describe tbUsuarios;
desc tbFuncionarios; 

-- inserindo registros nas tabelas
insert into tbUsuarios(codUsu,nome,senha)
	values(1, 'beatriz', 'deximbranco');

insert into tbFuncionarios(codFunc,nome,email,cpf,telCel)
	values(1,'beatriz sousa borges','beatriz.sborges@gmail','123.456.789-01',"95955-9955");	

-- visualizando os registros nos campos das tabelas

select * from tbUsuarios;
select * from tbFuncionarios;
