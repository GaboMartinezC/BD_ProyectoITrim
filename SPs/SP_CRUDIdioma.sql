DELIMITER //
CREATE PROCEDURE SpIngresarIdioma (IN descrip varchar(100))
BEGIN
	INSERT INTO IDIOMA (DESCRIPCION, BORRADO)
	VALUES (descrip, false);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpActualizarIdioma (IN descrip varchar(100), IN idIdi INT)
BEGIN
	UPDATE IDIOMA
    SET DESCRIPCION = descrip
    WHERE ID = idIdi;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarIdioma(IN descrip varchar(100))
BEGIN
	SELECT * FROM IDIOMA
    WHERE DESCRIPCION = descrip AND BORRADO = false;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarTodoIdioma ()
BEGIN
	SELECT * FROM IDIOMA
	WHERE BORRADO = false;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBorrarIdioma(IN idIdi INT)
BEGIN
	UPDATE IDIOMA
    SET BORRADO = true
    WHERE ID = idIdi;
END //
DELIMITER ;

CALL SpIngresarIdioma("Inglés");
CALL SpActualizarIdioma("Francés", 2);
CALL SpBuscarIdioma("Inglés");
CALL SpBuscarTodoIdioma();
CALL SpBorrarIdioma(3);