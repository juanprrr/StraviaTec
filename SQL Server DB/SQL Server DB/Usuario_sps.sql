-------------------------------/*CREAR PATROCINADOR*/

CREATE PROCEDURE sp_crear_patrocinador
@id INT,
@nombre_rep VARCHAR(15),
@apellido1_rep VARCHAR(15),
@apellido2_rep VARCHAR(15),
@nombrecomercial VARCHAR(30),
@telefono VARCHAR(15),
@logo IMAGE
AS 
INSERT INTO straviadb.dbo.PATROCINADOR
(id, nombre_rep, apellido1_rep, apellido2_rep, 
nombre_comercial, telefono_representante, logo)
VALUES
(@id, @nombre_rep, @apellido1_rep, @apellido2_rep,
@nombrecomercial, @telefono, @logo);

/*CONSULTAR PATROCINADOR POR ID*/
CREATE PROCEDURE sp_consultar_patrocinador
@id_patron INT
AS
SELECT * FROM straviadb.dbo.PATROCINADOR
WHERE id = @id_patron;

/*CONSULTAR LISTA DE PATROCINADORES*/
CREATE PROCEDURE sp_consultar_patrocinadores
AS
SELECT * FROM straviadb.dbo.PATROCINADOR

-------------------------------/*CREAR PATROCINA CARRERA*/
CREATE PROCEDURE sp_crear_patrocina_carrera
@id_patron INT,
@id_carrera INT
AS 
INSERT INTO straviadb.dbo.PATROCINA_CARRERA
(id_patron, id_carrera) VALUES 
(@id_patron,@id_carrera);

/*CONSULTAR PATROCINADORES DE CARRERA*/
CREATE PROCEDURE sp_consultar_patrocinadores_x_carrera
@id_carrera INT
AS
SELECT *  FROM straviadb.dbo.PATROCINADOR as G
JOIN straviadb.dbo.PATROCINA_CARRERA AS GVR ON GVR.id_patron= G.id
WHERE GVR.id_carrera =@id_carrera;

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

/*ACTUALIZAR REGISTROS DE RETOS*/
CREATE PROCEDURE sp_update_reto
@id INT, 
@nombre VARCHAR(20),
@fecha_inicio DATE ,
@fecha_finaliza DATE ,
@tipo_actividad VARCHAR(20),
@tipo_reto VARCHAR(20)
AS
UPDATE straviadb.dbo.RETO SET
id=@id, nombre=@nombre, fecha_inicio=@fecha_inicio,
fecha_finaliza=@fecha_finaliza, 
tipo_actividad=@tipo_actividad, tipo_reto=@tipo_reto
WHERE id=@id


/*ELIMINAR RETO*/
CREATE PROCEDURE sp_eliminar_reto
@idreto INT
AS
DELETE FROM straviadb.dbo.RETO 
WHERE id=@idreto

EXEC sp_eliminar_reto 2

-------------------------------/*CREAR GRUPO_VE_RETO*/
CREATE PROCEDURE sp_crear_grupo_ve_reto
@id_reto INT,
@grupo INT
AS 
INSERT INTO straviadb.dbo.GRUPO_VE_RETO
(id_reto, id_grupo) VALUES 
(@id_reto,@grupo);

/*CONSULTAR GRUPOS VISIBLES DE UN RETO*/

CREATE PROCEDURE sp_consultar_grupos_ven_reto
@id_reto INT
AS
SELECT nombre, id_admin  FROM straviadb.dbo.GRUPO as G
JOIN straviadb.dbo.GRUPO_VE_RETO AS GVR ON GVR.id_grupo= G.id
WHERE GVR.id_reto =@id_reto;


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
1, '2022-06-24', NULL;
EXEC sp_crear_actividad 3, NULL, 'lebron23', '5:34:54.1', '5:39:54.1', 'Correr', 
1, '2022-06-25', NULL;
EXEC sp_crear_actividad 4, NULL, 'lebron23', '5:34:54.1', '5:39:54.1', 'Kayak', 
1, '2022-06-26', NULL;
SELECT * FROM straviadb.dbo.ACTIVIDAD
/*OBTENER ACTIVIDAD POR USUARIO*/
CREATE PROCEDURE sp_consultar_actividad_usuario
@usuario_id VARCHAR(20)
AS
SELECT * FROM straviadb.dbo.ACTIVIDAD
WHERE id_usuario=@usuario_id;

CREATE PROCEDURE sp_consultar_grupos_ven_carrera
@id_carrera INT
AS
SELECT nombre, id_admin  FROM straviadb.dbo.GRUPO as G
JOIN straviadb.dbo.GRUPO_VE_CARRERA AS GVC ON GVC.id_grupo= G.id
WHERE GVC.id_carrera =@id_carrera;

/*OBTENER ACTIVIDAD DE AMIGOS DEL USUARIO*/
CREATE PROCEDURE sp_consultar_actividad_amigos
@usuario VARCHAR (20)
AS
SELECT id_usuario, fecha, hora_fin, tipo_actividad, kilometraje, recorrido  FROM straviadb.dbo.ACTIVIDAD AS ACT
JOIN straviadb.dbo.USUARIO_SIGUE_USUARIO AS USU
ON USU.user_sigue = ACT.id_usuario
WHERE USU.id_user = @usuario

EXEC sp_consultar_actividad_amigos "juancho23";

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
CREATE PROCEDURE sp_update_carrera
@_id INT,
@_id_actividad VARCHAR(20),
@nombre	VARCHAR(20),
@_fecha DATE,
@_costo DECIMAL(10,2)
AS
UPDATE straviadb.dbo.CARRERA SET id=@_id,
id_actividad =@_id_actividad ,nombre= @nombre,fecha=@_fecha,
costo = @_costo
WHERE id = @_id;


-------------------------------/*CREAR CUENTA BANCARIA*/

CREATE PROCEDURE sp_crear_cuenta_bancaria
@id INT, --- id de la carrera a la que está asociada
@no_cuenta VARCHAR(30)
AS
INSERT INTO straviadb.dbo.CUENTA_BANCARIA
(id, cuenta) VALUES (@id, @no_cuenta);

/*CONSULTAR CUENTA POR ID*/
CREATE PROCEDURE sp_consultar_cuenta_bancaria
@id INT
AS
SELECT * FROM straviadb.dbo.CUENTA_BANCARIA
WHERE id=@id
/*CONSULTAR CUENTAS*/
CREATE PROCEDURE sp_consultar_cuentas_bancarias
AS
SELECT * FROM straviadb.dbo.CUENTA_BANCARIA
-------------------------------/*CREAR PAGO DE CARRERA*/
CREATE PROCEDURE sp_crear_pagocarreras
@id_carrera INT,
@codigo INT,
@estado VARCHAR(10)
AS 
INSERT INTO straviadb.dbo.PAGOCARRERA
(id_carrera, codigo, estado) VALUES 
(@id_carrera, @codigo, @estado);

/*CONSULTAR PAGO DE CARRERA POR ID DE CARRERA*/
CREATE PROCEDURE sp_consultar_pago_carrera
@id_carrera INT
AS
SELECT * FROM straviadb.dbo.PAGOCARRERA
WHERE id_carrera=@id_carrera

/*CONSULTAR PAGOS DE CARRERAS*/
CREATE PROCEDURE sp_consultar_pagos_carreras
AS
SELECT * FROM straviadb.dbo.PAGOCARRERA

-------------------------------/*CREAR GRUPO_VE_CARRERA*/
CREATE PROCEDURE sp_crear_grupo_ve_carrera
@id_carrera INT,
@grupo INT
AS 
INSERT INTO straviadb.dbo.GRUPO_VE_CARRERA
(id_carrera, id_grupo) VALUES 
(@id_carrera,@grupo);

/*CONSULTAR GRUPOS VISIBLES DE UNA CARRERA*/

CREATE PROCEDURE sp_consultar_grupos_ven_carrera
@id_carrera INT
AS
SELECT nombre, id_admin  FROM straviadb.dbo.GRUPO as G
JOIN straviadb.dbo.GRUPO_VE_CARRERA AS GVC ON GVC.id_grupo= G.id
WHERE GVC.id_carrera =@id_carrera;
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
CREATE PROCEDURE sp_update_usuario
@nombreusuario VARCHAR(20),
@id_rol INT,
@id_carrera INT,
@nombre VARCHAR(20),
@apellido1 VARCHAR(20),
@apellido2 VARCHAR(20),
@foto IMAGE,
@nacionalidad VARCHAR(30),
@fecha_nacimiento DATE,
@_password VARCHAR(18)
AS
UPDATE straviadb.dbo.USUARIO 
SET  usuario= @nombreusuario,
id_rol = @id_rol,id_carrera = @id_carrera,
nombre = @nombre, apellido1 = @apellido1, apellido2 = @apellido2,
foto = @foto, nacionalidad = @nacionalidad, 
fecha_nacimiento = @fecha_nacimiento,
_password = @_password
WHERE usuario= @nombreusuario;

drop procedure sp_update_usuario
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

-------------------------------/*CREAR USUARIO_EN_GRUPO*/
CREATE PROCEDURE sp_crear_usuario_en_grupo
@id_usuario VARCHAR(20),
@id_grupo INT
AS
INSERT INTO straviadb.dbo.USUARIO_EN_GRUPO
(id_usuario, id_grupo) VALUES
(@id_usuario, @id_grupo);
/*CONSULTAR USUARIOS DE UN GRUPO*/
CREATE PROCEDURE sp_consultar_usuarios_en_grupo 
@id_grupo INT
AS
SELECT nombre, apellido1, apellido2 FROM straviadb.dbo.USUARIO AS U
JOIN straviadb.dbo.USUARIO_EN_GRUPO AS UEG
ON UEG.id_usuario = U.usuario
WHERE UEG.id_grupo = @id_grupo


-------------------------------/*CREAR USUARIO_EN_RETO*/
CREATE PROCEDURE sp_crear_usuario_en_reto
@id_usuario VARCHAR(20),
@id_reto INT
AS
INSERT INTO straviadb.dbo.USUARIO_EN_RETO
(id_usuario, id_reto) VALUES
(@id_usuario, @id_reto);

/*CONSULTAR USUARIOS DE UN RETO*/
CREATE PROCEDURE sp_consultar_usuarios_en_reto
@id_reto INT
AS
SELECT nombre, apellido1, apellido2 FROM straviadb.dbo.USUARIO AS U
JOIN straviadb.dbo.USUARIO_EN_RETO AS UEG
ON UEG.id_usuario = U.usuario
WHERE UEG.id_reto = @id_reto
-------------------------------/*CREAR USUARIO_SIGUE_USUARIO*/
CREATE PROCEDURE sp_crear_usuario_sigue_usuario
@id_usuario VARCHAR(20),
@id_seguido VARCHAR(20)
AS
INSERT INTO straviadb.dbo.USUARIO_SIGUE_USUARIO
(id_user, user_sigue) VALUES
(@id_usuario, @id_seguido);

EXEC sp_crear_usuario_sigue_usuario "juancho23", "jordan23";
EXEC sp_crear_usuario_sigue_usuario "juancho23", "lebron23";

/*CONSULTAR SEGUIDOS POR UN USUARIO*/
CREATE PROCEDURE sp_consultar_seguidos_x_usuario
@id_usuario VARCHAR(20)
AS
SELECT usuario ,nombre, apellido1, apellido2 FROM straviadb.dbo.USUARIO AS U
JOIN straviadb.dbo.USUARIO_SIGUE_USUARIO AS USU
ON USU.user_sigue = U.usuario
WHERE USU.id_user = @id_usuario

exec sp_consultar_usuarios;
select * from straviadb.dbo.ACTIVIDAD;
exec sp_consultar_seguidos_x_usuario "juancho23";