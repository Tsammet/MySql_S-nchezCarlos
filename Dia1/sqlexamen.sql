create database ex10_3_sql_sanchez_carlos;
use ex10_3_sql_sanchez_carlos;
create table usuario (
	id_user int not null auto_increment,
	primary key(id_user),
	first_name varchar(50) not null,
	last_name varchar(50) not null
);

insert into usuario(first_name, last_name) values
("Carlos", "Diaz"),
('Silvia', 'Angarita'),
('Olfer', 'Olaya'),
('Juan', 'Pablo'),
('Laura', 'Rodríguez'),
('José', 'Sánchez'),
('Ana', 'López'),
('Miguel', 'Hernández'),
('Sofía', 'Díaz'),
('David', 'Moreno'),
('Paula', 'Ruiz');

select * from usuario;

create table product(
	id_product int not null auto_increment,
	primary key(id_product),
	name varchar(50)
);

insert into product(name) values
('Software de edición de imágenes'),
('Música'),
('Película - HD'),
('Libro electrónico - PDF'),
('Videojuego - Steam Key'),
('Plantilla de sitio web - HTML'),
('Curso en línea - Video HD'),
('Aplicación móvil - Android'),
('Fondo de pantalla - 4K'),
('Ebook - ePub'),
('Plugins para software de diseño gráfico');

select * from product;

create table Download (
	ID_download int not null auto_increment,
	primary key(ID_download),
	id_user int not null,
	foreign key(id_user) references usuario(id_user),
	id_product int not null,
	foreign key(id_product) references product (id_product),
	download_date datetime
);

insert into Download(id_user, id_product, download_date) values
(1, 1,NOW()),
(2, 3,NOW()),
(3, 5,NOW()),
(4, 7,NOW()),
(5, 9,NOW()),
(6, 11,NOW()),
(7, 2,NOW()),
(8, 4,NOW()),
(9, 6,NOW()),
(10, 8, NOW()),
(11, 10,NOW());

select * from Download
