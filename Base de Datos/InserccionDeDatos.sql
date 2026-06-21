-- 1. Tabla: Persona (Registramos al personal de soporte y usuarios del sistema)
INSERT INTO Persona (Per_ID, Per_Nombre, Per_Apellido, Per_Email) VALUES 
('P20260000001', 'Carlos', 'Meza Flores', 'carlos.meza@email.com'),
('P20260000002', 'Ana', 'Rojas Quispe', 'ana.rojas@email.com'),
('P20260000003', 'Luis', 'Camacuari Yang', 'luis.camacuari@email.com'),
('P20260000004', 'Elena', 'Torres Bravo', 'elena.torres@email.com'),
('P20260000005', 'Jorge', 'Mendoza Solís', 'jorge.mendoza@email.com'),
('P20260000006', 'Sofia', 'Díaz Cárdenas', 'sofia.diaz@email.com');
GO

-- 2. Tabla: Ubicacion (Distritos de la provincia de Huancayo)
INSERT INTO Ubicacion (Ubi_ID, Ubi_Zona, Ubi_Distrito, Ubi_Latitud, Ubi_Longitud) VALUES 
('UBI300100001', 'Zona Centro', 'Huancayo', -12.065130, -75.204810),
('UBI300100002', 'Zona Sur', 'Chilca', -12.083333, -75.200000),
('UBI300100003', 'Zona Norte', 'El Tambo', -12.055278, -75.212500),
('UBI300100004', 'Zona Rural', 'Chupuro', -12.152222, -75.225556),
('UBI300100005', 'Zona Altura', 'Pucará', -12.175000, -75.143611),
('UBI300100006', 'Zona Agrícola', 'Sapallanga', -12.130556, -75.161111);
GO

-- 3. Tabla: Administrador (Encargados de revisar los reportes y activar las alertas de emergencia)
INSERT INTO Administrador (Adm_ID, Adm_Cargo, Per_ID) VALUES 
('ADM202600001', 'Director de Meteorología', 'P20260000001'),
('ADM202600002', 'Analista de Riesgos Ambientales', 'P20260000002'),
('ADM202600003', 'Coordinador de Defensa Civil', 'P20260000003'),
('ADM202600004', 'Especialista en Hidrología', 'P20260000004'),
('ADM202600005', 'Supervisor Técnico Regional', 'P20260000005'),
('ADM202600006', 'Técnico de Monitoreo Rápido', 'P20260000006');
GO

-- 4. Tabla: Usuario (Ciudadanos registrados)
INSERT INTO Usuario (Usu_ID, Usu_Telefono, Usu_FechaRegistro, Per_ID, Ubi_ID) VALUES 
('USU202600001', '987654321', '2026-01-10 08:30:00', 'P20260000001', 'UBI300100001'),
('USU202600002', '987654322', '2026-01-12 09:15:00', 'P20260000002', 'UBI300100002'),
('USU202600003', '987654323', '2026-01-15 14:22:00', 'P20260000003', 'UBI300100003'),
('USU202600004', '987654324', '2026-01-18 11:05:00', 'P20260000004', 'UBI300100004'),
('USU202600005', '987654325', '2026-01-20 16:40:00', 'P20260000005', 'UBI300100005'),
('USU202600006', '987654326', '2026-01-22 10:12:00', 'P20260000006', 'UBI300100006');
GO

-- 5. Tabla: Estacion (Estaciones Meteorológicas en Junín)
INSERT INTO Estacion (Est_ID, Est_Nombre, Est_Latitud, Est_Longitud, Est_Estado) VALUES 
('EST300100001', 'Estación Central Huancayo', -12.065000, -75.204000, 'Activa'),
('EST300100002', 'Estación Satelital El Tambo', -12.055000, -75.212000, 'Activa'),
('EST300100003', 'Estación Periférica Chilca', -12.083000, -75.200000, 'Activa'),
('EST300100004', 'Estación Agropecuaria Sapallanga', -12.130000, -75.161000, 'Mantenimiento'),
('EST300100005', 'Estación Climática Pucará', -12.175000, -75.143000, 'Activa'),
('EST300100006', 'Estación de Cuenca Chupuro', -12.152000, -75.225000, 'Inactiva');
GO

-- 6. Tabla: Suscripcion (Preferencias de los usuarios)
INSERT INTO Suscripcion (Sus_ID, Sus_TipoAlerta, Sus_Canal, Sus_FechaRegistro, Usu_ID, Est_ID) VALUES 
('SUS202600001', 'Helada', 'Aplicación Push', '2026-02-01 08:00:00', 'USU202600001', 'EST300100001'),
('SUS202600002', 'Friaje', 'SMS', '2026-02-02 12:30:00', 'USU202600002', 'EST300100002'),
('SUS202600003', 'Granizada', 'Aplicación Push', '2026-02-03 09:45:00', 'USU202600003', 'EST300100003'),
('SUS202600004', 'Lluvia Intensa', 'Correo Electrónico', '2026-02-05 15:10:00', 'USU202600004', 'EST300100004'),
('SUS202600005', 'Helada', 'SMS', '2026-02-06 11:20:00', 'USU202600005', 'EST300100005'),
('SUS202600006', 'Inundación', 'Aplicación Push', '2026-02-08 17:00:00', 'USU202600006', 'EST300100006');
GO

-- 7. Tabla: Registro_Climatico (Telemetría capturada)
INSERT INTO Registro_Climatico (Reg_ID, Reg_FechaHora, Reg_Temperatura, Reg_Humedad, Reg_Precipitacion, Reg_VelocidadViento, Est_ID) VALUES 
('REG202600001', '2026-03-15 05:00:00', -2.50, 45.20, 0.00, 12.50, 'EST300100001'), -- Indica Helada (-2.5°C)
('REG202600002', '2026-03-15 15:30:00', 14.20, 89.50, 45.80, 22.10, 'EST300100002'), -- Indica Lluvia Fuerte
('REG202600003', '2026-03-16 16:00:00', 8.00, 92.00, 15.00, 35.00, 'EST300100003'),  -- Indica Tormenta/Viento
('REG202600004', '2026-03-17 04:30:00', -4.10, 38.00, 0.00, 8.20, 'EST300100005'),  -- Helada severa en Pucará
('REG202600005', '2026-03-18 13:00:00', 18.50, 55.00, 0.00, 10.00, 'EST300100001'), -- Estado Normal
('REG202600006', '2026-03-19 18:45:00', 11.00, 88.00, 12.30, 18.40, 'EST300100002'); -- Lluvia ligera
GO

-- 8. Tabla: Alerta (Eventos críticos validados por un Administrador)
INSERT INTO Alerta (Alerta_ID, Alerta_Tipo, Alerta_Nivel, Alerta_FechaHora, Alerta_Descripcion, Alerta_Estado, Reg_ID, Adm_ID) VALUES 
('ALE202600001', 'Helada', 'Rojo', '2026-03-15 06:00:00', 'Temperatura crítica bajo cero en Huancayo Centro. Proteger cultivos.', 'Activa', 'REG202600001', 'ADM202600001'),
('ALE202600002', 'Lluvia Intensa', 'Naranja', '2026-03-15 16:00:00', 'Precipitaciones fuertes prolongadas en El Tambo. Riesgo de aniegos.', 'Activa', 'REG202600002', 'ADM202600002'),
('ALE202600003', 'Granizada', 'Amarillo', '2026-03-16 16:45:00', 'Caída de granizo moderado con ráfagas de viento en Chilca.', 'Expirada', 'REG202600003', 'ADM202600003'),
('ALE202600004', 'Helada Extrema', 'Rojo', '2026-03-17 05:15:00', 'Descenso drástico en Pucará. Priorizar abrigo en niños y ancianos.', 'Activa', 'REG202600004', 'ADM202600004'),
('ALE202600005', 'Friaje', 'Amarillo', '2026-03-18 14:00:00', 'Monitoreo de descenso leve de temperatura diurna.', 'Cancelada', 'REG202600005', 'ADM202600005'),
('ALE202600006', 'Lluvia Moderada', 'Amarillo', '2026-03-19 19:15:00', 'Precipitaciones dentro del rango estacional. Conducir con precaución.', 'Activa', 'REG202600006', 'ADM202600006');
GO

-- 9. Tabla: Notificacion (Envíos dirigidos a los ciudadanos)
INSERT INTO Notificacion (Noti_ID, Noti_Canal, Noti_FechaEnvio, Noti_EstadoLectura, Alerta_ID, Usu_ID) VALUES 
('NOT202600001', 'Aplicación Push', '2026-03-15 06:01:00', 'Leida', 'ALE202600001', 'USU202600001'),
('NOT202600002', 'SMS', '2026-03-15 16:02:00', 'No Leida', 'ALE202600002', 'USU202600002'),
('NOT202600003', 'Aplicación Push', '2026-03-16 16:46:00', 'Leida', 'ALE202600003', 'USU202600003'),
('NOT202600004', 'Correo Electrónico', '2026-03-17 05:16:00', 'No Leida', 'ALE202600004', 'USU202600004'),
('NOT202600005', 'SMS', '2026-03-18 14:02:00', 'Leida', 'ALE202600005', 'USU202600005'),
('NOT202600006', 'Aplicación Push', '2026-03-19 19:16:00', 'No Leida', 'ALE202600006', 'USU202600006');
GO

-- 10. Tabla: Historial_Alertas (Bitácora de auditoría del ciclo de vida de la alerta)
INSERT INTO Historial_Alertas (Hist_ID, Hist_Fecha, Hist_EstadoAnterior, Hist_EstadoNuevo, Hist_Observacion, Alerta_ID) VALUES 
('HST202600001', '2026-03-15 06:00:00', 'Creada', 'Activa', 'Alerta oficial inicial publicada por la dirección.', 'ALE202600001'),
('HST202600002', '2026-03-15 16:00:00', 'Creada', 'Activa', 'Alerta por lluvias torrenciales despachada a dispositivos móviles.', 'ALE202600002'),
('HST202600003', '2026-03-16 22:00:00', 'Activa', 'Expirada', 'El fenómeno meteorológico ha concluido en el distrito de Chilca.', 'ALE202600003'),
('HST202600004', '2026-03-17 05:15:00', 'Creada', 'Activa', 'Reporte automático crítico por helada severa en altura.', 'ALE202600004'),
('HST202600005', '2026-03-18 16:30:00', 'Activa', 'Cancelada', 'Falsa alarma, las condiciones meteorológicas se estabilizaron.', 'ALE202600005'),
('HST202600006', '2026-03-19 19:15:00', 'Creada', 'Activa', 'Ingreso de nubosidad moderada reportada desde el centro de control.', 'ALE202600006');
GO

-- 11. Tabla: Reporte
INSERT INTO Reporte (Reporte_ID, Reporte_Fecha, Reporte_Zona, Reporte_Fenomeno, Reporte_Periodo, Reporte_Estadisticas, Adm_ID) VALUES 
('REP202600001', '2026-03-31 18:00:00', 'Zona Centro', 'Heladas', 'Marzo 2026', 'Total alertas: 2. Población afectada estimada: 15,000 hab.', 'ADM202600001'),
('REP202600002', '2026-04-01 09:00:00', 'Zona Norte', 'Lluvias Intensas', 'Marzo 2026', 'Milímetros acumulados máx: 45.8mm. Daños materiales: Bajos.', 'ADM202600002'),
('REP202600003', '2026-04-02 10:30:00', 'Zona Sur', 'Granizadas', 'Marzo 2026', 'Eventos registrados: 1. Duración promedio: 45 minutos.', 'ADM202600003'),
('REP202600004', '2026-04-05 11:15:00', 'Zona Altura', 'Heladas Extremas', 'Marzo 2026', 'Mínima histórica registrada: -4.1°C en el distrito de Pucará.', 'ADM202600004'),
('REP202600005', '2026-04-06 14:00:00', 'Provincia Huancayo', 'Resumen Mensual', 'Marzo 2026', 'Alertas totales enviadas: 6. Efectividad de lectura: 50%.', 'ADM202600005'),
('REP202600006', '2026-04-10 16:45:00', 'Zona Agrícola', 'Lluvias Estacionales', 'Marzo 2026', 'Estaciones activas en el monitoreo: 4 operativas al 100%.', 'ADM202600006');
GO


SELECT * FROM Persona;