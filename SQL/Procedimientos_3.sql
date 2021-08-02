-- Selecciona DB
use DBUDI

-- Crea procedimiento almacenado
create procedure sp_CambioHorario(
	-- Variables de entrada al sp
	-- Variables para validación
	@aula smallint,
	@dia smallint,
	@horario smallint,
	-- Variables para cambio
	@inicio smallint,
	@fin smallint,
	@titular nvarchar(100),
	@auxiliar nvarchar(100),
	@grupo nvarchar(10),
	@materia nvarchar(100),
	@carrera smallint,
	@day smallint
)
as
begin
	-- Declara variables
	declare @hora smallint
	declare @hour smallint
	declare @id_t smallint
	declare @id_a smallint
	declare @id_g smallint
	declare @id_mat smallint
	declare @msg smallint
	-- Consulta que exista el horario a modificar
	set @hora = (select id_reg from horarios where @aula = aula and @dia = dia and @horario = hora_i)
	-- Consulta la hora del aula para evitar repetición
	set @hour = (select AVG(id_reg) from horarios where @inicio = hora_i and @fin = hora_f and aula = @aula and dia = @day)
	-- Consulta y asigna el valor a la variable
	set @id_t = (select id_tit from prof_t where nom_tit = @titular)
	-- Si la variable es nula, entra al proceso
	if(@id_t is null)
	begin
		-- El dato no existe, entonces lo inserta
		insert into prof_t values (@titular)
		-- Consulta y asigna el valor a la variable
		set @id_t = (select id_tit from prof_t where nom_tit = @titular)
	end
	-- Consulta y asigna el valor a la variable
	set @id_a = (select id_aux from prof_a where nom_aux = @auxiliar)
	-- Si la variable es nula, entra al proceso
	if(@id_a is null)
	begin
		-- El dato no existe, entonces lo inserta
		insert into prof_a values (@auxiliar)
		-- Consulta y asigna el valor a la variable
		set @id_a = (select id_aux from prof_a where nom_aux = @auxiliar)
	end
	-- Consulta y asigna el valor a la variable
	set @id_g = (select id_grupo from grupos where clave = @grupo)
	-- Si la variable es nula, entra al proceso
	if(@id_g is null)
	begin
		-- El dato no existe, entonces lo inserta
		insert into grupos values (@grupo)
		-- Consulta y asigna el valor a la variable
		set @id_g = (select id_grupo from grupos where clave = @grupo)
	end
	-- Consulta y asigna el valor a la variable
	set @id_mat = (select id_mat from materias where nom_mat = @materia)
	-- Si la variable es nula, entra al proceso
	if(@id_mat is null)
	begin
		-- El dato no existe, entonces lo inserta
		insert into materias values (@materia)
		-- Consulta y asigna el valor a la variable
		set @id_mat = (select id_mat from materias where nom_mat = @materia)
	end
	if(@hora is not null)
	begin
		if(@hour is null)
		begin
			-- Da de alta horario
			update horarios set prof_tit = @id_t, prof_aux = @id_a, 
			grupo = @id_g, carrera = @carrera, hora_i = @inicio, hora_f = @fin, 
			materia = @id_mat, dia = @day	
			where @hora = id_reg
			set @msg = 1;
			-- Regresa 1 para indicar que el proceso fue exitoso
			return @msg;
		end
		else
		begin
			set @msg = 0;
			-- Regresa 0 para indicar que hay un traslape
			return @msg;
		end
	end
end; 

-- Prueba de ejecución del SP con visualización del valor entero devuelto
	declare @status int
	exec @status = sp_CambioHorario 1, 2, 6, 1, 4, 'Frank', 'Juanito', '2CV2', 'Física', 4, 5
	select @status;
