﻿CREATE DATABASE Portalweb
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




