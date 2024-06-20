drop database dbCDs;

create database dbCDs;

use dbCDs;

create table tbArtistas(
codArt int not null,
nome varchar(100) not null unique,
primary key(codArt)
);

create table tbGravadoras(
codGrav int not null,
nome varchar(50) not null unique,
primary key(codGrav)
);

create table tbFuncionarios(
codFunc int not null,
nome varchar(50) not null,
endereco varchar(100) not null,
salario decimal(9,2) not null default 0 check(salario >=0),
sexo char(1) not null default 'F' check(sexo in('F','M')),
primary key(codFunc)
);

create table tbCategorias(
codCat int not null,
nome varchar(50) not null unique,
primary key(codCat)
);

create table tbEstados(
siglaEst char(2) not null,
nome varchar(50) not null unique,
primary key(siglaEst)
);


create table tbCidades(
codCid int not null,
nome varchar(50) not null,
siglaEst char(2) not null,
primary key(codCid),
foreign key(siglaEst) references tbEstados(siglaEst)
);

create table tbClientes(
codCli int not null,
nome varchar(50) not null,
endereco varchar(100) not null,
renda decimal(9,2) not null default 0 check(renda >=0),
sexo char(1) not null default 'F' check(sexo in('F','M')),
codCid int not null,
primary key(codCli),
foreign key(codCid) references tbCidades(codCid)
);

create table tbConjuge(
codConj int not null,
nome varchar(50) not null,
renda decimal(9,2) not null default 0 check(renda >=0),
sexo char(1) not null default 'F' check(sexo in('F', 'M')),
codCli int not null,
primary key(codConj),
foreign key(codCli) references tbClientes(codCli)
);

create table tbDependentes(
codDep int not null,
nome varchar(100) not null,
sexo char(1) not null default 'F' check(sexo in('F','M')),
codFunc int not null,
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
codTit int not null,
nome varchar(50) not null unique,
valorCD decimal(9,2) not null check(valorCD >0),
estoque int not null check(estoque >=0),
codCat int not null,
codGrav int not null,
primary key(codTit),
foreign key(codCat) references tbCategorias(codCat),
foreign key(codGrav) references tbGravadoras(codGrav)
);

create table tbPedidos(
numPed int not null,
codCli int not null,
codFunc int not null,
data datetime not null,
valor decimal(9,2) not null default 0 check(valor >=0),
primary key(numPed),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulosPedidos(
quantidadeCD int not null check(quantidadeCD >=1),
valorCD decimal(9,2) not null check(valorCD >0),
codTit int not null,
numPed int not null,
foreign key(codTit) references tbTitulos(codTit),
foreign key(numPed) references tbPedidos(numPed)
);

create table tbTitulosArtista(
codTit int not null,
codArt int not null,
foreign key(codTit) references tbTitulos(codTit),
foreign key(codArt) references tbArtistas(codArt)
);


desc tbArtistas;
desc tbGravadoras;
desc tbFuncionarios;
desc tbCategorias;
desc tbEstados;
desc tbCidades;
desc tbClientes;
desc tbConjuge;
desc tbDependentes;
desc tbTitulos;
desc tbPedidos;
desc tbTitulosPedidos;
desc tbTitulosArtista;


insert into tbArtistas(codArt,nome)
	values(1, 'Marisa Monte');
insert into tbArtistas(codArt,nome)
	values(2, 'Gilberto Gil');
insert into tbArtistas(codArt,nome)
	values(3, 'Caetano Veloso');
insert into tbArtistas(codArt,nome)
	values(4, 'Milton Nascimento');
insert into tbArtistas(codArt,nome)
	values(5, 'Legião Urbana');
insert into tbArtistas(codArt,nome)
	values(6, 'The Beatles');
insert into tbArtistas(codArt,nome)
	values(7, 'Rita Lee');


insert into tbGravadoras(codGrav,nome)
	values(1, 'Polygram');
insert into tbGravadoras(codGrav,nome)
	values(2, 'Emi');
insert into tbGravadoras(codGrav,nome)
	values(3, 'Som Livre');
insert into tbGravadoras(codGrav,nome)
	values(4, 'Som Music');


insert into tbCategorias(codCat,nome)
	values(1, 'MPB');
insert into tbCategorias(codCat,nome)
	values(2, 'Trilha Sonora');
insert into tbCategorias(codCat,nome)
	values(3, 'Rock Internacional');
insert into tbCategorias(codCat,nome)
	values(4, 'Rock Nacional');


insert into tbEstados(siglaEst,nome)
	values('SP', 'São Paulo');
insert into tbEstados(siglaEst,nome)
	values('MG', 'Minas Gerais');
insert into tbEstados(siglaEst,nome)
	values('RJ', 'Rio de Janeiro');
insert into tbEstados(siglaEst,nome)
	values('ES', 'Espirito Santo');


insert into tbCidades(codCid,siglaEst,nome)
	values(1,'SP', 'São Paulo');
insert into tbCidades(codCid,siglaEst,nome)
	values(2,'SP', 'Sorocaba');
insert into tbCidades(codCid,siglaEst,nome)
	values(3,'SP', 'Jundiai');
insert into tbCidades(codCid,siglaEst,nome)
	values(4,'SP', 'Americana');
insert into tbCidades(codCid,siglaEst,nome)
	values(5,'SP', 'Araraquara');
insert into tbCidades(codCid,siglaEst,nome)
	values(6,'MG', 'Ouro Preto');
insert into tbCidades(codCid,siglaEst,nome)
	values(7,'ES', 'Cachoeira de Itapemirim');


insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(1,1,'José Nogueira','Rua A',1500.00,'M');
insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(2,1,'Angelo Pereira','Rua B',2000.00,'M');
insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(3,1,'Alem Mar Paranhos','Rua C',1500.00,'M');
insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(4,1,'Catarina Souza','Rua D',892.00,'F');
insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(5,1,'Vagner Costa','Rua E',950.00,'M');
insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(6,2,'Antenor da Costa','Rua F',1582.00,'M');
insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(7,2,'Maria Amelia de Souza','Rua G',1152.00,'F');
insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(8,2,'Paulo Roberto Silva','Rua H',3250.00,'M');
insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(9,3,'Fatima Souza','Rua I',1632.00,'F');
insert into tbClientes(codCli,codCid,nome,endereco,renda,sexo)
	values(10,3,'Joel da Rocha','Rua J',2000.00,'M');


insert into tbConjuge(codConj,codCli,nome,renda,sexo)
	values(1,1,'Carla Nogueira',2500.00,'F');
insert into tbConjuge(codConj,codCli,nome,renda,sexo)
	values(2,2,'Emilia Pereira',5500.00,'F');
insert into tbConjuge(codConj,codCli,nome,renda,sexo)
	values(3,6,'Altiva da Costa',3000.00,'F');
insert into tbConjuge(codConj,codCli,nome,renda,sexo)
	values(4,7,'Carlos de Souza',3250.00,'M');


insert into tbFuncionarios(codFunc,nome,endereco,salario,sexo)
	values(1,'Vania Gabriela Pereira','Rua A',2500.00,'F');
insert into tbFuncionarios(codFunc,nome,endereco,salario,sexo)
	values(2,'Noberto Pereira da Silva','Rua B',300.00,'M');
insert into tbFuncionarios(codFunc,nome,endereco,salario,sexo)
	values(3,'Olavo Linhares','Rua C',580.00,'M');
insert into tbFuncionarios(codFunc,nome,endereco,salario,sexo)
	values(4,'Paula da Silva','Rua D',3000.00,'F');
insert into tbFuncionarios(codFunc,nome,endereco,salario,sexo)
	values(5,'Rolando Rocha','Rua E',2000.00,'M');


insert into tbDependentes(codDep,codFunc,nome,sexo)
	values(1,1,'Ana Pereira','F');
insert into tbDependentes(codDep,codFunc,nome,sexo)
	values(2,1,'Roberto Pereira','M');
insert into tbDependentes(codDep,codFunc,nome,sexo)
	values(3,1,'Celso Pereira','M');
insert into tbDependentes(codDep,codFunc,nome,sexo)
	values(4,3,'Brisa Linhares','F');
insert into tbDependentes(codDep,codFunc,nome,sexo)
	values(5,3,'Mari Sol Linhares','F');
insert into tbDependentes(codDep,codFunc,nome,sexo)
	values(6,4,'Sonia da Silva','F');


insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(1,1,1,'Tribalistas',30.00,1500);
insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(2,1,2,'Tropicalia',50.00,500);
insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(3,1,1,'Aquele Abraço',50.00,600);
insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(4,1,2,'Refazenda',60.00,1000);
insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(5,1,3,'Totalmente Demais',50.00,2000);
insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(6,1,3,'Travessia',55.00,500);
insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(7,1,2,'Courage',30.00,200);
insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(8,4,3,'Legiao Urbana',20.00,100);
insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(9,3,2,'The Beatles',30.00,300);
insert into tbTitulos(codTit,codCat,codGrav,nome,valorCD,estoque)
	values(10,4,1,'Rita Lee',30.00,500);


insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(1,1,2,'02/05/02',1500.00);
insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(2,3,4,'02/05/02',50.00);
insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(3,4,5,'02/06/02',100.00);
insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(4,1,4,'02/02/03',200.00);
insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(5,7,5,'02/03/03',300.00);
insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(6,4,4,'02/03/03',100.00);
insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(7,5,5,'02/03/03',50.00);
insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(8,7,2,'02/03/03',50.00);
insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(9,2,2,'02/03/03',2000.00);
insert into tbPedidos(numPed,codCli,codFunc,data,valor)
	values(10,7,1,'02/03/03',3000.00);


insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(1,1,2,30.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(1,2,3,20.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(2,1,1,50.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(2,2,3,30.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(3,1,2,40.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(4,2,3,20.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(5,1,2,25.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(6,2,3,30.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(6,3,1,35.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(7,4,2,35.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(8,1,4,60.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(9,2,3,15.00);
insert into tbTitulosPedidos(numPed,codTit,quantidadeCD,valorCD)
	values(10,7,2,15.00);


insert into tbTitulosArtista(codTit,codArt)
	values(1,1);
insert into tbTitulosArtista(codTit,codArt)
	values(2,2);
insert into tbTitulosArtista(codTit,codArt)
	values(3,2);
insert into tbTitulosArtista(codTit,codArt)
	values(4,2);
insert into tbTitulosArtista(codTit,codArt)
	values(5,3);
insert into tbTitulosArtista(codTit,codArt)
	values(6,4);
insert into tbTitulosArtista(codTit,codArt)
	values(7,4);
insert into tbTitulosArtista(codTit,codArt)
	values(8,5);
insert into tbTitulosArtista(codTit,codArt)
	values(9,6);
insert into tbTitulosArtista(codTit,codArt)
	values(10,7);

select * from tbArtistas;
select * from tbGravadoras;
select * from tbFuncionarios;
select * from tbCategorias;
select * from tbEstados;
select * from tbCidades;
select * from tbClientes;
select * from tbConjuge;
select * from tbDependentes;
select * from tbTitulos;
select * from tbPedidos;
select * from tbTitulosPedidos;
select * from tbTitulosArtista;


select tit.nome as 'CD',
grav.nome as 'Gravadora' from tbTitulos as tit
inner join tbGravadoras as grav on tit.codGrav = grav.codGrav;

select tit.nome as 'CD',
cat.nome as 'Categoria' from tbTitulos as tit 
inner join tbCategorias as cat on tit.codCat = cat.codCat;

select tit.nome as 'CD',
grav.nome as 'Gravadora',
cat.nome as 'Categoria' from tbTitulos as tit
inner join tbGravadoras as grav on tit.codGrav = grav.codGrav
inner join tbCategorias as cat on tit.codCat = cat.codCat;
