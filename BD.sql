USE
SALVAYA
go
create table Persona(
	nPersonaID int identity,
	nTpoDoc int,
	nNDoc int,
	cNombre varchar(100),
	cApellidoPaterno varchar(100),
	cApellidoMaterno varchar(100),
	cCelular varchar(9),
	cCelular1 varchar(9),
	cDireccion varchar(200),
	cDireccion1 varchar(200),
	cCorreo varchar(200),
	cCorreo1 varchar(200),
	primary key(nPersonaID,nNDoc),
	unique(nPersonaID),
	unique(nNDoc)
)
go
create table Empresa (
	nEmpresaID int identity,
	nTpoDoc int,
	nNDoc int,
	cRazonSocial varchar(100),
	cCelular varchar(9),
	cCelular1 varchar(9),
	cDireccion varchar(200),
	cDireccion1 varchar(200),
	cCorreo varchar(200),
	cCorreo1 varchar(200),
	primary key(nEmpresaID,nNDoc),
	unique(nEmpresaID),
	unique(nNDoc),
)
go
create table Categoria(
	nCategoriaID int identity,
	cCodCategoria varchar(10),
	cDescripcion varchar(100),
	nEstado int
	primary key(nCategoriaID,cCodCategoria),
	unique(nCategoriaID),
	unique(cCodCategoria),
)
go
create table Producto(
	nProductoID int identity,
	cCodProducto varchar(10),
	cDescripcion varchar(10),
	nEstado int,
	nCategoriaID int ,
	primary key(nProductoID,cCodProducto),
	unique(nProductoID),
	unique(cCodProducto),
	foreign key(nCategoriaID) references Categoria(nCategoriaID)
)
go
create table Empresa_Producto(
	cCodProducto varchar(10),
	cDescripcionVenta varchar(200),
	nPrecio money,
	dFechaVencimeinto date,
	nEmpresaID int,
	cLongitud float,
	cLatitud float,
	foreign key (nEmpresaID) references empresa(nEmpresaID),
	foreign key (cCodProducto) references Producto(cCodProducto)
)
GO
create table Usuarios(
	nUsuarioID INT identity,
	cUsuario varchar(6),
	cClave varchar(100),
	nPersonaID int ,
	primary key(nUsuarioID,cUsuario),
	unique(nUsuarioID),
	unique(cUsuario),
	foreign key (nPersonaID) references Persona(nPersonaID),

)
GO
CREATE TABLE Favoritos (
    nFavoritoID INT IDENTITY PRIMARY KEY,
    nUsuarioID INT ,
    nProductoID INT ,
    dFechaAgregado DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nUsuarioID) REFERENCES Usuarios(nUsuarioID),
    FOREIGN KEY (nProductoID) REFERENCES Producto(nProductoID),
    UNIQUE (nUsuarioID, nProductoID)
);

-- Tabla de notificaciones push
CREATE TABLE NotificacionPush (
    nNotificacionID INT IDENTITY PRIMARY KEY,
    nUsuarioID INT NOT NULL,
    cPlataforma NVARCHAR(50), -- Android, iOS, Web, etc.
    nActivo BIT DEFAULT 1,
    dFechaRegistro DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nUsuarioID) REFERENCES Usuarios(nUsuarioID)
);
