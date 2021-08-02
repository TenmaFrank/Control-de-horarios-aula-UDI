-- Selecciona DB
use DBUDI

-- Crea procedimiento almacenado
create procedure sp_AltaHorario(
	-- Variables de entrada al sp
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
	declare @hour smallint
	declare @id_t smallint
	declare @id_a smallint
	declare @id_g smallint
	declare @id_mat smallint
	declare @msg smallint
	-- Consulta la hora del aula para evitar repetición
	set @hour = (select AVG(1) from horarios where @inicio = hora_i and @fin = hora_f and aula = @aula)
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
	if(@hour is null)
	begin
		-- Da de alta horario
		insert into horarios values ('', @aula, @id_t, @id_a, @id_g, @carrera, @inicio, @fin, @id_mat, @dia)		
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
end; 

-- Pruebas de ejecución del SP
	exec sp_AltaHorario 1, 'Juanito', 'Frank', '1CV2', 1, 1, 3, 'Programación Orientada a Objetos', 1
	exec sp_AltaHorario 1, 'Juanito', 'Frank', '1CV2', 1, 1, 3, 'Fundamentos de Programación', 1
	exec sp_AltaHorario 1, 'Juanito', 'Frank', '1CV2', 1, 1, 3, 'Física', 1
	exec sp_AltaHorario 1, 'Juanito', 'Frank', '1CV2', 1, 1, 3, 'Cálculo Integral y Diferencial', 1
	exec sp_AltaHorario 1, 'Frank', 'Juanito', '2CV2', 1, 1, 3, 'Química Básica', 1
	exec sp_AltaHorario 1, 'Juanito', 'Frank', '1CV2', 1, 4, 6, 'Programación Orientada a Objetos', 1
	exec sp_AltaHorario 1, 'Juanito', 'Frank', '1CV2', 1, 4, 6, 'Fundamentos de Programación', 1

-- Prueba de ejecución del SP con visualización del valor entero devuelto
	declare @status int
	exec @status = sp_AltaHorario 2, 'Juanito', 'Frank', '1CV2', 1, 6, 8, 'Fundamentos de Programación', 1
	select @status;

-- Validar repetición de hora en la misma aula

select * from horarios