DELIMITER //
CREATE PROCEDURE SpIngresarProveedor (IN descr varchar(30), IN esEditorial boolean,
IN correo varchar (100), IN numero varchar (20))
BEGIN
	INSERT INTO PROVEEDOR (DESCRIPCION, ES_EDITORIAL, EMAIL,NUMERO_TELEFONICO, BORRADO)
	VALUES (descr, esEditorial, correo, numero, false);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpActualizarProveedor (IN descr varchar(30), IN esEditorial boolean,
IN correo varchar (100), IN numero varchar (20), IN idProv INT)
BEGIN
	UPDATE PROVEEDOR
    SET DESCRIPCION = descr, ES_EDITORIAL = esEditorial,
    EMAIL = correo, NUMERO_TELEFONICO = numero
    WHERE ID = idProv;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBorrarProveedor (IN idProv INT)
BEGIN
	UPDATE PROVEEDOR
    SET BORRADO = TRUE
    WHERE ID = idProv;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarTodoProveedor()
BEGIN
	SELECT * FROM PROVEEDOR
    WHERE BORRADO = false;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarProveedor(IN descr varchar(30))
BEGIN
	SELECT * FROM PROVEEDOR
    WHERE DESCRIPCION = descr AND BORRADO = false;
END //
DELIMITER ;

CALL SpIngresarProveedor("MAPED", false, "infomaped@maped.com", "8822 1215");
CALL SpActualizarProveedor("SUMA",false, "infosuma@suma.com","6553 9087",2);
CALL SpBorrarProveedor(3);
CALL SpBuscarTodoProveedor();
CALL SpBuscarProveedor("MAPED");