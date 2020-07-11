-- ///////////////////////////////////////////////////////////////////////////////////////////////////////// -- 5
-- 12)	Empleados contratados entre los años X y Y
DROP PROCEDURE sp_Inciso12;
DELIMITER $$
	CREATE PROCEDURE sp_Inciso12(IN añoX INT, IN añoY INT)
		BEGIN
			SELECT idEmpleado, nombre, edad, fechaDeNacimiento as 'fecha de nacimiento',fechaDeIngreso as 'fecha de contratación' 
			FROM Empleados WHERE SUBSTRING(fechaDeIngreso, 1,4) BETWEEN añoX AND añoY ORDER BY fechaDeIngreso ASC;
        END$$
DELIMITER ;
CALL sp_Inciso12(1990, 2000);


	-- Empleados con una edad mayor a 35 años -----------------------------------------------------------------------------------------------------------
	
	CREATE VIEW EmpleadosMayores35 as
	SELECT * FROM Empleados WHERE edad > 35 and tipoDeCategoria = administrativo;
	
	-- 17 -----------------------------------------------------------------------------------------------------------------
DELIMITER $$
	CREATE PROCEDURE sp_Inciso17(IN departamento VARCHAR(45))
    BEGIN
		SELECT E.idEmpleado, E.nombre, D.descripcion AS departamento FROM Empleados E INNER JOIN
		Asignaciones A ON E.idEmpleado = A.idEmpleado INNER JOIN 
		Oficinas O ON O.idOficina = A.idOficina INNER JOIN 
		Departamentos D ON D.idDepartamento = O.idDepartamento
		WHERE D.descripcion != departamento ORDER BY E.idEmpleado ASC;
	END$$
DELIMITER ;
CALL sp_Inciso17('Quiche');

	
	-- Empleados con 40 años o mayores ---------------------------------------------------------------------------------------------------------

SELECT count(edad) FROM empleados where edad >= 40;

	-- Creacion de vista para sueldos totaltes de empleados -----------------------------------------------------------------------------------------------------------
	
	CREATE VIEW SueldoDeCadaEmpleadoYBonificacion as
	SELECT sueldoBase,bonificacionGubernamental,bonificacionEmpresarial FROM Categorias;