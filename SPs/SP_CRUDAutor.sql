DELIMITER //
CREATE PROCEDURE SpIngresarAutor (IN nombre varchar(100), IN apellidos varchar (100))
BEGIN
	INSERT INTO AUTOR (NOMBRE, APELLIDOS, BORRADO)
	VALUES (nombre, apellidos, false);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpActualizarAutor(IN nombre varchar(100), IN apellidos varchar (100), IN idAut INT)
BEGIN
    UPDATE AUTOR
    SET NOMBRE = nombre, APELLIDOS = apellidos
    WHERE ID = idAut;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBusquedaTodoAutor()
BEGIN
	SELECT * FROM AUTOR;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBusquedaNombreAutor(IN nombre varchar (100))
BEGIN
	SELECT * FROM AUTOR
    WHERE NOMBRE = nombre;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBusquedaApellidosAutor(IN apellidos varchar (100))
BEGIN 
    SELECT * FROM AUTOR 
    WHERE APELLIDOS = apellidos;
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
	SqlCommand("SpBusquedaTodo")
    SqlCommand("SpBusquedaNombreAutor")
    SqlCommand("SpBusquedaApellidosAutor")
	SqlCommand("SpBorrar")
*/
CALL SpIngresarAutor("Gabriel","Martínez");