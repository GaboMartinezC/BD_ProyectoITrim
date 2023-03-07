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
CREATE PROCEDURE SpBusquedaTodoCategoria()
BEGIN
	SELECT * FROM CATEGORIA;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBusquedaCategoriaDescripcion (IN descripcion varchar(200))
BEGIN
	SELECT * FROM CATEGORIA WHERE DESCRIPCION = descripcion;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBorrarCategoria (IN idCat INT)
BEGIN 
	UPDATE CATEGORIA
	SET BORRADO = TRUE
	WHERE ID = idCat;
END //
DELIMITER ;

/*Ejemplos:
	Llamadas C#:
	CommandType.StoredProcedure
	SqlCommand("SpIngresarCategoria")
	SqlCommand("SpActualizarCategoria")
	SqlCommand("SpBusquedaCategoriaDescripcion")
	SqlCommand("SpBusquedaTodoCategoria")
	SqlCommand("SpBorrarCategoria")
*/
CALL SpIngresarCategoria("Fantasia", true);
CALL SpActualizarCategoria("Lapiz", false, 1);
CALL SpBusqueda ("Fantasia");
CALL SpBusquedaTodoCategoria();
CALL SpBorrarCategoria(1);