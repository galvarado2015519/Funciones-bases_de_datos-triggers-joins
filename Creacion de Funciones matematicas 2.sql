CREATE DATABASE DBSerie2_2015519;
USE DBSerie2_2015519;

/*CREATE TABLE Operaciones2(

	int valor1 not null,
    int valor2 not null,
    int masOMenos not null,
    int parOImpar not null
);*/

DELIMITER $$
CREATE FUNCTION fn_MasOMenos(X INT) RETURNS varchar (45)
	READS SQL DATA DETERMINISTIC
    BEGIN
		IF (X < 0) THEN
			RETURN 'El numero es negativo';
        else if (X > 0) THEN
			RETURN 'El numero es positivo';
		else
			RETURN 'El numero es 0';
		END IF;
		END IF;
        
    END $$

DELIMITER ;

	select fn_MasOMenos(0) as resultado;

DELIMITER $$
CREATE FUNCTION fn_ParOImapar(x int) returns varchar (45)
	READS SQL DATA DETERMINISTIC
    BEGIN
		IF (X % 2= 0) THEN
        return 'El numero es par';
        else 
        return 'El numero es impar';
        END IF;
    
    END $$
DELIMITER ;

	select fn_ParOImapar(111) as Resultado;
    
    -- drop function fn_Digito;
DELIMITER $$
CREATE FUNCTION fn_Digito(X varchar (1)) returns varchar (256)
	READS SQL DATA DETERMINISTIC
    BEGIN
		
		IF (X IN(1,2,3,4,5,6,7,8,9)) THEN
			RETURN 'Es un digito';
		else
			RETURN 'No es un digito';
        END IF;
    
    END$$
DELIMITER ;

	select fn_Digito(8) as Resultado;

-- DROP FUNCTION fn_NumeroN;

DELIMITER $$
CREATE FUNCTION fn_NumeroN(x int) RETURNS varchar (255) 
	READS SQL DATA DETERMINISTIC
    BEGIN
		declare mayor,cont,num int;
        declare completo varchar (256);
        set completo = ' ';
        set cont = 0;
        set mayor = 0;
		
        
        while (cont < x) do
			set cont = cont + 1;
			set num = floor(rand()*100);
            set completo = concat(completo, num,' , ');
            
            if (mayor < num) then
				set mayor = num;
            end if;
            
        end while;
        set completo = concat(completo,'El valor mayor es: ', mayor);
		return completo;
    END $$
DELIMITER ;

select fn_NumeroN(10) as resultado;

DELIMITER $$
CREATE FUNCTION fn_Base10A2(X INT) RETURNS VARCHAR (100)
	READS SQL DATA DETERMINISTIC
    BEGIN
		declare bin varchar (256) DEFAULT ' ';
        repeat
			case (x mod 2)
				when 0 then
					Set bin = concat('0',bin);
				when 1 then
					set bin = concat('1',bin);
			 end case;
		set x = x div 2;
        
		until (x = 0)
        end repeat;
        
        RETURN bin;
    END $$
    
DELIMITER ;

	SELECT fn_Base10A2(50) as resultado;
 
-- drop function fn_figonatzi;
DELIMITER $$
CREATE FUNCTION fn_figonatzi(x int) returns varchar (256)
	READS SQL DATA DETERMINISTIC
    BEGIN
		DECLARE cont,a,b,c INT;
        declare result varchar (256);
		set a = 0;
        set b = 1;
        set c = 0;
        set cont = 2;
                set result = ' ';

		
        if (x = 0) then
			RETURN '0 no es un numero valido';
            
        elseif (x = 1) then
			return '0';
            
		elseif (x = 2) then
			return '0, 1';
            
		else
                set result = '0,1';

			while (cont < x) do
				set cont = cont + 1;
				SET c = a + b;
                set result = concat(result, ' , ',c);
				set a = b;
				set b = c;
                
                
			end while;
		RETURN result;
        
        end if;
        
    END $$
DELIMITER ;

select fn_figonatzi(10) as resultado;


DELIMITER $$
	CREATE FUNCTION fn_Base10A16(x int) RETURNS VARCHAR (256)
    READS SQL DATA DETERMINISTIC
    BEGIN
		DECLARE acum,cont int;
        set acum = 0;
        set cont = 0;
        
	while(cont < x) do
		set cont = cont + 1;
		case (num mod 16)
			when 0 then 
				set acum = concat(acum,'0');
        end case;
    end while;
    return x;
    END $$
DELIMITER ;