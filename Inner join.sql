CREATE DATABASE DBEmpresaX;
USE DBEmpresaX;

CREATE TABLE Departamentos(
	codigoDepartamento int not null,
    nombreDepartamento varchar(100),
  
	PRIMARY KEY PK_codigoDepartamento(codigoDepartamento)
);
	
CREATE TABLE Empleados(
	codigoEmpleado int not null auto_increment,
    nombreEmpleado varchar(256) not null,
    codigoDepartamento int,
    
    PRIMARY KEY PK_codigoEmpleado (codigoEmpleado)
);

DELIMITER $$
CREATE procedure SP_AgregarDepartamento(codigoDepartamento int, nombreDepartamento VARCHAR (100))
	BEGIN
		INSERT INTO Departamentos (codigoDepartamento,nombreDepartamento)VALUES(codigoDepartamento,nombreDepartamento);
    
    END$$
DELIMITER ;

DELIMITER $$
CREATE procedure SP_AgregarEmpleado(nombreEmpleado VARCHAR (100),codigoEmpleado int)
	BEGIN
		INSERT INTO Empleados (codigoEmpleado,nombreEmpleado)VALUES(codigoEmpleado,nombreEmpleado);
    
    END$$
DELIMITER ;


call SP_AgregarDepartamento(1030,'Marqueting');
call SP_AgregarDepartamento(1520,'Ventas');
call SP_AgregarDepartamento(1035,'Mecanica');
call SP_AgregarDepartamento(1350,'Informatica');
call SP_AgregarDepartamento(1045,null);

call SP_AgregarEmpleado('Pedro',1350);
call SP_AgregarEmpleado('Luis',1520);
call SP_AgregarEmpleado('Pablo',1035);
call SP_AgregarEmpleado('Mathias',1030);
call SP_AgregarEmpleado('Carlos',null);
call SP_AgregarEmpleado('Derick',1351);
call SP_AgregarEmpleado('Denilson',1522);

DELIMITER $$
CREATE PROCEDURE SP_ModificarDepartamento()
	BEGIN
		UPDATE
        SET
        WHERE
	END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_ModificarEmpleado()
	BEGIN
		UPDATE
        SET
        WHERE
	END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_ListarDepartamentos()
	BEGIN
		SELECT Departamentos.codigoDepartamento, Departamentos.nombreDepartamento FROM Departamentos;
    
    END$$
DELIMITER ;

CREATE PROCEDURE SP_ListarDepartamentos()
	BEGIN
		SELECT Empleados.codigoEmpleado, Empleados.nombreEmpleado FROM Empleados
    
    END$$
DELIMITER ;

SELECT * FROM Departamentos INNER JOIN Empleados;