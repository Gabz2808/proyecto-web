CREATE DATABASE IF NOT EXISTS grama;
USE grama;

-- Creación de la tabla Categoria
CREATE TABLE IF NOT EXISTS Categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);
create table if not exists Descuento(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion varchar(255) not null,
    descuento decimal(10,2) not null
);

-- Creación de la tabla Producto
CREATE TABLE IF NOT EXISTS Producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT,
    id_descuento INT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    ruta_imagen VARCHAR(1024),
    stock INT,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id),
    FOREIGN KEY (id_descuento) REFERENCES Descuento(id)
);

-- Creación de la tabla Usuario
CREATE TABLE usuario (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(50) NULL,
  telefono VARCHAR(15) NULL,
  cedula INT DEFAULT 0,
  ruta_imagen VARCHAR(1024) NULL DEFAULT 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000008gente-de-la-foto.png?alt=media&token=d5cc7370-e232-49d6-9fbc-158bb39ad8bf',
  activo BOOLEAN,
  PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Favoritos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_producto INT,
    fecha_adicion date,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_producto) REFERENCES Producto(id)
);

create table rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table muestas_productos(
	id_producto int,
    imagen1 VARCHAR(255),
	imagen2 VARCHAR(255),
);

-- password 1 = 123
-- password 2 = 456
INSERT INTO usuario (id, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'gerschacon','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Gerson', 'Chacon', 'gerschacon@hotmail.com', '7777-8888', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true),
(2,'gabriel','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Gabriel', 'Mairena', 'gabrielgranera28@hotmail.com', '7777-8888', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true);

insert into rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2), (5,'ROLE_USER',2);
 
-- Creación de usuario y asignación de privilegios
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON grama.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

-- Insertar categorías de ejemplo
INSERT INTO Categoria (nombre, descripcion) VALUES ('Electrónica', 'Productos electrónicos y gadgets');
INSERT INTO Categoria (nombre, descripcion) VALUES ('Computadoras', 'Computadoras y accesorios');
INSERT INTO Categoria (nombre, descripcion) VALUES ('Telefonía', 'Teléfonos móviles y accesorios');

-- Insertar productos de ejemplo
INSERT INTO producto(id_categoria, nombre, descripcion, precio, ruta_imagen, stock) 
VALUES (1, 'Smartphone XYZ', 'Smartphone de última generación con pantalla OLED', 699.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000002Samsung%20galaxy.jpeg?alt=media&token=666a78b1-b500-4358-9a6b-ab89ec1c66a4', 30),
(2, 'Laptop Asus', 'Laptop Asus con procesador Intel i7 y 16GB de RAM', 999.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000001laptopAsus.jpg?alt=media&token=435a0310-2c5b-4494-b15c-d112bcef944e', 25),
(2, 'iPad', 'iPad de 10.2 pulgadas con 64GB de almacenamiento', 329.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000003ipad.jpeg?alt=media&token=794efcff-ad2e-48f8-a0f7-3c5f74e64421', 40),
(2, 'Monitor Dell', 'Monitor Dell UltraSharp de 27 pulgadas con resolución 4K', 499.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000004monitor%20dell.jpg?alt=media&token=02dde57f-448f-49ad-a617-7cf515ce181e', 15),
(1, 'Bose', 'Altavoces Bose con tecnología de sonido envolvente', 299.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000005Bose.jpg?alt=media&token=5cc4b59d-c927-4f88-a0c7-03ebcdcc39d5', 20),
(3, 'Reloj Inteligente Garmin', 'Reloj inteligente Garmin con GPS y monitor de frecuencia cardíaca', 199.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000006garmin.jpg?alt=media&token=3681c1f7-8f3b-4008-a134-cba10409aec0', 35),
(2, 'Teclado Gamer', 'Teclado mecánico gamer con retroiluminación RGB', 79.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000007teclado.jpeg?alt=media&token=a0a0f347-d81d-40c3-bb92-88af0f9f9ed4', 50),
(2, 'Mouse Gamer', 'Mouse gamer con sensor óptico de alta precisión y botones programables', 59.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000008mouse.jpeg?alt=media&token=83f88e18-77f2-4d21-bcb8-0d5be6fd0b3d', 45),
(1, 'Cámara de Fotos', 'Cámara digital de 20MP con capacidad de grabación 4K', 899.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000009camara.jpeg?alt=media&token=d7d3e47e-1c8a-411e-8439-ff1b3e488e9d', 10),
(2, 'Impresora', 'Impresora multifunción con conectividad Wi-Fi y soporte para impresión móvil', 149.99, 'https://firebasestorage.googleapis.com/v0/b/grama-9f778.appspot.com/o/grama%2Fproducto%2Fimg0000000000000000010impresora.jpeg?alt=media&token=18421a3a-2af5-40e8-a091-9cd1b5b00a60producto', 30);
-- Crear Trigger

INSERT INTO Descuento (descripcion, descuento) VALUES
('Descuento de referidos', 12.00),
('Descuento de fin de año', 30.00),
('Descuento de Black Friday', 40.00),
('Descuento por compras en volumen', 18.00),
('Descuento de estudiante', 8.00);


create view v_favoritos_productos as
select F.id
	,u.id as id_usuario
    ,p.id as id_producto
	,P.id_categoria
    ,P.nombre
    ,P.descripcion
    ,P.precio
    ,P.ruta_imagen
    ,F.fecha_adicion
from favoritos F
left join usuario U on U.id = F.id_usuario
left join producto P on P.id = F.id_producto;


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


