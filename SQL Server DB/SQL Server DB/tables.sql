CREATE TABLE ACTIVIDAD(
	ID INT NOT NULL,
	hora_inicio TIME,
	hora_fin TIME,
	tipo_actividad varchar(20),
	kilometraje INT, 
	fecha DATE,
	recorrido XML,
	PRIMARY KEY(ID)
);

CREATE TABLE PATROCINADOR(
	ID INT NOT NULL,
	nombre_representante VARCHAR(40) NOT NULL,
	nombre_comercial VARCHAR(30) NOT NULL, 
	telefono_representante VARCHAR(15) NOT NULL,
	PRIMARY KEY(ID)
);

CREATE TABLE RETO(
	ID INT NOT NULL, 
	nombre VARCHAR(20)NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	tipo_reto VARCHAR(20) NOT NULL, /* de fondo o altitud*/
	PRIMARY KEY(ID)
);

CREATE TABLE CARRERA(
	ID INT NOT NULL,
	nombre VARCHAR(20)NOT NULL,
	fecha DATE NOT NULL,
	costo DECIMAL(10, 2) NOT NULL, /* de fondo o altitud*/
	categoria VARCHAR(20) NOT NULL
	PRIMARY KEY(ID)
);

CREATE TABLE GRUPO(
	ID INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	PRIMARY KEY(ID)
);

CREATE TABLE ROL(
	ID INT NOT NULL,
	nombre VARCHAR(10) NOT NULL,
	PRIMARY KEY(ID)
);

CREATE TABLE USUARIO(
	usuario INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	apellido1 VARCHAR(10) NOT NULL,
	apellido2 VARCHAR(10) NOT NULL,
	foto IMAGE,
	nacionalidad VARCHAR(30) NOT NULL,
	fecha_nacimiento DATE NOT NULL, 
	_password VARCHAR(18) NOT NULL,
	PRIMARY KEY(usuario)
);

CREATE TABLE PAGOCARRERA(
	ID_carrera INT NOT NULL,
	codigo INT NOT NULL,
	estado VARCHAR(10)
	PRIMARY KEY(ID_carrera,codigo)
);