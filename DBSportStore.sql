CREATE DATABASE DBSportStore_2015519;
-- DROP DATABASE DBSportStore_2015519;
USE DBSportStore_2015519;

	CREATE TABLE Categorias(
		codigoCategoria int not null auto_increment,
        descripcion varchar(100) not null,
        
        primary key PK_codigoCarrera (codigoCategoria)
        
	);
    
    CREATE TABLE Marcas(
		codigoMarca int not null auto_increment,
        descripcion varchar(100) not null,
        
        primary key PK_codigoMarca(codigoMarca)
	);
    
	CREATE TABLE Tallas(
		codigoTalla int not null auto_increment,
        descripcion varchar(100) not null,
        
        primary key PK_codigoTalla(codigoTalla)
    );
    
    CREATE TABLE Productos(
		codigoProducto int not null auto_increment,
        descripcion varchar(100) not null,
        existencia int not null default 0,
        precioUnitario decimal(10,2) not null default 0.00,
        precioPorDocena decimal(10,2) not null default 0.00,
        precioPorMayor decimal(10,2) not null default 0.00,
        codigoCategoria int not null,
        codigoMarca int not null,
        codigoTalla int not null,
        
        primary key PK_codigoProducto(codigoProducto),
        constraint FK_Productos_Categorias foreign key (codigoCategoria) references Categorias(codigoCategoria),
        constraint FK_Productos_Marcas foreign key (codigoMarca) references Marcas(codigoMarca),
        constraint FK_Productos_Tallas foreign key (codigoTalla) references Tallas(codigoTalla)
    );
   
		INSERT INTO Categorias(descripcion) VALUES('zapateria');
			
		SELECT * FROM Categorias;
        
        
-- procedimientos almacenados de agregas --------------------------------------------------------------------------------------------------------------
		
        Delimiter $$
        
		CREATE PROCEDURE SP_AgregarCategoria (IN descripcion varchar (100))
			BEGIN 
				INSERT INTO Categorias(descripcion)
			Values(descripcion);
            
		END $$
		
        Delimiter $$
        
	    CALL SP_AgregarCategoria ('ropa');
        CALL SP_AgregarCategoria ('equipamiento');
        CALL SP_AgregarCategoria ('zapatos');
        CALL SP_AgregarCategoria ('suplementos');
        CALL SP_AgregarCategoria ('maquinaria');
        
        
        DELIMITER $$
        
        CREATE PROCEDURE SP_AgregarMarcas (IN descripcion varchar (100))
			BEGIN
				INSERT INTO Marcas(descripcion) VALUES(descripcion);
			END $$
            
		DELIMITER $$
        
        call SP_AgregarMarcas('Nike');
        call SP_AgregarMarcas('Addidas');
        call SP_AgregarMarcas('Hordan');
        call SP_AgregarMarcas('Patin');
        call SP_AgregarMarcas('Nordenberg');
        
-- Procedimiento almacenado listar--------------------------------------------------------------------------------------------------------------------------
	
    Delimiter $$

	CREATE PROCEDURE SP_ListarCategorias()
		BEGIN
			SELECT Categorias.codigoCategoria,Categorias.descripcion FROM Categorias;
            
		END $$
        
	Delimiter $$
    
    Call SP_ListarCategorias();
    
    
    Delimiter $$
    
    CREATE PROCEDURE SP_ListarMarcas()
		BEGIN
			SELECT Marcas.codigoMarca, Marcas.descripcion FROM Marcas;
            
		END $$
        
	DELIMITER $$
    
    CREATE PROCEDURE SP_ListarTallas()
		BEGIN
			SELECT Tallas.codigoTalla, Tallas,descripcion FROM Tallas;
            
		END $$
        
	DELIMITER $$


    
-- Procedimiento almacenado ACTUALIZAR--------------------------------------------------------------------------------------------------------------------------
	
    DELIMITER $$
    CREATE PROCEDURE SP_ActualizarCategoria()
		BEGIN
			UPDATE Categorias
			SET	descripcion = Claro
            WHERE descripcion;
		
        END $$
        
	DELIMITER $$
    
    call SP_ActualizarCategoria('ropa');
    call SP_ActualizarCategoria('equipamiento');
    call SP_ActualizarCategoria('zapatos');
    call SP_ActualizarCategoria('suplementos');
    call SP_ActualizarCategoria('maquinaria');
    
    -- Eliminar -----------------------------------------------------------------------------------------------------------

	DELIMITER $$
	CREATE PROCEDURE SP_EliminarCategoria()
		BEGIN
			DELETE FROM Categorias where descripcion = descripcion;
		
        END $$
        
	DELIMITER $$
    
    call SP_EliminarCategoria('ropa');
    call SP_EliminarCategoria('equipamiento');
    call SP_EliminarCategoria('zapatos');
    call SP_EliminarCategoria('suplementos');
    call SP_EliminarCategoria('maquinaria');