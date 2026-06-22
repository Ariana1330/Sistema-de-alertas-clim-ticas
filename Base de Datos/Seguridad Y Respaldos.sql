CREATE LOGIN Administrador
WITH PASSWORD = 'adminpass@',
CHECK_POLICY = OFF
GO

CREATE LOGIN Usuario
WITH PASSWORD = 'user1234',
CHECK_POLICY = OFF
GO


CREATE USER Administrador FOR LOGIN Administrador;
CREATE USER Usuario FOR LOGIN Usuario;


GRANT SELECT, INSERT, UPDATE, DELETE ON [Persona] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Usuario] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Administrador] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Ubicacion] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Estacion] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Suscripcion] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Registro_Climatico] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Alerta] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Notificacion] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Historial_Alertas] TO Administrador;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Reporte] TO Administrador;


GRANT SELECT, UPDATE ON [Usuario] TO Usuario;
GRANT SELECT ON [Ubicacion] TO Usuario;
GRANT SELECT, INSERT, UPDATE ON [Suscripcion] TO Usuario;
GRANT SELECT ON [Alerta] TO Usuario;
GRANT SELECT ON [Notificacion] TO Usuario;
GRANT SELECT ON [Historial_Alertas] TO Usuario;

 