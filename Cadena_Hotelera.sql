DROP DATABASE IF EXISTS Cadena_hotelera;
CREATE DATABASE Cadena_hotelera CHARSET utf8mb4 COLLATE utf8mb4_spanish2_ci;

USE Cadena_hotelera;

CREATE TABLE Hoteles (
CodHotel VARCHAR (10), 
Nombre VARCHAR (30) NOT NULL,
Dirección VARCHAR(50),
Ciudad VARCHAR (30) NOT NULL,
FecInaug DATE,
Categoría NUMERIC(1) NOT NULL,
NumHabitac NUMERIC (2) NOT NULL,

CONSTRAINT PK_CodHotel PRIMARY KEY (CodHotel),
CONSTRAINT CH_Categoría CHECK (Categoría >= 1 AND Categoría <= 5),
CONSTRAINT CH_NumHabitac CHECK (NumHabitac > 0)
)
 ENGINE = InnoDB;

CREATE TABLE Clientes (
NIF VARCHAR (9),
Nombre VARCHAR (30) NOT NULL,
Apellido1 VARCHAR (30) NOT NULL,
Apellido2 VARCHAR (30),
Dirección VARCHAR(50),
Ciudad VARCHAR (30) NOT NULL,
FecNacim DATE NOT NULL,

CONSTRAINT PK_Clientes PRIMARY KEY (NIF)
)
 ENGINE = InnoDB;
 
 CREATE TABLE Reservas (
CodHotel VARCHAR (10),
NIF_Clientes VARCHAR (9),
FechaEntrada DATE,
FechaReserva DATE NOT NULL,
NumNoches NUMERIC (2) NOT NULL,
NumHabitaci NUMERIC (2) NOT NULL,
NumAdultos NUMERIC (1) NOT NULL DEFAULT 2,
NumNinyas NUMERIC (1) NOT NULL DEFAULT 0,
PrecioNochHab NUMERIC (3,2) NOT NULL,

CONSTRAINT PK_Reservas PRIMARY KEY (CodHotel, NIF_Clientes, FechaEntrada),
CONSTRAINT PK_ResrvHotel FOREIGN KEY (CodHotel)
	REFERENCES Hoteles (CodHotel) 
	ON DELETE CASCADE,
CONSTRAINT PK_ResrvCLientes FOREIGN KEY (NIF_CLientes)
	REFERENCES Clientes (NIF) 
	ON DELETE CASCADE,
CONSTRAINT CH_PrecioNochHab CHECK (PrecioNochHab > 0),
CONSTRAINT CH_NumHabitaci CHECK (NumHabitaci > 0),
CONSTRAINT CH_NumNoches CHECK (NumNoches > 0)
)
 ENGINE = InnoDB;
 
 DROP TABLE Reservas;
 DROP TABLE Hoteles;
 DROP TABLE Clientes;
 