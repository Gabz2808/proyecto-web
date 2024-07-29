CREATE DATABASE IF NOT EXISTS grama;
USE grama;

-- Creación de la tabla Categoria
CREATE TABLE IF NOT EXISTS Categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

-- Creación de la tabla Producto
CREATE TABLE IF NOT EXISTS Producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    ruta_imagen VARCHAR(1024) DEFAULT 'https://via.placeholder.com/200x200',
    stock INT,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id)
);
-- Creación de la tabla Usuario
CREATE TABLE IF NOT EXISTS Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100),
    email VARCHAR(100),
    numero_telefono VARCHAR(20),
	password varchar(512) NOT NULL
);
CREATE TABLE IF NOT EXISTS Favoritos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_producto INT,
    fecha_adicion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Producto(id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (id_usuario, id_producto)
);

create table Rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references Usuario(id)
);

CREATE TABLE IF NOT EXISTS muestras_productos (
    id_producto INT,
    imagen1 VARCHAR(255),
    imagen2 VARCHAR(255),
    FOREIGN KEY (id_producto) REFERENCES Producto(id)
);
insert into usuario(nombre_completo,email,password) values
('Gabriel Mairena', 'gabrielgranera28@hotmail.com','123');

insert into rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1);


-- Creación de usuario y asignación de privilegios
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON grama.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

-- Insertar categorías de ejemplo
INSERT INTO Categoria (nombre, descripcion) VALUES ('Electrónica', 'Productos electrónicos y gadgets');
INSERT INTO Categoria (nombre, descripcion) VALUES ('Computadoras', 'Computadoras y accesorios');
INSERT INTO Categoria (nombre, descripcion) VALUES ('Telefonía', 'Teléfonos móviles y accesorios');

-- Insertar productos de ejemplo
use grama;
-- Insertar 10 productos tecnológicos en la tabla Producto
INSERT INTO Producto (id_categoria, nombre, descripcion, precio, stock)
VALUES
(2, 'Laptop ASUS', 'Laptop ASUS con procesador Intel i7', 899.99, 50),
(3, 'Smartphone Samsung Galaxy', 'Smartphone Samsung Galaxy con pantalla AMOLED', 499.99, 100),
(3, 'Tablet Apple iPad', 'Apple iPad con pantalla Retina', 329.99, 30),
(1, 'Monitor Dell', 'Monitor Dell de 24 pulgadas Full HD', 149.99, 25),
(1, 'Auriculares Bose', 'Auriculares inalámbricos Bose con cancelación de ruido', 299.99, 40),
(3, 'Smartwatch Garmin', 'Smartwatch Garmin con GPS integrado', 199.99, 60),
(1, 'Teclado Mecánico Logitech', 'Teclado mecánico Logitech retroiluminado', 99.99, 70),
(2, 'Mouse Gaming Razer', 'Mouse gaming Razer con sensor óptico', 59.99, 80),
(1, 'Cámara Digital Canon', 'Cámara digital Canon con lente de 18-55mm', 449.99, 20),
(1, 'Impresora HP', 'Impresora HP multifuncional', 129.99, 35);

-- Crear Trigger
DROP TRIGGER IF EXISTS after_insert_producto;

DELIMITER //

CREATE TRIGGER after_insert_producto
AFTER INSERT ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO muestras_productos (id_producto, imagen1, imagen2)
    VALUES (NEW.id, 'https://via.placeholder.com/200x200', 'https://via.placeholder.com/200x200');
END //

DELIMITER ;


-- Paso 1: Eliminar filas de la tabla muestras_productos
-- DELETE FROM muestras_productos WHERE id_producto IN (SELECT id FROM Producto);

-- Paso 2: Eliminar filas de la tabla Producto
-- DELETE FROM Producto;

-- Paso 3: (Opcional) Restablecer el contador de AUTO_INCREMENT en la tabla Producto
-- ALTER TABLE Producto AUTO_INCREMENT = 1;

