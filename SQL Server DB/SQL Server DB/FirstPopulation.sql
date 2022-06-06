use straviadb;
/*POPULACI�N INCIAL*/


/**EJEMPLOS DE CONSULTAS A LA BASE CON PROCEDIMIENTOS ALMACENADOS
exec sp_consultar_actividad_usuario 'juancho23'
exec sp_consultar_actividad_usuario 'jordan23'
exec sp_consultar_actividad_usuario 'lebron23'
exec sp_consultar_carreras
exec sp_consultar_categorias ---empty
exec sp_consultar_cuentas_bancarias
exec sp_consultar_grupos ---empty
EXEC sp_consultar_retos
exec sp_consultar_grupos_ven_carrera 321 ---empty
exec sp_consultar_grupos_ven_reto 1 ---empty
exec sp_consultar_pagos_carreras ---empty
exec sp_consultar_patrocinadores ---empty
exec sp_consultar_seguidos_x_usuario 'juancho23' 
exec sp_consultar_usuarios_en_reto 1 ---empty
**/

EXEC sp_crear_rol 1, 'organiza';
EXEC sp_crear_rol 2, 'deportista';
/*
CATEGOR�AS
? Junior: menor de 15 a�os
? Sub-23: de 15 a 23 a�os.
? Open: de 24 a 30 a�os.
? Elite: cualquiera que quiera inscribirse.
? Master A: de 30 a 40 a�os,
? Master B: de 41 a 50 a�os,
? Master C: m�s de 51 a�os.
*/
EXEC sp_crear_categorias 'menor de 15 a�os', 'Junior'
EXEC sp_crear_categorias 'de 15 a 23 a�os', 'Sub-23'
EXEC sp_crear_categorias 'de 24 a 30 a�os', 'Open'
EXEC sp_crear_categorias 'cualquier edad', 'Elite'
EXEC sp_crear_categorias 'de 30 a 40 a�os', 'Master A'
EXEC sp_crear_categorias 'de 41 a 50 a�os', 'Master B'
EXEC sp_crear_categorias 'm�s de 51', 'Master C'

EXEC sp_crear_patrocinador 11, 'Luis', 'Marquez', 'Jara', 'Gatored','22222222', null
EXEC sp_crear_patrocinador 12, 'Aldo', 'Martinez', 'Jara', 'Alpina','11111111', null
EXEC sp_crear_patrocinador 13, 'Marcia', 'Mora', 'Volio', 'Caf� Volio','44444444', null





