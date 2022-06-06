-------------------------------/*CREAR PATROCINADOR*/
USE straviadb;
CREATE PROCEDURE sp_crear_patrocinador
@id INT,
@nombre_rep VARCHAR(15),
@apellido1_rep VARCHAR(15),
@apellido2_rep VARCHAR(15),
@nombrecomercial VARCHAR(30),
@telefono VARCHAR(15),
@logo IMAGE
AS 
INSERT INTO PATROCINADOR
(id, nombre_rep, apellido1_rep, apellido2_rep, 
nombre_comercial, telefono_representante, logo)
VALUES
(@id, @nombre_rep, @apellido1_rep, @apellido2_rep,
@nombrecomercial, @telefono, @logo);

/*CONSULTAR PATROCINADOR POR ID*/

CREATE PROCEDURE sp_consultar_patrocinador
@id_patron INT
AS
SELECT * FROM PATROCINADOR
WHERE id = @id_patron;

/*CONSULTAR LISTA DE PATROCINADORES*/
CREATE PROCEDURE sp_consultar_patrocinadores
AS
SELECT * FROM PATROCINADOR

-------------------------------/*CREAR PATROCINA CARRERA*/

CREATE PROCEDURE sp_crear_patrocina_carrera
@id_patron INT,
@id_carrera INT
AS 
INSERT INTO PATROCINA_CARRERA
(id_patron, id_carrera) VALUES 
(@id_patron,@id_carrera);

/*CONSULTAR PATROCINADORES DE CARRERA*/
CREATE PROCEDURE sp_consultar_patrocinadores_x_carrera
@id_carrera INT
AS
SELECT *  FROM PATROCINADOR as G
JOIN PATROCINA_CARRERA AS GVR ON GVR.id_patron= G.id
WHERE GVR.id_carrera =@id_carrera;

/*PROCEDIMIENTOS ALMACENADOS REQUERIDOS PARA USUARIOS*/
-------------------------------/*CREAR GRUPO*/
CREATE PROCEDURE sp_crear_grupo
@id INT, 
@admin VARCHAR(20),
@nombre VARCHAR(20)
AS
INSERT INTO GRUPO
(id, id_admin,nombre) VALUES
(
@id, @admin, @nombre
);

---/*CONSULTAR GRUPO POR ID*/
CREATE PROCEDURE sp_consultar_grupo
@id INT
AS
SELECT * FROM GRUPO
WHERE id=@id;
/*CONSULTAR GRUPOS*/
CREATE PROCEDURE sp_consultar_grupos
AS
SELECT * FROM GRUPO


---/*MODIFICAR REGISTROS DE GRUPO*/

CREATE PROCEDURE sp_update_grupo
@id INT, 
@admin VARCHAR(20),
@nombre VARCHAR(20)
AS 
UPDATE GRUPO SET 
id=@id, id_admin=@admin, nombre=@nombre
WHERE id=@id

/*ELIMINAR GRUPO*/
CREATE PROCEDURE sp_eliminar_grupo
@idgrupo INT
AS
DELETE FROM USUARIO_EN_GRUPO WHERE
id_grupo = @idgrupo
DELETE FROM GRUPO 
WHERE id=@idgrupo;

-------------------------------/*CREAR CATEGORÍAS*/
CREATE PROCEDURE sp_crear_categorias
@id_carrera INT, 
@descripcion VARCHAR(40),
@nombre VARCHAR(20)
AS
INSERT INTO CATEGORIAS
(nombre, id_carrera,descripcion) VALUES
(
@nombre,@id_carrera, @descripcion
);
--/*CONSULTAR CATEGORÍA POR NOMBRE*/
CREATE PROCEDURE sp_consultar_categoria
@nombre VARCHAR(20)
AS
SELECT * FROM CATEGORIAS
WHERE nombre=@nombre

--/*CONSULTAR CATEGORÍAS*/
CREATE PROCEDURE sp_consultar_categorias
AS
SELECT * FROM CATEGORIAS

-------------------------------/*CREAR RETO*/

CREATE PROCEDURE sp_crear_reto
@id INT, 
@nombre VARCHAR(20),
@fecha_inicio DATE ,
@fecha_finaliza DATE ,
@tipo_actividad VARCHAR(20),
@tipo_reto VARCHAR(20)
AS
INSERT INTO RETO
(id, nombre, fecha_inicio, fecha_finaliza,
tipo_actividad, tipo_reto
) VALUES
(
@id, @nombre, @fecha_inicio, @fecha_finaliza,
@tipo_actividad, @tipo_reto
)

/*Obtener reto por id*/
CREATE PROCEDURE sp_consultar_reto
@id INT
AS
SELECT * FROM RETO
WHERE id=@id;

/*Obtener todos los retos*/

CREATE PROCEDURE sp_consultar_retos
AS
SELECT * FROM RETO

/*ACTUALIZAR REGISTROS DE RETOS*/
CREATE PROCEDURE sp_update_reto
@id INT, 
@nombre VARCHAR(20),
@fecha_inicio DATE ,
@fecha_finaliza DATE ,
@tipo_actividad VARCHAR(20),
@tipo_reto VARCHAR(20)
AS
UPDATE RETO SET
id=@id, nombre=@nombre, fecha_inicio=@fecha_inicio,
fecha_finaliza=@fecha_finaliza, 
tipo_actividad=@tipo_actividad, tipo_reto=@tipo_reto
WHERE id=@id

/*ELIMINAR RETO*/
CREATE PROCEDURE sp_eliminar_reto
@idreto INT
AS
DELETE FROM RETO 
WHERE id=@idreto

-------------------------------/*CREAR GRUPO_VE_RETO*/
CREATE PROCEDURE sp_crear_grupo_ve_reto
@id_reto INT,
@grupo INT
AS 
INSERT INTO GRUPO_VE_RETO
(id_reto, id_grupo) VALUES 
(@id_reto,@grupo);

/*CONSULTAR GRUPOS VISIBLES DE UN RETO*/
CREATE PROCEDURE sp_consultar_grupos_ven_reto
@id_reto INT
AS
SELECT nombre, id_admin  FROM GRUPO as G
JOIN GRUPO_VE_RETO AS GVR ON GVR.id_grupo= G.id
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
INSERT INTO ACTIVIDAD
(id,id_reto,id_usuario,hora_inicio,hora_fin ,
tipo_actividad ,kilometraje,fecha,recorrido) 
VALUES
(@id,@id_reto,@id_usuario,@hora_inicio,@hora_fin,
@tipo_actividad,@kilometraje,@fecha,@recorrido
)

/*OBTENER ACTIVIDAD POR USUARIO*/
CREATE PROCEDURE sp_consultar_actividad_usuario
@usuario_id VARCHAR(20)
AS
SELECT * FROM ACTIVIDAD
WHERE id_usuario=@usuario_id;

/*OBTENER ACTIVIDAD DE AMIGOS DEL USUARIO*/
CREATE PROCEDURE sp_consultar_actividad_amigos
@usuario VARCHAR (20)
AS
SELECT id_usuario, fecha, hora_fin, tipo_actividad, kilometraje, recorrido  FROM ACTIVIDAD AS ACT
JOIN USUARIO_SIGUE_USUARIO AS USU
ON USU.user_sigue = ACT.id_usuario
WHERE USU.id_user = @usuario

/*OBTENER LA DURACIÓN DE UNA ACTIVIDAD*/

CREATE PROCEDURE sp_consultar_duracion
@id_actividad INT
AS
SELECT id_usuario, fecha, tipo_actividad, 
CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(SECOND,hora_inicio, hora_fin),0), 108) 
AS Duracion
FROM ACTIVIDAD
WHERE id=@id_actividad

-------------------------------/*CREAR CARRERA*/
CREATE PROCEDURE sp_crear_carrera
@_id INT,
@_id_actividad VARCHAR(20),
@nombre	VARCHAR(20),
@_fecha DATE,
@_costo DECIMAL(10,2)
AS
INSERT INTO CARRERA
(id, id_actividad, nombre, fecha, costo
) VALUES
(
@_id, @_id_actividad, @nombre,@_fecha, @_costo)

/*OBTENER CARRERA*/
CREATE PROCEDURE sp_consultar_carrera
@id_carrera INT
AS
SELECT * FROM CARRERA
WHERE id=@id_carrera

/*OBTENER CARRERAS*/
CREATE PROCEDURE sp_consultar_carreras
AS
SELECT * FROM CARRERA

/*ELIMINAR CARRERAS*/
CREATE PROCEDURE sp_eliminar_carrera
@_id INT
AS
DELETE FROM CARRERA 
WHERE id=@_id 

/*ACTUALIZAR DATOS DE CARRERA*/
CREATE PROCEDURE sp_update_carrera
@_id INT,
@_id_actividad VARCHAR(20),
@nombre	VARCHAR(20),
@_fecha DATE,
@_costo DECIMAL(10,2)
AS
UPDATE CARRERA SET id=@_id,
id_actividad =@_id_actividad ,nombre= @nombre,fecha=@_fecha,
costo = @_costo
WHERE id = @_id;

-------------------------------/*CREAR CUENTA BANCARIA*/
CREATE PROCEDURE sp_crear_cuenta_bancaria
@id INT, --- id de la carrera a la que está asociada
@no_cuenta VARCHAR(30)
AS
INSERT INTO CUENTA_BANCARIA
(id, cuenta) VALUES (@id, @no_cuenta);

/*CONSULTAR CUENTA POR ID*/
CREATE PROCEDURE sp_consultar_cuenta_bancaria
@id INT
AS
SELECT * FROM CUENTA_BANCARIA
WHERE id=@id
/*CONSULTAR CUENTAS*/
CREATE PROCEDURE sp_consultar_cuentas_bancarias
AS
SELECT * FROM CUENTA_BANCARIA

-------------------------------/*CREAR PAGO DE CARRERA*/
CREATE PROCEDURE sp_crear_pagocarreras
@id_carrera INT,
@codigo INT,
@estado VARCHAR(10)
AS 
INSERT INTO PAGOCARRERA
(id_carrera, codigo, estado) VALUES 
(@id_carrera, @codigo, @estado);

/*CONSULTAR PAGO DE CARRERA POR ID DE CARRERA*/
CREATE PROCEDURE sp_consultar_pago_carrera
@id_carrera INT
AS
SELECT * FROM PAGOCARRERA
WHERE id_carrera=@id_carrera

/*CONSULTAR PAGOS DE CARRERAS*/
CREATE PROCEDURE sp_consultar_pagos_carreras
AS
SELECT * FROM PAGOCARRERA

-------------------------------/*CREAR GRUPO_VE_CARRERA*/
CREATE PROCEDURE sp_crear_grupo_ve_carrera
@id_carrera INT,
@grupo INT
AS 
INSERT INTO GRUPO_VE_CARRERA
(id_carrera, id_grupo) VALUES 
(@id_carrera,@grupo);

/*CONSULTAR GRUPOS VISIBLES DE UNA CARRERA*/
CREATE PROCEDURE sp_consultar_grupos_ven_carrera
@id_carrera INT
AS
SELECT nombre, id_admin  FROM GRUPO as G
JOIN GRUPO_VE_CARRERA AS GVC ON GVC.id_grupo= G.id
WHERE GVC.id_carrera =@id_carrera;

-------------------------------/*CREAR ROLES*/
CREATE PROCEDURE sp_crear_rol
@rol_id INT,
@rol_nombre VARCHAR(10)
AS
INSERT INTO ROL (id, nombre) VALUES(@rol_id, @rol_nombre);


-------------------------------/*CREAR USUARIOS*/
CREATE PROCEDURE sp_crear_usuario
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
INSERT INTO USUARIO(
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


/*CONSULTA PARA OBTENER USUARIO POR PRIMARY KEY*/
CREATE PROCEDURE sp_consultar_usuario
@usuario_id VARCHAR(20)
AS
SELECT * FROM straviadb.dbo.USUARIO
WHERE usuario=@usuario_id;

/*CONSULTA PARA OBTENER TODOS LOS USUARIOS*/
CREATE PROCEDURE sp_consultar_usuarios
AS
SELECT * FROM straviadb.dbo.USUARIO

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
FROM USUARIO
WHERE usuario=@nombreusuario

/*ACTUALIZAR REGISTROS DE USUARIO*/

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
UPDATE USUARIO 
SET  usuario= @nombreusuario,
id_rol = @id_rol,id_carrera = @id_carrera,
nombre = @nombre, apellido1 = @apellido1, apellido2 = @apellido2,
foto = @foto, nacionalidad = @nacionalidad, 
fecha_nacimiento = @fecha_nacimiento,
_password = @_password
WHERE usuario= @nombreusuario;

------ELIMINAR USUARIO------
CREATE PROCEDURE sp_eliminar_usuario
@nombreusuario VARCHAR(20)
AS
BEGIN
DELETE FROM ACTIVIDAD 
WHERE id_usuario=@nombreusuario 
DELETE FROM USUARIO 
WHERE usuario=@nombreusuario 
END;

-------------------------------/*CREAR USUARIO_EN_GRUPO*/
CREATE PROCEDURE sp_crear_usuario_en_grupo
@id_usuario VARCHAR(20),
@id_grupo INT
AS
INSERT INTO USUARIO_EN_GRUPO
(id_usuario, id_grupo) VALUES
(@id_usuario, @id_grupo);

/*CONSULTAR USUARIOS DE UN GRUPO*/
CREATE PROCEDURE sp_consultar_usuarios_en_grupo 
@id_grupo INT
AS
SELECT nombre, apellido1, apellido2 FROM USUARIO AS U
JOIN USUARIO_EN_GRUPO AS UEG
ON UEG.id_usuario = U.usuario
WHERE UEG.id_grupo = @id_grupo

-------------------------------/*CREAR USUARIO_EN_RETO*/
CREATE PROCEDURE sp_crear_usuario_en_reto
@id_usuario VARCHAR(20),
@id_reto INT
AS
INSERT INTO USUARIO_EN_RETO
(id_usuario, id_reto) VALUES
(@id_usuario, @id_reto);

/*CONSULTAR USUARIOS DE UN RETO*/
CREATE PROCEDURE sp_consultar_usuarios_en_reto
@id_reto INT
AS
SELECT nombre, apellido1, apellido2 FROM USUARIO AS U
JOIN USUARIO_EN_RETO AS UEG
ON UEG.id_usuario = U.usuario
WHERE UEG.id_reto = @id_reto
-------------------------------/*CREAR USUARIO_SIGUE_USUARIO*/
CREATE PROCEDURE sp_crear_usuario_sigue_usuario
@id_usuario VARCHAR(20),
@id_seguido VARCHAR(20)
AS
INSERT INTO USUARIO_SIGUE_USUARIO
(id_user, user_sigue) VALUES
(@id_usuario, @id_seguido);

/*CONSULTAR SEGUIDOS POR UN USUARIO*/
CREATE PROCEDURE sp_consultar_seguidos_x_usuario
@id_usuario VARCHAR(20)
AS
SELECT usuario ,nombre, apellido1, apellido2 FROM USUARIO AS U
JOIN USUARIO_SIGUE_USUARIO AS USU
ON USU.user_sigue = U.usuario
WHERE USU.id_user = @id_usuario



