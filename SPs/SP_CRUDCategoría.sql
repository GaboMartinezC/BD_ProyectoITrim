DELIMITER //
CREATE PROCEDURE SpIngresarCategoria (IN descripcion varchar(200), IN esGenero boolean)
BEGIN
	INSERT INTO CATEGORIA (DESCRIPCION, ES_GENERO, BORRADO)
	VALUES (descripcion, esGenero, false);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpActualizarCategoria (IN descripcion varchar(200), IN esGenero boolean, IN id INT)
BEGIN
	UPDATE CATEGORIA
	SET DESCRIPCION = descripcion, ES_GENERO = esGenero
	WHERE ID = id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBusquedaTodo()
BEGIN
	SELECT * FROM CATEGORIA;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBusqueda (IN descripcion varchar(200))
BEGIN
	SELECT * FROM CATEGORIA WHERE DESCRIPCION = descripcion;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBorrar (IN idCat INT)
BEGIN 
	UPDATE CATEGORIA
	SET BORRRADO = TRUE
	WHERE ID = idCat;
END //
DELIMITER ;

/*Ejemplos:
	Llamadas C#:
	CommandType.StoredProcedure
	SqlCommand("SpIngresarCategoria")
	SqlCommand("SpActualizarCategoria")
	SqlCommand("SpBusqueda")
	SqlCommand("SpBusquedaTodo")
	SqlCommand("SpBorrar")
	CORREGIR EL SP NOMBRE
*/
CALL SpIngresarCategoria("Fantasia", true);
CALL SpActualizarCategoria("Lapiz", false, 1);
CALL SpBusqueda ("Fantasia");
CALL SpBusquedaTodo();
CALL SpBorrar(1);