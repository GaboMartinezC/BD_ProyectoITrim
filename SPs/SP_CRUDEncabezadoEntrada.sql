DELIMITER //
CREATE PROCEDURE SpIngresarEncabezado(IN idSuc INT, IN idEmp INT)
BEGIN
    INSERT INTO ENCABEZADO_ENTRADA(ID_SUCURSAL, ID_EMPLEADO, FECHA, BORRADO)
    VALUES(idSuc, idEmp, CURDATE(), FALSE);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpActualizarEncabezado(IN idEncabezado INT, IN idSuc INT, IN idEmp INT)
BEGIN
    UPDATE ENCABEZADO_ENTRADA 
    SET ID_SUCURSAL = idSuc, ID_EMPLEADO = idEmp
    WHERE ID = idEncabezado;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBorrarEncabezado(IN idEncabezado INT)
BEGIN
    UPDATE ENCABEZADO_ENTRADA 
    SET BORRADO = true
    WHERE ID = idEncabezado;
    UPDATE DETALLE_ENTRADA
    SET BORRADO = true
    where ID_ENTRADA = idEncabezado;
END //
DELIMITER ;