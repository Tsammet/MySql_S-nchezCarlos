
-- ##############################
-- ###### EJERCICIO DIA 4  ######
-- ##############################

-- creo la base de datos paises
create database paises;

-- uso base de datos
use paises;

-- creo tabla de paìs
create table pais(
	id_pais int not null auto_increment,
	primary key(id_pais),
	nombre varchar(20),
	continente varchar(50),
	poblacion int
);

-- inserto datos a paìs
insert into pais (nombre, continente, poblacion) 
values ("Colombia", "America", "50000000"), ("Corea Del Sur", "Asia", "25000000"), ("Estados Unidos", "America", "60000000"), 
("Francia", "Europa", "15000000"), ("España", "Europa", "7000000"), ("Brasil", "America", "80000000"), ("Italia", "Europa", "25200000"),
("Alemania", "Europa", "255000000"), ("Russia", "Asia", "15000000")

select * from pais;

-- creo tabla ciudad
create table ciudad(
	id_ciudad int not null auto_increment,
	primary key (id_ciudad),
	nombre varchar(20),
	id_pais int,
	foreign key (id_pais) references pais(id_pais)
);

-- inserto datos a ciudad
insert into ciudad (nombre, id_pais)
values ("Bogotà", 1),("Seùl", 2),("Washintong D.C", 3),("Paris", 4),("Barcelona", 5),("Rio de Janeiro", 6),("Roma", 7),("Frankfurt", 8),("Moscú", 9)

select * from ciudad;

-- creo tabla idioma
create table idioma(
	id_idioma int not null auto_increment, 
	primary key (id_idioma),
	idioma varchar(50)
);

-- inserto datos a idioma
insert into idioma (idioma)
values ("Español"),("Coreano"),("Inglés"),("Frances"),("Portugues"),("Italiano"),("Aleman"),("Ruso")

select * from idioma;

-- creo tabla idioma_pais
create table idioma_pais(
	id_idioma int,
	foreign key(id_idioma) references idioma(id_idioma),
	id_pais int,
	foreign key(id_pais) references pais(id_pais),
	es_oficial tinyint(1)
);
-- inserto datos a idioma_pais
insert into idioma_pais(id_idioma, id_pais, es_oficial)
values (1,1,1), (2,1,0),(1,3,0), (3,4,0),(4,4,1), (7,8,1), (1,2,0), (2,2,1)

select * from idioma_pais


-- Desarrollado por Pedro Gomez - C.C:1.***.***.666

