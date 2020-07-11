-- Autor Gildardo Alvarado
-- CREADO EL 19/02/2019, se creo la tabla Laboratorio, se creo de la funcion promedio a la de factorial, se crearon los procedimientos.
-- EL 20/02/2019 se creo la funcion sucesion y se ordeno el contenido.
CREATE DATABASE DBParcial2015519;
USE DBParcial2015519;


	CREATE TABLE Laboratorio(
		codigoLaboratorio int not null auto_increment,
		valor1 int not null,
        valor2 int not null,
        valor3 int not null,
        valor4 int not null,
        valor5 int not null,
        promedio decimal(6,2),
        cuadrado int not null default 0,
        cubo int not null default 0,
        xALay int not null default 0,
        factorial decimal (8,2),
        sucesion decimal (8,2),
        perfectos int not null default 0,
        
        primary KEY PK_codigoLaboratorio(codigoLaboratorio)
    );
    
    
    DELIMITER $$
    CREATE FUNCTION fn_Promedio(x decimal (6,2), y decimal (6,2), z decimal (6,2), a decimal (6,2), b decimal (6,2)) RETURNS DECIMAL
    READS SQL DATA DETERMINISTIC
		BEGIN
			DECLARE resultado int;
            
            SET resultado = (x + y + z + a + b)/5;
            
		RETURN resultado;
        END $$
    DELIMITER ;
   
   
    SELECT fn_Promedio(5.00,6.00,7.00,8.00,9.00) as Promedio;
    
    
    
    DELIMITER $$
    CREATE FUNCTION fn_Cuadrado(X INT) returns INT
    READS SQL DATA DETERMINISTIC
		BEGIN
			DECLARE resultado int;
            
            SET resultado = x * x;
            
        RETURN resultado;
        END $$
	DELIMITER ;
    
    
    SELECT fn_Cuadrado(5) as cuadrado;
    

    DELIMITER $$
    CREATE FUNCTION fn_Cubo(x int) returns int
    READS SQL DATA DETERMINISTIC
		BEGIN
			DECLARE resultado int;
            
            SET resultado = fn_Cuadrado(x)*x;
		RETURN resultado;
        END $$
	DELIMITER ;
    
    
    SELECT fn_Cubo(5) as Cubo;
    
    
    DELIMITER $$
    CREATE FUNCTION fn_XALaY(x int, y int) RETURNS INT
    READS SQL DATA DETERMINISTIC
		BEGIN
			DECLARE resultado int;
            DECLARE contador int;
            DECLARE acum int;
            
            SET resultado = 1;
            SET contador = 0;
            
            while (contador < y) do
            
            SET resultado = x * resultado;
            SET contador = contador +1;       
            
            END WHILE;
             RETURN resultado;
        END $$
	DELIMITER ;
    
    
    SELECT fn_XALaY(8,3) as XALaY;
    

    DELIMITER $$
    CREATE FUNCTION fn_Factorial(x int) RETURNS int
		READS SQL DATA DETERMINISTIC	
        BEGIN
			DECLARE contador int;
            DECLARE increment int;
            DECLARE increment2 int;
            DECLARE resultado int;
            
            SET contador = 1;
            SET increment = 1;
            SET resultado = 1;
            SET increment2 = 2;
            
            WHILE(contador < x)DO
            
            SET resultado = resultado * increment2;
            SET increment2 = increment2 + 1;
            SET contador = contador + 1;
            END WHILE;
            RETURN resultado;
        END $$
	DELIMITER ;
    
   
   SELECT fn_Factorial(4) as factorial;
    
   
   DELIMITER $$
    CREATE function fn_sucesion(x decimal(8,4)) RETURNS decimal (8,4)
    reads sql data deterministic
		BEGIN
			DECLARE contador decimal (10,2);
            DECLARE acum decimal (10,2);
            DECLARE a decimal (10,2);
            
            SET contador = 0;
            SET acum = 0;
            SET a = 0;
            
            WHILE (contador < x)DO
			SET contador = contador + 1;      
            SET acum = fn_factorial(contador);
			SET a = a + contador/acum;
            
            END WHILE;
            
            RETURN a;
		END $$
	DELIMITER ;
    
    
    SELECT fn_sucesion(9) as sucesion;
    
    
    DELIMITER $$
    CREATE PROCEDURE sp_AgregarDato(in valor1 int, in valor2 int, in Valor3 int, in valor4 int, in valor5 int)
		BEGIN
			INSERT INTO Laboratorio(Laboratorio.valor1,Laboratorio.valor2,Laboratorio.valor3,Laboratorio.valor4,Laboratorio.valor5) 
        VALUES (valor1,valor2,valor3,valor4,valor5);
	END $$
    DELIMITER ;
    
    
    CALL sp_AgregarDato(5,6,7,8,9);
    
    DELIMITER $$
    CREATE PROCEDURE sp_ModificarDato(in codigo int)
		BEGIN
				UPDATE Laboratorio
                SET promedio = fn_Promedio(Laboratorio.valor1,Laboratorio.valor2,Laboratorio.valor3,Laboratorio.valor4,Laboratorio.valor5),
                cuadrado = fn_Cuadrado(Laboratorio.valor1),
                cubo = fn_Cubo(laboratorio.valor5),
                xALaY = fn_XALaY(Laboratorio.valor1, Laboratorio.valor2),
                factorial = fn_Factorial(Laboratorio.valor1),
                sucesion = fn_Sucesion(Laboratorio.valor5)
                WHERE codigoLaboratorio = codigo;
		END $$
    DELIMITER ;
    
    
   call sp_ModificarDato(1);

	DELIMITER $$
    CREATE PROCEDURE sp_ListarDatos()
    READS SQL DATA DETERMINISTIC
		BEGIN
			SELECT Laboratorio.valor1,
					Laboratorio.valor2,
                    Laboratorio.valor3,
                    Laboratorio.valor4,
                    Laboratorio.valor5,
                    Laboratorio.promedio,
                    Laboratorio.cuadrado,
                    Laboratorio.cubo,
                    Laboratorio.xALaY,
                    Laboratorio.factorial,
                    Laboratorio.sucesion
			FROM Laboratorio;
        END $$
	DELIMITER ;
    
    
    call sp_ListarDatos();
    