/*
    Sp's para productos, no involucra libros, por lo que los 
    prrocedimientos que se expresan a continuación NO deben ser consumidos
    en los metodos de la sub clase Libro, si no, en la super clase producto
*/
DELIMITER //
CREATE PROCEDURE SpIngresarProducto (
    IN descrip varchar(100), 
    IN stMinimo INT, 
    IN stMaximo INT,
    IN idProv INT,
    IN precioProd FLOAT, 
    IN prodEstudiantil BOOLEAN
)
BEGIN
	INSERT INTO PRODUCTO (DESCRIPCION, STOCK_MINIMO, STOCK_MAXIMO,
    ID_PROVEEDOR, PRECIO, PRODUCTO_ESTUDIANTIL, CANTIDAD_PAGINAS,  BORRADO)
    VALUES (descrip, stMinimo, stMaximo, idProv, precioProd, prodEstudiantil, 0, false);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpActualizarProducto (
    IN descrip varchar(100), 
    IN stMinimo INT, 
    IN stMaximo INT,
    IN idProv INT,
    IN precioProd FLOAT, 
    IN prodEstudiantil BOOLEAN,
    IN idProd INT
)
BEGIN
	UPDATE PRODUCTO
    SET DESCRIPCION = descrip,
    STOCK_MINIMO = stMinimo,
    STOCK_MAXIMO = stMaximo,
    ID_PROVEEDOR = idProv,
    PRECIO = precioProd,
    PRODUCTO_ESTUDIANTIL = prodEstudiantil
    WHERE ID = idProd;
END //
DELIMITER ;

/*Nota:
    Se toma como parámetro para separar libros de 
    productos generales, el que CANTIDAD_PAGINAS sea 
    igual a 0, por lo que se hace la busqueda de la siguiente 
    manera, sin seleccionar los datos propios de libro
*/
DELIMITER //
CREATE PROCEDURE SpBuscarTodoProducto()
BEGIN
    SELECT  P.ID, P.DESCRIPCION, P.STOCK_MINIMO, P.STOCK_MAXIMO, P.ID_PROVEEDOR,
    P.PRECIO, P.PRODUCTO_ESTUDIANTIL, P.BORRADO FROM PRODUCTO AS P
    WHERE CANTIDAD_PAGINAS = 0;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarProducto(IN descrip VARCHAR (100))
BEGIN
    SELECT  P.ID, P.DESCRIPCION, P.STOCK_MINIMO, P.STOCK_MAXIMO, P.ID_PROVEEDOR,
    P.PRECIO, P.PRODUCTO_ESTUDIANTIL, P.BORRADO FROM PRODUCTO AS P
    WHERE CANTIDAD_PAGINAS = 0 AND DESCRIPCION = descrip;
END //
DELIMITER ;

CALL SpIngresarProducto("Lapiz Grafito", 2, 10, 2, 10,false);
CALL SpActualizarProducto("Lapiz Grafito", 2, 10, 2, 10,false, 1);
CALL SpBuscarTodoProducto();

/*SP's Generales*/
DELIMITER //
CREATE PROCEDURE SpBuscarTodoProductoGeneral()
BEGIN
    SELECT * FROM PRODUCTO;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarProductoGeneral(IN descrip VARCHAR (100))
BEGIN
    SELECT * FROM PRODUCTO
    WHERE DESCRIPCION = descrip;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBorrarProducto(IN idProd INT)
BEGIN
    UPDATE PRODUCTO
    SET BORRADO = TRUE
    WHERE ID = idProd;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarProductoProveedor(IN idProv INT)
BEGIN 
    SELECT * FROM PRODUCTO 
    WHERE ID_PROVEEDOR = idProv;
END
DELIMITER ;

CALL SpBuscarTodoProductoGeneral();
CALL SpBuscarProductoGeneral("Lapiz Grafito");
CALL SpBorrarProducto(1);
/*
    SP's  para productos libro
    Contienen parámetros especiales para ingreso de 
    los datos de libro, esto así por la propiedad estructurada 
    del lenguaje SQL, en los metodos de la sub clase Libro SI
    se deben de consumir los SP a continuación
*/
DELIMITER //
CREATE PROCEDURE SpIngresarLibro (
    IN descrip varchar(100), 
    IN stMinimo INT, 
    IN stMaximo INT,
    IN idProv INT,
    IN precioProd FLOAT, 
    IN prodEstudiantil BOOLEAN,
    IN cantPag INT, 
    IN idAut INT, 
    IN idIdi INT
)
BEGIN
	INSERT INTO PRODUCTO (DESCRIPCION, STOCK_MINIMO, STOCK_MAXIMO,
    ID_PROVEEDOR, PRECIO, PRODUCTO_ESTUDIANTIL, CANTIDAD_PAGINAS, ID_AUTOR, ID_IDIOMA  BORRADO)
    VALUES (descrip, stMinimo, stMaximo, idProv, precioProd, prodEstudiantil, cantPag, idAut, idIdi false);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpActualizarLibro (
    IN descrip varchar(100), 
    IN stMinimo INT, 
    IN stMaximo INT,
    IN idProv INT,
    IN precioProd FLOAT, 
    IN prodEstudiantil BOOLEAN,
    IN cantPag INT, 
    IN idAut INT, 
    IN idIdi INT,
    IN idLib INT
)
BEGIN
	UPDATE PRODUCTO
    SET DESCRIPCION = descrip,
    STOCK_MINIMO = stMinimo,
    STOCK_MAXIMO = stMaximo,
    ID_PROVEEDOR = idProv,
    PRECIO = precioProd,
    PRODUCTO_ESTUDIANTIL = prodEstudiantil,
    CANTIDAD_PAGINAS = cantPag,
    ID_AUTOR = idAut,
    ID_IDIOMA = idIdi
    WHERE ID = idLib;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarLibroIdioma(IN idIdi INT)
BEGIN
    SELECT * FROM PRODUCTO
    WHERE ID_IDIOMA = idIdi;
END
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SpBuscarLibroAutor(IN idAut INT)
BEGIN
    SELECT * FROM PRODUCTO
    WHERE ID_AUTOR = idAut;
END
DELIMITER ;
