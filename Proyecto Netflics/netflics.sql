drop database netflics;
create database netflics;
use netflics;

create table plan(
	idPlan int(1) primary key not null,
    nombre varchar(10),
    precio double
);

create table usuarios(
	idUsuario varchar(3) primary key not null,
    nombreUsuario varchar(30),
    email varchar(50),
    contraseña varchar(30),
    idTarjeta varchar(12) not  null,
    usuario_idPlan int(1) not null,
	foreign key(usuario_idPlan) references plan(idPlan)
);

create table pagos(
	idPago int(1) primary key not null,
    monto double,
    pagos_idPlan int(1),
    pagos_idUsuario varchar(3) not null,
    fecha date,
	foreign key(pagos_idPlan) references plan(idPlan),
    foreign key(pagos_idUsuario) references usuarios(idUsuario)
);
create table perfiles(
	perfiles_idUsuario varchar(3) not null,
    idPerfil varchar(3) not null,
    nombrePerfil varchar(20),
    edad int,
    perfiles_idPlan int(1) not null,
	foreign key(perfiles_idPlan) references plan(idPlan),
    primary key(perfiles_idUsuario,idPerfil)
);

create table titulos(
	idTitulo varchar(3) primary key not null,
    titulo varchar(50) not null,
    descripcion varchar(1000),
    clasificacion varchar(3),
    año int(4),
    tipo varchar(10)
);
create table generos(
	idGenero varchar(3) primary key not null,
    genero varchar(20) not null
);
create table tituloGenero(
	tituloGenero_idGenero varchar(3) not null,
    tituloGenero_idTitulo varchar(8) not null,
    foreign key(tituloGenero_idGenero) references generos(idGenero),
    foreign key(tituloGenero_idTitulo) references titulos(idTitulo),
    primary key(tituloGenero_idGenero,tituloGenero_idTitulo)
);

create table calidades(
	idCalidad varchar(2) primary key not null,
    calidad varchar(9) not null
);

create table tituloCalidad(
	tituloCalidad_idTitulo varchar(8) not null,
    tituloCalidad_idCalidad varchar(2) not null,
    foreign key(tituloCalidad_idTitulo) references titulos(idTitulo),
    foreign key(tituloCalidad_idCalidad) references calidades(idCalidad),
    primary key(tituloCalidad_idTitulo,tituloCalidad_idCalidad)
);

create table actores(
	idActor varchar(3) primary key not null,
    actor varchar(30) not null
);

create table tituloActores(
	tituloActores_idActor varchar(4) not null,
    tituloActores_idTitulo varchar(8) not null,
    foreign key(tituloActores_idTitulo) references titulos(idTitulo),
    foreign key(tituloActores_idActor) references actores(idActor),
    primary key(tituloActores_idTitulo,tituloActores_idActor)
);

create table directores(
	idDirector varchar(3) primary key not null,
    director varchar(30)
);

create table tituloDirectores(
	tituloDirectores_idDirector varchar(3) not null,
    tituloDirectores_idTitulo varchar(8) not null,
    foreign key(tituloDirectores_idTitulo) references titulos(idTitulo),
    foreign key(tituloDirectores_idDirector) references directores(idDirector),
    primary key(tituloDirectores_idTitulo,tituloDirectores_idDirector)
);

create table historial(
	historial_idUsuario varchar(3),
    historial_idTitulo varchar(3),
    fecha date,
    foreign key(historial_idUsuario) references usuarios(idUsuario),
    foreign key(historial_idTitulo) references titulos(idTitulo),
    primary key(historial_idUsuario,historial_idTitulo,fecha)
);