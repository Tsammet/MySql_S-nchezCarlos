use sistema_academico3;
create table departamento(
	id_departamento int auto_increment,
    primary key (id_departamento),
    nombre varchar (50) not null
);

create table profesor(
	id_profesor int not null auto_increment,
    foreign key (id_profesor) references persona (id_persona),
    id_departamento int not null,
    foreign key (id_departamento) references departamento(id_departamento)
);

create table persona(
	id_persona int not null auto_increment,
    primary key (id_persona),
    nif varchar(50),
    nombre varchar(50) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50),
    ciudad varchar(25) not null,
    direccion varchar (50) not null,
    telefono varchar(9),
    fecha_nacimiento date not null,
    sexo enum('h','m') not null,
    tipo enum ('t1','t2')
    );

create table asignatura(
	id_asignatura int not null auto_increment,
    primary key (id_asignatura),
    nombre varchar(50) not null,
    creditos float not null,
    tipo enum('tipo1', 'tipo2', 'tipo3') not null,
    curso tinyint(3)not null,
    cuatrimestre tinyint(3) not null,
    id_profesor int,
    foreign key(id_profesor) references profesor(id_profesor),
    id_grado int,
    foreign key(id_grado) references grado(id_grado)
);

create table grado(
	id_grado int not null auto_increment,
    primary key(id_grado),
    nombre varchar (100) not null
);

create table alumno_matricula(
	id_alumno int not null,
    foreign key(id_alumno) references persona(id_persona),
    id_asignatura int not null,
    foreign key(id_asignatura) references asignatura(id_asignatura),
    id_curso_escolar int not null,
    foreign key(id_curso_escolar) references curso_escolar(id_curso)
);

create table curso_escolar(
	id_curso int not null auto_increment,
    primary key(id_curso),
    agnio_inicio year(4),
    agnio_fin year(4)
)