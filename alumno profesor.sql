CREATE DATABASE PracticaExamen;
use PracticaExamen;

create table alumnos(
	idAlumno int auto_increment,
    nombre varchar(35) not null,
    apellido varchar(35) not null,
    
    PRIMARY KEY pk_idAlumno(idAlumno)
);

create table Profesor(
	idProfesor int auto_increment,
    nombre varchar(35) not null,
    apellido varchar(35) not null,
    
    primary key pk_idProfesor(idProfesor)
)