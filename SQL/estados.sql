use DBUDI

create table EstadoAula(
	aula smallint,
	estado nvarchar(10)
)

insert into EstadoAula values (1, 'ocupado')
insert into EstadoAula values (2, 'ocupado')
insert into EstadoAula values (3, 'ocupado')
insert into EstadoAula values (4, 'ocupado')
insert into EstadoAula values (5, 'ocupado')
insert into EstadoAula values (6, 'ocupado')
insert into EstadoAula values (7, 'ocupado')
insert into EstadoAula values (8, 'ocupado')
insert into EstadoAula values (9, 'ocupado')
insert into EstadoAula values (10, 'ocupado')

select * from EstadoAula

alter procedure sp_estado
(
	@tipoper smallint,
	@aulas smallint,
	@estados nvarchar(10)
)
as
begin
	if(@tipoper = 1)
	begin
		update EstadoAula set estado = @estados where aula = @aulas
	end
	if(@tipoper = 2 )
	begin 
		select estado from EstadoAula
	end
end

exec sp_estado 1, 1, 'libre'