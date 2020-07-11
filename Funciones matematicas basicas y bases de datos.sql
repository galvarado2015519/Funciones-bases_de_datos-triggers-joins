drop database DBOperaciones2015519;
CREATE DATABASE DBOperaciones2015519;
USE DBOperaciones2015519;

	DELIMITER $$
    CREATE Function fn_Suma(x int,y int) 
		RETURNS int
		READS sql data DETERMINISTIC
			BEGIN
				DECLARE respuesta int;
                SET respuesta = x + y;
                RETURN respuesta;
                
		END $$
    
    DELIMITER ;

    
    DELIMITER $$
    CREATE FUNCTION fn_Resta(x int,y int)
     RETURNS int
	reads sql data DETERMINISTIC
			BEGIN 
				DECLARE respuesta int;
			SET respuesta = x - y;
			RETURN respuesta;
	
		END $$
        
	DELIMITER $$
    
    SELECT fn_Resta(5,4) as Resultado
    
    drop function fn_Dividir;
    DELIMITER $$
    
    CREATE FUNCTION fn_Dividir(x int, y int) RETURNS INT
		READS SQL DATA deterministic
        BEGIN
			
            
            DECLARE respuesta int;
            DECLARE acum int;
            DECLARE cont int;
            
            SET cont = 0;
            SET acum = x;
            while (acum > 0) do
            SET cont = cont + 1;
            SET acum = acum - y;
            END WHILE;
            
            RETURN cont;
		
        END $$
	
    DELIMITER ;
    
    SELECT fn_Dividir(12,4) as Resultado;
    
    
    DELIMITER $$
    CREATE FUNCTION fn_Multiplicar(x int, y int) RETURNS int
		READS SQL DATA DETERMINISTIC
        BEGIN
			DECLARE respuesta int;
            DECLARE acum int;
			declare cont int;
            SET cont = 0;
            SET acum = 0;
            while(cont < y) do
            SET cont = cont + 1 ;
            SET acum = acum + x;
            END WHILE;
            RETURN acum;
            
		END $$
        
	DELIMITER ;
    
    SELECT fn_Multiplicar(12,3) as Resultado;

	drop table Operaciones;
    CREATE TABLE Operaciones(
		codigoOperacion int not null auto_increment,
        num1 int not null,
        num2 int not null,
        suma int,
        resta int,
        multiplicar int,
        dividir int,
        
        primary key PK_codigoOperacion(codigoOperacion)
    );
    
    DELIMITER $$
    CREATE PROCEDURE sp_AgregarDato(in num1 int, in num2 int)
			BEGIN
                 INSERT INTO Operaciones (num1,num2) VALUES (num1,num2);
            
            END $$
	DELIMITER ;
    
    
    CALL sp_AgregarDato(10,5);
    drop procedure SP_ListarDatos;
    
    
    dELIMITER $$
    CREATE PROCEDURE SP_ListarDatos()
		BEGIN 
			SELECT
				Operaciones.num1,
                Operaciones.num2,
                Operaciones.suma,
                Operaciones.resta,
                Operaciones.multiplicar,
                Operaciones.dividir
                FROM Operaciones;
                
		END $$
	DELIMITER ;
    
    CALL sp_ListarDatos();
    
	select fn_Suma (Operaciones.num1,Operaciones.num2) as Resultado
		FROM Operaciones;
        
	SELECT fn_Resta(Operaciones.num1,Operaciones.num2) as Resultado
		From Operaciones;

	SELECT fn_Multiplicar(Operaciones.num1,Operaciones.num2) as Resultado
		FROM Operaciones;
        
	SELECT fn_Dividir(Operaciones.num1, Operaciones.num2) as Resultado
		FROM Operaciones;
	
    drop procedure SP_ModificarDato;
	DELIMITER $$
    CREATE PROCEDURE SP_ModificarDato(in codigo int)
		 reads sql data deterministic
         BEGIN
			update Operaciones
            set suma = fn_Suma (Operaciones.num1,Operaciones.num2),
            resta = fn_Resta(Operaciones.num1,Operaciones.num2),
            multiplicar = fn_Multiplicar(Operaciones.num1,Operaciones.num2),
            dividir = fn_Dividir(Operaciones.num1, Operaciones.num2)
            where codigoOperacion = codigo;
	END $$
    
    DELIMITER ;
     
	call SP_ModificarDato(1);
    call SP_ListarDatos();