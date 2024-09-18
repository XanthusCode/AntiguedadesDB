-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS AntiguedadesDB;
USE AntiguedadesDB;

-- Crear tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    Rol ENUM('vendedor', 'comprador', 'administrador') NOT NULL,
    FechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla Antigüedades
CREATE TABLE IF NOT EXISTS Antigüedades (
    AntiguedadID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Categoria VARCHAR(50),
    Epoca VARCHAR(50),
    Origen VARCHAR(50),
    EstadoConservacion ENUM('excelente', 'bueno', 'regular', 'malo'),
    Precio DECIMAL(10, 2) NOT NULL,
    FechaAñadido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Estado ENUM('en venta', 'vendido', 'retirado') NOT NULL,
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Crear tabla Transacciones
CREATE TABLE IF NOT EXISTS Transacciones (
    TransaccionID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tipo ENUM('compra', 'venta') NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    UsuarioID INT,
    AntiguedadID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (AntiguedadID) REFERENCES Antigüedades(AntiguedadID)
);

-- Crear tabla HistorialPrecios
CREATE TABLE IF NOT EXISTS HistorialPrecios (
    HistorialID INT PRIMARY KEY AUTO_INCREMENT,
    AntiguedadID INT,
    Precio DECIMAL(10, 2) NOT NULL,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AntiguedadID) REFERENCES Antigüedades(AntiguedadID)
);

-- Crear tabla Inventario
CREATE TABLE IF NOT EXISTS Inventario (
    InventarioID INT PRIMARY KEY AUTO_INCREMENT,
    AntiguedadID INT,
    Cantidad INT DEFAULT 0,
    FOREIGN KEY (AntiguedadID) REFERENCES Antigüedades(AntiguedadID)
);

-- Crear tabla Visitas
CREATE TABLE IF NOT EXISTS Visitas (
    VisitaID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    AntiguedadID INT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (AntiguedadID) REFERENCES Antigüedades(AntiguedadID)
);

CREATE INDEX idx_categoria ON Antigüedades(Categoria);
CREATE INDEX idx_estado ON Antigüedades(Estado);
CREATE INDEX idx_usuario ON Visitas(UsuarioID);
CREATE INDEX idx_antiguedad ON Visitas(AntiguedadID);
