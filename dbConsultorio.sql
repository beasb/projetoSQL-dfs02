drop database dbConsultorio;

create database dbConsultorio;

use dbConsultorio;

create table tbMedico(
idMedico int not null auto_increment,
nome varchar(100),
telefone char(9),
primary key(idMedico)
);

create table tbPacientes(
idPacientes int not null auto_increment,
nome varchar(100),
telefone char(9),
convenio varchar(100),
primary key(idPacientes)
);

create table tbReceitaMedica(
idReceitaMedica int not null auto_increment,
descricao varchar(100),
primary key(idReceitaMedica)
);

create table tbConsultas(
idConsultas int not null auto_increment,
data datetime,
idMedico int not null,
idPacientes int not null,
idReceitaMedica int not null,
primary key(idConsultas),
foreign key(idMedico) references tbMedico(idMedico), 
foreign key(idPacientes) references tbPacientes(idPacientes),
foreign key(idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

desc tbMedico;
desc tbPacientes;
desc tbReceitaMedica;
desc tbConsultas;