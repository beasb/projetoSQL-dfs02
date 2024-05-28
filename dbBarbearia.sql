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

select codProd as 'Código',
	descricao as 'Descrição',
	marca as 'Marca',
	preco as 'Preço' from tbProdutos;

-- colunas virtuais

select codProd as 'Código',descricao as 'Descrição',
marca as 'Marca', 'Sim' as 'Vendido', preco as 'Preço'
	from tbProdutos;

-- utilizando calculos no SQL

update tbProdutos set preco = preco * 1.10 where codProd = 3;

select * from tbProdutos;

select preco * 0.90 as 'Desconto' from tbProdutos;

update tbProdutos set preco = preco * 0.20 where codProd = 1;

select * from tbProdutos;

-- tipos de busca

select * from tbProdutos;
select descricao, preco from tbProdutos;

-- clausula where / operadores

select * from tbProdutos where preco 


