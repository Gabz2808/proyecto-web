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
    ruta_imagen VARCHAR(255),
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
CREATE TABLE IF NOT EXISTS Favoritos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_producto INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_producto) REFERENCES Producto(id)
);

create table Rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references Usuario(id)
);

create table muestas_productos(
	id_producto int,
    imagen1 VARCHAR(255),
	imagen2 VARCHAR(255),
	imagen3 VARCHAR(255)
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
INSERT INTO Producto (id_categoria, nombre, descripcion, precio, ruta_imagen, stock) 
VALUES (1, 'Smartphone XYZ', 'Smartphone de última generación con pantalla OLED', 699.99, 'https://www.adslzone.net/app/uploads-adslzone.net/2023/09/Samsung-Galaxy-S24-filtracion.jpg', 30);

INSERT INTO Producto (id_categoria, nombre, descripcion, precio, ruta_imagen, stock) 
VALUES (2, 'Laptop ABC', 'Laptop ultraligera con 16GB de RAM y 512GB SSD', 1199.99, 'https://miro.medium.com/v2/resize:fit:1400/0*lFtXGZ5aY4ckM0pq.jpg', 20);


