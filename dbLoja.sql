-- apagando bd se existir 
drop database dbLojaDF02;

-- criando banco de dados
create database dbLojaDF02;

-- acessando bd
use dbLojaDF02;

-- visualizando banco de dados
show databases;

-- criando as tabelas no bd
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char(14) not null unique,
telCel char(10),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
primary key(codFunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
cnpj char(16) not null unique,
primary key(codForn)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codCli)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
valor decimal(9,2),
quantidade int,
data date,
hora time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);

create table tbVendas(
codVend int not null auto_increment,
valor decimal(9,2),
data date,
hora time,
quantidade int,
codUsu int not null,
codProd int not null,
codCli int not null,
primary key(codVend),
foreign key(codUsu) references tbUsuarios(codUsu),
foreign key(codProd) references tbProdutos(codProd),
foreign key(codCli) references tbClientes(codCli)
);

-- visualizando as tabelas criadas
show tables;

-- visualizando as estruturas das tabelas

desc tbFuncionarios; 
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;


-- inserindo registros nas tabelas
insert into tbFuncionarios(nome,email,cpf,telCel,logradouro,numero,cep,bairro,cidade,estado)
	values('beatriz sousa borges','beatriz.sborges@gmail','123.456.789-01','95955-9955','Rua dr. Antonio Bento','355','04750-000','Santo Amaro','São Paulo', 'SP');	

insert into tbFuncionarios(nome,email,cpf,telCel,logradouro,numero,cep,bairro,cidade,estado)
	values('Ana Frios Delgado Matarazzo','ana.fdmatarazzo@gmail','445.456.789-01','95955-9675','Rua da Alegria','153','04750-123','Santo Amaro','São Paulo', 'SP');		

insert into tbUsuarios(nome,senha,codFunc)
	values('beatriz','deximbranco',1);

insert into tbUsuarios(nome,senha,codFunc)
	values('Ana Frios Matarazzo','dexi234branco',2);	

-- visualizando os registros nos campos das tabelas

select * from tbFuncionarios;
select * from tbUsuarios;

