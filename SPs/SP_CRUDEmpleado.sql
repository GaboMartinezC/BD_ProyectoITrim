DELIMITER //
CREATE PROCEDURE SpIngresarEmpleado
(   
    IN idCedula VARCHAR (30),
    IN nombre VARCHAR (100),
    IN contra VARCHAR (100),
    IN numero VARCHAR (20),
    IN mail VARCHAR (100),
    IN idRol INT
)
BEGIN
    INSERT INTO EMPLEADO(CEDULA,NOMBRE_COMPLETO, CONTRASENA, NUMERO_TELEFONICO, EMAIL, ID_ROL, EMPLEADO_VIGENTE)
    VALUES(idCedula, nombre, contra, numero, mail, idRol, true);
END //
DELIMITER ; 

DELIMITER //
CREATE PROCEDURE SpActualizarEmpleado
(
    IN idEmpleadoMod INT,
    IN idCedula VARCHAR (30),
    IN nombre VARCHAR (100),
    IN contra VARCHAR (100),
    IN numero VARCHAR (20),
    IN mail VARCHAR (100),
    IN idRol INT
)
BEGIN
    UPDATE EMPLEADO
    SET CEDULA = idCedula, NOMBRE_COMPLETO = nombre,
    CONTRASENA = contra, NUMERO_TELEFONICO = numero,
    EMAIL = mail, ID_ROL = idRol
    WHERE ID = idEmpleadoMod;
END //
DELIMTER ;

DELIMITER //
CREATE PROCEDURE SpBuscarTodoEmpleado()
BEGIN
    SELECT * FROM EMPLEADO;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarEmpleado(IN idEmp INT)
BEGIN
    SELECT * FROM EMPLEADO
    WHERE ID = idEmp;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpInhabilitarCuentaEmpleado(IN idEmp INT)
BEGIN 
    UPDATE EMPLEADO 
    SET EMPLEADO_VIGENTE = false
    WHERE ID = idEmp;
END //
DELIMITER ;