ALTER TABLE straviadb.USUARIO
	ADD CONSTRAINT USUARIO_ROL_FK FOREIGN KEY(id_rol)
		REFERENCES ROL(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

ALTER TABLE straviadb.USUARIO
	ADD CONSTRAINT USUARIO_CARRERA_FK FOREIGN KEY(id_carrera)
		REFERENCES CARRERA(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

ALTER TABLE straviadb.ACTIVIDAD
	ADD CONSTRAINT ACTIVIDAD_RETO_FK FOREIGN KEY(id_reto)
		REFERENCES RETO(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

ALTER TABLE straviadb.ACTIVIDAD
	ADD CONSTRAINT ACTIVIDAD_USUARIO_FK FOREIGN KEY(id_usuario)
		REFERENCES USUARIO(usuario)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

ALTER TABLE straviadb.CARRRERA
	ADD CONSTRAINT CARRERA_ACTIVIDAD_FK FOREIGN KEY(id_actividad)
		REFERENCES ACTIVIDAD(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE;