use parque;


create table  parque_nacional(
	id_parque int not null auto_increment,
    primary key(id_parque),
    nombre varchar(50),
    fecha datetime
);

create table entidad(
	id_entidad int not null auto_increment, 
    primary key (id_entidad),
    nombre varchar(50)
);

create table depto(
	id_depto int not null auto_increment,
    primary key(id_depto),
    id_entidad int not null,
    foreign key(id_entidad) references entidad(id_entidad)
);

create table depto_parque(
	id_depto_parque int not null auto_increment,
    primary key (id_depto_parque),
    id_depto int,
    foreign key(id_depto) references depto(id_depto)
);

create table area_parque(
	id_area_parque int not null auto_increment, 
    primary key  (id_area_parque),
    nombre varchar(50),
    extension double,
    fk_id_parque int,
    foreign key(fk_id_parque) references parque_nacional(id_parque)
);

create table tipo_especie(
	id_tipo_especie int not null auto_increment,
    primary key (id_tipo_especie),
    descripcion varchar(200)
);

create table especie(
	id_especie int not null auto_increment,
    primary key (id_especie),
    denom_cientifica varchar(50),
    denom_vulgar varchar(50),
    num_inventario int,
    fk_area_parque int not null,
    foreign key (fk_area_parque) references area_parque(id_area_parque),
    fk_tipo_especie int not null, 
    foreign key(fk_tipo_especie) references tipo_especie(id_tipo_especie)
);

create table trabajador(
	id_trabajador int not null auto_increment,
    primary key (id_trabajador),
    nombre varchar(50),
    cedula int,
    direccion varchar (50),
    sueldo double,
    fk_id_parque int,
    foreign key (fk_id_parque) references parque_nacional(id_parque)
);

create table telefono(
	id_telefono int not null auto_increment,
    primary key (id_telefono),
    num_fijo int,
    num_movil int,
    fk_id_trabajador int not null,
    foreign key(fk_id_trabajador) references trabajador(id_trabajador)
);

create table gestion_trabajador(
	id_gestion_trabajador int not null auto_increment,
    primary key (id_gestion_trabajador),
    estado varchar(45),
    fk_id_trabajador int,
    foreign key (fk_id_trabajador) references trabajador(id_trabajador),
    fk_id_area_parque int, 
    foreign key (fk_id_area_parque) references area_parque(id_area_parque)
);

create table entrada(
	id_entrada int not null auto_increment,
    primary key (id_entrada),
    num_entrada int,
    ubicacion varchar(50),
    fk_id_parque int,
    foreign key (fk_id_parque) references parque_nacional(id_parque)
)

select * from parque_nacional;
select * from entidad;
select * from depto;
select * from depto_parque;
select * from area_parque;
select * from tipo_especie;
select * from especie;
select * from trabajador;
select * from telefono;
select* from gestion_trabajador;
 