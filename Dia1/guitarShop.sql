create database my_guitar_shop
create table Categories(
	category_id int not null auto_increment,
    primary key(category_id),
    category_name varchar(255) not null unique
);

INSERT INTO Categories (category_name) VALUES
('Guitarra eléctrica'),
('Piano de cola'),
('Violín'),
('Batería acústica'),
('Saxofón'),
('Trompeta'),
('Bajo eléctrico'),
('Flauta traversa'),
('Cello'),
('Teclado electrónico'),
('Guitarra acústica');

Select * from Categories;

Create table Products (
	ProductId int not null auto_increment,
    primary key(ProductId),
    Category_id int,
    foreign key (Category_id) References Categories(category_id),
    ProductCode VARCHAR(10) NOT NULL UNIQUE,
	ProductName VARCHAR(255) NOT NULL,
	Descriptio  varchar(500) NOT NULL,
	ListPrice   Double NOT NULL,
	DiscountPercent Double  NOT NULL DEFAULT 0.00,
	DateAdded DATETIME DEFAULT NULL
);

INSERT INTO Products (Category_id, ProductCode, ProductName, Descriptio, ListPrice, DiscountPercent, DateAdded) VALUES
(1,'INS001', 'Guitarra eléctrica Fender Stratocaster', 'Guitarra eléctrica icónica usada en diversos géneros musicales.', 899.99, 0.05, NOW()),
(2,'INS002', 'Piano de cola Yamaha C7', 'Piano de cola profesional adecuado para conciertos y grabaciones de estudio.', 15000.00, 0.10, NOW()),
(3,'INS003', 'Violín Stradivarius', 'Violín de alta gama conocido por su calidad de sonido y artesanía excepcional.', 25000.00, 0.00, NOW()),
(4,'INS004', 'Batería acústica Gretsch Renown Maple', 'Batería acústica de alta calidad adecuada para presentaciones en vivo y estudio.', 2999.99, 0.00, NOW()),
(5,'INS005', 'Saxofón Selmer Mark VI', 'Saxofón tenor de referencia utilizado por músicos de jazz profesionales.', 4500.00, 0.00, NOW()),
(6,'INS006', 'Trompeta Bach Stradivarius', 'Trompeta profesional conocida por su tono brillante y su excelente respuesta.', 1800.00, 0.05, NOW()),
(7,'INS007', 'Bajo eléctrico Fender Precision Bass', 'Bajo eléctrico clásico que ha sido fundamental en muchos estilos de música.', 799.99, 0.00, NOW()),
(8,'INS008', 'Flauta traversa Yamaha YFL-577H', 'Flauta traversa de plata esterlina con un sonido cálido y una excelente proyección.', 1200.00, 0.00, NOW()),
(9,'INS009', 'Cello Stradivarius', 'Cello de alta calidad y sonido excepcional, ideal para solistas y músicos de orquesta.', 30000.00, 0.00, NOW()),
(10,'INS010', 'Teclado electrónico Roland RD-2000', 'Teclado electrónico versátil y expresivo adecuado para actuaciones en vivo y estudio.', 2499.99, 0.00, NOW()),
(11,'INS011', 'Guitarra acústica Taylor 814ce', 'Guitarra acústica premium con una construcción de alta calidad y un sonido excepcional.', 3499.99, 0.00, NOW());

select * from Products;

CREATE TABLE Customers (
  CustomerID INT NOT NULL auto_increment,
  PRIMARY KEY(CustomerID),
  EmailAddress VARCHAR(255) NOT NULL UNIQUE,
  Passwd VARCHAR(60) NOT NULL,
  FirstName VARCHAR(60) NOT NULL,
  LastName  VARCHAR(60) NOT NULL,
  ShippingAddressID  INT DEFAULT NULL,
  BillingAddressID INT DEFAULT NULL
);

INSERT INTO Customers (EmailAddress, Passwd, FirstName, LastName, ShippingAddressID, BillingAddressID)
VALUES
('cliente1@gmail.com', 'contraseña1', 'Juan', 'García', 1, 1),
('cliente2@gmail.com', 'contraseña2', 'María', 'López', 2, 2),
('cliente3@gmail.com', 'contraseña3', 'Pedro', 'Martínez', 3, 3),
('cliente4@gmail.com', 'contraseña4', 'Ana', 'González', 4, 4),
('cliente5@gmail.com', 'contraseña5', 'Luis', 'Rodríguez', 5, 5),
('cliente6@gmail.com', 'contraseña6', 'Sofía', 'Hernández', 6, 6),
('cliente7@gmail.com', 'contraseña7', 'Carlos', 'Pérez', 7, 7),
('cliente8@gmail.com', 'contraseña8', 'Laura', 'Díaz', 8, 8),
('cliente9@gmail.com', 'contraseña9', 'Jorge', 'Sánchez', 9, 9),
('cliente10@gmail.com', 'contraseña10', 'Elena', 'Fernández', 10, 10),
('cliente11@gmail.com', 'contraseña11', 'Diego', 'Ramírez', 11, 11);

select * from Customers;

CREATE TABLE Addresses (
  AddressID INT NOT NULL auto_increment,
  PRIMARY KEY (AddressID),
  CustomerID INT,
  Foreign Key (CustomerID) REFERENCES Customers(CustomerID),
  Line1 VARCHAR(60) NOT NULL,
  Line2 VARCHAR(60) DEFAULT NULL,
  City  VARCHAR(40) NOT NULL,
  State  VARCHAR(2) NOT NULL,
  ZipCode VARCHAR(10) NOT NULL,
  Phone VARCHAR(12) NOT NULL,
  Disabled INT  NOT NULL DEFAULT 0
);

INSERT INTO Addresses (CustomerID, Line1, Line2, City, State, ZipCode, Phone)
VALUES
(1, '123 Main St', NULL, 'New York', 'NY', '10001', '555-1234'),
(2, '456 Elm St', NULL, 'Los Angeles', 'CA', '90001', '555-5678'),
(3, '789 Oak St', NULL, 'Chicago', 'IL', '60601', '555-9876'),
(4, '101 Pine St', NULL, 'Miami', 'FL', '33101', '555-5432'),
(5, '222 Broadway', 'Apt 3B', 'San Francisco', 'CA', '94101', '555-1111'),
(6, '333 Maple Ave', NULL, 'Seattle', 'WA', '98101', '555-2222'),
(7, '444 Chestnut St', NULL, 'Boston', 'MA', '02101', '555-3333'),
(8, '555 Walnut St', NULL, 'Denver', 'CO', '80201', '555-4444'),
(9, '666 Cedar St', NULL, 'Austin', 'TX', '78701', '555-5555'),
(10, '777 Pine St', 'Suite 100', 'Nashville', 'TN', '37201', '555-6666'),
(11, '888 Spruce St', NULL, 'Portland', 'OR', '97201', '555-7777');

Select * from Addresses;

CREATE TABLE Orders (
  OrderID  INT NOT NULL auto_increment,
  PRIMARY KEY(OrderID),
  CustomerID INT NOT NULL,
  Foreign Key (CustomerID) REFERENCES Customers (CustomerID),
  OrderDate DATETIME NOT NULL,
  ShipAmount Double NOT NULL,
  TaxAmount Double NOT NULL,
  ShipDate DATETIME DEFAULT NULL,
  ShipAddressID INT  NOT NULL,
  CardType VARCHAR(50) NOT NULL,
  CardNumber CHAR(16) NOT NULL,
  CardExpires CHAR(7) NOT NULL,
  BillingAddressID INT NOT NULL    
);

INSERT INTO Orders (CustomerID, OrderDate, ShipAmount, TaxAmount, ShipAddressID, CardType, CardNumber, CardExpires, BillingAddressID)
VALUES
(1, NOW(), 10.00, 2.00, 1, 'Visa', '1234567890123456', '12/25', 1),
(2, NOW(), 8.00, 1.60, 2, 'MasterCard', '9876543210987654', '11/24', 2),
(3, NOW(), 15.00, 3.00, 3, 'American Express', '5432167890123456', '10/23', 3),
(4, NOW(), 12.50, 2.50, 4, 'Visa', '9876123456789012', '09/22', 4),
(5, NOW(), 9.75, 1.95, 5, 'MasterCard', '1234987654321098', '08/21', 5),
(6, NOW(), 7.20, 1.44, 6, 'Visa', '8765123456789012', '07/20', 6),
(7, NOW(), 11.30, 2.26, 7, 'American Express', '3456127890123456', '06/19', 7),
(8, NOW(), 14.80, 2.96, 8, 'MasterCard', '6543210987654321', '05/18', 8),
(9, NOW(), 16.50, 3.30, 9, 'Visa', '9876345210987654', '04/17', 9),
(10, NOW(), 18.25, 3.65, 10, 'American Express', '1234567812345678', '03/16', 10),
(11, NOW(), 20.00, 4.00, 11, 'MasterCard', '9876123412345678', '02/15', 11);

Select * from Orders;

CREATE TABLE OrderItems (
  ItemID INT,
  OrderID INT NOT NULL,
  Foreign Key(OrderID) REFERENCES Orders (OrderID),
  ProductID INT NOT NULL,
  Foreign Key(ProductID) REFERENCES Products (ProductID),
  ItemPrice Double NOT NULL,
  DiscountAmount Double NOT NULL,
  Quantity INT NOT NULL
);

INSERT INTO OrderItems (ItemID, OrderID, ProductID, ItemPrice, DiscountAmount, Quantity)
VALUES
(1, 1, 12, 99.99, 0.00, 1),
(2, 1, 13, 1499.99, 0.00, 1),
(3, 2, 14, 249.99, 0.00, 1),
(4, 2, 15, 399.99, 0.00, 2),
(5, 3, 16, 799.99, 0.00, 1),
(6, 3, 17, 149.99, 0.00, 1),
(7, 4, 18, 499.99, 0.00, 5),
(8, 4, 19, 899.99, 0.00, 3),
(9, 5, 20, 399.99, 0.00, 1),
(10, 5, 21, 199.99, 0.00, 2),
(11, 6, 22, 299.99, 0.00, 1)

select * from OrderItems;

CREATE TABLE Administrators (
  AdminID INT NOT NULL auto_increment,
  PRIMARY KEY(AdminID),
  EmailAddress VARCHAR(255)   NOT NULL,
  Passwd VARCHAR(255) NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL
);

INSERT INTO Administrators (EmailAddress, Passwd, FirstName, LastName)
VALUES
('admin1@gmail.com', 'password1', 'John', 'Doe'),
('admin2@gmail.com', 'password2', 'Jane', 'Smith'),
('admin3@gmail.com', 'password3', 'Michael', 'Johnson'),
('admin4@gmail.com', 'password4', 'Emily', 'Brown'),
('admin5@gmail.com', 'password5', 'David', 'Martinez'),
('admin6@gmail.com', 'password6', 'Jennifer', 'Jones'),
('admin7@gmail.com', 'password7', 'Daniel', 'Garcia'),
('admin8@gmail.com', 'password8', 'Sarah', 'Wilson'),
('admin9@gmail.com', 'password9', 'James', 'Taylor'),
('admin10@gmail.com', 'password10', 'Jessica', 'Lee'),
('admin11@gmail.com', 'password11', 'Matthew', 'Clark');

select* from Administrators