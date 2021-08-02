-- Selecciona DB
use DBUDI

-- Crea procedimiento almacenado
create procedure sp_BajaHorario(
	-- Variables de entrada al SP
	@aula smallint,
	@titular nvarchar(100),
	@auxiliar nvarchar(100),
	@grupo nvarchar(10),
	@carrera smallint,
	@inicio smallint,
	@fin smallint,
	@materia nvarchar(100),
	@dia smallint
)
as
begin
	-- Declara variables
	declare @id_t smallint
	declare @id_a smallint
	declare @id_g smallint
	declare @id_m smallint
	-- Consulta y asigna valores a las variables
	set @id_t = (select id_tit from prof_t where @titular = nom_tit)
	set @id_a = (select id_aux from prof_a where @auxiliar = nom_aux)
	set @id_g = (select id_grupo from grupos where @grupo = clave)
	set @id_m = (select id_mat from materias where @materia = nom_mat)
	-- Elimina el registro de horarios
	delete from horarios where @aula = aula and @id_t = prof_tit
	and @id_a = prof_aux and @id_g = grupo and @carrera = carrera
	and @inicio = hora_i and @fin = hora_f and @id_m = materia
	and @dia = dia
end;

-- Pruebas de ejecución del SP
	exec sp_BajaHorario 1, 'Juanito', 'Frank', '1CV2', 1, 1, 3, 'Programación Orientada a Objetos', 1