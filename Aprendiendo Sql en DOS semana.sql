CREATE DATABASE db1
GO
USE db1
GO

--2 - Crear una tabla (create table - sp_tables - sp_columns - drop table)

-----------Primer problema
IF object_id('Agenda') is not null
  DROP TABLE Agenda;

CREATE TABLE /Agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)	
);

CREATE TABLE Agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)	
);

exec sp_tables @table_owner='dbo'

sp_columns Agenda;

DROP TABLE Agenda;

DROP TABLE Agenda;


-----------Segundo problema
IF object_id('Libros') is not null
  DROP TABLE Libros;

EXEC sp_tables @table_owner='dbo'

CREATE TABLE Libros(
	  titulo varchar(20),
	  autor varchar(30),
	  editorial varchar(15)
);

CREATE TABLE Libros(
	  titulo varchar(20),
	  autor varchar(30),
	  editorial varchar(15)
);

EXEC sp_tables @table_owner='dbo'

sp_columns Libros;

DROP TABLE Libros;

DROP TABLE Libros;


--3 - Insertar y recuperar registros de una tabla (insert into - select)

--------------Primer problema
IF object_id('Agenda') is not null
	DROP TABLE Agenda;
	
CREATE TABLE Agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
); 

EXEC sp_tables @table_owner='dbo'

sp_columns Agenda;

insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Diaz','Martinsito','Salome esq. Colon','8092128159');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Hernandez','Robinson','Nagua','8095847013');

SELECT * FROM Agenda;

DROP TABLE Agenda;

DROP TABLE Agenda;

----------------Segundo problema

IF object_id('Libros') is not null
	DROP TABLE Libros;

CREATE TABLE Libros(
	titulo varchar(20),
	autor varchar(30),
	editorial varchar(15)
);

EXEC sp_tables @table_owner='dbo'

sp_columns Libros

insert into Libros(titulo,autor,editorial)
	values('Maestria en decimas','Martin','Susaeta');
insert into Libros(titulo,autor,editorial)
	values('Poesias','Leo','Nagua');

SELECT * FROM Libros

-- 4 - Tipos de datos básicos

------------Primer problema

IF object_id('Peliculas') is not null
	DROP DATABASE Peliculas;

CREATE TABLE Peliculas(
	nombre varchar(20),
	actor varchar(20),
	duracion integer,
	cantidad integer
);

EXEC sp_columns Peliculas;

insert into Peliculas(nombre,actor,duracion,cantidad)
	values('A mi altura','Griffin',102,1);
insert into Peliculas(nombre,actor,duracion,cantidad)
	values('Amor en obras','Christina',98,7);
insert into Peliculas(nombre,actor,duracion,cantidad)
	values('De tal padre','Kristen',103,1);
insert into Peliculas(nombre,actor,duracion,cantidad)
	values('28 Dias','Sandra',103,7);

SELECT * FROM Peliculas;

---------------Segundo problema

IF object_id('Empleados') is not null
	DROP DATABASE Empleados;

CREATE TABLE Empleados(
	nombre varchar(20),
	documentos varchar(20),
	sexo varchar(1),
	domicilio varchar(30),
	sueldobasico float
);

EXEC sp_columns Empleados;

insert into Empleados(nombre,documentos,sexo,domicilio,sueldobasico)
	values('Martinsito','20170611','m','Nagua',115000);
insert into Empleados(nombre,documentos,sexo,domicilio,sueldobasico)
	values('Cristina','7454123','f','Nagua',65000);
insert into Empleados(nombre,documentos,sexo,domicilio,sueldobasico)
	values('Martin','5412369','m','Nagua',145000);

SELECT * FROM Empleados;

-- 5 - Recuperar algunos campos (select)

--------------Primer problema

IF object_id('Peliculas') is not null
	DROP TABLE Peliculas;

CREATE TABLE Peliculas(
	titulo varchar(20),
	actor varchar(20),
	duracion integer,
	cantidad integer
);

exec sp_columns Peliculas;

insert into Peliculas(titulo,actor,duracion,cantidad)
	values('A mi altura','Griffin',102,1);
insert into Peliculas(titulo,actor,duracion,cantidad)
	values('Amor en obras','Christina',98,7);
insert into Peliculas(titulo,actor,duracion,cantidad)
	values('De tal padre','Kristen',103,1);
insert into Peliculas(titulo,actor,duracion,cantidad)
	values('28 Dias','Sandra',103,7);

SELECT * FROM Peliculas;

SELECT titulo,duracion FROM Peliculas;

SELECT titulo,cantidad FROM Peliculas;

--------------Segundo problema

IF object_id('Empleados') is not null
	DROP TABLE Empleados;

CREATE TABLE Empleados(
	nombre varchar(20),
	documento varchar(8),
	sexo varchar(1),
	domicilio varchar(30),
	sueldobasico float
);

exec sp_columns Empleados;

insert into Empleados(nombre,documento,sexo,domicilio,sueldobasico)
	values('Martinsito','20170','m','Nagua',115000);
insert into Empleados(nombre,documento,sexo,domicilio,sueldobasico)
	values('Viseydi','4541236','f','Nagua',65000);
insert into Empleados(nombre,documento,sexo,domicilio,sueldobasico)
	values('Miguel','4678411','m','Tenares',145000);

SELECT * FROM Empleados;

SELECT nombre,documento,domicilio FROM Empleados;

SELECT documento,sexo,sueldobasico FROM Empleados;

-- 6 - Recuperar algunos registros (where)

----------------Primer problema
if object_id('Agenda')is not null
	drop table Agenda;

CREATE TABLE Agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
);

exec sp_columns Agenda;

insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Acosta','Ana','Colon 123','4234567');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Bustamante','Betina','Avellaneda 135','4458787');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Lopez','Hector','Salta 545','4887788');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Lopez','Luis','Urquiza 333','4545454');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Lopez','Marisa','Urquiza 333','4545454');

SELECT * FROM Agenda;

SELECT * FROM Agenda
	WHERE nombre = 'Marisa';

SELECT nombre,domicilio FROM Agenda	
	WHERE apellido = 'Lopez'

SELECT nombre FROM Agenda 
		WHERE telefono = '4545454'

----------- Segundo problema

if object_id('Libros') is not null
	drop database Libros;

create table Libros(
	titulo varchar(20),
	autor varchar(30),
	editorial varchar(15)
);

exec sp_columns Libros;

insert into Libros(titulo,autor,editorial)
	values('El aleph','Borges','Emece');
insert into Libros(titulo,autor,editorial)
	values('Martin Fierro','Jose Hernandez','Emece');
insert into Libros(titulo,autor,editorial)
	values('Martin Fierro','Jose Hernandez','Planeta');
insert into Libros(titulo,autor,editorial)
	values('Aprenda PHP','Mario Molina','Siglo XXI');

SELECT * FROM Libros	
	WHERE autor = 'Borges';

SELECT	titulo FROM Libros	
	WHERE editorial = 'Emece';

SELECT	editorial FROM Libros	
	WHERE titulo = 'Martin Fierro';

-- 7 -Operadores relacionales

------------------Primer problema

if object_id('Articulos') is not null
	drop table Articulos;

create table Articulos(
	codigo integer,
	nombre varchar(20),
	descripcion varchar(30),
	precio float,
	cantidad integer
);

exec sp_columns Articulos;

insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values (1,'Impresora','Epson Stylus C45',400.80,20);
insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values (2,'Impresora','Epson Stylus C85',500,30);
insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values (3,'Monitor','Samsung 14',800,10);
insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values (4,'Teclado','Ingles Biswal',100,50);
insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values (5,'Teclado','Español Biswal',90,50);

select * from Articulos;

select * from Articulos
	where precio >= 400;

select codigo,nombre from Articulos
	where cantidad < 30;

select nombre,descripcion from Articulos
	where precio <> 100;

------------------Segundo problema

if object_id('Peliculas')is not null
	drop table Peliculas;

CREATE TABLE Peliculas(
	titulo varchar(20),
	actor varchar(20),
	duracion integer,
	cantidad integer
);

insert into Peliculas (titulo, actor, duracion, cantidad)
	values ('Mision imposible','Tom Cruise',120,3);
insert into Peliculas (titulo, actor, duracion, cantidad)
	values ('Mision imposible 2','Tom Cruise',180,4);
insert into Peliculas (titulo, actor, duracion, cantidad)
	values ('Mujer bonita','Julia R.',90,1);
insert into Peliculas (titulo, actor, duracion, cantidad)
	values ('Elsa y Fred','China Zorrilla',80,2);

select * from Peliculas
	where duracion <= 90;

select titulo from Peliculas
	where actor <> 'Tom Cruise';

select titulo,actor,cantidad from Peliculas
	where cantidad > 2;

-- 8 - 	Borrar registros (delete)

-- Primer problema

if object_id('Agenda')is not null
	drop table Agenda;

CREATE TABLE Agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)	
);

insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Alvarez','Alberto','Colon 123','4234567');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Juarez','Juan','Avellaneda 135','4458787');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Lopez','Maria','Urquiza 333','4545454');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Lopez','Jose','Urquiza 333','4545454');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Salas','Susana','Gral. Paz 1234','4123456');

delete from Agenda
	where nombre = 'Juan';

delete from Agenda
	where telefono = 4545454;

select * from Agenda;

delete from Agenda;

select * from Agenda;

--Segundo problema

if object_id('Articulos')is not null
	drop table Articulos;


create table Articulos(
	codigo integer,
	nombre varchar(20),
	descripcion varchar(30),
	precio float,
	cantidad integer
);

exec sp_columns Articulos;

insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values(1,'Impresora','Epson Stylus C45',400.80,20);
insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values(2,'Impresora','Epson Stylus C85',500,30);
insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values(3,'Monitor','Samsung 14',800,10);
insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values(4,'Teclado','Ingles Biswal',100,50);
insert into Articulos(codigo,nombre,descripcion,precio,cantidad)
	values(5,'Teclado','Español Biswal',90,50);

delete from Articulos
	where precio >= 500;

delete from Articulos
	where nombre ='Impresora';

delete from Articulos
	where codigo <> 4;

select * from Articulos;

-- 9 - Actualizar registros (update)

-----Primer problema
if object_id('Agenda')is not null
	drop database Agenda;

CREATE TABLE Agenda(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)	
);

insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Acostas','Alberto','Colon 123','4234567');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Juarez','Juan','Avellaneda 135','4458787');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Lopez','Maria','Urquiza 333','4545454');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Lopez','Jose','Urquiza 333','4545454');
insert into Agenda(apellido,nombre,domicilio,telefono)
	values('Suarez','Susana','Gral. Paz 1234','4123456');

update Agenda set nombre = 'Juan Jose'
	where nombre = 'Juan';

update Agenda set telefono = 4445566
	where telefono = 4545454; 

update Agenda set nombre = 'Juan Jose'
	where nombre = 'Juan';

select * From Agenda;

--Segundo problema

if object_id('Libros') is not null
	drop database Libros;

create table Libros(
	titulo varchar(30),
	autor varchar(20),
	editorial varchar(15),
	precio float
);

insert into Libros(titulo,autor,editorial,precio)
	values('El aleph','Borges','Emece',25.00);
insert into Libros(titulo,autor,editorial,precio)
	values('Martin Fierro','Jose Hernandez','Planeta',35.50);
insert into Libros(titulo,autor,editorial,precio)
	values('Aprenda PHP','Mario Molina','Emece',45.50);
insert into Libros(titulo,autor,editorial,precio)
	values('Cervantes y el quijote','Borges','Emece',25);
insert into Libros(titulo,autor,editorial,precio)
	values('Matematica estas ahi','Paenza','Siglo XXI',15);

SELECT * FROM Libros;

update Libros set autor = 'Adrian Paenza'
	where autor = 'Paenza';

update Libros set autor = 'Adrian Paenza'
	where autor = 'Paenza';

update Libros set precio = 27
	where autor = 'Mario Molina';

update Libros set editorial = 'Emece S.A'
	where editorial = 'Emece';

select * from Libros;

--11 - Valores null (is null)

--- Primer problema

if object_id('Medicamentos')is  not null
	drop table Medicamentos;

create table Medicamentos(
	codigo integer not null,
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer not null
);

exec sp_columns Medicamentos;

insert into Medicamentos(codigo,nombre,laboratorio,precio,cantidad)
	values(1,'Sertal gotas',null,null,100); 
insert into Medicamentos(codigo,nombre,laboratorio,precio,cantidad)
	values(2,'Sertal compuesto',null,8.90,150);
insert into Medicamentos(codigo,nombre,laboratorio,precio,cantidad)
	values(3,'Buscapina','Roche',null,200);

select * from Medicamentos;

insert into Medicamentos(codigo,nombre,laboratorio,precio,cantidad)
	values(4,'Paracetamol','',0,100); 

insert into Medicamentos(codigo,nombre,laboratorio,precio,cantidad)
	values(0,'','Bayer',56,0); 

select * from Medicamentos;

insert into Medicamentos(codigo,nombre,laboratorio,precio,cantidad)
	values(null,'Aceptaminofen','Bayer',15,5); 

select * from Medicamentos
	where laboratorio is null;

select * from Medicamentos
	where precio is null;

select * from Medicamentos
	where precio = 0;

select * from Medicamentos
	where laboratorio <>'';

select * from Medicamentos
	where laboratorio is not null;

select * from Medicamentos
	where precio <> 0;

select * from Medicamentos
	where precio is not null;;

-- Segundo problema
if object_id('Peliculas')is not null
	drop table Peliculas;
	
CREATE TABLE Peliculas(
	codigo int not null,
	titulo varchar(40) not null,
	actor varchar(20),
	duracion int
);

exec sp_columns Peliculas;

insert into Peliculas(codigo,titulo,actor,duracion)
	values(1,'Mision imposible','Tom Cruise',120);
insert into Peliculas(codigo,titulo,actor,duracion)
	values(2,'Harry Potter y la piedra filosofal',null,180);
insert into Peliculas(codigo,titulo,actor,duracion)
	values(3,'Harry Potter y la camara secreta','Daniel R.',null);
insert into Peliculas(codigo,titulo,actor,duracion)
	values(0,'Mision imposible 2','',150);
insert into Peliculas(codigo,titulo,actor,duracion)
	values(4,'','L. Di Caprio',220);
insert into Peliculas(codigo,titulo,actor,duracion)
	values(5,'Mujer bonita','R. Gere-J. Roberts',0);

select * from Peliculas;

insert into Peliculas(codigo,titulo,actor,duracion)
	 values(null,'Mujer bonita','R. Gere-J. Roberts',190);

select * from Peliculas
	where actor is null;

select * from Peliculas
	where actor = '';

update Peliculas set duracion = null
	where duracion = 120;

update Peliculas set actor = 'Desconocido'
	where actor is null;

select * from Peliculas;

delete from Peliculas 
	where titulo = '';

-- 12 - Clave primaria

--Primer problema
if object_id('Libros')is not null
	drop table Libros;

create table Libros(
	codigo int not null,
	titulo varchar(40) not null,
	autor varchar(20),
	editorial varchar(15),
	primary key(codigo)
);

insert into Libros(codigo,titulo,autor,editorial)
	values (1,'El aleph','Borges','Emece');
insert into Libros(codigo,titulo,autor,editorial)
	 values (2,'Martin Fierro','Jose Hernandez','Planeta');
insert into Libros(codigo,titulo,autor,editorial)
	values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');


insert into libros (codigo,titulo,autor,editorial)
	values (3,'Aprenda C++','Junior Gil','Susaeta');

insert into libros (codigo,titulo,autor,editorial)
	values (null,'Aprenda C++','Junior Gil','Susaeta');

update Libros set codigo = 1
	where autor = 'Martin Fierro';

--Segundo problema

if object_id('Alumnos') is not null
	drop table Alumnos;

create table Alumnos(
	legajo varchar(4) not null,
	documento varchar(8),
	nombre varchar(30),
	domicilio varchar(30),
	primary key(documento),
	primary key(legajo)
);

create table Alumnos(
	legajo varchar(4) not null,
	documento varchar(8),
	nombre varchar(30),
	domicilio varchar(30),
	primary key(documento),
);

exec sp_columns Alumnos;

insert into alumnos (legajo,documento,nombre,domicilio)
   values('A233','22345345','Perez Mariana','Colon 234');
insert into alumnos (legajo,documento,nombre,domicilio)
   values('A567','23545345','Morales Marcos','Avellaneda 348');

insert into alumnos (legajo,documento,nombre,domicilio)
   values('A567','23545345','Morales Marcos','Avellaneda 348');

insert into alumnos (legajo,documento,nombre,domicilio)
   values('A567',null,'Morales Marcos','Avellaneda 348');

-- 13 - Campo con atributo Identity

---Primer problema
if object_id('Medicamentos')is  not null
	drop table Medicamentos;

create table Medicamentos(
	codigo int identity,
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer
);

exec sp_columns Medicamentos;

insert into Medicamentos(nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
insert into Medicamentos(nombre, laboratorio,precio,cantidad)
   values('Buscapina','Roche',4.10,200);
insert into Medicamentos(nombre, laboratorio,precio,cantidad)
   values('Amoxidal 500','Bayer',15.60,100);

select * from Medicamentos;


insert into Medicamentos(codigo,nombre, laboratorio,precio,cantidad)
   values(4,'Paracetamol','Bayer',15.60,100);

update Medicamentos set codigo = 4
	where nombre = 'Sertal';

delete from Medicamentos
	where codigo = 3;

insert into Medicamentos(nombre, laboratorio,precio,cantidad)
   values('Amoxidal 500','Bayer',15.60,100);

select * from Medicamentos;

-- Segundo problema
if object_id('Peliculas')is not null
	drop table Peliculas;
	
CREATE TABLE Peliculas(
	codigo int identity,
	titulo varchar(40),
	actor varchar(20),
	duracion int,
	primary key(codigo)
);

exec sp_columns Peliculas;

insert into Peliculas(titulo,actor,duracion)
    values('Mision imposible','Tom Cruise',120);
insert into Peliculas(titulo,actor,duracion)
	values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into Peliculas(titulo,actor,duracion)
	values('Harry Potter y la camara secreta','Daniel R.',190);
insert into Peliculas(titulo,actor,duracion)
	values('Mision imposible 2','Tom Cruise',120);
insert into Peliculas(titulo,actor,duracion)
	values('La vida es bella','zzz',220);

select * from Peliculas;

update Peliculas set codigo = 4
	where duracion = 120;

delete from Peliculas
	where titulo = 'La vida es bella';

insert into Peliculas(titulo,actor,duracion)
	values('Up','Martinsito',210);

select * from Peliculas;

-- 14 - Otras caracteristicas del atributo identity

--- Primer problema
if object_id('Medicamentos')is  not null
	drop table Medicamentos;

create table Medicamentos(
	codigo int identity(10,1),
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer
);

insert into Medicamentos(nombre, laboratorio,precio,cantidad)
	values('Sertal','Roche',5.2,100);
insert into Medicamentos(nombre, laboratorio,precio,cantidad)
	values('Buscapina','Roche',4.10,200);
insert into Medicamentos(nombre, laboratorio,precio,cantidad)
	values('Amoxidal 500','Bayer',15.60,100);
 
Select * from Medicamentos;

insert into Medicamentos(codigo, nombre, laboratorio,precio,cantidad)
	values(5,'Amoxidal 500','Bayer',15.60,100);

Set identity_insert Medicamentos on;

insert into Medicamentos(nombre, laboratorio,precio,cantidad)
	values('Amoxilina 500','Bayer',15.60,100);

insert into Medicamentos(codigo, nombre, laboratorio,precio,cantidad)
	values(4,'Amoxidal 500','Bayer',15.60,100);

Select ident_seed('Medicamentos');

Select ident_incr('Medicamentos');

---Segundo problema
if object_id('Peliculas')is not null
	drop table Peliculas;

Create table Peliculas(
	codigo int identity(50,3),
	titulo varchar(40),
	actor varchar(20),
	duracion int
);

insert into Peliculas(titulo,actor,duracion)
	values('Mision imposible','Tom Cruise',120);
insert into Peliculas(titulo,actor,duracion)
	values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into Peliculas(titulo,actor,duracion)
	values('Harry Potter y la camara secreta','Daniel R.',190);

Select * from Peliculas;

Set identity_insert	Peliculas on;

insert into Peliculas(codigo,titulo,actor,duracion)
	values(24,'Mision imposible','Tom Cruise',120);

insert into Peliculas(codigo,titulo,actor,duracion)
	values(55,'Mision imposible','Tom Cruise',120);

Select ident_seed('Peliculas');

Select ident_incr('Peliculas');

insert into Peliculas(titulo,actor,duracion)
	values('Elsa y Fred','China Zorrilla',90);

Set identity_insert peliculas off;

Insert into Peliculas(titulo,actor,duracion)
	values('Elsa y Fred','China Zorrilla',90);

Select * from Peliculas;

-- 15 Truncate table

---Primer problema
if object_id('Alumnos')is not null
	drop table Alumnos;

Create table Alumnos(
	legajo int identity,
	documento varchar(8),
	nombre varchar(30),
	domicilio varchar(30)
);

insert into Alumnos(documento,nombre,domicilio)
	values('22345345','Perez Mariana','Colon 234');
insert into Alumnos(documento,nombre,domicilio)
	values('23545345','Morales Marcos','Avellaneda 348');
insert into Alumnos(documento,nombre,domicilio)
	values('24356345','Gonzalez Analia','Caseros 444');
insert into Alumnos(documento,nombre,domicilio)
	values('25666777','Torres Ramiro','Dinamarca 209');

Delete from Alumnos;

insert into Alumnos(documento,nombre,domicilio)
	values('22345345','Perez Mariana','Colon 234');
insert into Alumnos(documento,nombre,domicilio)
	values('23545345','Morales Marcos','Avellaneda 348');
insert into Alumnos(documento,nombre,domicilio)
	values('24356345','Gonzalez Analia','Caseros 444');
insert into Alumnos(documento,nombre,domicilio)
	values('25666777','Torres Ramiro','Dinamarca 209');

Select * from Alumnos;

Truncate table Alumnos;

insert into Alumnos(documento,nombre,domicilio)
	values('22345345','Perez Mariana','Colon 234');
insert into Alumnos(documento,nombre,domicilio)
	values('23545345','Morales Marcos','Avellaneda 348');
insert into Alumnos(documento,nombre,domicilio)
	values('24356345','Gonzalez Analia','Caseros 444');
insert into Alumnos(documento,nombre,domicilio)
	values('25666777','Torres Ramiro','Dinamarca 209');

Select * from Alumnos;

---Segundo problema
if object_id('Articulos')is not null
	drop table Articulos;

Create table Articulos(
	codigo int identity,
	nombre varchar(20),
	descripcion varchar(20),
	precio float
);

insert into Articulos(nombre, descripcion, precio)
	values ('impresora','Epson Stylus C45',400.80);
insert into Articulos(nombre, descripcion, precio)
	values ('impresora','Epson Stylus C85',500);

Truncate table Articulos;

insert into Articulos(nombre, descripcion, precio)
	values('monitor','Samsung 14',800);
insert into Articulos(nombre, descripcion, precio)
	values('teclado','ingles Biswal',100);
insert into Articulos(nombre, descripcion, precio)
	values('teclado','español Biswal',90);

Select * from Articulos;

delete from Articulos;

insert into Articulos(nombre, descripcion, precio)
	values('monitor','Samsung 14',800);
insert into Articulos(nombre, descripcion, precio)
	values('teclado','ingles Biswal',100);
insert into Articulos(nombre, descripcion, precio)
	values('teclado','español Biswal',90);

Select * from Articulos;

-- 17 - Tipo de dato (texto)

---Primer problema
If object_id('Autos')is not null
	drop table Autos;

Create table Autos(
	patente char(6),
	marca varchar(20),
	modelo char(4),
	precio float,
	primary key(patente)
);

insert into Autos(patente,marca,modelo,precio)
	values('ACD123','Fiat 128','1970',15000);
insert into Autos(patente,marca,modelo,precio)
	values('ACG234','Renault 11','1990',40000);
insert into Autos(patente,marca,modelo,precio)
	values('BCD333','Peugeot 505','1990',80000);
insert into Autos(patente,marca,modelo,precio)
	values('GCD123','Renault Clio','1990',70000);
insert into Autos(patente,marca,modelo,precio)
	values('BCC333','Renault Megane','1998',95000);

Select * from Autos	
	where modelo = '1990';

---Segundo problema
If object_id('Clientes') is not null
	drop table Clientes;

Create table Clientes(
	documento char(8),
	apellido varchar(20),
	nombre varchar(20),
	domicilio varchar(20),
	telefono varchar(11)
);

insert into Clientes(documento,apellido,nombre,domicilio,telefono)
	values('2233344','Perez','Juan','Sarmiento 980','4342345');
insert into Clientes(documento,apellido,nombre,domicilio,telefono)
	values('2333344','Perez','Ana','Colon 234', '8092128159');
insert into Clientes(documento,apellido,nombre,domicilio,telefono)
	values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
insert into Clientes(documento,apellido,nombre,domicilio,telefono)
	values('2533344','Juarez','Ana','Urquiza 444','4789900');

Select * from Clientes	
	where apellido = 'Perez';

-- 18 - Tipo de dato (numerico)
---Primer problema
If object_id('Cuentas')is not null
	drop table Cuentas;

Create table Cuentas(
	numeroCuenta int not null,
	primary key(numeroCuenta),
	documento char(8),
	nombre varchar(30),
	Saldo float	
);

insert into Cuentas(numeroCuenta,documento,nombre,saldo)
	values('1234','25666777','Pedro Perez',500000.60);
insert into Cuentas(numeroCuenta,documento,nombre,saldo)
	values('2234','27888999','Juan Lopez',-250000);
insert into Cuentas(numeroCuenta,documento,nombre,saldo)	
	values('3344','27888999','Juan Lopez',4000.50);
insert into Cuentas(numeroCuenta,documento,nombre,saldo)
	values('3346','32111222','Susana Molina',1000);

Select * from Cuentas
	where saldo > 4000;	

Select numeroCuenta,saldo from Cuentas	
	where nombre = 'Juan Lopez';

Select * from Cuentas
	where saldo < 0;	

Select * from Cuentas	
	where numeroCuenta >= 3000;

---Segundo problema

If object_id('Empleados')is not null 
	drop table Empleados;

Create table Empleados(
	nombre varchar(30),
	documento char(8),
	sexo char(1),
	domicilio varchar(30),
	sueldoBasico decimal(7,2),
	cantidadHijos tinyint
);

insert into Empleados(nombre,documento,sexo,domicilio,sueldoBasico,cantidadHijos)
	values('Juan Perez','22333444','m','Sarmiento 123',500,2);
insert into Empleados(nombre,documento,sexo,domicilio,sueldoBasico,cantidadHijos)
	values('Ana Acosta','24555666','f','Colon 134',850,0);
insert into Empleados(nombre,documento,sexo,domicilio,sueldoBasico,cantidadHijos)
	values('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);
	
insert into Empleados(nombre,documento,sexo,domicilio,sueldoBasico,cantidadHijos)
	values('Susana Molina','29000555','f','Salta 876',800.888,3);

insert into Empleados(nombre,documento,sexo,domicilio,sueldoBasico,cantidadHijos)
	values('Susana Molina','29000555','f','Salta 876',800877777777.888,3);

Select * from Empleados
	where sueldoBasico <= 900;

Select nombre from Empleados
	where cantidadHijos > 0;

-- 19 - Tipo de dato (fecha y hora)

--- Primer problema
If object_id('Alumnos') is not null
	drop table Alumnos;

Create table Alumnos(
	apellido varchar(30),
	nombre varchar(30),
	documento char(8),
	domicilio varchar(30),
	fechaIngreso datetime,
	fechaNacimiento datetime
);

Set dateformat 'dmy';

insert into Alumnos(apellido,nombre,documento,domicilio,fechaIngreso,fechaNacimiento)
	values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972');

insert into Alumnos(apellido,nombre,documento,domicilio,fechaIngreso,fechaNacimiento)
	values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972');

insert into Alumnos(apellido,nombre,documento,domicilio,fechaIngreso,fechaNacimiento)
	values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);

insert into Alumnos(apellido,nombre,documento,domicilio,fechaIngreso,fechaNacimiento)
	values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

Select * from Alumnos
	where fechaIngreso <  '1-1-91';

Select * from Alumnos	
	where fechaNacimiento is null;

insert into Alumnos(apellido,nombre,documento,domicilio,fechaIngreso,fechaNacimiento)
	values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

Set dateformat 'mdy';

insert into Alumnos(apellido,nombre,documento,domicilio,fechaIngreso,fechaNacimiento)
	values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

--20 -Ingresar algunos campos (insert into)

---Primer problema
If object_id('Cuentas')is not null
	drop table Cuentas;

Create table Cuentas(
	numero int identity,
	documento char(8) not null,
	nombre varchar(30),
	saldo money
);

Insert into Cuentas(numero,documento,nombre,saldo)
	values(1,'25666777','Juan Perez', 2500.50);

Insert into Cuentas(documento,nombre,saldo)
	values('25666777','Juan Perez', 2500.50);

Insert into Cuentas(documento,nombre,saldo)
	values('Juan Perez', 2500.50);

Insert into Cuentas(numero,documento,nombre,saldo)
	values(5,'28999777','Luis Lopez',34000);

Insert into Cuentas(numero,documento,nombre)
	values(3344,'28999777','Luis Lopez',34000);

Insert into Cuentas(nombre, saldo)
	values('Luis Lopez',34000);

Select * from Cuentas;

-- 21 -Valores por defecto (default)
---Primer problema
if object_id('Visitantes') is not null
	drop table Visitantes;

Create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1) default 'f',
	domicilio varchar(30),
	ciudad varchar(20) default 'Cordoba',
	telefono varchar(11),
	mail varchar(30) default 'No tiene',
	montocompra decimal (6,2)
);

Exec sp_columns Visitantes;

Insert into Visitantes(nombre, domicilio, montocompra)
	values('Susana Molina','Colon 123',59.80);
Insert into Visitantes(nombre, edad, ciudad, mail)
	values('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
 
Select *from Visitantes;

Insert into Visitantes
 	values('Marcelo Morales',38,default,default,default,'4255232','marcelomorales@hotmail.com',default);

Insert into Visitantes default values;

---Segundo problema
if object_id('Prestamos') is not null
	drop table Prestamos;

Create table Prestamos(
	  titulo varchar(40) not null,
	  documento char(8) not null,
	  fechaprestamo datetime not null,
	  fechadevolucion datetime,
	  devuelto char(1) default 'n'
);

insert into Prestamos(titulo,documento,fechaprestamo,fechadevolucion)
	values('Manual de 1 grado','23456789','2006-12-15','2006-12-18');
insert into Prestamos(titulo,documento,fechaprestamo)
	values('Alicia en el pais de las maravillas','23456789','2006-12-16');
insert into Prestamos(titulo,documento,fechaprestamo,fechadevolucion)
	values('El aleph','22543987','2006-12-16','2006-08-19');
insert into Prestamos(titulo,documento,fechaprestamo,devuelto)
	values('Manual de geografia 5 grado','25555666','2006-12-18','s');

select * from Prestamos;

insert into Prestamos values('Manual de historia','32555666','2006-10-25',default,default);

select * from Prestamos;

insert into Prestamos default values;

-- 22 - Columnas calculadas(operadores aritmeticos y de concatenacion)

---Primer problema
if object_id('Articulos')is not null
	drop table Articulos;
	
Create table Articulos(
	codigo int identity,
	nombre varchar(20),
	descripcion varchar(30),
	precio smallmoney,
	cantidad tinyint default 0,
	primary key (codigo)
);

insert into Articulos(nombre, descripcion, precio,cantidad)
	values('impresora','Epson Stylus C45',400.80,20);
insert into Articulos(nombre, descripcion, precio)
	values('impresora','Epson Stylus C85',500);
insert into Articulos(nombre, descripcion, precio)
	values('monitor','Samsung 14',800);
insert into Articulos(nombre, descripcion, precio,cantidad)
	values('teclado','ingles Biswal',100,50);

Update Articulos set precio = precio + (precio*0.15);

Select * from Articulos;

Select nombre+','+descripcion  from Articulos; 

Update Articulos set cantidad = cantidad - 5
	where nombre = 'Teclado';

-- 23 - Alias
---Primer problema

if object_id('Libros')is not null
	drop table Libros;

create table Libros
(
	codigo int identity,
	titulo varchar(40) not null,
	autor varchar(20) default 'Desconocido',
	editorial varchar(20),
	precio decimal(6,2),
	cantidad tinyint default 0,
	primary key (codigo)
);

insert into Libros(titulo,autor,editorial,precio)
	values('El aleph','Borges','Emece',25);

insert into Libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);

insert into Libros(titulo,autor,editorial,precio,cantidad)
	values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

select titulo, autor,editorial,precio,cantidad,precio*cantidad as 'monto total' from Libros;

select titulo,autor,precio,precio*0.1 as descuento,precio-(precio*0.1) as 'precio final' from Libros
	where editorial='Emece';

select titulo+'-'+autor as "Título y autor" from Libros;

-- 27 - Funciones para el uso de fechas y horas

if object_id('Empleados')is not null
	drop table Empleados;

create table Empleados(
	nombre varchar(30) not null,
	apellido varchar(20) not null,
	documento char(8),
	fechaNacimiento datetime,
	fechaIngreso datetime,
	sueldo decimal(6,2),
	primary key(documento)
);

Insert into Empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
Insert into Empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
Insert into Empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
Insert into Empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
Insert into Empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

Select nombre+space(1)+upper(apellido) as nombre,
	stuff(documento,1,0,'DNI N°') as documento,
	stuff(sueldo,1,0,'$') as sueldo from Empleados;

Select documento,stuff(ceiling(sueldo),1,0,'$') from Empleados;

Select nombre,apellido from Empleados
	where datename(month,fechaNacimiento) = 'October';

Select nombre,apellido from Empleados	
	where datepart(year,fechaIngreso)=1987;

-- 28 - Ordenar registros (order by)

if object_id('Visitas') is not null
	drop table Visitas;

Create table Visitas(
	numero int identity,
	nombre varchar(30) default 'Anonimo',
	mail varchar(50),
	pais varchar(20),
	fecha datetime,
	primary key(numero)
);

Insert into Visitas(nombre,mail,pais,fecha)
	values('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
Insert into Visitas(nombre,mail,pais,fecha)	
	values('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
Insert into Visitas(nombre,mail,pais,fecha)
	values('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
Insert into Visitas(nombre,mail,pais,fecha)
	values('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
Insert into Visitas(nombre,mail,pais,fecha)
	values('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
Insert into Visitas(nombre,mail,pais,fecha)
	values('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
Insert into Visitas(nombre,mail,pais,fecha)
	values('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

Select * from Visitas order by fecha desc;

Select nombre,pais,DATENAME(month,fecha) 
	from Visitas order by pais, datename(month,fecha) desc;

Select pais,
	datename(month,fecha) Mes,	
	datename(day,fecha) Dia, 
	datename(hour,fecha) Hora from Visitas order by fecha;

Select mail,pais from Visitas 
	where datename(month,fecha) = 'October'
	order by pais;

-- 29 - Operadores logicos (and - or - not)

---Primer problema
If object_id('Medicamentos') is not null
	drop table Medicamentos;

Create table Medicamentos
(
	codigo int identity,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(5,2),
	cantidad tinyint,
	primary key(codigo)
);

Insert into Medicamentos values('Sertal','Roche',5.2,100);
Insert into Medicamentos values('Buscapina','Roche',4.10,200);
Insert into Medicamentos values('Amoxidal 500','Bayer',15.60,100);
Insert into Medicamentos values('Paracetamol 500','Bago',1.90,200);
Insert into Medicamentos values('Bayaspirina','Bayer',2.10,150); 
Insert into Medicamentos values('Amoxidal jarabe','Bayer',5.10,250); 

Select codigo,nombre from Medicamentos
	where laboratorio = 'Roche' and precio<5;

Select * from Medicamentos
	where laboratorio = 'Roche' or precio<5;

Select * from Medicamentos
  where not laboratorio = 'Bayer' and cantidad = 100;

Select * from Medicamentos
	where laboratorio = 'Bayer' and not cantidad = 100;

Delete from Medicamentos
	where laboratorio='Bayer' and precio > 10;

Update Medicamentos set cantidad = 200
	where laboratorio='Roche' and precio>5;

Delete from Medicamentos
	where laboratorio = 'Bayer' or precio<3;

---Segundo problema
 If object_id('Peliculas') is not null
	drop table Peliculas;

Create table Peliculas(
	codigo int identity,
	titulo varchar(40) not null,
	actor varchar(20),
	duracion tinyint,
	primary key (codigo)
);

Insert into Peliculas values('Mision imposible','Tom Cruise',120);
Insert into Peliculas values('Harry Potter y la piedra filosofal','Daniel R.',180);
Insert into Peliculas values('Harry Potter y la camara secreta','Daniel R.',190);
Insert into Peliculas values('Mision imposible 2','Tom Cruise',120);
Insert into Peliculas values('Mujer bonita','Richard Gere',120);
Insert into Peliculas values('Tootsie','D. Hoffman',90);
Insert into Peliculas values('Un oso rojo','Julio Chavez',100);
Insert into Peliculas values('Elsa y Fred','China Zorrilla',110);

Select * from Peliculas
	where actor='Tom Cruise' or actor = 'Richard Gere';

Select * from Peliculas
	where actor = 'Tom Cruise' and duracion < 100;

Update Peliculas set duracion = 200
	where actor = 'Daniel R.' and duracion = 180;

Delete from Peliculas
	where not actor = 'Tom Cruise' and duracion <= 100;

-- 30 - Otros operadores relacionales (is null)

If object_id('Peliculas')is not null
	drop table Peliculas;

Create table Peliculas(
	codigo int identity,
	titulo varchar(40) not null,
	actor varchar(20),
	duracion tinyint,
	primary key (codigo)
);

Insert into Peliculas values('Mision imposible','Tom Cruise',120);
Insert into Peliculas values('Harry Potter y la piedra filosofal','Daniel R.',null);
Insert into Peliculas values('Harry Potter y la camara secreta','Daniel R.',190);
Insert into Peliculas values('Mision imposible 2','Tom Cruise',120);
Insert into Peliculas values('Mujer bonita',null,120);
Insert into Peliculas values('Tootsie','D. Hoffman',90);
Insert into Peliculas(titulo)
	values('Un oso rojo');

Select * from peliculas
	where actor is null;

 Update peliculas set duracion=0
	where duracion is null;

Delete from peliculas
	where actor is null and duracion = 0;

-- 31 - Otros operadores relacionales (between)

---Primer problema
If object_id('Visitas')is not null
	drop table Visitas;

Create table Visitas(
	numero int identity,
	nombre varchar(30) default 'Anonimo',
	mail varchar(50),
	pais varchar(20),
	fechayhora datetime,
	primary key (numero)
);

Insert into Visitas(nombre,mail,pais,fechayhora)
	values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
Insert into Visitas(nombre,mail,pais,fechayhora)
	values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
Insert into Visitas(nombre,mail,pais,fechayhora)
	values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
Insert into Visitas(nombre,mail,pais,fechayhora)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
Insert into Visitas(nombre,mail,pais,fechayhora)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
Insert into Visitas(nombre,mail,pais,fechayhora)
	values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
Insert into Visitas(nombre,mail,pais,fechayhora)
	values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
Insert into Visitas(nombre,mail,pais)
	values ('Federico1','federicogarcia@xaxamail.com','Argentina');

Select * from Visitas
	where fechayhora between '2006-09-12' and '2006-10-11';

 Select * from visitas
	where numero between 2 and 5;

--- Segundo problema
If object_id('Autos') is not null
	drop table Autos;


Create table Autos(
	patente char(6),
	marca varchar(20),
	modelo char(4),
	precio decimal(8,2),
	primary key(patente)
);

Insert into Autos values('ACD123','Fiat 128','1970',15000);
Insert into Autos values('ACG234','Renault 11','1980',40000);
Insert into Autos values('BCD333','Peugeot 505','1990',80000);
Insert into Autos values('GCD123','Renault Clio','1995',70000);
Insert into Autos values('BCC333','Renault Megane','1998',95000);
Insert into Autos values('BVF543','Fiat 128','1975',20000);

Select * from Autos
	where modelo between '1970' and '1990'
	order by modelo;

Select * from Autos
	where precio between 50000 and 100000; 

-- 32 - Otros operadores relacionales (in)

If object_id('Medicamentos') is not null
	drop table Medicamentos;

Create table Medicamentos(
	codigo int identity,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(6,2),
	cantidad tinyint,
	fechavencimiento datetime not null,
	primary key(codigo)
);

Insert into Medicamentos values('Sertal','Roche',5.2,1,'2015-02-01');
Insert into Medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01');
Insert into Medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01');
Insert into Medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01');
Insert into Medicamentos values('Bayaspirina','Bayer',2.10,150,'2019-12-01'); 
Insert into Medicamentos values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01'); 

Select nombre,precio from Medicamentos
	where laboratorio in ('Bayer','Bago');

Select * from Medicamentos
	where cantidad between 1 and 5;

Select * from Medicamentos
	where cantidad in (1,2,3,4,5);

-- 33 - Busqueda de patrones (like - not like)

If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	nombre varchar(30),
	documento char(8),
	domicilio varchar(30),
	fechaingreso datetime,
	seccion varchar(20),
	sueldo decimal(6,2),
	primary key(documento)
);

Insert into Empleados values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
Insert into Empleados values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
Insert into Empleados values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
Insert into Empleados values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
Insert into Empleados values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
Insert into Empleados values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
Insert into Empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

Select * from Empleados
	where nombre like '%Perez%';

Select * from Empleados
	where domicilio like 'Co%8%';

Select * from Empleados
	where documento like '%[02468]';

Select * from Empleados
	where documento like '[^13]%' and nombre like '%ez';

Select nombre from Empleados
	where nombre like '%[yj]%';

 Select nombre,seccion from empleados
	where seccion like '[SG]_______';
 
 Select nombre,seccion from empleados
	where seccion not like '[SG]%';
 
 Select nombre,sueldo from empleados
	where sueldo not like '%.00';
 
 Select * from empleados
	where fechaingreso like '%1990%';

-- 34 - Contar registros

if object_id('Medicamentos') is not null
	drop table Medicamentos;

create table medicamentos(
	codigo int identity,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(6,2),
	cantidad tinyint,
	fechavencimiento datetime not null,
	numerolote int default null,
	primary key(codigo)
);

Insert into Medicamentos values('Sertal','Roche',5.2,1,'2015-02-01',null);
Insert into Medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01',null);
Insert into Medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
Insert into Medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
Insert into Medicamentos values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
Insert into Medicamentos values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

Select count(*) from Medicamentos;

Select count(laboratorio) from Medicamentos;

Select count(precio) as 'Con precio',count(cantidad) as 'Con cantidad' from Medicamentos;

Select count(precio) from Medicamentos
	where laboratorio like 'B%';

Select count(numerolote) from Medicamentos;

-- 35 - Funciones de agrupamientos (count - sum -min - max - avg)

if object_id('Empleados') is not null
  drop table Empleados;

Create table Empleados(
    nombre varchar(30),
	documento char(8),
	domicilio varchar(30),
	seccion varchar(20),
	sueldo decimal(6,2),
	cantidadhijos tinyint,
	primary key(documento)
);

Insert into Empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
Insert into Empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
Insert into Empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
Insert into Empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
Insert into Empleados values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
Insert into Empleados values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
Insert into Empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
Insert into Empleados values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
Insert into Empleados values('Andres Costa','28444555',default,'Secretaria',null,null);

Select count(*) from Empleados;

Select count(sueldo) from Empleados
	where seccion='Secretaria';

Select max(sueldo) as 'Mayor sueldo', min(sueldo) as 'Menor sueldo'
	from Empleados;

Select max(cantidadhijos) from Empleados
	where nombre like '%Perez%';

Select avg(sueldo)	from Empleados;

Select avg(sueldo)	from Empleados
	where seccion='Secretaria';

Select avg(cantidadhijos) from Empleados
	where seccion='Sistemas';

-- 36 - Agrupar registro (group by)

If object_id('Visitantes') is not null
	drop table Visitantes;

Create table Visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1) default 'f',
	domicilio varchar(30),
	ciudad varchar(20) default 'Cordoba',
	telefono varchar(11),
	mail varchar(30) default 'no tiene',
	montocompra decimal (6,2)
);

Insert into Visitantes values('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
Insert into Visitantes values('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
Insert into Visitantes values('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);

Insert into Visitantes (nombre, edad,sexo,telefono, mail)
	values('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
Insert into Visitantes (nombre, ciudad, montocompra)
	values('Alejandra Gonzalez','La Falda',280.50);
Insert into Visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
	values('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
Insert into Visitantes
	values('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
Insert into Visitantes
	values('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

Select ciudad, count(*) from Visitantes
	group by ciudad;

Select ciudad, count(telefono) from Visitantes
	group by ciudad;

Select sexo, sum(montocompra) from Visitantes
	group by sexo;

Select sexo,ciudad, max(montocompra) as mayor, min(montocompra) as menor
	from Visitantes
	group by sexo,ciudad;

Select ciudad, avg(montocompra) as 'promedio de compras'
	from Visitantes
	group by ciudad;

Select ciudad, count(*) as 'cantidad con mail' from Visitantes
	where mail is not null and mail<>'no tiene'
	group by ciudad;

Select ciudad, count(*) as 'cantidad con mail' from Visitantes
	 where mail is not null and mail<>'no tiene'
	 group by all ciudad;

--- Segundo problema
If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	 nombre varchar(30),
	 documento char(8),
	 domicilio varchar(30),
	 seccion varchar(20),
	 sueldo decimal(6,2),
	 cantidadhijos tinyint,
	 fechaingreso datetime,
	 primary key(documento)
);

Insert into Empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
Insert into Empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
Insert into Empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
Insert into Empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
Insert into Empleados values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
Insert into Empleados values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
Insert into Empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
Insert into Empleados values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
Insert into Empleados values('Andres Costa','28444555',default,'Secretaria',null,null,null);

Select seccion, count(*) from Empleados
	group by seccion;

Select seccion, avg(cantidadhijos) as 'promedio de hijos' from Empleados
   group by seccion;

Select datepart(year,fechaingreso), count(*) from Empleados
	group by datepart(year,fechaingreso);

Select seccion, avg(sueldo) as 'promedio de sueldo'	from Empleados
	where cantidadhijos>0 and cantidadhijos is not null
	group by seccion;

Select seccion, avg(sueldo) as 'promedio de sueldo' from Empleados
	where cantidadhijos>0 and cantidadhijos is not null
	group by all seccion;

-- 37 -Selecionar grupos (having)

--- Primer problema
If object_id('Clientes') is not null
	drop table Clientes;

Create table Clientes (
	codigo int identity,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	provincia varchar (20),
	telefono varchar(11),
	primary key(codigo)
);

Insert into Clientes values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
Insert into Clientes values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
Insert into Clientes values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
Insert into Clientes values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
Insert into Clientes Values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
Insert into Clientes values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
Insert into Clientes values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
Insert into Clientes values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
Insert into Clientes values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
Insert into Clientes values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

Select ciudad, provincia, count(*) as cantidad	from Clientes
	group by ciudad,provincia;

Select ciudad, provincia, count(*) as cantidad from Clientes
	group by ciudad,provincia having count(*)>1;

Select ciudad, count(*) from Clientes
	where domicilio like '%San Martin%'
	group by all ciudad 
	having count(*)<2 and ciudad <> 'Cordoba';

--- Segundo problema

If object_id('Visitantes') is not null
	drop table Visitantes;

Create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1),
	domicilio varchar(30),
	ciudad varchar(20),
	telefono varchar(11),
	montocompra decimal(6,2) not null
 );

Insert into Visitantes values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
Insert into Visitantes values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
Insert into Visitantes values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
Insert into Visitantes values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
Insert into Visitantes values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
Insert into Visitantes values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
Insert into Visitantes values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
Insert into Visitantes values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
Insert into Visitantes values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
Insert into Visitantes values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

Select ciudad,sexo, sum(montocompra) as Total
	 from Visitantes
	 group by ciudad,sexo
	 having sum(montocompra) > 50;

Select ciudad, sexo, sum(montocompra) as 'total'
	from Visitantes
	where montocompra > 50 and telefono is not null
	group by all ciudad,sexo
	having ciudad<>'Cordoba'
	order by ciudad;

Select ciudad,max(montocompra) as maximo
	from Visitantes
	where domicilio is not null and sexo = 'f'
	group by all ciudad
	having max(montocompra) > 50;

Select ciudad,sexo, count(*) as cantidad,
	sum(montocompra) as total,
	avg(montocompra) as promedio
	from Visitantes
	group by ciudad,sexo
	having avg(montocompra)>30
	order by total;


-- 38 - Registros duplicados (distint)

--- Primer problema
if object_id('Clientes') is not null
	drop table Clientes;

create table Clientes(
	codigo int identity,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(20),
	provincia varchar (20),
	primary key(codigo)
);

Insert into Clientes values('Lopez Marcos','Colon 111','Cordoba','Cordoba');
Insert into Clientes values('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
Insert into Clientes values('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
Insert into Clientes values('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
Insert into Clientes values('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
Insert into Clientes values('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
Insert into Clientes values('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
Insert into Clientes values('Lopez Carlos',null,'Cruz del Eje','Cordoba');
Insert into Clientes values('Ramos Betina','San Martin 999','Cordoba','Cordoba');
Insert into Clientes values('Lopez Lucas','San Martin 1010','Posadas','Misiones');

Select distinct provincia from Clientes;

Select count(distinct provincia) as cantidad from Clientes;

Select distinct ciudad from Clientes;

Select count(distinct ciudad) from Clientes;

Select distinct ciudad from Clientes
	where provincia='Cordoba';

Select provincia,count(distinct ciudad) from Clientes
	group by provincia;

-- Segundo problema

If object_id('Inmuebles') is not null
	drop table Inmuebles;

create table Inmuebles(
	documento varchar(8) not null,
	apellido varchar(30),
	nombre varchar(30),
	domicilio varchar(20),
	barrio varchar(20),
	ciudad varchar(20),
	tipo char(1),
	superficie decimal (8,2)
);

Insert into Inmuebles values('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
Insert into Inmuebles values('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
Insert into Inmuebles values('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
Insert into Inmuebles values('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
Insert into Inmuebles values('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
Insert into Inmuebles values('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
Insert into Inmuebles values('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
Insert into Inmuebles values('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
Insert into Inmuebles values('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

Select distinct apellido from Inmuebles;

Select distinct documento from Inmuebles;

Select count(distinct documento) from Inmuebles
	where ciudad='Cordoba';

Select count(ciudad) from Inmuebles
	where domicilio like 'San Martin %';

Select distinct apellido,nombre from Inmuebles;

Select documento,count(distinct barrio) as 'cantidad'
	from Inmuebles
	group by documento;

-- 39 - Clausula top

If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	documento varchar(8) not null,
	nombre varchar(30),
	estadocivil char(1),
	seccion varchar(20)
 );

Insert into Empleados values('22222222','Alberto Lopez','c','Sistemas');
Insert into Empleados values('23333333','Beatriz Garcia','c','Administracion');
Insert into Empleados values('24444444','Carlos Fuentes','s','Administracion');
Insert into Empleados values('25555555','Daniel Garcia','s','Sistemas');
Insert into Empleados values('26666666','Ester Juarez','c','Sistemas');
Insert into Empleados values('27777777','Fabian Torres','s','Sistemas');
Insert into Empleados values('28888888','Gabriela Lopez',null,'Sistemas');
Insert into Empleados values('29999999','Hector Garcia',null,'Administracion');

Select top 5 * from Empleados;

Select top 4 nombre,seccion from Empleados
	order by seccion;

Select top 4 with ties nombre,seccion from Empleados
	order by seccion;

Select top 4 nombre,estadocivil,seccion from Empleados
	order by estadocivil,seccion;

Select top 4 with ties nombre,estadocivil,seccion from Empleados
    order by estadocivil,seccion;

-- 40 - Eliminar restricciones (alter table - drop)

 If object_id('Vehiculos') is not null
	drop table Vehiculos;

Create table Vehiculos(
	patente char(6) not null,
	tipo char(1),
	horallegada datetime not null,
	horasalida datetime
);

Alter table Vehiculos
	add constraint CK_Vehiculos_tipo
	check (tipo in ('a','m'));

Alter table Vehiculos
	add constraint DF_Vehiculos_tipo
	default 'a' for tipo;

Alter table Vehiculos
	add constraint CK_Vehiculos_patente_patron
	check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

Alter table Vehiculos
	add constraint PK_Vehiculos_patentellegada
	primary key(patente,horallegada);

Insert into Vehiculos values('SDR456','a','2005/10/10 10:10',null);
Insert into Vehiculos values('SDR456','m','2005/10/10 10:10',null);
Insert into Vehiculos values('SDR456','m','2005/10/10 12:10',null);
Insert into Vehiculos values('SDR111','m','2005/10/10 10:10',null);

exec sp_helpconstraint Vehiculos;

Alter table Vehiculos
	drop DF_Vehiculos_tipo;

Exec sp_helpconstraint vehiculos;

Alter table Vehiculos
	drop PK_Vehiculos_patentellegada, CK_Vehiculos_tipo;

 exec sp_helpconstraint Vehiculos;

 --- 42 - Combinacion interna (inner join)

 -- Primer problema
If (object_id('Clientes')) is not null
	drop table Clientes;

If (object_id('Provincias')) is not null
	drop table Provincias;

Create table Clientes(
	codigo int identity,
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(20),
	codigoprovincia tinyint not null,
	primary key(codigo)
);

Create table Provincias(
	codigo tinyint identity,
	nombre varchar(20),
	primary key (codigo)
);

Insert into Provincias (nombre) values('Cordoba');
Insert into Provincias (nombre) values('Santa Fe');
Insert into Provincias (nombre) values('Corrientes');

Insert into Clientes values('Lopez Marcos','Colon 111','Córdoba',1);
Insert into Clientes values('Perez Ana','San Martin 222','Cruz del Eje',1);
Insert into Clientes values('Garcia Juan','Rivadavia 333','Villa Maria',1);
Insert into Clientes values('Perez Luis','Sarmiento 444','Rosario',2);
Insert into Clientes values('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
Insert into Clientes values('Gomez Ines','San Martin 666','Santa Fe',2);
Insert into Clientes values('Torres Fabiola','Alem 777','Ibera',3);

Select c.nombre,domicilio,ciudad,p.nombre from Clientes as c
	join provincias as p on c.codigoprovincia=p.codigo;

Select c.nombre,domicilio,ciudad,p.nombre from Clientes as c
	join provincias as p
	on c.codigoprovincia=p.codigo
	order by p.nombre;

Select c.nombre,domicilio,ciudad from Clientes as c
	join provincias as p
	on c.codigoprovincia=p.codigo
	where p.nombre='Santa Fe';

--- Segundo problema
If (object_id('Inscriptos')) is not null
	drop table Inscriptos;

If (object_id('Inasistencias')) is not null
	drop table Inasistencias;

Create table Inscriptos(
	nombre varchar(30),
	documento char(8),
	deporte varchar(15),
	matricula char(1), --'s'=paga 'n'=impaga
	primary key(documento,deporte)
);

Create table Inasistencias(
	documento char(8),
	deporte varchar(15),
	fecha datetime
 );

Insert into Inscriptos values('Juan Perez','22222222','tenis','s');
Insert into Inscriptos values('Maria Lopez','23333333','tenis','s');
Insert into Inscriptos values('Agustin Juarez','24444444','tenis','n');
Insert into Inscriptos values('Marta Garcia','25555555','natacion','s');
Insert into Inscriptos values('Juan Perez','22222222','natacion','s');
Insert into Inscriptos values('Maria Lopez','23333333','natacion','n');
			
Insert into Inasistencias values('22222222','tenis','2006-12-01');
Insert into Inasistencias values('22222222','tenis','2006-12-08');
Insert into Inasistencias values('23333333','tenis','2006-12-01');
Insert into Inasistencias values('24444444','tenis','2006-12-08');
Insert into Inasistencias values('22222222','natacion','2006-12-02');
Insert into Inasistencias values('23333333','natacion','2006-12-02');

Select nombre,insc.deporte,ina.fecha
	from Inscriptos as insc
	join inasistencias as ina
	on insc.documento=ina.documento and
	insc.deporte=ina.deporte
	order by nombre, insc.deporte;

Select nombre,insc.deporte, ina.fecha
	from Inscriptos as insc
	join inasistencias as ina
	on insc.documento=ina.documento and
	insc.deporte=ina.deporte
	where insc.documento='22222222';

Select nombre,insc.deporte, ina.fecha
	from Inscriptos as insc
	join inasistencias as ina
	on insc.documento=ina.documento and
	insc.deporte=ina.deporte
	where insc.matricula='s';

-- 43 - Combinacion externa izquierda (left join)
If (object_id('Clientes')) is not null
   drop table Clientes;
If (object_id('Provincias')) is not null
   drop table Provincias;

Create table Clientes(
	codigo int identity,
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(20),
	codigoprovincia tinyint not null,
	primary key(codigo)
);

Create table Provincias(
	codigo tinyint identity,
	nombre varchar(20),
	primary key (codigo)
);

Insert into Provincias (nombre) values('Cordoba');
Insert into Provincias (nombre) values('Santa Fe');
Insert into Provincias (nombre) values('Corrientes');

Insert into Clientes values('Lopez Marcos','Colon 111','Córdoba',1);
Insert into Clientes values('Perez Ana','San Martin 222','Cruz del Eje',1);
Insert into Clientes values('Garcia Juan','Rivadavia 333','Villa Maria',1);
Insert into Clientes values('Perez Luis','Sarmiento 444','Rosario',2);
Insert into Clientes values('Gomez Ines','San Martin 666','Santa Fe',2);
Insert into Clientes values('Torres Fabiola','Alem 777','La Plata',4);
Insert into Clientes values('Garcia Luis','Sucre 475','Santa Rosa',5);

Select c.nombre,domicilio,ciudad, p.nombre from Clientes as c
	left join provincias as p
	on codigoprovincia = p.codigo;

Select c.nombre,domicilio,ciudad, p.nombre from Provincias as p
	left join clientes as c
	on codigoprovincia = p.codigo;

Select c.nombre,domicilio,ciudad, p.nombre from Clientes as c
	left join provincias as p
	on codigoprovincia = p.codigo
	where p.codigo is not null;

Select c.nombre,domicilio,ciudad, p.nombre from Clientes as c
	left join provincias as p
	on codigoprovincia = p.codigo
	where p.codigo is null
	order by c.nombre;

Select c.nombre,domicilio,ciudad, p.nombre from Clientes as c
	left join provincias as p
	on codigoprovincia = p.codigo
	where p.nombre='Cordoba';

-- 44 - Combinacion externa derecha (right join)
If (object_id('Clientes')) is not null
	drop table Clientes;
If (object_id('Provincias')) is not null
	drop table Provincias;

Create table Clientes(
	codigo int identity,
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(20),
	codigoprovincia tinyint not null,
	primary key(codigo)
);

Create table Provincias(
	codigo tinyint identity,
	nombre varchar(20),
	primary key (codigo)
);

Insert into Provincias (nombre) values('Cordoba');
Insert into Provincias (nombre) values('Santa Fe');
Insert into Provincias (nombre) values('Corrientes');

Insert into Clientes values('Lopez Marcos','Colon 111','Córdoba',1);
Insert into Clientes values('Perez Ana','San Martin 222','Cruz del Eje',1);
Insert into Clientes values('Garcia Juan','Rivadavia 333','Villa Maria',1);
Insert into Clientes values('Perez Luis','Sarmiento 444','Rosario',2);
Insert into Clientes values('Gomez Ines','San Martin 666','Santa Fe',2);
Insert into Clientes values('Torres Fabiola','Alem 777','La Plata',4);
Insert into Clientes values('Garcia Luis','Sucre 475','Santa Rosa',5);

Select c.nombre,domicilio,ciudad, p.nombre
	from Provincias as p
	right join clientes as c
	on codigoprovincia = p.codigo;

Select c.nombre,domicilio,ciudad, p.nombre
	from Clientes as c
	left join provincias as p
	on codigoprovincia = p.codigo;

Select c.nombre,domicilio,ciudad, p.nombre
	from Provincias as p
	right join clientes as c
	on codigoprovincia = p.codigo
	where p.codigo is not null;

Select c.nombre,domicilio,ciudad, p.nombre
	from Provincias as p
	right join clientes as c
	on codigoprovincia = p.codigo
	where p.codigo is null
	order by ciudad;

-- 45 - Combinacion externa completa (full join)
If (object_id('Deportes')) is not null
	drop table Deportes;
If (object_id('Inscriptos')) is not null
	drop table Inscriptos;

Create table Deportes(
	codigo tinyint identity,
	nombre varchar(30),
	profesor varchar(30),
	primary key (codigo)
);

Create table Inscriptos(
	documento char(8),
	codigodeporte tinyint not null,
	matricula char(1) --'s'=paga 'n'=impaga
 );

Insert into Deportes values('tenis','Marcelo Roca');
Insert into Deportes values('natacion','Marta Torres');
Insert into Deportes values('basquet','Luis Garcia');
Insert into Deportes values('futbol','Marcelo Roca');
 
Insert into Inscriptos values('22222222',3,'s');
Insert into Inscriptos values('23333333',3,'s');
Insert into Inscriptos values('24444444',3,'n');
Insert into Inscriptos values('22222222',2,'s');
Insert into Inscriptos values('23333333',2,'s');
Insert into Inscriptos values('22222222',4,'n'); 
Insert into Inscriptos values('22222222',5,'n'); 

Select documento,d.nombre,matricula
	from Inscriptos as i
	join Deportes as d
	on codigodeporte=codigo;

Select documento,d.nombre,matricula
	from Inscriptos as i
	left join Deportes as d
	on codigodeporte=codigo;

Select documento,d.nombre,matricula
	from Deportes as d
	right join Inscriptos as i
	on codigodeporte=codigo;

Select nombre
	from Deportes as d
	left join Inscriptos as i
	on codigodeporte=codigo
	where codigodeporte is null;

 Select documento
	from Inscriptos as i
	left join Deportes as d
	on codigodeporte=codigo
	where codigo is null;

Select documento,nombre,profesor,matricula
	from Inscriptos as i
	full join Deportes as d
	on codigodeporte=codigo;

-- 46 - Combinaciones cruzadas (cross join)

---Primer problema

If object_id('Mujeres') is not null
	drop table Mujeres;
If object_id('Varones') is not null
	drop table Varones;
 
Create table Mujeres(
	nombre varchar(30),
	domicilio varchar(30),
	edad int
);

Create table Varones(
	nombre varchar(30),
	domicilio varchar(30),
	edad int
);

Insert into Mujeres values('Maria Lopez','Colon 123',45);
Insert into Mujeres values('Liliana Garcia','Sucre 456',35);
Insert into Mujeres values('Susana Lopez','Avellaneda 98',41);

Insert into Varones values('Juan Torres','Sarmiento 755',44);
Insert into Varones values('Marcelo Oliva','San Martin 874',56);
Insert into Varones values('Federico Pereyra','Colon 234',38);
Insert into Varones values('Juan Garcia','Peru 333',50);

Select m.nombre,m.edad,v.nombre,v.edad
	from Mujeres as m
	cross join Varones as v;

Select m.nombre,m.edad,v.nombre,v.edad
	from Mujeres as m
	cross join Varones as v
	where m.edad > 40 and v.edad > 40;

Select m.nombre,m.edad,v.nombre,v.edad
	from Mujeres as m
	cross join Varones as v
	where m.edad-v.edad between -10 and 10;

--- Segundo problema

If object_id('Guardias') is not null
	drop table Guardias; 

If object_id('Tareas') is not null
	drop table Tareas;

Create table Guardias(
	documento char(8),
	nombre varchar(30),
	sexo char(1), 
	domicilio varchar(30),
	primary key (documento)
);

Create table Tareas(
  codigo tinyint identity,
  domicilio varchar(30),
  descripcion varchar(30),
  horario char(2),
  primary key (codigo)
);

Insert into Guardias values('22333444','Juan Perez','m','Colon 123');
Insert into Guardias values('24333444','Alberto Torres','m','San Martin 567');
Insert into Guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
Insert into Guardias values('23333444','Lorena Viale','f','Sarmiento 988');
Insert into Guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

Insert into Tareas values('Colon 1111','vigilancia exterior','AM');
Insert into Tareas values('Urquiza 234','vigilancia exterior','PM');
Insert into Tareas values('Peru 345','vigilancia interior','AM');
Insert into Tareas values('Avellaneda 890','vigilancia interior','PM');

Select nombre,t.domicilio,descripcion from Guardias
	cross join Tareas as t;

Select nombre,t.domicilio,descripcion from Guardias as g
	cross join Tareas as t
	where (g.sexo = 'f' and t.descripcion = 'Vigilancia interior') or
	(g.sexo ='m' and t.descripcion = 'Vigilancia exterior');

-- 47 - Combinacion de mas de dos tablas

If object_id('Socios') is not null
	drop table Socios;

If object_id('Deportes') is not null
	drop table Deportes;

If object_id('Inscriptos') is not null
	drop table Inscriptos;

Create table Socios(
	documento char(8) not null, 
	nombre varchar(30),
	domicilio varchar(30),
	primary key(documento)
);

Create table Deportes(
	codigo tinyint identity,
	nombre varchar(20),
	profesor varchar(15),
	primary key(codigo)
);

Create table Inscriptos(
	documento char(8) not null, 
	codigodeporte tinyint not null,
	anio char(4),
	matricula char(1),
	primary key(documento,codigodeporte,anio)
);

Insert into Socios values('22222222','Ana Acosta','Avellaneda 111');
Insert into Socios values('23333333','Betina Bustos','Bulnes 222');
Insert into Socios values('24444444','Carlos Castro','Caseros 333');
Insert into Socios values('25555555','Daniel Duarte','Dinamarca 44');

Insert into Deportes values('basquet','Juan Juarez');
Insert into Deportes values('futbol','Pedro Perez');
Insert into Deportes values('natacion','Marina Morales');
Insert into Deportes values('tenis','Marina Morales');

Insert into Inscriptos values('22222222',3,'2006','s');
Insert into Inscriptos values('23333333',3,'2006','s');
Insert into Inscriptos values('24444444',3,'2006','n');
			
Insert into Inscriptos values('22222222',3,'2005','s');
Insert into Inscriptos values('22222222',3,'2007','n');
			
Insert into Inscriptos values('24444444',1,'2006','s');
Insert into Inscriptos values('24444444',2,'2006','s');
			
Insert into Inscriptos values('26666666',0,'2006','s');

Select s.nombre,d.nombre,anio from Deportes as d
	right join Inscriptos as i
	on codigodeporte=d.codigo
	left join Socios as s
	on i.documento=s.documento;

Select s.nombre,d.nombre,anio,matricula from Deportes as d
	full join Inscriptos as i
	on codigodeporte=d.codigo
	full join Socios as s
	on s.documento=i.documento;

Select s.nombre,d.nombre,anio,matricula from Deportes as d
	join Inscriptos as i
	on codigodeporte=d.codigo
	join Socios as s
	on s.documento=i.documento
	where s.documento='22222222';

-- 50 - Union

If object_id('Clientes') is not null
	drop table Clientes;

If object_id('Proveedores') is not null
	drop table Proveedores;

If object_id('Empleados') is not null
	drop table Empleados;

Create table Proveedores(
	codigo int identity,
	nombre varchar (30),
	domicilio varchar(30),
	primary key(codigo)
);

Create table Clientes(
	codigo int identity,
	nombre varchar (30),
	domicilio varchar(30),
	primary key(codigo)
);

Create table Empleados(
	documento char(8) not null,
	nombre varchar(20),
	apellido varchar(20),
	domicilio varchar(30),
	primary key(documento)
);

Insert into Proveedores values('Bebida cola','Colon 123');
Insert into Proveedores values('Carnes Unica','Caseros 222');
Insert into Proveedores values('Lacteos Blanca','San Martin 987');

Insert into Clientes values('Supermercado Lopez','Avellaneda 34');
Insert into Clientes values('Almacen Anita','Colon 987');
Insert into Clientes values('Garcia Juan','Sucre 345');

Insert into Empleados values('23333333','Federico','Lopez','Colon 987');
Insert into Empleados values('28888888','Ana','Marquez','Sucre 333');
Insert into Empleados values('30111111','Luis','Perez','Caseros 956');

Select nombre, domicilio from Proveedores union
	select nombre, domicilio from Clientes
		union
			select (apellido+' '+nombre), domicilio from Empleados;

Select nombre, domicilio, 'proveedor' as categoria from Proveedores
	union
		Select nombre, domicilio, 'cliente' from Clientes
			union
				Select (apellido+' '+nombre), domicilio , 'empleado' from Empleados
					Order by categoria;

-- 51 - Agregar y eliminar campos (alter table - add -drop)

If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	apellido varchar(20),
	nombre varchar(20),
	domicilio varchar(30),
	fechaingreso datetime
);

Insert into Empleados(apellido,nombre) values('Rodriguez','Pablo');

Alter table Empleados
	add sueldo decimal(5,2);

Exec sp_columns Empleados;

Alter table Empleados
	add codigo int identity;

Alter table Empleados
	add documento char(8) not null;

Alter table Empleados
	add documento char(8) not null default '00000000';

Exec sp_columns Empleados;

Alter table Empleados
	drop column sueldo;

Exec sp_columns Empleados;

Alter table Empleados
	drop column documento;

Alter table Empleados
	drop column codigo,fechaingreso;

Exec sp_columns Empleados;

-- 52 - Alterar campos (alter table - alter)

If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	legajo int not null,
	documento char(7) not null,
	nombre varchar(10),
	domicilio varchar(30),
	ciudad varchar(20) default 'Buenos Aires',
	sueldo decimal(6,2),
	cantidadhijos tinyint default 0,
	primary key(legajo)
);

Alter table Empleados
	alter column nombre varchar(30);

Exec sp_columns Empleados;

Alter table Empleados
	alter column sueldo decimal(6,2) not null;

Alter table Empleados
	alter column documento char(8) not null;

Alter table Empleados
	alter column legajo tinyint not null;

Insert into Empleados values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3);
Insert into Empleados values(2,'30000000',null,'Sucre 456','Cordoba',600,2);

Alter table Empleados
	alter column nombre varchar(30) not null;

Delete from empleados where nombre is null;

Alter table Empleados
	alter column nombre varchar(30) not null;

Alter table Empleados
	alter column ciudad varchar(10);

Insert into Empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

Alter table Empleados
	alter column ciudad varchar(15);

Insert into Empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

Alter table Empleados
	alter column legajo int identity;

-- 53 - Campos calculados

If	object_id('Articulos') is not null
	drop table Articulos;

Create table Articulos(
	codigo int identity,
	descripcion varchar(30),
	precio decimal(5,2) not null,
	cantidad smallint not null default 0,
	montoTotal as precio *cantidad
);

Insert into Articulos values('birome',1.5,100,150);
			
Insert into Articulos values('birome',1.5,100);
Insert into Articulos values('cuaderno 12 hojas',4.8,150);
Insert into Articulos values('lapices x 12',5,200);

Select * from Articulos;

Update Articulos set precio=2 
	where descripcion = 'birome';

Select * from articulos;

Update Articulos set cantidad = 200 
	where descripcion='birome';

Select * from Articulos;

Update Articulos set montoTotal = 300 
	where descripcion='birome';

-- 55 - Subconsultas como expresion

If object_id('Alumnos') is not null
   drop table Alumnos;

Create table Alumnos(
	documento char(8),
	nombre varchar(30),
	nota decimal(4,2),
	primary key(documento),
	constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
);

Insert into Alumnos values('30111111','Ana Algarbe',5.1);
Insert into Alumnos values('30222222','Bernardo Bustamante',3.2);
Insert into Alumnos values('30333333','Carolina Conte',4.5);
Insert into Alumnos values('30444444','Diana Dominguez',9.7);
Insert into Alumnos values('30555555','Fabian Fuentes',8.5);
Insert into Alumnos values('30666666','Gaston Gonzalez',9.70);

Select Alumnos.* from Alumnos
	where nota = (select max(nota) from Alumnos);

Select documento ,nombre, nota from Alumnos
  where nota = (select nombre,max(nota) from Alumnos);

Select Alumnos.*,(select avg(nota) from Alumnos)-nota as diferencia
  from Alumnos
  where nota < (select avg(nota) from Alumnos);

Update Alumnos set nota=4
	where nota = (select min(nota) from Alumnos);

 Delete from Alumnos
	where nota < (select avg(nota) from Alumnos);

-- 56 - Subconsultas con in

 If (object_id('Ciudades')) is not null
	drop table Ciudades;

 If (object_id('Clientes')) is not null
	drop table Clientes;

Create table Ciudades(
	codigo tinyint identity,
	nombre varchar(20),
	primary key (codigo)
);

Create table Clientes (
	codigo int identity,
	nombre varchar(30),
	domicilio varchar(30),
	codigociudad tinyint not null,
	primary key(codigo),
	constraint FK_clientes_ciudad
	foreign key (codigociudad)
	references ciudades(codigo)
	on update cascade,
);

Insert into Ciudades (nombre)values('Cordoba');
Insert into Ciudades (nombre)values('Cruz del Eje');
Insert into Ciudades (nombre)values('Carlos Paz');
Insert into Ciudades (nombre)values('La Falda');
Insert into Ciudades (nombre)values('Villa Maria');
			
Insert into Clientes values('Lopez Marcos','Colon 111',1);
Insert into Clientes values('Lopez Hector','San Martin 222',1);
Insert into Clientes values('Perez Ana','San Martin 333',2);
Insert into Clientes values('Garcia Juan','Rivadavia 444',3);
Insert into Clientes values('Perez Luis','Sarmiento 555',3);
Insert into Clientes values('Gomez Ines','San Martin 666',4);
Insert into Clientes values('Torres Fabiola','Alem 777',5);
Insert into Clientes values('Garcia Luis','Sucre 888',5);

Select nombre from Ciudades
	where codigo in (
		select codigociudad
		from Clientes
		where domicilio like 'San Martin %'
	);

Select distinct ci.nombre from Ciudades as ci
	join clientes as cl
	on codigociudad=ci.codigo
	where domicilio like 'San Martin%';

 Select nombre from Ciudades
	where codigo not in (
		select codigociudad from Clientes
		where nombre like 'G%'
	);

Select codigociudad from Clientes
	where nombre like 'G%';

-- 57 - Subconsultas any - some -all

If object_id('Inscriptos') is not null
	drop table Inscriptos;

If object_id('Socios') is not null
	drop table Socios;

Create table Socios(
	numero int identity,
	documento char(8),
	nombre varchar(30),
	domicilio varchar(30),
	primary key (numero)
);
 
Create table Inscriptos (
	numerosocio int not null,
	deporte varchar(20) not null,
	cuotas tinyint
	constraint CK_inscriptos_cuotas
	check (cuotas >= 0 and cuotas <= 10)
	constraint DF_inscriptos_cuotas default 0,
	primary key(numerosocio,deporte),
	constraint FK_inscriptos_socio
	foreign key (numerosocio)
	references socios(numero)
	on update cascade
	on delete cascade,
);

Insert into Socios values('23333333','Alberto Paredes','Colon 111');
Insert into Socios values('24444444','Carlos Conte','Sarmiento 755');
Insert into Socios values('25555555','Fabian Fuentes','Caseros 987');
Insert into Socios values('26666666','Hector Lopez','Sucre 344');

Insert into Inscriptos values(1,'tenis',1);
Insert into Inscriptos values(1,'basquet',2);
Insert into Inscriptos values(1,'natacion',1);
Insert into Inscriptos values(2,'tenis',9);
Insert into Inscriptos values(2,'natacion',1);
Insert into Inscriptos values(2,'basquet',default);
Insert into Inscriptos values(2,'futbol',2);
Insert into Inscriptos values(3,'tenis',8);
Insert into Inscriptos values(3,'basquet',9);
Insert into Inscriptos values(3,'natacion',0);
Insert into Inscriptos values(4,'basquet',10);

Select numero,nombre,deporte from socios as s
  join Inscriptos as i
  on numerosocio=numero;

Select nombre from Socios
   join inscriptos as i
   on numero=numerosocio
   where deporte='natacion' and 
   numero= any (
  		select numerosocio
  		from inscriptos as i
  		where deporte = 'tenis'
  	);
  
Select deporte from Inscriptos as i
  where numerosocio = 1 and deporte= any
    (
		select deporte from inscriptos as i
		where numerosocio=2
	);

Select i1.deporte from Inscriptos as i1
	join Inscriptos as i2
	on i1.deporte=i2.deporte
	where i1.numerosocio = 1 and i2.numerosocio = 2;

Select deporte from Inscriptos as i
	where numerosocio = 2 and cuotas > any
	(	select cuotas from Inscriptos
			where numerosocio=1
	);


Select deporte from Inscriptos as i
  where numerosocio=2 and cuotas > all
  (	select cuotas from inscriptos
		where numerosocio = 1
   );

Delete from Inscriptos
  where numerosocio = any 
  (
	select numerosocio from Inscriptos
		where cuotas = 0
   );

-- 58 - Subconsultas correlacionadas

If object_id('Inscriptos') is not null
	drop table Inscriptos;

If object_id('Socios') is not null
	drop table Socios;

Create table Socios(
	numero int identity,
	documento char(8),
	nombre varchar(30),
	domicilio varchar(30),
	primary key (numero)
);
 
Create table Inscriptos(
	numerosocio int not null,
	deporte varchar(20) not null,
	cuotas tinyint
	constraint CK_inscriptos_cuotas
	 check (cuotas >= 0 and cuotas <= 10)
	constraint DF_inscriptos_cuotas default 0,
	primary key(numerosocio,deporte),
	constraint FK_inscriptos_socio
	 foreign key (numerosocio)
	 references Socios(numero)
	 on update cascade
	 on delete cascade,
);

Insert into Socios values('23333333','Alberto Paredes','Colon 111');
Insert into Socios values('24444444','Carlos Conte','Sarmiento 755');
Insert into Socios values('25555555','Fabian Fuentes','Caseros 987');
Insert into Socios values('26666666','Hector Lopez','Sucre 344');

Insert into Inscriptos values(1,'tenis',1);
Insert into Inscriptos values(1,'basquet',2);
Insert into Inscriptos values(1,'natacion',1);
Insert into Inscriptos values(2,'tenis',9);
Insert into Inscriptos values(2,'natacion',1);
Insert into Inscriptos values(2,'basquet',default);
Insert into Inscriptos values(2,'futbol',2);
Insert into Inscriptos values(3,'tenis',8);
Insert into Inscriptos values(3,'basquet',9);
Insert into Inscriptos values(3,'natacion',0);
Insert into Inscriptos values(4,'basquet',10);

Select nombre,domicilio,
  (select count(*) from Inscriptos as i
    where s.numero = i.numerosocio) as 'deportes' from Socios as s;

Select nombre,
  (	select (count(*)*10) from Inscriptos as i
    where s.numero = i.numerosocio) as total,
  (	select sum(i.cuotas) from Inscriptos as i
    where s.numero=i.numerosocio) as pagas
	from socios as s;

Select nombre, count(i.deporte)*10 as total,
	sum(i.cuotas) as pagas	from Socios as s
	join Inscriptos as i
	on numero=numerosocio
	group by nombre;

-- 59 - Exists y No Exists 

If object_id('Inscriptos') is not null
	drop table Inscriptos;

If object_id('Socios') is not null
	drop table Socios;

Create table Socios(
	numero int identity,
	documento char(8),
	nombre varchar(30),
	domicilio varchar(30),
	primary key (numero)
);
 
Create table Inscriptos(
	numerosocio int not null,
	deporte varchar(20) not null,
	cuotas tinyint
	constraint CK_inscriptos_cuotas
	 check (cuotas>=0 and cuotas<=10)
	constraint DF_inscriptos_cuotas default 0,
	primary key(numerosocio,deporte),
	constraint FK_inscriptos_socio
	 foreign key (numerosocio)
	 references Socios(numero)
	 on update cascade
	 on delete cascade,
);

Insert into Socios values('23333333','Alberto Paredes','Colon 111');
Insert into Socios values('24444444','Carlos Conte','Sarmiento 755');
Insert into Socios values('25555555','Fabian Fuentes','Caseros 987');
Insert into Socios values('26666666','Hector Lopez','Sucre 344');

Insert into Inscriptos values(1,'tenis',1);
Insert into Inscriptos values(1,'basquet',2);
Insert into Inscriptos values(1,'natacion',1);
Insert into Inscriptos values(2,'tenis',9);
Insert into Inscriptos values(2,'natacion',1);
Insert into Inscriptos values(2,'basquet',default);
Insert into Inscriptos values(2,'futbol',2);
Insert into Inscriptos values(3,'tenis',8);
Insert into Inscriptos values(3,'basquet',9);
Insert into Inscriptos values(3,'natacion',0);
Insert into Inscriptos values(4,'basquet',10);

Select nombre from Socios as s
  where exists	
  (select *from Inscriptos as i
  where s.numero = i.numerosocio and i.deporte = 'natacion');

Select nombre from Socios as s
  where not exists
  (select *from Inscriptos as i
   where s.numero = i.numerosocio and i.deporte = 'natacion');

Select s.* from Socios as s
  where exists
  (select *from Inscriptos as i
  where s.numero = i.numerosocio and i.cuotas = 10);

-- 60 - Subconsulta en lugar de una tabla 

If object_id('Inscriptos') is not null
	drop table Inscriptos;
 
If object_id('Socios') is not null
	drop table Socios;
 
If object_id('Deportes') is not null
	drop table Deportes;

Create table Socios(
	documento char(8) not null, 
	nombre varchar(30),
	domicilio varchar(30),
	primary key(documento)
);
 
Create table Deportes(
	codigo tinyint identity,
	nombre varchar(20),
	profesor varchar(15),
	primary key(codigo)
 );

Create table Inscriptos(
	documento char(8) not null, 
	codigodeporte tinyint not null,
	año char(4),
	matricula char(1),
	primary key(documento,codigodeporte,año),
	constraint FK_inscriptos_socio
	 foreign key (documento)
	 references Socios(documento)
	 on update cascade
	 on delete cascade
);

Insert into Socios values('22222222','Ana Acosta','Avellaneda 111');
Insert into Socios values('23333333','Betina Bustos','Bulnes 222');
Insert into Socios values('24444444','Carlos Castro','Caseros 333');
Insert into Socios values('25555555','Daniel Duarte','Dinamarca 44');

Insert into Deportes values('basquet','Juan Juarez');
Insert into Deportes values('futbol','Pedro Perez');
Insert into Deportes values('natacion','Marina Morales');
Insert into Deportes values('tenis','Marina Morales');

Insert into Inscriptos values('22222222',3,'2006','s');
Insert into Inscriptos values('23333333',3,'2006','s');
Insert into Inscriptos values('24444444',3,'2006','n');
Insert into Inscriptos values('22222222',3,'2005','s');
Insert into Inscriptos values('22222222',3,'2007','n');
Insert into Inscriptos values('24444444',1,'2006','s');
Insert into Inscriptos values('24444444',2,'2006','s');

Select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor
	from Deportes as d
	join Inscriptos as i
	on d.codigo = i.codigodeporte;

Select s.nombre,td.deporte,td.profesor,td.año,td.matricula
	from Socios as s
	join (select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor
		from Deportes as d
		join Inscriptos as i
		on d.codigo=i.codigodeporte) as td
	on td.documento=s.documento;

-- 61 - Subconsulta (update - delete)

If object_id('Inscriptos') is not null
	drop table Inscriptos;

If object_id('Socios') is not null
	drop table Socios;

Create table Socios(
	numero int identity,
	documento char(8),
	nombre varchar(30),
	domicilio varchar(30),
	primary key (numero)
);
 
Create table Inscriptos (
	numerosocio int not null,
	deporte varchar(20) not null,
	matricula char(1),-- 'n' o 's'
	primary key(numerosocio,deporte),
	constraint FK_inscriptos_socio
	 foreign key (numerosocio)
	 references Socios(numero)
);

Insert into Socios values('23333333','Alberto Paredes','Colon 111');
Insert into Socios values('24444444','Carlos Conte','Sarmiento 755');
Insert into Socios values('25555555','Fabian Fuentes','Caseros 987');
Insert into Socios values('26666666','Hector Lopez','Sucre 344');

Insert into Inscriptos values(1,'tenis','s');
Insert into Inscriptos values(1,'basquet','s');
Insert into Inscriptos values(1,'natacion','s');
Insert into Inscriptos values(2,'tenis','s');
Insert into Inscriptos values(2,'natacion','s');
Insert into Inscriptos values(2,'basquet','n');
Insert into Inscriptos values(2,'futbol','n');
Insert into Inscriptos values(3,'tenis','s');
Insert into Inscriptos values(3,'basquet','s');
Insert into Inscriptos values(3,'natacion','n');
Insert into Inscriptos values(4,'basquet','n');

Update Inscriptos set matricula='s'
  where numerosocio =( select numero from Socios
     where documento = '25555555');

Delete from inscriptos
  where numerosocio in	
  (		select numero from Socios as s
		join Inscriptos
		on numerosocio = numero
		where matricula = 'n'
   );

-- 62 - Subconsulta (insert)

If object_id('Facturas') is not null
	drop table Facturas;

If object_id('Clientes') is not null
	drop table Clientes;

Create table Clientes(
	codigo int identity,
	nombre varchar(30),
	domicilio varchar(30),
	primary key(codigo)
);

Create table Facturas(
	numero int not null,
	fecha datetime,
	codigocliente int not null,
	total decimal(6,2),
	primary key(numero),
	constraint FK_facturas_cliente
	 foreign key (codigocliente)
	 references Clientes(codigo)
	 on update cascade
);

Insert into Clientes values('Juan Lopez','Colon 123');
Insert into Clientes values('Luis Torres','Sucre 987');
Insert into Clientes values('Ana Garcia','Sarmiento 576');
Insert into Clientes values('Susana Molina','San Martin 555');

Insert into Facturas values(1200,'2007-01-15',1,300);
Insert into Facturas values(1201,'2007-01-15',2,550);
Insert into Facturas values(1202,'2007-01-15',3,150);
Insert into Facturas values(1300,'2007-01-20',1,350);
Insert into Facturas values(1310,'2007-01-22',3,100);

If object_id ('Clientespref') is not null
	drop table clientespref;
 
Create table Clientespref(
	nombre varchar(30),
	domicilio varchar(30)
);

Insert into Clientespref
  select nombre,domicilio from Clientes 
   where codigo in 
	(select codigocliente from clientes as c
     join Facturas as f
     on codigocliente=codigo
     group by codigocliente
     having sum(total) > 500);

 Select * from clientespref;

-- 63 - Crear table a partir de otra (select - into)

If object_id('Empleados')is not null
	drop table Empleados;

If object_id('Sucursales')is not null
	drop table Sucursales;

Create table Sucursales( 
	codigo int identity,
	ciudad varchar(30) not null,
	primary key(codigo)
); 

Create table Empleados( 
	documento char(8) not null,
	nombre varchar(30) not null,
	domicilio varchar(30),
	seccion varchar(20),
	sueldo decimal(6,2),
	codigosucursal int,
	primary key(documento),
	constraint FK_empleados_sucursal
	 foreign key (codigosucursal)
	 references Sucursales(codigo)
	 on update cascade
); 

Insert into Sucursales values('Cordoba');
Insert into Sucursales values('Villa Maria');
Insert into Sucursales values('Carlos Paz');
Insert into Sucursales values('Cruz del Eje');

Insert into Empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
Insert into Empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
Insert into Empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
Insert into Empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
Insert into Empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
Insert into Empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
Insert into Empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
Insert into Empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);

Select documento,nombre,domicilio,seccion,sueldo,ciudad from Empleados
  join Sucursales on codigosucursal=codigo;

 If object_id('Secciones') is not null
	drop table Secciones;

Select distinct Seccion as nombre
  into Secciones
  from Empleados;

Select *from Secciones;

If object_id('Sueldosxseccion') is not null
	drop table Sueldosxseccion;

Select Seccion, sum(sueldo) as total
	into Sueldosxseccion
	from Empleados
	group by seccion;

Select *from Sueldosxseccion;

If object_id('Maximossueldos') is not null
	drop table Maximossueldos;

Select top 3 * into maximossueldos from Empleados
	order by sueldo;

Select *from Maximossueldos;

If object_id('SucursalCordoba') is not null
	drop table SucursalCordoba;

Select nombre,ciudad
	into sucursalCordoba from Empleados
	join Sucursales
	on codigosucursal = codigo
	where ciudad = 'Cordoba';

Select *from SucursalCordoba;

-- 65 - Vistas

If object_id('Inscriptos') is not null  
  drop table Inscriptos;

If object_id('Socios') is not null  
	drop table Socios;

If object_id('Profesores') is not null  
	drop table Profesores; 

If object_id('Cursos') is not null  
  drop table Cursos;

Create table Socios(
	documento char(8) not null,
	nombre varchar(40),
	domicilio varchar(30),
	constraint PK_socios_documento
	 primary key (documento)
);

Create table Profesores(
	documento char(8) not null,
	nombre varchar(40),
	domicilio varchar(30),
	constraint PK_profesores_documento
	 primary key(documento)
);

Create table Cursos(
	numero tinyint identity,
	deporte varchar(20),
	dia varchar(15),
	constraint CK_inscriptos_dia check (dia in('lunes','martes','miercoles','jueves','viernes','sabado')),
	documentoprofesor char(8),
	constraint PK_cursos_numero
	primary key(numero),
);

Create table Inscriptos(
	documentosocio char(8) not null,
	numero tinyint not null,
	matricula char(1),
	constraint CK_inscriptos_matricula check (matricula in('s','n')),
	constraint PK_inscriptos_documento_numero
	primary key(documentosocio,numero)
);

Insert into Socios values('30000000','Fabian Fuentes','Caseros 987');
Insert into Socios values('31111111','Gaston Garcia','Guemes 65');
Insert into Socios values('32222222','Hector Huerta','Sucre 534');
Insert into Socios values('33333333','Ines Irala','Bulnes 345');

Insert into Profesores values('22222222','Ana Acosta','Avellaneda 231');
Insert into Profesores values('23333333','Carlos Caseres','Colon 245');
Insert into Profesores values('24444444','Daniel Duarte','Sarmiento 987');
Insert into Profesores values('25555555','Esteban Lopez','Sucre 1204');

Insert into Cursos values('tenis','lunes','22222222');
Insert into Cursos values('tenis','martes','22222222');
Insert into Cursos values('natacion','miercoles','22222222');
Insert into Cursos values('natacion','jueves','23333333');
Insert into Cursos values('natacion','viernes','23333333');
Insert into Cursos values('futbol','sabado','24444444');
Insert into Cursos values('futbol','lunes','24444444');
Insert into Cursos values('basquet','martes','24444444');

Insert into Inscriptos values('30000000',1,'s');
Insert into Inscriptos values('30000000',3,'n');
Insert into Inscriptos values('30000000',6,null);
Insert into Inscriptos values('31111111',1,'s');
Insert into Inscriptos values('31111111',4,'s');
Insert into Inscriptos values('32222222',8,'s');

If object_id('Vista_club')is not null 
	drop view Vista_club;

Create view Vista_club as
	select s.nombre as socio,s.documento as docsocio,s.domicilio as domsocio,c.deporte,dia,
	p.nombre as Profesor, matricula
	from Socios as s
	full join Inscriptos as i
	on s.documento = i.documentosocio
	full join Cursos as c
	on i.numero = c.numero
	full join Profesores as p
	on c.documentoprofesor = p.documento;

Select *from vista_club;

Select deporte,dia, count(socio) as cantidad
	from Vista_club
	where deporte is not null
	group by deporte,dia
	order by cantidad;

Select deporte,dia from Vista_club
	where socio is null and deporte is not null;

Select socio from Vista_club
	where deporte is null and socio is not null;

Select profesor from Vista_club where deporte is null and profesor is not null;

Select socio, docsocio from Vista_club where deporte is not null and matricula <> 's';

Select distinct profesor,dia from Vista_club where profesor is not null;

Select distinct profesor,dia from Vista_club 
	where profesor is not null
	order by dia;

Select socio from Vista_club
	where deporte = 'tenis' and dia = 'lunes';

If object_id('Vista_inscriptos')is not null
	drop view Vista_inscriptos;

Create view Vista_inscriptos as
	select deporte,dia,
	 (select count(*)
	  from Inscriptos as i
	  where i.numero = c.numero) as cantidad
	from Cursos as c;

Select *from Vista_inscriptos;

-- 67 - Lenguaje de control de flujo (case)

If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	documento char(8) not null,
	nombre varchar(30) not null,
	sexo char(1),
	fechanacimiento datetime,
	fechaingreso datetime,
	cantidadhijos tinyint,
	sueldo decimal(5,2),
	primary key(documento)
);

Insert into Empleados values('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
Insert into Empleados values('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
Insert into Empleados values('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
Insert into Empleados values('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
Insert into Empleados values('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400);
Insert into Empleados values('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
Insert into Empleados values('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
Insert into Empleados values('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
Insert into Empleados values('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

Select sexo, count(*) as cantidad, obsequio =
  case 
	when sexo = 'f' then 'rosas'
   else 'corbata'
  end
  from Empleados
  where datepart(month,fechanacimiento) = 5
  group by sexo;

Select nombre,datepart(year,fechaingreso) as añoingreso,
  datepart(year,getdate())-datepart(year,fechaingreso) as AñosdeServicio, placa=
   case (datepart(year,getdate())-datepart(year,fechaingreso)) %10
     when 0 then 'Si'  
     else 'No'
   end
  from Empleados
  where datepart(month,fechaingreso) = 4;

Select nombre,sueldo,cantidadhijos,porhijo=
  case 
		when sueldo<=500 then 200
   else 100
  end, salariofamilar = 
  case
	when sueldo <= 500 then 200 * cantidadhijos
  else 100 * cantidadhijos
  end, sueldototal=
  case
		when sueldo<=500 then sueldo+(200*cantidadhijos)
   else sueldo + (100*cantidadhijos)
  end
  from Empleados
  order by sueldototal;

-- 68 - Lenguaje de control de flujo (if)

--- Primer problema
If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	documento char(8) not null,
	nombre varchar(30) not null,
	sexo char(1),
	fechanacimiento datetime,
	sueldo decimal(5,2),
	primary key(documento)
);

Insert into Empleados values('22333111','Juan Perez','m','1970-05-10',550);
Insert into Empleados values('25444444','Susana Morales','f','1975-11-06',650);
Insert into Empleados values('20111222','Hector Pereyra','m','1965-03-25',510);
Insert into Empleados values('30000222','Luis LUque','m','1980-03-29',700);
Insert into Empleados values('20555444','Laura Torres','f','1965-12-22',400);
Insert into Empleados values('30000234','Alberto Soto','m','1989-10-10',420);
Insert into Empleados values('20125478','Ana Gomez','f','1976-09-21',350);
Insert into Empleados values('24154269','Ofelia Garcia','f','1974-05-12',390);
Insert into Empleados values('30415426','Oscar Torres','m','1978-05-02',400);

If exists(select * from Empleados
	where datepart(month,fechanacimiento) = 5)
	     (select sexo,count(*) as cantidad from Empleados
   where datepart(month,fechanacimiento) = 5 group by sexo)
		else select 'No hay empleados que cumplan en mayo';

--- Segundo problema

If object_id('Entradas') is not null
	drop table Entradas;

Create table Entradas(
	sala tinyint,
	fechahora datetime,
	capacidad smallint,
	entradasvendidas smallint,
	primary key(sala,fechahora)
);

Insert into Entradas values(1,'2006-05-10 20:00',300,50);
Insert into Entradas values(1,'2006-05-10 23:00',300,250);
Insert into Entradas values(2,'2006-05-10 20:00',400,350);
Insert into Entradas values(2,'2006-05-11 20:00',400,380);
Insert into Entradas values(2,'2006-05-11 23:00',400,400);
Insert into Entradas values(3,'2006-05-12 20:00',350,350);
Insert into Entradas values(3,'2006-05-12 22:30',350,100);
Insert into Entradas values(4,'2006-05-12 20:00',250,0);

If exists 
	(select * from entradas where capacidad>entradasvendidas)
	select sala,fechahora,capacidad-entradasvendidas as disponibles
	from Entradas
	where capacidad > entradasvendidas
	else select 'Todas las entradas estan agotadas';

-- 70 - Procedimientos almacenados (crear - ejecutar) 
 
If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	documento char(8),
	nombre varchar(20),
	apellido varchar(20),
	sueldo decimal(6,2),
	cantidadhijos tinyint,
	seccion varchar(20),
	primary key(documento)
);

Insert into Empleados values('22222222','Juan','Perez',300,2,'Contaduria');
Insert into Empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
Insert into Empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
Insert into Empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
Insert into Empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

If object_id('Pa_empleados_sueldo') is not null
	drop procedure pa_empleados_sueldo;

Create procedure Pa_empleados_sueldo as
	select nombre,apellido,sueldo
	from empleados;

Exec pa_empleados_sueldo;

If object_id('Pa_empleados_hijos') is not null
	drop procedure Pa_empleados_hijos;

Create procedure pa_empleados_hijos as
	select nombre,apellido,cantidadhijos
	from empleados
	where cantidadhijos > 0;

Exec pa_empleados_hijos;

Update empleados set cantidadhijos = 1 
	where documento = '22333333';
 
Exec pa_empleados_hijos;

-- 73 - Funciones escalares (crear y llamar)

--- Primer problema

If object_id('Consultas') is not null
	drop table Consultas;

If object_id('Medicos') is not null
	drop table Medicos;

Create table Medicos (
	documento char(8) not null,
	nombre varchar(30),
	constraint PK_medicos 
	primary key clustered(documento)
);

Create table Consultas(
	fecha datetime,
	medico char(8) not null,
	paciente varchar(30),
	constraint PK_consultas
	primary key(fecha,medico),
	constraint FK_consultas_medico
	foreign key (medico)
	references Medicos(documento)
	on update cascade
	on delete cascade
 );

Insert into Medicos values('22222222','Alfredo Acosta');
Insert into Medicos values('23333333','Pedro Perez');
Insert into Medicos values('24444444','Marcela Morales');

Insert into Consultas values('2007/03/26 8:00','22222222','Juan Juarez');
Insert into Consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
Insert into Consultas values('2007/03/26 8:30','22222222','Nora Norte');
Insert into Consultas values('2007/03/28 9:00','22222222','Juan Juarez');
Insert into Consultas values('2007/03/29 8:00','24444444','Nora Norte');
Insert into Consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
Insert into Consultas values('2007/03/24 9:30','23333333','Hector Huerta');

If object_id('f_nombreDia') is not null
	drop function f_nombreDia;

Create function f_nombreDia(
	@fecha varchar(30))
	  returns varchar(10)
	  as
	  begin
		declare @nombre varchar(10)
		set @nombre='Fecha inválida'   
		if (isdate(@fecha)=1)
		begin
		  set @fecha=cast(@fecha as datetime)
		  set @nombre=
		  case datename(weekday,@fecha)
		   when 'Monday' then 'lunes'
		   when 'Tuesday' then 'martes'
		   when 'Wednesday' then 'miércoles'
		   when 'Thursday' then 'jueves'
		   when 'Friday' then 'viernes'
		   when 'Saturday' then 'sábado'
		   when 'Sunday' then 'domingo'
		  end
		end
		return @nombre
	 end;
 
If object_id('f_horario') is not null
	drop function f_horario;

Create function f_horario(
	  @fecha varchar(30))
	  returns varchar(5)
	  as
	  begin
		declare @nombre varchar(5)
		set @nombre='Fecha inválida'   
		if (isdate(@fecha)=1)
		begin
		  set @fecha=cast(@fecha as datetime)
		  set @nombre=rtrim(cast(datepart(hour,@fecha) as char(2)))+':'
		  set @nombre=@nombre+rtrim(cast(datepart(minute,@fecha) as char(2)))
		end--si es una fecha válida
		return @nombre
	 end;

 if object_id('f_fecha') is not null
  drop function f_fecha;

 create function f_fecha
 (@fecha varchar(30))
  returns varchar(12)
  as
  begin
    declare @nombre varchar(12)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=rtrim(cast(datepart(day,@fecha) as char(2)))+'/'
      set @nombre=@nombre+rtrim(cast(datepart(month,@fecha) as char(2)))+'/'
      set @nombre=@nombre+rtrim(cast(datepart(year,@fecha) as char(4)))
    end--si es una fecha válida
    return @nombre
 end;

Select dbo.f_nombredia(fecha) as dia,
	dbo.f_fecha(fecha) as fecha,
	dbo.f_horario(fecha) as horario,
	paciente
	from Consultas as c
	join Medicos as m
	on m.documento=c.medico
	where m.nombre='Alfredo Acosta';

Select fecha, m.nombre from Consultas as c
	join Medicos as m
	on m.documento=c.medico
	where dbo.f_nombredia(fecha)='Sábado';

Declare @valor char(30) set @valor='2007/04/09' 
	select dbo.f_nombreDia(@valor);

--- Segundo problema

If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	documento char(8) not null,
	nombre varchar(30),
	fechanacimiento datetime,
	fechaingreso datetime,
	telefono char(12),
	mail varchar(50)
);

Insert into Empleados values('22222222', 'Ana Acosta', '1970/10/02', '1995/10/10', '4556677', 'anitaacosta@hotmail.com');
Insert into Empleados values('25555555', 'Bernardo Bustos', '1973/01/15', '1999/02/15', '4789012', null);
Insert into Empleados values('30000000', 'Carlos Caseros', '1980/5/25', '2001/05/05', null, null);
Insert into Empleados values('32222222', 'Estela Esper', '1985/02/20', '2006/12/12', null, 'estelaesper@gmail.com');

If object_id('f_edad') is not null
	drop function f_edad;

Create function f_edad(
	@fechaactual datetime,
	@fecha datetime='2007/01/01'
 )
 returns tinyint
 as
 begin
    declare @edad tinyint
    set @edad = null
    if( @fechaactual >= @fecha )
    begin
      set @edad = datepart(year,@fechaactual)-datepart(year,@fecha)
      if(datepart(month,@fecha)>datepart(month,@fechaactual))
       set @edad=@edad-1
      else 
        if (datepart(month,@fecha)=datepart(month,@fechaactual)) and 
			(datepart(day,@fecha)>datepart(day,@fechaactual))
          set @edad=@edad-1
    end
    return @edad
  end;

Select nombre, dbo.f_edad(getdate(),fechanacimiento) as edad
  from Empleados;

Select nombre, dbo.f_edad(fechaingreso,fechanacimiento) as 'Edad al ingresar',
   dbo.f_edad(getdate(),fechaingreso) as 'Años de servicio'
  from Empleados;

Select dbo.f_edad(getdate(),'1971/05/25');

Select dbo.f_edad();

Select dbo.f_edad(getdate(),default);

If object_id('f_valorNulo') is not null
	drop function f_valorNulo;

Create function f_valorNulo(
	@valor varchar(50))
	returns varchar(50)
	begin
		if @valor is null
		 set @valor='No tiene'
		return @valor
	end;

Select documento,nombre,fechanacimiento,
	dbo.f_valorNulo(telefono) as telefono,
	dbo.f_valorNulo(mail) as mail
	from Empleados;

-- 74 - Funciones de tabla de varias instrucciones

If object_id('Empleados') is not null
	drop table Empleados;

Create table Empleados(
	documento char(8) not null,
	apellido varchar(30) not null,
	nombre varchar(30) not null,
	domicilio varchar(30),
	ciudad varchar(30),
	fechanacimiento datetime,
	constraint PK_empleados
	primary key(documento)
);

Insert into Empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
Insert into Empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
Insert into Empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
Insert into Empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');

If object_id('f_empleados') is not null
	drop function f_empleados;

Create function f_empleados
 (
	@opcion varchar(10)
 )
 returns @listado table(
	documento char(8),
	nombre varchar(60),
	domicilio varchar(60),
	nacimiento varchar(12))
 as 
	begin
		if @opcion not in ('total','parcial')
			set @opcion='parcial'
		if @opcion='total'
			insert @listado 
			select documento,
			(apellido+' '+nombre),
			(domicilio+' ('+ciudad+')'), 
			cast(fechanacimiento as varchar(12))
			from Empleados
		else
		 insert @listado
		 select documento,apellido,ciudad,cast(datepart(year,fechenacimiento) as char(4))
		 from Empleados
		return
	end;

Select * from dbo.f_empleados('total');

Select * from dbo.f_empleados();

Select * from dbo.f_empleados('');

Select * from dbo.f_empleados('parcial')
	where domicilio='Cordoba';