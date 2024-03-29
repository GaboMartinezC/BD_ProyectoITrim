CREATE DATABASE SISTEMALIBRERIA_EQUIPO211E;
USE SISTEMALIBRERIA_EQUIPO211E;

CREATE TABLE CATEGORIA
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DESCRIPCION VARCHAR (100) NOT NULL,
    ES_GENERO BOOLEAN NOT NULL
);

CREATE TABLE PROVEEDOR
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DESCRIPCION VARCHAR (100) NOT NULL,
    ES_EDITORIAL BOOLEAN NOT NULL,
    EMAIL VARCHAR (100) NOT NULL,
    NUMERO_TELEFONICO VARCHAR (20) NOT NULL
);

CREATE TABLE IDIOMA
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DESCRIPCION VARCHAR (100) NOT NULL
);

CREATE TABLE AUTOR
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    APELLIDOS VARCHAR(100) NOT NULL
);

CREATE TABLE PRODUCTO 
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DESCRIPCION VARCHAR (100) NOT NULL,
    STOCK_MINIMO INT NOT NULL, 
    STOCK_MAXIMO INT NOT NULL,
    ID_PROVEEDOR INT NOT NULL,
    PRECIO FLOAT NOT NULL,
    PRODUCTO_ESTUDIANTIL BOOLEAN NOT NULL,
    CANTIDAD_PAGINAS INT NOT NULL,
    ID_AUTOR INT,
    ID_IDIOMA INT,
    FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDOR (ID),
    FOREIGN KEY (ID_AUTOR) REFERENCES AUTOR (ID),
    FOREIGN KEY (ID_IDIOMA) REFERENCES IDIOMA (ID)
);

CREATE TABLE DETALLE_CATEGORIA
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUCTO INT NOT NULL,
    ID_CATEGORIA INT NOT NULL,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID),
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID)
);

CREATE TABLE ROL_USUARIO
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DESCRIPCION VARCHAR (100) NOT NULL
);

CREATE TABLE MODULO 
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DESCRIPCION VARCHAR (100) NOT NULL
);
/*
La tabla modulo posee datos previamente definidos, 
Insert de los modulos establecidos, puede ser modificado
a futuro para fines de escalabilidad
*/
INSERT INTO MODULO (DESCRIPCION) VALUES
("Datos de Producto"),
("Proveeduria"),
("Sucursales"),
("Productos"),
("Inventario"),
("Empleados");

CREATE TABLE PERMISOS
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_ROL INT NOT NULL,
    ID_MODULO INT NOT NULL,
    FOREIGN KEY (ID_ROL) REFERENCES ROL_USUARIO(ID),
    FOREIGN KEY (ID_MODULO) REFERENCES MODULO(ID)
);

CREATE TABLE EMPLEADO
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CEDULA VARCHAR (30) NOT NULL,
    NOMBRE_COMPLETO VARCHAR (100) NOT NULL,
    CONTRASENA VARCHAR (100) NOT NULL,
    NUMERO_TELEFONICO VARCHAR(20),
    EMAIL VARCHAR (100),
    ID_ROL INT NOT NULL,
    EMPLEADO_VIGENTE BOOLEAN NOT NULL,
    FOREIGN KEY (ID_ROL) REFERENCES ROL_USUARIO(ID)
);

CREATE TABLE SUCURSALES 
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UBICACION VARCHAR(200),
    NUMERO_TELEFONICO VARCHAR(150)
);

CREATE TABLE BODEGA
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUCTO INT NOT NULL,
    ID_SUCURSAL INT NOT NULL,
    CANTIDAD INT NOT NULL,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID),
    FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSALES(ID)
);
CREATE TABLE ENCABEZADO_ENTRADA 
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_SUCURSAL INT NOT NULL,
    ID_EMPLEADO INT NOT NULL,
    FECHA DATE NOT NULL,
    FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSALES(ID),
    FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID)
);
CREATE TABLE DETALLE_ENTRADA 
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_ENTRADA INT NOT NULL,
    ID_PRODUCTO INT NOT NULL,
    CANTIDAD INT NOT NULL,
    FOREIGN KEY (ID_ENTRADA) REFERENCES ENCABEZADO_ENTRADA (ID),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID)
);
/*Alteración de tablas para fines de borrado lógico*/
ALTER TABLE CATEGORIA 
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE CATEGORIA
SET BORRADO = FALSE;

ALTER TABLE PROVEEDOR 
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE PROVEEDOR
SET BORRADO = FALSE;

ALTER TABLE IDIOMA 
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE IDIOMA
SET BORRADO = FALSE;

ALTER TABLE AUTOR 
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE AUTOR
SET BORRADO = FALSE;

ALTER TABLE PRODUCTO
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE PRODUCTO
SET BORRADO = FALSE;

ALTER TABLE DETALLE_CATEGORIA
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE DETALLE_CATEGORIA
SET BORRADO = FALSE;

ALTER TABLE ROL_USUARIO
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE ROL_USUARIO
SET BORRADO = FALSE;

ALTER TABLE PERMISOS
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE PERMISOS
SET BORRADO = FALSE;

ALTER TABLE SUCURSALES
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE SUCURSALES
SET BORRADO = FALSE;

ALTER TABLE BODEGA
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE BODEGA
SET BORRADO = FALSE;

ALTER TABLE ENCABEZADO_ENTRADA
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE ENCABEZADO_ENTRADA
SET BORRADO = FALSE;

ALTER TABLE DETALLE_ENTRADA
ADD COLUMN BORRADO BOOLEAN NOT NULL;
UPDATE DETALLE_ENTRADA
SET BORRADO = FALSE;