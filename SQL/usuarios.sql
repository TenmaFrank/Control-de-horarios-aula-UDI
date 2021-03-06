use DBUDI;

create table table_Usuarios
(
	id_usu smallint identity(1,1) primary key,
	usuario nvarchar(20),
	contraseņa nvarchar(20)
)

insert into table_Usuarios values ( 'admin', 'admin');

select * from table_Usuarios;

alter procedure sp_ManejaUsuario(

	@tipoper smallint,
	@usuario nvarchar(20),
	@contrasena nvarchar(20)
)
as
begin
	declare @rt_usuario nvarchar(20);
	declare @rt_contrasena nvarchar(20);
	declare @msq smallint;

	if(@tipoper = 1)
	begin
		set @rt_usuario = (select usuario from table_Usuarios where usuario = @usuario)
		set @rt_contrasena = (select @contrasena from table_Usuarios where contraseņa = @contrasena)
		if(@rt_usuario is null or @rt_contrasena is null)
		begin
			set @msq = 0;
			return @msq	
		end
		else
		begin
			set @msq = 1;
			return @msq;
		end
	end

	if(@tipoper = 2)
	begin
		select usuario, contraseņa from table_Usuarios
	end

	if(@tipoper = 3)
	begin
		insert into table_Usuarios values (@usuario, @contrasena)
		set @msq = 1
		return @msq;
	end

	if(@tipoper = 4)
	begin
		delete from table_Usuarios where usuario = @usuario and contraseņa = @contrasena
		set @msq = 1
		return @msq; 
	end

end

exec sp_ManejaUsuario 4, 'orueva', '1111'