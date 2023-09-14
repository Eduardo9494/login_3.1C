CREATE DATABASE Portalweb
USE Portalweb

CREATE TABLE Usuarios(
Cod_Usuario int identity(1,1),
Nombre varchar(50),
Apellido varchar(50),
Correo varchar(70),
Edad int,
Usuario varchar(50),
Contraseña varchar(50)
)

Alter table Usuarios add Cod_rol int 

select * from Usuarios

Create table Permisos(
Cod_Permisos int identity(1,1),
Nombre_Permiso varchar (50)
)

create table Roles(
Cod_rol int identity(1,1),
Nombre_Rol varchar(50)
)

create table Roles_Permisos(
Cod_rol_permiso int identity (1,1),
Cod_Rol int,
Cod_permiso int,
Estado bit
)

insert into Roles values ('Admin')
insert into Roles values ('User')

select * from Roles

insert into Permisos values ('Create')
insert into Permisos values ('Read')
insert into Permisos values ('Update')
insert into Permisos values ('Delete')

select * from Permisos

select * from Roles_Permisos


insert into Roles_Permisos values (1,1,1)
insert into Roles_Permisos values (1,2,1)
insert into Roles_Permisos values (1,3,1)
insert into Roles_Permisos values (1,4,1)

insert into Roles_Permisos values (2,1,0)
insert into Roles_Permisos values (2,2,1)
insert into Roles_Permisos values (2,3,0)
insert into Roles_Permisos values (2,4,0)

create procedure sp_registrar
@Nombre varchar(50),
@Apellido varchar(50),
@Correo varchar(70),
@Edad int,
@Usuario varchar(50),
@Contraseña varchar(max),
@Cod_Rol int,
@Patron varchar (50)
as begin
insert  into Usuarios values (@Nombre , @Apellido , @Correo, @Edad , @Usuario , ENCRYPTBYPASSPHRASE (@Patron , @Contraseña) , @Cod_Rol)
end



create procedure sp_login
@Usuario varchar(50),
@Contraseña varchar(max),
@Patron varchar (50)
as begin
select * from Usuarios where Usuario=@Usuario and CONVERT(varchar(50) , DECRYPTBYPASSPHRASE(@Patron , Contraseña))= @Contraseña
end