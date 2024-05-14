
drop database dbclinica;

create database dbclinica;

use dbclinica;

create table tbMedico(
codMed int not null auto_increment,
nome varchar(50) not null,
telCel char(10),
primary key(codMed)
);


create table tbPaciente(
codPaci int not null auto_increment,
nome varchar(50) not null,
telCel char(10),
convenio varchar(50),
primary key(codPaci)
);

create table tbReceitaMedica(
codRec int not null auto_increment,
descricao varchar(500) not null,
primary key(codRec)
);

create table tbConsulta(
codCon int not null auto_increment,
data datetime,
codMed int not null,
codPaci int not null,
codRec int not null,
primary key(codCon),
foreign key(codMed) references tbMedico(codMed),
foreign key(codPaci) references tbPaciente(codPaci),
foreign key(codRec) references tbReceitaMedica(codRec)
);

show tables;

desc tbMedico;
desc tbPaciente;
desc tbReceitaMedica;
desc tbConsulta;


insert into tbMedico(nome,telCel)
	values('roberta','12345-6789');

insert into tbPaciente(nome,telCel,convenio)
	values('maria','98766-9876','unimed');

insert into tbReceitaMedica(descricao)
	values('remedio tal');



