create or replace function modulo_1.gestionar_curriculums(
	accion varchar
	, v_idcurriculum bigint     
    , v_idpersona bigint
    , v_idnivelacad integer
) returns boolean as
$$
/*
 * Funcion gestionar_curriculums
 * Se define segun accion:
 * registrar, modificar, baja
 * operaciones sobre la tabla curriculums.
 * Autor: juan jose gonzalez <juanftp100@gmail.com>
 * version: 1.0
 * fecha: 02-12-2019
 */
 declare
 	v_fecha_actual timestamp := now();
 begin
 	--Controles
	perform referenciales.averiguar_persona(v_idpersona);
	--Caso
	case accion
		when 'registrar' then
			INSERT INTO modulo_1.curriculums(
			id_curriculum, fecha, id_persona, id_nivel_acad)
			VALUES (v_idcurriculum, v_fecha_actual, v_idpersona, v_idnivelacad);
		when 'modificar' then
		when 'baja' then
		else raise exception 'Ninguna opcion es correcta' using ERRCODE = '20100';
 	end case;
 end
$$ language plpgsql;
