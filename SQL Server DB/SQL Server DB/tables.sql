USE straviadb;

CREATE TABLE ACTIVIDAD(
	id INT NOT NULL,
	id_reto INT NOT NULL,
	id_usuario VARCHAR(20) NOT NULL,
	hora_inicio TIME,
	hora_fin TIME,
	tipo_actividad varchar(20),
	kilometraje INT, 
	fecha DATE,
	recorrido XML,
	PRIMARY KEY(id)
);

CREATE TABLE PATROCINADOR(
	id INT NOT NULL,
	nombre_rep VARCHAR(15) NOT NULL,
	apellido1_rep VARCHAR(15) NOT NULL,
	apellido2_rep VARCHAR(15) NOT NULL,
	nombre_comercial VARCHAR(30) NOT NULL, 
	telefono_representante VARCHAR(15) NOT NULL,
	logo IMAGE,
	PRIMARY KEY(id)
);

CREATE TABLE RETO(
	id INT NOT NULL, 
	nombre VARCHAR(20)NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_finaliza DATE NOT NULL,
	tipo_actividad VARCHAR(20),
	tipo_reto VARCHAR(20) NOT NULL, /* de fondo o altitud*/
	PRIMARY KEY(id)
);

CREATE TABLE CARRERA(
	id INT NOT NULL,
	id_actividad INT NOT NULL,
	nombre VARCHAR(20)NOT NULL,
	fecha DATE NOT NULL,
	costo DECIMAL(10, 2) NOT NULL, /* de fondo o altitud*/
	categoria VARCHAR(20) NOT NULL
	PRIMARY KEY(id)
);

CREATE TABLE GRUPO(
	id INT NOT NULL,
	id_admin VARCHAR(20) NOT NULL,
	id_carrera INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE ROL(
	id INT NOT NULL,
	nombre VARCHAR(10) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE USUARIO(
	usuario VARCHAR(20) NOT NULL,
	id_rol INT NOT NULL,
	id_carrera INT, 
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
	id_carrera INT NOT NULL,
	codigo INT NOT NULL,
	estado VARCHAR(10)
	PRIMARY KEY(id_carrera,codigo)
);

/*relaciones N:M*/

CREATE TABLE USUARIO_EN_GRUPO(
	id_usuario INT NOT NULL,
	id_grupo INT NOT NULL,
	PRIMARY KEY (id_usuario, id_grupo)
	/* CONSTRAINT USUARIO_EN_GRUPO_USER FOREIGN KEY (id_usuario) REFERENCES USUARIO(usuario),
	CONSTRAINT USUARIO_EN_GRUPO_GRUPO FOREIGN KEY (id_grupo) REFERENCES GRUPO(id),
	CONSTRAINT USUARIO_EN_GRUPO_UNIQUE UNIQUE (id_usuario, id_grupo)*/
	);

CREATE TABLE USUARIO_SIGUE_USUARIO(
	id_user INT NOT NULL,
	user_sigue INT NOT NULL,
	PRIMARY KEY(id_user, user_sigue)
	/*CONSTRAINT USUARIO_SIGUE_USUARIO FOREIGN KEY (id_user) REFERENCES USUARIO(usuario),
	CONSTRAINT USUARIO_SIGUE_USUARIO FOREIGN KEY (user_sigue) REFERENCES USUARIO(usuario),
	CONSTRAINT USUARIO_SIGUE_USUARIO UNIQUE (id_usuario, id_grupo)*/
	);

CREATE TABLE USUARIO_EN_RETO(
	id_usuario INT NOT NULL,
	id_reto INT NOT NULL,
	PRIMARY KEY (id_usuario, id_reto)
);
CREATE TABLE GRUPO_VE_CARRERA(
	id_carrera INT NOT NULL,
	id_grupo INT NOT NULL,
	PRIMARY KEY (id_carrera, id_grupo)
);
CREATE TABLE GRUPO_VE_RETO(
	id_grupo INT NOT NULL,
	id_reto INT NOT NULL,
	PRIMARY KEY (id_grupo, id_reto)
);

CREATE TABLE PATROCINA_RETO(
	id_patron INT NOT NULL,
	id_reto INT NOT NULL,
	PRIMARY KEY (id_patron, id_reto)
	);
CREATE TABLE PATROCINA_CARRERA(
	id_patron INT NOT NULL,
	id_carrera INT NOT NULL,
	PRIMARY KEY (id_patron, id_carrera)
);

CREATE TABLE CATEGORIAS(
	id INT NOT NULL,
	tipo VARCHAR(15) NOT NULL,
	PRIMARY KEY (id, tipo)
);
CREATE TABLE CUENTA_BANCARIA(
	id INT NOT NULL,
	cuenta VARCHAR(30) NOT NULL,
	PRIMARY KEY (id, cuenta)
);





