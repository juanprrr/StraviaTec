
/*PROCEDIMIENTOS ALMACENADOS REQUERIDOS PARA USUARIOS*/

/*CREAR ROLES*/
CREATE PROCEDURE sp_crear_rol
@rol_id INT,
@rol_nombre VARCHAR(10)
AS
INSERT INTO straviadb.dbo.ROL (id, nombre) VALUES(@rol_id, @rol_nombre);

EXEC sp_crear_rol 1, 'organiza';
EXEC sp_crear_rol 2, 'deportista';
SELECT * FROM straviadb.dbo.ROL;

DROP PROCEDURE sp_insertar_usuario
/*CREAR USUARIOS: FALTA AGREGAR ID CARRERA  Y CARGAR IMAGEN*/
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

SELECT * FROM straviadb.dbo.USUARIO;
/*CONSULTA PARA OBTENER USUARIO POR PRIMARY KEY*/
CREATE PROCEDURE sp_consultar_usuario
@usuario_id VARCHAR(20)
AS
SELECT * FROM straviadb.dbo.USUARIO
WHERE usuario=@usuario_id;

EXEC sp_consultar_usuario 'lebron23';

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

CREATE PROCEDURE sp_actualizar_foto
@nombreusuario VARCHAR(20)
AS
UPDATE straviadb.dbo.USUARIO SET foto = 
(SELECT * 
FROM OPENROWSET 
(BULK 'C:\Users\HP\Desktop\TEC\IX Semestre\Bases de datos\StraviaTec\SQL Server DB\fotosPerfil\lebron23.png', SINGLE_BLOB)
IMG_PERFIL)
WHERE usuario= @nombreusuario;
drop procedure sp_actualizar_foto
EXEC sp_actualizar_foto 'lebron23'
EXEC sp_consultar_usuario 'lebron23';