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
    ruta_imagen VARCHAR(1024),
    stock INT,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id)
);

-- Creación de la tabla Usuario
CREATE TABLE usuario (
  id INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(50) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS Favoritos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_producto INT,
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
	imagen3 VARCHAR(255)
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
INSERT INTO Producto (id_categoria, nombre, descripcion, precio, ruta_imagen, stock) 
VALUES (1, 'Smartphone XYZ', 'Smartphone de última generación con pantalla OLED', 699.99, 'https://www.adslzone.net/app/uploads-adslzone.net/2023/09/Samsung-Galaxy-S24-filtracion.jpg', 30);

-- Crear Trigger
DROP TRIGGER IF EXISTS after_insert_producto;

DELIMITER //

create view v_favoritos_productos as
select F.id
	,u.id as id_usuario
    ,p.id as id_producto
	,P.id_categoria
    ,P.nombre
    ,P.descripcion
    ,P.precio
    ,P.ruta_imagen
    ,P.activo
    ,F.fecha_adicion
from favoritos F
left join usuario U on U.id = F.id_usuario
left join producto P on P.id = F.id_producto;

CREATE TRIGGER after_insert_producto
AFTER INSERT ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO muestras_productos (id_producto, imagen1, imagen2)
    VALUES (NEW.id, 'https://via.placeholder.com/200x200', 'https://via.placeholder.com/200x200');
END //

DELIMITER ;


