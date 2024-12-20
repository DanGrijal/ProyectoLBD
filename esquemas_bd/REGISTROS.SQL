INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (1, 'San Jose');
INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (2, 'Alajuela');
INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (3, 'Heredia');
INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (4, 'Cartago');
INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (5, 'Puntarenas');
INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (6, 'Limon');
INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (7, 'Guanacaste');
INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (8, 'Perez Zeledon');
INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (9, 'Pococi');
INSERT INTO tablas_peaje.provincia (idProvincia, nombreProvincia) VALUES (10, 'Santa Ana');

INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (1, 'San Jose Centro', 1);
INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (2, 'Escazu', 1);
INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (3, 'Alajuela Centro', 2);
INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (4, 'San Rafael', 2);
INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (5, 'Heredia Centro', 3);
INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (6, 'Cartago Centro', 4);
INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (7, 'Puntarenas Centro', 5);
INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (8, 'Limon Centro', 6);
INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (9, 'Liberia', 7);
INSERT INTO tablas_peaje.ciudad (idCiudad, nombreCiudad, idProvincia) VALUES (10, 'Santa Ana Centro', 10);

INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (1, 'Ruta 27', 'Concesionaria 1', 1);
INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (2, 'Ruta 1', 'Concesionaria 2', 3);
INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (3, 'Ruta 32', 'Concesionaria 3', 8);
INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (4, 'Ruta 2', 'Concesionaria 4', 6);
INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (5, 'Ruta 3', 'Concesionaria 5', 5);
INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (6, 'Ruta 4', 'Concesionaria 6', 9);
INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (7, 'Ruta 5', 'Concesionaria 7', 4);
INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (8, 'Ruta 6', 'Concesionaria 8', 2);
INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (9, 'Ruta 7', 'Concesionaria 9', 10);
INSERT INTO tablas_peaje.peaje (idPeaje, rutaPeaje, concesionaria, idCiudad)
VALUES (10, 'Ruta 8', 'Concesionaria 10', 7);

INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (1, 'Automóvil');
INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (2, 'Camión');
INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (3, 'Motocicleta');
INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (4, 'Bus');
INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (5, 'Tráiler');
INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (6, 'Taxi');
INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (7, 'Ambulancia');
INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (8, 'Bomberos');
INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (9, 'Patrulla');
INSERT INTO tablas_quickpass.tipoVehiculo (idTipoVehiculo, descripcion) VALUES (10, 'Grúa');

INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (1, 1);
INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (2, 2);
INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (3, 3);
INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (4, 4);
INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (5, 5);
INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (6, 6);
INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (7, 7);
INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (8, 8);
INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (9, 9);
INSERT INTO tablas_peaje.antena (idAntena, idPeaje) VALUES (10, 10);

INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (1, 500, SYSDATE, 1, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (2, 1000, SYSDATE, 1, 2); -- Camión
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (3, 300, SYSDATE, 2, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (4, 650, SYSDATE, 2, 2); -- Camión
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (5, 450, SYSDATE, 3, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (6, 1500, SYSDATE, 3, 2); -- Camión
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (7, 275, SYSDATE, 4, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (8, 400, SYSDATE, 4, 2); -- Camión
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (9, 375, SYSDATE, 5, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (10, 475, SYSDATE, 5, 2); -- Camión
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (11, 900, SYSDATE, 6, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (12, 1000, SYSDATE, 6, 2); -- Camión
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (13, 875, SYSDATE, 7, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (14, 975, SYSDATE, 7, 2); -- Camión
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (15, 250, SYSDATE, 8, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (16, 500, SYSDATE, 8, 2); -- Camión
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (17, 600, SYSDATE, 9, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (18, 700, SYSDATE, 9, 2); -- Camión
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (19, 850, SYSDATE, 10, 1); -- Automóvil
INSERT INTO tablas_peaje.costoPeaje (idCostoPeaje, monto, fecha, idPeaje, idTipoVehiculo) 
VALUES (20, 900, SYSDATE, 10, 2); -- Camión

INSERT INTO tablas_banco.usuario (idUsuario, nombre, username, password) 
VALUES (1, 'Juan Perez', 'jperez', 'password123');
INSERT INTO tablas_banco.usuario (idUsuario, nombre, username, password) 
VALUES (2, 'Ana Gomez', 'agomez', 'password456');
INSERT INTO tablas_banco.usuario (idUsuario, nombre, username, password) 
VALUES (3, 'Carlos Mora', 'cmora', 'password789');
INSERT INTO tablas_banco.usuario (idUsuario, nombre, username, password) 
VALUES (4, 'Maria Lopez', 'mlopez', 'password101');
INSERT INTO tablas_banco.usuario (idUsuario, nombre, username, password) 
VALUES (5, 'Luis Vargas', 'lvargas', 'password202');

INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (1, 1000, 1);
INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (2, 1500, 1);
INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (3, 500, 2);
INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (4, 700, 2);
INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (5, 1200, 3);
INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (6, 800, 3);
INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (7, 1100, 4);
INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (8, 600, 4);
INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (9, 900, 5);
INSERT INTO tablas_banco.cuenta (idCuenta, saldo, idUsuario) VALUES (10, 100, 5);

INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (1, 'Banco Nacional', '3101234567');
INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (2, 'Banco Popular', '3107654321');
INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (3, 'Banco de Costa Rica', '3109876543');
INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (4, 'BAC San Jose', '3106543212');
INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (5, 'Coopenae', '3104567890');
INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (6, 'Scotiabank', '3101122334');
INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (7, 'Davivienda', '3102233445');
INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (8, 'Banco Lafise', '3103344556');
INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (9, 'Banco Promerica', '3104455667');
INSERT INTO tablas_banco.cliente (idCliente, nombreBanco, cedulaJuridica) 
VALUES (10, 'Banco Improsa', '3105566778');

INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (1, 1, 1, 1); 
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (2, 2, 2, 1); 
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (3, 3, 1, 0); 
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (4, 4, 1, 1); 
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (5, 5, 1, 1); 
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (6, 6, 2, 1); 
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (7, 7, 1, 1); 
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (8, 8, 2, 1);
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (9, 9, 1, 0); 
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (10, 10, 1, 1); 
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (11, 1, 3, 1);
INSERT INTO tablas_quickpass.quickPass (idQuickPass, idCliente, idTipoVehiculo, activo) 
VALUES (12, 2, 4, 1);

INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (1, 1);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (1, 2);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (2, 3);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (2, 4);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (3, 5);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (3, 6);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (4, 7);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (4, 8);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (5, 9);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (5, 10);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (11, 1);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (11, 2);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (12, 3);
INSERT INTO tablas_banco.cuentasPorQuickPass (idQuickPass, idCuenta) VALUES (12, 4);


