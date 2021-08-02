-- Selecciona DB
use DBUDI

-- Crea procedimiento almacenado
create procedure sp_ReporteHorario(
	-- Variables de entrada al sp
		-- Variables para validación
		@inicio smallint,
		@fin smallint,
		@titular nvarchar(100),
		@grupo nvarchar(10),
		@materia nvarchar(100),
		@carrera smallint
)
as
begin
	-- Muestra registros por horario (inicial y final)
	if(@inicio > 0 and @fin > 0)
	begin
		select h.aula as AULA, s.nomdia as DIA, t.nom_tit as 'PROFESOR TITULAR', 
		a.nom_aux as 'PROFESOR ADJUNTO', g.clave as CLAVE, c.nom_car as CARRERA,
		hs.hora as 'HORA INICIAL', hss.hora as 'HORA FINAL', m.nom_mat as MATERIA
		from horarios h, semana s, prof_t t, prof_a a, horas hs, horas hss, grupos g, carreras c,
		materias m
		where h.hora_i = @inicio  and h.hora_f = @fin
		and h.carrera = c.id_car and h.dia = s.id_dia and h.prof_tit = t.id_tit
		and h.prof_aux = a.id_aux and h.grupo = g.id_grupo and h.materia = m.id_mat
		and h.hora_i = hs.id_hora and h.hora_f = hss.id_hora
	end
	-- Muestra registros por profesor titular (cadena no vacía)
	if(@titular != '')
	begin
		declare @tit smallint
			set @tit = (select id_tit from prof_t where @titular = nom_tit)
		select h.aula as AULA, s.nomdia as DIA, t.nom_tit as 'PROFESOR TITULAR', 
		a.nom_aux as 'PROFESOR ADJUNTO', g.clave as CLAVE, c.nom_car as CARRERA,
		hs.hora as 'HORA INICIAL', hss.hora as 'HORA FINAL', m.nom_mat as MATERIA
		from horarios h, semana s, prof_t t, prof_a a, horas hs, horas hss, grupos g, carreras c,
		materias m
		where h.hora_i between 1 and 31  and h.hora_f between 1 and 31
		and h.carrera = c.id_car and h.dia = s.id_dia and h.prof_tit = @tit
		and h.prof_tit = t.id_tit and h.prof_aux = a.id_aux 
		and h.grupo = g.id_grupo and h.materia = m.id_mat
		and h.hora_i = hs.id_hora and h.hora_f = hss.id_hora
	end
	-- Muestra registros por grupo (cadena no vacía)
	if(@grupo != '')
	begin
		declare @grup smallint
			set @grup = (select id_grupo from grupos where @grupo = clave)
		select h.aula as AULA, s.nomdia as DIA, t.nom_tit as 'PROFESOR TITULAR', 
		a.nom_aux as 'PROFESOR ADJUNTO', g.clave as CLAVE, c.nom_car as CARRERA,
		hs.hora as 'HORA INICIAL', hss.hora as 'HORA FINAL', m.nom_mat as MATERIA
		from horarios h, semana s, prof_t t, prof_a a, horas hs, horas hss, grupos g, carreras c,
		materias m
		where h.hora_i between 1 and 31  and h.hora_f between 1 and 31
		and h.carrera = c.id_car and h.dia = s.id_dia and h.prof_tit = t.id_tit 
		and h.prof_aux = a.id_aux and h.grupo = @grup and h.materia = m.id_mat
		and h.hora_i = hs.id_hora and h.hora_f = hss.id_hora and h.grupo = g.id_grupo
	end
	-- Muestra registros por materia (cadena no vacía)
	if(@materia != '')
	begin
		declare @mat smallint
			set @mat = (select id_mat from materias where @materia = nom_mat)
		select h.aula as AULA, s.nomdia as DIA, t.nom_tit as 'PROFESOR TITULAR', 
		a.nom_aux as 'PROFESOR ADJUNTO', g.clave as CLAVE, c.nom_car as CARRERA,
		hs.hora as 'HORA INICIAL', hss.hora as 'HORA FINAL', m.nom_mat as MATERIA
		from horarios h, semana s, prof_t t, prof_a a, horas hs, horas hss, grupos g, carreras c,
		materias m
		where h.hora_i between 1 and 31  and h.hora_f between 1 and 31
		and h.carrera = c.id_car and h.dia = s.id_dia and h.prof_tit = t.id_tit 
		and h.prof_aux = a.id_aux and h.grupo = g.id_grupo and h.materia = @mat
		and h.hora_i = hs.id_hora and h.hora_f = hss.id_hora and h.materia = m.id_mat
	end
	-- Muestra registros por carrera (cadena no vacía)
	if(@carrera > 0)
	begin
		select h.aula as AULA, s.nomdia as DIA, t.nom_tit as 'PROFESOR TITULAR', 
		a.nom_aux as 'PROFESOR ADJUNTO', g.clave as CLAVE, c.nom_car as CARRERA,
		hs.hora as 'HORA INICIAL', hss.hora as 'HORA FINAL', m.nom_mat as MATERIA
		from horarios h, semana s, prof_t t, prof_a a, horas hs, horas hss, grupos g, carreras c,
		materias m
		where h.hora_i between 1 and 31  and h.hora_f between 1 and 31
		and h.carrera = @carrera and h.dia = s.id_dia and h.prof_tit = t.id_tit 
		and h.prof_aux = a.id_aux and h.grupo = g.id_grupo and h.materia = m.id_mat
		and h.hora_i = hs.id_hora and h.hora_f = hss.id_hora and h.carrera = c.id_car
	end
end

-- Pruebas de ejecución del SP
	exec sp_ReporteHorario 0, 0, '', '', '', 1