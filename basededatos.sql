IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='BD_PEDIDO')
DROP DATABASE BD_PEDIDO
GO

CREATE  DATABASE BD_PEDIDO
GO

USE BD_PEDIDO

CREATE TABLE TCliente
(CodCliente char(6) not null Primary key,
DNI bigint,
NomCliente varchar(35),
ApeCliente varchar(35),
DirCliente varchar(35))

CREATE TABLE Tvendedor
(CodVendedor char(6) not null primary key,
NomVendedor varchar(25) not null,
DirVendedor varchar(25),
turno varchar(15),
tipo varchar (15))


CREATE TABLE TPedido
(NumPedido int not null primary key,
CodCliente char(6),
Impuesto float,
Total float,
Fecha date,
CodVendedor  char(6),
foreign key (CodVendedor) references Tvendedor(Codvendedor),
foreign key (CodCliente) references TCliente(CodCliente))


CREATE TABLE Tpago
(IdPago int not null primary key,
FechaPago date,
NumPedido int,
Monto float,
foreign key (NumPedido) references Tpedido(NumPedido))


CREATE TABLE Tproducto
(CodProducto char(6) not null primary key,
Nomproducto varchar(20),
Precio float,
Unidad varchar(12),
Stock INT)


CREATE TABLE TPedidoProd
(CodProducto char(6),
NumPedido int,
Cantidad int,
primary key(CodProducto, NumPedido),
foreign Key (CodProducto) references Tproducto(CodProducto),
foreign Key (NumPedido) references Tpedido(Numpedido))





INSERT INTO tCliente values ('CL0001',12345678,'Maria','Achilli Gamarra','Jr.Puno 416');
INSERT INTO tCliente values ('CL0002',12345679,'Jorge','Alvarez Ferroñan','Jr.Lima 1016')
INSERT INTO tCliente values ('CL0003',12345636,'Raul','Rodriguez Leon','Jr.Puno 213')
INSERT INTO tCliente values ('CL0004',12345625,'Alisson','Vilca Peña','Jr.Cusco 169')
INSERT INTO tCliente values ('CL0005',45345646,'Yenny','Ojeda Arriaga','Av.Tacna 1340')


insert into Tvendedor values ('LU1901','Luis Armando Alvarez Baca','Los Incas #1311','mañana','contratado')
insert into Tvendedor values ('CA1902','Carlos Castañeda Solis','Los Olivos #346','tarde','nombrado')
insert into Tvendedor values ('KA1903','Karin Ojeda Arriaga','Av. Peru #1340','mañana','contratado')
insert into Tvendedor values ('SO1904','Sonia Calizaya Perca','Av. Tacna #452','tarde','nombrado') 
insert into Tvendedor values ('TE1905','Teresa Valdez Cohaila','Av. Tacna #932','noche','contratado') 


insert into TProducto values ('C0001','Coca Cola 1Litro', 45.00,'cajas', 1000)
insert into TProducto values ('C0002','Coca Cola Personal', 12.00,'cajas',1000)
insert into TProducto values ('F0003','Fanta 1Litro', 45.00,'cajas',1000)
insert into TProducto values ('F0004','Fanta Personal', 12.00,'cajas',1000)
insert into TProducto values ('I0005','Inka Cola Personal', 10.00,'cajas',1000)

set dateformat dmy

insert into TPedido values (0001,'CL0001',24.3,135.00,'10/08/2023','LU1901');
insert into TPedido values (0002,'CL0002',24.3,135.00,'12/08/2023','LU1901');
insert into TPedido values (0003,'CL0003',10.8,60.00, '10/09/2023','KA1903');
insert into TPedido values (0004,'CL0001',24.3,135.00,'05/09/2023','CA1902')
insert into TPedido values (0005,'CL0001',16.2,90.00,'01/10/2023','KA1903');
insert into TPedido values (0006,'CL0001',16.2,90.00,'12/10/2023','CA1902');


insert into TPedidoProd values ('C0001',0001,3);
insert into TPedidoProd values ('C0001',0002,2);
insert into TPedidoProd values ('F0003',0002,1);
insert into TPedidoProd values ('F0004',0003,5);
insert into TPedidoProd values ('F0004',0005,2);


 SET DATEFORMAT DMY
insert into TPago values (0001,'10/08/2023',0001,135.00);
insert into TPago values (0002,'12/08/2023',0002,135.00);
insert into TPago values (0003,'10/09/2023',0003,30.00);
insert into TPago values (0004,'15/09/2023',0003,20.00);
insert into TPago values (0005,'01/10/2023',0005,45.00);