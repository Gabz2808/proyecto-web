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
  correo VARCHAR(100) NULL,
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
);

create table muestas_productos(
	id_producto int,
    imagen1 VARCHAR(255),
	imagen2 VARCHAR(255),
	imagen3 VARCHAR(255)
);

INSERT INTO usuario (id, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'gabriel','123','Gabriel', 'Mairena', 'gabrielgranera28@hotmail.com', '7777-8888', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true),
(2,'gerschacon','123','Gerson', 'Chacon', 'gerschacon@hotmail.com', '7777-8888', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true);

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

INSERT INTO Producto (id_categoria, nombre, descripcion, precio, ruta_imagen, stock) 
VALUES (2, 'Laptop ABC', 'Laptop ultraligera con 16GB de RAM y 512GB SSD', 1199.99, 'https://miro.medium.com/v2/resize:fit:1400/0*lFtXGZ5aY4ckM0pq.jpg', 20);


