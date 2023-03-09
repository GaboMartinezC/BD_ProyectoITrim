DELIMITER //
CREATE PROCEDURE SpIngresarAutor (IN nom varchar(100), IN ap varchar (100))
BEGIN
	INSERT INTO AUTOR (NOMBRE, APELLIDOS, BORRADO)
	VALUES (nom, ap, false);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpActualizarAutor(IN nom varchar(100), IN ap varchar (100), IN idAut INT)
BEGIN
    UPDATE AUTOR
    SET NOMBRE = nom, APELLIDOS = ap
    WHERE ID = idAut;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBusquedaTodoAutor()
BEGIN
	SELECT * FROM AUTOR 
    WHERE BORRADO = false;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBusquedaNombreAutor(IN nom varchar (100))
BEGIN
	SELECT * FROM AUTOR
    WHERE NOMBRE = nom AND BORRADO = false;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBusquedaApellidosAutor(IN ap varchar (100))
BEGIN 
    SELECT * FROM AUTOR 
    WHERE APELLIDOS = ap AND BORRADO = false;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBorrarAutor(IN idAut INT)
BEGIN
    UPDATE AUTOR
    SET BORRADO = TRUE
    WHERE ID = idAut;
END //
DELIMITER ;
/*Ejemplos:
	Llamadas C#:
	CommandType.StoredProcedure
	SqlCommand("SpIngresarAutor")
	SqlCommand("SpActualizarAutor")
	SqlCommand("SpBusquedaTodoAutor")
    SqlCommand("SpBusquedaNombreAutor")
    SqlCommand("SpBusquedaApellidosAutor")
	SqlCommand("SpBorrarAutor")
*/
CALL SpIngresarAutor("Gabriel","Martínez");
CALL SpActualizarAutor("Gabriel de Jesús", "Martinez Camareno", 1);
CALL SpBusquedaTodoAutor();
CALL SpBusquedaNombreAutor("Keyla");
CALL SpBusquedaApellidosAutor("Vega");
CALL SpBorrarAutor(6);