CREATE DATABASE grama;
USE grama;

CREATE TABLE Categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT
);
CREATE TABLE Producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    ruta_imagen VARCHAR(255),
    stock INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id)
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
GRANT ALL PRIVILEGES ON empresa_tecnologia.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

