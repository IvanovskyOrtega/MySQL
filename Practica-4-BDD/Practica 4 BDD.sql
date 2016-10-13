create database cinemex;
use cinemex;
create table Cinemex
(
	idCinemex int primary key not null,
	nombre varchar(45),
	direccion varchar(45),
	tel varchar(20),
	email varchar(50)
);
create table Gerente
(
	idGerente int primary key not null,
	idCinemex int,
	nombre varchar(45),
	turno varchar(45),
	noCel int,
	salario double,
	constraint foreign key(idCinemex) references Cinemex(idCinemex)
);

create table Empleado
(
	idEmpleado varchar(20) primary key not null,
	nombre varchar(50),
	direccion varchar(100),
	ter varchar(20),
	sex varchar(1)
);
create table CinemexEmpleado
(
	idCinemex int,
	idEmpleado varchar(20),
	constraint foreign key(idCinemex) references Cinemex(idCinemex) on update cascade on delete cascade,
	constraint foreign key(idEmpleado) references Empleado(idEmpleado) on update cascade on delete cascade
);
alter table Empleado add column salario double;
alter table Empleado add column correo varchar(100);
alter table Gerente modify noCel varchar(22);
alter table Empleado rename Asociado;
alter table Asociado modify direccion varchar(150);
insert into Cinemex values
(
	01, 
	'Cinemex Mundo E',
	'Por un lugar',
	'5559874692',
	'cinepolispSat@hotmail.com'
);
insert into Cinemex values
(
	02, 
	'Cinemex 2',
	'Cerca de ESCOM',
	'5547549862',
	'cinepolispTorres@hotmail.com'
);
insert into Cinemex values
(
	03, 
	'Cinemex 3',
	'Por otro lugar',
	'5545962514',
	'cinepolistcNicRom@hotmail.com'
);
insert into Asociado values
(
	'001',
	'Chavo',
	'El barril',
	'88888888',
	'H',
	888.88,
	'chavito@gmail.com'
);
insert into Asociado values
(
	'002',
	'Kiko',
	'Sepa :v',
	'5584741524',
	'H',
	666.66,
	'cachetes@gmail.com'
);
insert into Asociado values
(
	'003',
	'Don Ramon',
	'Una casa de la vecindad',
	'5569847414',
	'H',
	0.50,
	'rorro@gmail.com'
);
insert into CinemexEmpleado values
(
	01,
	'001'
);
insert into CinemexEmpleado values
(
	02,
	'002'
);
insert into CinemexEmpleado values
(
	03,
	'003'
);
delete from Cinemex where idCinemex=1;
alter table CinemexEmpleado drop foreign key cinemexempleado_ibfk_1;
alter table Gerente drop foreign key Gerente_ibfk_1; 
alter table Cinemex drop primary key;
alter table Cinemex add primary key(idCinemex, nombre);
/*show create table Gerente;
show create table Cinemex;
son comandos utilizados para obtener el nombre de las foreign key y elimarlas adecuadamente
*/
create table Cartelera
(
	idCartelera int primary key not null,
    nombre varchar(45),
    fechaInicio date,
    fechaFin date,
    clasificación varchar(2)
);
create table Cartelera_Cinemex
(
	idCartelera int not null,
    idCinemex int not null,
    constraint foreign key(idCartelera) references Cartelera(idCartelera),
    constraint foreign key(idCinemex) references Cinemex(idCinemex),
    primary key(idCartelera, idCinemex)
);