-- Crea la DB
create database DBUDI
-- Selecciona la DB
use DBUDI

-- Tablas

-- Tabla dias de la semana
create table semana(
	id_dia smallint identity(1,1) primary key,
	nomdia nvarchar(12) not null
)

-- Tabla de materias
create table materias(
	id_mat smallint identity(1,1) primary key,
	nom_mat nvarchar(100) not null
)

-- Tabla de carrera
create table carreras(
	id_car smallint identity(1,1) primary key,
	nom_car nvarchar(45) not null
)

-- Tabla de grupo
create table grupos(
	id_grupo smallint identity(1,1) primary key,
	clave nvarchar(10) not null
)

-- Tabla de profesores titulares
create table prof_t(
	id_tit smallint identity(1,1) primary key,
	nom_tit nvarchar(100) not null
)

-- Tabla de profesores auxiliares
create table prof_a(
	id_aux smallint identity(1,1) primary key,
	nom_aux nvarchar(100) not null
)

-- Tabla de horas
create table horas(
	id_hora smallint identity(1,1) primary key,
	hora nvarchar(10) not null
)

-- Tabla de horarios
create table horarios(
	id_reg smallint identity(1,1) primary key,
	estado nvarchar(10) not null,
	aula smallint not null,
	prof_tit smallint not null,
	prof_aux smallint not null,
	grupo smallint not null, 
	carrera smallint not null,
	hora_i smallint not null,
	hora_f smallint not null,
	materia smallint not null,
	dia smallint not null,
	foreign key(prof_tit) references prof_t(id_tit),
	foreign key(prof_aux) references prof_a(id_aux),
	foreign key(grupo) references grupos(id_grupo),
	foreign key(hora_i) references horas(id_hora),
	foreign key(hora_f) references horas(id_hora),
	foreign key(carrera) references carreras(id_car),
	foreign key(dia) references semana(id_dia)
)

-- Ingreso de datos en tablas "estáticas"

insert into carreras values ('Ingeniería en Computación')
insert into carreras values ('Ingeniería en Comunicaciones y Electrónica')
insert into carreras values ('Ingeniería en Sistemas Automotríces')
insert into carreras values ('Ingeniería Mecánica')

select * from carreras

select * from grupos
select * from horarios
select * from horas
select * from materias
select * from prof_t
select * from prof_a

insert into semana values ('Lunes')
insert into semana values ('Martes')
insert into semana values ('Miércoles')
insert into semana values ('Jueves')
insert into semana values ('Viernes')
insert into semana values ('Sábado')

select * from semana

insert into horas values ('07:00')
insert into horas values ('07:30')
insert into horas values ('08:00')
insert into horas values ('08:30')
insert into horas values ('09:00')
insert into horas values ('09:30')
insert into horas values ('10:00')
insert into horas values ('10:30')
insert into horas values ('11:00')
insert into horas values ('11:30')
insert into horas values ('12:00')
insert into horas values ('12:30')
insert into horas values ('13:00')
insert into horas values ('13:30')
insert into horas values ('14:00')
insert into horas values ('14:30')
insert into horas values ('15:00')
insert into horas values ('15:30')
insert into horas values ('16:00')
insert into horas values ('16:30')
insert into horas values ('17:00')
insert into horas values ('17:30')
insert into horas values ('18:00')
insert into horas values ('18:30')
insert into horas values ('19:00')
insert into horas values ('19:30')
insert into horas values ('20:00')
insert into horas values ('20:30')
insert into horas values ('21:00')
insert into horas values ('21:30')
insert into horas values ('22:00')

select * from horarios
select * from materias
select * from prof_t
select * from prof_a
select * from grupos