
create or replace function referenciales.averiguar_persona(
	id integer
) returns boolean as
$$
/*
 * Funcion gestionar_curriculums
 * Averigua si existe persona en tabla persona.
 * Autor: juan jose gonzalez <juanftp100@gmail.com>
 * version: 1.0
 * fecha: 02-12-2019
 */
 begin
 	
	perform id_persona from referenciales.personas where id_persona = $1;
	if FOUND then
		return true;
	end if;
	raise exception 'Esta persona no existe en la BD' using ERRCODE = '10000';
 end
$$ language plpgsql;


select referenciales.averiguar_persona(15);

