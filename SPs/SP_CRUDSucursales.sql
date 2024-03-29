DELIMITER //
CREATE PROCEDURE SpIngresarSucursal(IN ubic varchar (100), IN telef varchar(150))
BEGIN
    INSERT INTO SUCURSALES(UBICACION, NUMERO_TELEFONICO, BORRADO)
    VALUES (ubic,telef,false);
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE SpActualizarSucursal(IN ubic varchar (100), IN telef varchar(150), IN idSuc INT)
BEGIN
    UPDATE SUCURSALES
    SET UBICACION = ubic,
    NUMERO_TELEFONICO = telef
    WHERE ID = idSuc;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarTodoSucursal()
BEGIN
    SELECT * FROM SUCURSALES
    WHERE BORRADO = false;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarSucursal(IN idSuc INT)
BEGIN
    SELECT * FROM SUCURSALES
    WHERE ID = idSuc AND BORRADO = false;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBorrarSucursal(IN idSuc INT)
BEGIN
    UPDATE SUCURSALES
    SET BORRADO = true
    WHERE ID = idSuc;
    UPDATE BODEGA 
    SET BORRADO = true
    WHERE ID_SUCURSAL = idSuc;
END //
DELIMITER ;
