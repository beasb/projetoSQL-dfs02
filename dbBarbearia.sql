drop database dbBarbearia;

create database dbBarbearia;

use dbBarbearia;

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
preco decimal(9,2),
marca varchar(50),
primary key(codProd)
);

insert into tbProdutos(descricao,marca,preco)
	values('shampoo','nivea', 30.0);

insert into tbProdutos(descricao,marca,preco)
	values('sabonete','phebo', 50.0);

insert into tbProdutos(descricao,marca,preco)
	values('creme de barbear','barbers', 70.0);

insert into tbProdutos(descricao,marca,preco)
	values('gel capilar','salome', 25.0);

select * from tbProdutos;


delete from tbProdutos where codProd = 2;

select * from tbProdutos;