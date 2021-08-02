-- Selecciona DB
use DBUDI

-- Crea prodecimiento almacenado
create procedure sp_TableroHorario(
	-- Variables de entrada
		@hora smallint,
		@dia smallint
)
as
begin
	declare @aux 

	select h.aula as AULA, t.nom_tit as 'PROFESOR TITULAR', 
	hs.hora as 'HORA INICIAL', hss.hora as 'HORA FINAL', m.nom_mat as MATERIA, sem.nomdia as dia
	from horarios h, prof_t t, horas hs, horas hss, materias m, semana sem
	where h.hora_i = @hora and h.prof_tit = t.id_tit and h.materia = m.id_mat 
	and h.hora_i = hs.id_hora and h.hora_f = hss.id_hora and h.dia = @dia and h.dia = sem.id_dia
end

exec sp_TableroHorario '16:35', 1

create procedure sp_TableroHorario2
as
begin
 select * from horarios
end

alter procedure sp_TableroHorario(
    -- Variables de entrada
        @hora nvarchar(10),
        @dia smallint
)
as
begin

	declare @horaini date
	declare @horafin date

	set @horaini = (select convert(varchar, dateadd(MINUTE, -45, '06:30'), 108) as horaini1)
	set @horafin = (select convert(varchar, dateadd(MINUTE, 45, '07:09'), 108) as horafin1)

    declare @horas smallint
    set @horas = (select id_hora from horas where hora between @horaini and @horafin)


    select h.aula as AULA, t.nom_tit as 'PROFESOR TITULAR', 
    hs.hora as 'HORA INICIAL', hss.hora as 'HORA FINAL', m.nom_mat as MATERIA,
    s.nomdia as DIA
    from horarios h, prof_t t, horas hs, horas hss, materias m, semana s
    where h.prof_tit = t.id_tit and h.materia = m.id_mat 
    and h.dia = @dia and h.dia = s.id_dia
	and hs.id_hora = 

end




alter procedure sp_TableroHorario(
    -- Variables de entrada
        @hora nvarchar(10),
        @dia smallint
)
as
begin
    declare @hour nvarchar(10)
    set @hour = (select MAX(hora) from horas where hora <= @hora)
    declare @horas smallint
    set @horas = (select id_hora from horas where @hour = hora)
    select h.aula as AULA, t.nom_tit as 'PROFESOR TITULAR', 
    hs.hora as 'HORA INICIAL', hss.hora as 'HORA FINAL', m.nom_mat as MATERIA,
    s.nomdia as DIA
    from horarios h, prof_t t, horas hs, horas hss, materias m, semana s
    where @horas between h.hora_i and h.hora_f and h.prof_tit = t.id_tit and h.materia = m.id_mat 
    and h.hora_i = hs.id_hora and h.hora_f = hss.id_hora and h.dia = @dia and h.dia = s.id_dia
    and @horas < h.hora_f
end