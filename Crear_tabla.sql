/*
Crear una tabla con llave primaria auto incrementable de 1 digito
*/
create table Clientes (
IDCliente int IDENTITY(1,1) PRIMARY KEY,
Client nvarchar(20),
[Creado Por] nvarchar(20),
Departamento nvarchar(20),
Nota nvarchar(500),
Fecha datetime
)

/*
Crear tabla con llave primaria de tipo cadena, tipo serial
NOTA: En proximos repositorios pondre ejemplo de store procedure de como crear llaves primarias para tablas de tipo cadena serializadas
*/
create table Vendedores (
IDVendedor nvarchar(10) PRIMARY KEY,
Vendedor nvarchar(20),
[Descripcion] nvarchar(20),
Departamento nvarchar(20),
[Cliente asignado] datetime,
Notas nvarchar(500),
[Fecha Ingreso] datetime
)

/*
Crear tabla con llave primaria, ademas creamos relacion con llaves foraneas
index cloustered
*/
Create table OrdenTrabajo(
IDOrdenTrabajo int IDENTITY(1,1) PRIMARY KEY,
Cliente char(8) not null,
Vendedor char(8) not null,
Descripcion char(8) not null,
Fecha char(8),
CONSTRAINT fk_Client FOREIGN KEY (IDVendedor) REFERENCES Vendedores (Id),
CONSTRAINT fk_Vendedor FOREIGN KEY (IDCliente) REFERENCES Clientes (Id),
)

/*
Crear tabla comprobando que no exista ya en la DB
*/
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Pass` varchar(100) DEFAULT NULL,
  `Acceso` int(11) DEFAULT NULL,
  `Puesto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;