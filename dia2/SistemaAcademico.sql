create database sistema_academico;
use sistema_academico;
create table departamento(
	id_departamento int auto_increment not null,
    primary key (id_departamento),
    nombre varchar (50)
);

create table profesor(
	id_profesor int auto_increment not null,
    primary key (id_profesor),
    id_departamento int,
    foreign key (id_departamento) references departamento(id_departamento)
);

ALTER TABLE profesor
ADD COLUMN id_persona INT,
ADD FOREIGN KEY (id_persona) REFERENCES persona(id_persona);
    
create table persona(
	id_persona int auto_increment not null,
    primary key (id_persona),
    nif varchar (9),
    nombre varchar (50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    ciudad varchar (25),
    direccion varchar(50),
    telefono varchar(9),
    fecha_nacimiento date,
    sexo enum("H", "M"),
    tipo enum('...')
);



create table alumno_matricula_asignatura(
	id_alumno int auto_increment not null,
    primary key (id_alumno),
    id_asignatura int,
    id_curso_escolar int
);

 
    

Alter table alumno_matricula_asignatura
add foreign key(id_asignatura) references asignatura (id_asignatura);
Alter table alumno_matricula_asignatura
add foreign key(id_curso_escolar) references curso_escolar (id_curso_escolar);


create table curso_escolar(
	id_curso_escolar int not null auto_increment,
    primary key (id_curso_escolar),
    agnio_inicio date,
    agnio_fin date
);

create table grado(
	id_grado int,
    primary key (id_grado),
    nombre varchar(100)
);

create table asignatura(
	id_asignatura int not null auto_increment,
    primary key (id_asignatura),
    nombre varchar(100),
    creditos int,
    tipo enum('...'),
    curso int,
    cuatrimestre tinyint(3),
    id_profesor int(10),
    foreign key (id_profesor) references profesor(id_profesor),
    id_grado int(10),
    foreign key (id_grado) references grado(id_grado)
    
)
