drop database dbConsultorio;

create database dbConsultorio;

use dbConsultorio;

create table tbMedico(
idMedico int not null auto_increment,
nome varchar(100),
telefone char(10),
primary key(idMedico)
);

create table tbPacientes(
idPacientes int not null auto_increment,
nome varchar(100),
telefone char(10),
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


insert into tbMedico(nome, telefone)
	values('Divaldo Antunes','97523-4258');
insert into tbMedico(nome, telefone)
	values('Marieta Regina','97523-8741');
insert into tbMedico(nome, telefone)
	values('Zenilda Fernandez','97523-5236');



insert into tbPacientes(nome,telefone,convenio)
	values('Regina Marques Sampaio','98525-7452','Porto Saude');
insert into tbPacientes(nome,telefone,convenio)
	values('Naldina Rocha','98525-8963','Unimed');
insert into tbPacientes(nome,telefone,convenio)
	values('Carolina Martins','98525-3214','Amil');
insert into tbPacientes(nome,telefone,convenio)
	values('Analisa das Fontes','98525-9658','Porto Saude');
insert into tbPacientes(nome,telefone,convenio)
	values('Cesar Augusto','98525-4710','Unimed');


insert into tbReceitaMedica(descricao)
	values('Fazer exercicio fisico diario');
insert into tbReceitaMedica(descricao)
	values('Tomar suco');
insert into tbReceitaMedica(descricao)
	values('Correr duas vezes ao dia');
insert into tbReceitaMedica(descricao)
	values('Andar de bicicleta');
insert into tbReceitaMedica(descricao)
	values('Brincar');

insert into tbConsultas(data,idMedico,idPacientes,idReceitaMedica)
	values('2024/06/18',2,3,3);
insert into tbConsultas(data,idMedico,idPacientes,idReceitaMedica)
	values('2024/06/17',1,5,2);
insert into tbConsultas(data,idMedico,idPacientes,idReceitaMedica)
	values('2024/06/16',3,2,4);
insert into tbConsultas(data,idMedico,idPacientes,idReceitaMedica)
	values('2024/06/15',1,4,1);
insert into tbConsultas(data,idMedico,idPacientes,idReceitaMedica)
	values('2024/06/14',2,1,5);

select * from tbMedico;
select * from tbPacientes;
select * from tbReceitaMedica;
select * from tbConsultas;

select med.nome as 'Medico', 
pac.nome as 'Paciente', 
rec.descricao as 'Receita' from tbConsultas as con 
inner join tbMedico as med on con.idMedico = med.idMedico 
inner join tbPacientes as pac on con.idPacientes = pac.idPacientes
inner join tbReceitaMedica as rec on con.idReceitaMedica = rec.idReceitaMedica
where med.nome like '%n%';

select pac.nome as 'Paciente',
med.nome as 'Medico'from tbMedico as med 
inner join tbPacientes as pac on med.idMedico = pac.idPacientes;
