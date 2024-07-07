CREATE DATABASE grama;
USE grama;

CREATE TABLE Categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    ruta_imagen VARCHAR(255),
    stock INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id),
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100),
    email VARCHAR(100),
    numero_telefono VARCHAR(20),
    contrasena VARCHAR(255), -- Se recomienda almacenar la contraseña de forma segura (hash)
    es_admin BOOLEAN
);

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
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

INSERT INTO Producto (id_categoria, nombre, descripcion, precio, ruta_imagen, stock) 
VALUES (1, 'Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 149.99, 'https://media.cnn.com/api/v1/images/stellar/prod/new-project-2023-07-25t102604-234.jpg?c=16x9&q=h_720,w_1280,c_fill', 50);

INSERT INTO Producto (id_categoria, nombre, descripcion, precio, ruta_imagen, stock) 
VALUES (3, 'Smartwatch DEF', 'Reloj inteligente con monitor de actividad y GPS', 199.99, 'ihttps://m.media-amazon.com/images/I/81tNBW+YfLL._AC_SL500_.jpg', 40);
