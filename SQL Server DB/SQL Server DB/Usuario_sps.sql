
/*PROCEDIMIENTOS ALMACENADOS REQUERIDOS PARA USUARIOS*/
-------------------------------/*CREAR GRUPO*/
CREATE PROCEDURE sp_crear_grupo
@id INT, 
@admin VARCHAR(20),
@nombre VARCHAR(20)
AS
INSERT INTO straviadb.dbo.GRUPO
(id, id_admin,nombre) VALUES
(
@id, @admin, @nombre
);

/*CONSULTAR GRUPO POR ID*/
CREATE PROCEDURE sp_consultar_grupo
@id INT
AS
SELECT * FROM straviadb.dbo.GRUPO
WHERE id=@id;

/*CONSULTAR GRUPOS*/
CREATE PROCEDURE sp_consultar_grupos
AS
SELECT * FROM straviadb.dbo.GRUPO

/*MODIFICAR NOMBRE DE GRUPO*/
CREATE PROCEDURE sp_actualizar_nombreGrupo
@nombre VARCHAR(20),
@idGrupo INT
AS
UPDATE straviadb.dbo.GRUPO SET nombre = @nombre
WHERE id= @idGrupo;
/*MODIFICAR ADMIN DE GRUPO*/
CREATE PROCEDURE sp_actualizar_adminGrupo
@nombreusuario VARCHAR(20),
@idGrupo INT
AS
UPDATE straviadb.dbo.GRUPO SET id_admin = @nombreusuario
WHERE id= @idGrupo;

/*ELIMINAR GRUPO*/
CREATE PROCEDURE sp_eliminar_grupo
@idgrupo INT
AS
DELETE FROM straviadb.dbo.GRUPO 
WHERE id=@idgrupo;
-------------------------------/*CREAR CATEGORÍAS*/
CREATE PROCEDURE sp_crear_categorias
@id_carrera INT, 
@descripcion VARCHAR(40),
@nombre VARCHAR(20)
AS
INSERT INTO straviadb.dbo.CATEGORIAS
(nombre, id_carrera,descripcion) VALUES
(
@nombre,@id_carrera, @descripcion
);
/*CONSULTAR CATEGORÍA POR NOMBRE*/
CREATE PROCEDURE sp_consultar_categoria
@nombre VARCHAR(20)
AS
SELECT * FROM straviadb.dbo.CATEGORIAS
WHERE nombre=@nombre

/*CONSULTAR CATEGORÍAS*/
CREATE PROCEDURE sp_consultar_categorias
AS
SELECT * FROM straviadb.dbo.CATEGORIAS

-------------------------------/*CREAR RETO*/
CREATE PROCEDURE sp_crear_reto
@id INT, 
@nombre VARCHAR(20),
@fecha_inicio DATE ,
@fecha_finaliza DATE ,
@tipo_actividad VARCHAR(20),
@tipo_reto VARCHAR(20)
AS
INSERT INTO straviadb.dbo.RETO
(id, nombre, fecha_inicio, fecha_finaliza,
tipo_actividad, tipo_reto
) VALUES
(
@id, @nombre, @fecha_inicio, @fecha_finaliza,
@tipo_actividad, @tipo_reto
)
EXEC sp_crear_reto 1, 'pseudomaraton', '2022-05-26','2022-05-31',
'correr', 'fondo'
EXEC sp_crear_reto 2, 'aguas abiertas', '2022-05-27','2022-05-30',
'natacion', 'fondo'
/*Obtener reto por id*/
CREATE PROCEDURE sp_consultar_reto
@id INT
AS
SELECT * FROM straviadb.dbo.RETO
WHERE id=@id;

EXEC sp_consultar_reto 2

/*Obtener todos los retos*/
CREATE PROCEDURE sp_consultar_retos
AS
SELECT * FROM straviadb.dbo.RETO

EXEC sp_consultar_retos

/*ACTUALIZAR NOMBRE*/
CREATE PROCEDURE sp_actualizar_nombre_reto
@_id INT,
@_nombre VARCHAR(20)
AS
UPDATE straviadb.dbo.RETO SET nombre = @_nombre
WHERE id= @_id;
/*ACTUALIZAR FECHA INICIO*/
CREATE PROCEDURE sp_actualizar_fecha_inicio_reto
@_id INT,
@_fecha DATE
AS
UPDATE straviadb.dbo.RETO SET fecha_inicio = @_fecha
WHERE id= @_id;
/*ACTUALIZAR FECHA FINALIZA*/
CREATE PROCEDURE sp_actualizar_fecha_fin_reto
@_id INT,
@_fecha DATE
AS
UPDATE straviadb.dbo.RETO SET fecha_finaliza = @_fecha
WHERE id= @_id;
/*ACTUALIZAR TIPO ACTIVIDAD*/
CREATE PROCEDURE sp_actualizar_tipoacti_reto
@_id INT,
@_tipoactividad VARCHAR(20)
AS
UPDATE straviadb.dbo.RETO SET tipo_actividad = @_tipoactividad
WHERE id= @_id;
/*ACTUALIZAR TIPO RETO*/
CREATE PROCEDURE sp_actualizar_tipo_reto
@_id INT,
@_tiporeto VARCHAR(20)
AS
UPDATE straviadb.dbo.RETO SET tipo_reto = @_tiporeto
WHERE id= @_id;
/*ELIMINAR RETO*/
CREATE PROCEDURE sp_eliminar_reto
@idreto INT
AS
DELETE FROM straviadb.dbo.RETO 
WHERE id=@idreto

EXEC sp_eliminar_reto 2
-------------------------------/*CREAR ACTIVIDAD*/
CREATE PROCEDURE sp_crear_actividad
@id INT,
@id_reto INT,
@id_usuario VARCHAR(20),
@hora_inicio TIME,
@hora_fin TIME,
@tipo_actividad varchar(20),
@kilometraje INT, 
@fecha DATE,
@recorrido XML
AS
INSERT INTO straviadb.dbo.ACTIVIDAD
(id,id_reto,id_usuario,hora_inicio,hora_fin ,
tipo_actividad ,kilometraje,fecha,recorrido) 
VALUES
(@id,@id_reto,@id_usuario,@hora_inicio,@hora_fin,
@tipo_actividad,@kilometraje,@fecha,@recorrido
)

EXEC sp_crear_actividad 1, NULL, 'jordan23', '12:34:54.1', '12:39:54.1', 'Correr', 
12, '2022-05-24', NULL;
EXEC sp_crear_actividad 2, NULL, 'jordan23', '5:34:54.1', '5:39:54.1', 'Natación', 
1, '2022-05-24', NULL;
SELECT * FROM straviadb.dbo.ACTIVIDAD
/*OBTENER ACTIVIDAD POR USUARIO*/
CREATE PROCEDURE sp_consultar_actividad_usuario
@usuario_id VARCHAR(20)
AS
SELECT * FROM straviadb.dbo.ACTIVIDAD
WHERE id_usuario=@usuario_id;

/*OBTENER ACTIVIDAD DE AMIGOS DEL USUARIO*/

/*OBTENER LA DURACIÓN DE UNA ACTIVIDAD*/
CREATE PROCEDURE sp_consultar_duracion
@id_actividad INT
AS
SELECT id_usuario, fecha, tipo_actividad, 
CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(SECOND,hora_inicio, hora_fin),0), 108) 
AS Duracion
FROM straviadb.dbo.ACTIVIDAD
WHERE id=@id_actividad
EXEC sp_consultar_duracion 1

-------------------------------/*CREAR CARRERA*/
CREATE PROCEDURE sp_crear_carrera
@_id INT,
@_id_actividad VARCHAR(20),
@nombre	VARCHAR(20),
@_fecha DATE,
@_costo DECIMAL(10,2)
AS
INSERT INTO straviadb.dbo.CARRERA
(id, id_actividad, nombre, fecha, costo
) VALUES
(
@_id, @_id_actividad, @nombre,@_fecha, @_costo)

EXEC sp_crear_carrera 123, null, 'Maraton SJ', '2022-05-31', 12.50
EXEC sp_crear_carrera 321, null, 'Maraton SC', '2022-05-31', 12.50
/*OBTENER CARRERA*/
CREATE PROCEDURE sp_consultar_carrera
@id_carrera INT
AS
SELECT * FROM straviadb.dbo.CARRERA
WHERE id=@id_carrera
EXEC sp_consultar_carrrera 123
/*OBTENER CARRERAS*/
CREATE PROCEDURE sp_consultar_carreras
AS
SELECT * FROM straviadb.dbo.CARRERA
EXEC sp_consultar_carreras

/*ELIMINAR CARRERAS*/
CREATE PROCEDURE sp_eliminar_carrera
@_id INT
AS
BEGIN
DELETE FROM straviadb.dbo.CARRERA 
WHERE id=@_id 
END;
EXEC sp_eliminar_carrera 123

/*ACTUALIZAR DATOS DE CARRERA*/

--NUEVA FECHA DE CARRERA
CREATE PROCEDURE sp_actualizar_fecha_carrera
@_id INT,
@_fecha DATE
AS
UPDATE straviadb.dbo.CARRERA SET fecha = @_fecha
WHERE id= @_id;
--NUEVO NOMBRE DE CARRERA
CREATE PROCEDURE sp_actualizar_nombre_carrera
@_id INT,
@_nombre VARCHAR(20)
AS
UPDATE straviadb.dbo.CARRERA SET nombre = @_nombre
WHERE id= @_id;
--NUEVO PRECIO DE CARRERA
CREATE PROCEDURE sp_actualizar_precio_carrera
@_id INT,
@_precio DECIMAL(10, 2)
AS
UPDATE straviadb.dbo.CARRERA SET costo = @_precio
WHERE id= @_id;

-------------------------------/*CREAR ROLES*/
CREATE PROCEDURE sp_crear_rol
@rol_id INT,
@rol_nombre VARCHAR(10)
AS
INSERT INTO straviadb.dbo.ROL (id, nombre) VALUES(@rol_id, @rol_nombre);

EXEC sp_crear_rol 1, 'organiza';
EXEC sp_crear_rol 2, 'deportista';
SELECT * FROM straviadb.dbo.ROL;

DROP PROCEDURE sp_insertar_usuario
-------------------------------/*CREAR USUARIOS*/
CREATE PROCEDURE sp_insertar_usuario
@_usuario VARCHAR(20),
@rol_usuario INT,
@id_carrera INT,
@_nombre VARCHAR(20),
@_apellido1 VARCHAR(10),
@_apellido2 VARCHAR(10),
@_foto IMAGE,
@_nacionalidad VARCHAR(30),
@_fecha_nacimiento DATE,
@_password_ VARCHAR(18)
AS
INSERT INTO straviadb.dbo.USUARIO(
usuario,
id_rol,
id_carrera,
nombre,
apellido1,
apellido2,
foto,
nacionalidad,
fecha_nacimiento,
_password
) VALUES(
@_usuario,
@rol_usuario,
@id_carrera,
@_nombre,
@_apellido1,
@_apellido2,
@_foto,
@_nacionalidad,
@_fecha_nacimiento,
@_password_
);

EXEC sp_insertar_usuario 'juancho23', 1,NULL,'Juan', 'Peña',
'Rostrán',NULL, 'Nicaragüense', '2000-01-15', '1234567palomitas';

EXEC sp_insertar_usuario 'jordan23', 2,NULL,'Michael', 'Jeffrey',
'Jordan',NULL, 'Estadounidense', '1963-02-17', '1234567palomitas';

EXEC sp_insertar_usuario 'lebron23', 2,NULL,'LeBron', 'Raymone',
'James',NULL, 'Estadounidense', '1984-12-30', '1234567palomitas';


/*CONSULTA PARA OBTENER USUARIO POR PRIMARY KEY*/
CREATE PROCEDURE sp_consultar_usuario
@usuario_id VARCHAR(20)
AS
SELECT * FROM straviadb.dbo.USUARIO
WHERE usuario=@usuario_id;

EXEC sp_consultar_usuario 'lebron23';


/*CONSULTA PARA OBTENER TODOS LOS USUARIOS*/
CREATE PROCEDURE sp_consultar_usuarios
AS
SELECT * FROM straviadb.dbo.USUARIO

DROP PROCEDURE	sp_consultar_usuarios
EXEC sp_consultar_usuarios;

/*CONSULTA PARA OBTENER EDAD DE USUARIOS*/

CREATE PROCEDURE sp_edad_usuarios
@nombreusuario VARCHAR(20)
AS
SELECT usuario,
DATEDIFF(YEAR, fecha_nacimiento, GETDATE())
-
(CASE 
	WHEN DATEADD(YY, DATEDIFF(YEAR, fecha_nacimiento, GETDATE()), fecha_nacimiento)
	> GETDATE() THEN 1
	ELSE 0 END)
	'Edad en años' 
FROM straviadb.dbo.USUARIO
WHERE usuario=@nombreusuario

EXEC sp_edad_usuarios 'jordan23'
EXEC sp_edad_usuarios 'juancho23'
EXEC sp_edad_usuarios 'lebron23'

/*ACTUALIZAR REGISTROS DE USUARIO*/
------ACTUALIZAR FOTO-------

CREATE PROCEDURE sp_actualizar_foto
@nombreusuario VARCHAR(20),
@foto IMAGE
AS
UPDATE straviadb.dbo.USUARIO SET foto = @foto
WHERE usuario= @nombreusuario;

------ACTUALIZAR CARRERA------
CREATE PROCEDURE sp_actualizar_carrera
@nombreusuario VARCHAR(20),
@_idcarrera INT
AS
UPDATE straviadb.dbo.USUARIO SET id_carrera = @_idcarrera
WHERE usuario= @nombreusuario;

EXEC sp_actualizar_carrera 'jordan23', 123;
------ACTUALIZAR ROL------
CREATE PROCEDURE sp_actualizar_rol
@nombreusuario VARCHAR(20),
@_idrol INT
AS
UPDATE straviadb.dbo.USUARIO SET id_rol = @_idrol
WHERE usuario= @nombreusuario;

------ACTUALIZAR PASSWORD------
CREATE PROCEDURE sp_actualizar_password
@nombreusuario VARCHAR(20),
@_pwd VARCHAR(18)
AS
UPDATE straviadb.dbo.USUARIO SET _password = @_pwd
WHERE usuario= @nombreusuario;

------ELIMINAR USUARIO------
CREATE PROCEDURE sp_eliminar_usuario
@nombreusuario VARCHAR(20)
AS
BEGIN
DELETE FROM straviadb.dbo.ACTIVIDAD 
WHERE id_usuario=@nombreusuario 
DELETE FROM straviadb.dbo.USUARIO 
WHERE usuario=@nombreusuario 
END;

--EXEC sp_eliminar_usuario 'jordan23'
--EXEC sp_consultar_usuarios


