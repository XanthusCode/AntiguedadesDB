-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (Nombre, CorreoElectronico, Contraseña, Rol) VALUES
('Carlos Martínez', 'carlos.martinez@example.com', 'contraseña123', 'vendedor'),
('Ana Gómez', 'ana.gomez@example.com', 'contraseña123', 'comprador'),
('Luis Pérez', 'luis.perez@example.com', 'contraseña123', 'administrador'),
('Maria López', 'maria.lopez@example.com', 'contraseña123', 'comprador');

-- Insertar datos en la tabla Antigüedades
INSERT INTO Antigüedades (Nombre, Descripcion, Categoria, Epoca, Origen, EstadoConservacion, Precio, Estado, UsuarioID) VALUES
('Vase Chino Ming', 'Un hermoso jarrón chino de la dinastía Ming.', 'Cerámica', 'Dinastía Ming', 'China', 'excelente', 1500.00, 'en venta', 1),
('Silla Victoriana', 'Silla antigua de estilo victoriano, restaurada.', 'Muebles', 'Siglo XIX', 'Inglaterra', 'bueno', 800.00, 'en venta', 1),
('Cuadro Impresionista', 'Cuadro de estilo impresionista pintado a mano.', 'Arte', 'Siglo XX', 'Francia', 'excelente', 2500.00, 'en venta', 2),
('Reloj de Bolsillo', 'Reloj antiguo de bolsillo con mecanismos de época.', 'Relojes', 'Siglo XIX', 'Suiza', 'regular', 400.00, 'en venta', 1);

-- Insertar datos en la tabla Transacciones
INSERT INTO Transacciones (Fecha, Tipo, Precio, UsuarioID, AntiguedadID) VALUES
('2024-09-10 14:30:00', 'compra', 1500.00, 2, 1),
('2024-09-15 09:45:00', 'venta', 800.00, 1, 2),
('2024-09-16 11:00:00', 'compra', 2500.00, 2, 3),
('2024-09-17 15:30:00', 'venta', 400.00, 1, 4);

-- Insertar datos en la tabla HistorialPrecios
INSERT INTO HistorialPrecios (AntiguedadID, Precio, Fecha) VALUES
(1, 1500.00, '2024-09-01'),
(2, 850.00, '2024-09-05'),
(3, 2500.00, '2024-09-10'),
(4, 400.00, '2024-09-15');

-- Insertar datos en la tabla Inventario
INSERT INTO Inventario (AntiguedadID, Cantidad) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- Insertar datos en la tabla Visitas
INSERT INTO Visitas (UsuarioID, AntiguedadID, Fecha) VALUES
(2, 1, '2024-09-08 10:00:00'),
(2, 3, '2024-09-10 12:30:00'),
(4, 2, '2024-09-15 13:45:00'),
(4, 4, '2024-09-17 14:00:00');
