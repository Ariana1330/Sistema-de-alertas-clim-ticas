CREATE DATABASE SistemaAlertasClimaticas;
GO

USE SistemaAlertasClimaticas;
GO

CREATE TABLE Persona(
    Per_ID CHAR(12) NOT NULL,
    Per_Nombre VARCHAR(50) NOT NULL,
    Per_Apellido VARCHAR(50) NOT NULL,
    Per_Email VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Persona PRIMARY KEY (Per_ID)
);
GO

CREATE TABLE Ubicacion(
    Ubi_ID CHAR(12) NOT NULL,
    Ubi_Zona VARCHAR(50) NOT NULL,
    Ubi_Distrito VARCHAR(50) NOT NULL,
    Ubi_Latitud DECIMAL(10,6) NOT NULL,
    Ubi_Longitud DECIMAL(10,6) NOT NULL,
    CONSTRAINT PK_Ubicacion PRIMARY KEY (Ubi_ID)
);
GO

CREATE TABLE Administrador(
    Adm_ID CHAR(12) NOT NULL,
    Adm_Cargo VARCHAR(50) NOT NULL,
    Per_ID CHAR(12) NOT NULL,
    CONSTRAINT PK_Administrador PRIMARY KEY (Adm_ID),
    CONSTRAINT FK_Administrador_Persona
        FOREIGN KEY (Per_ID)
        REFERENCES Persona(Per_ID)
);
GO

CREATE TABLE Usuario(
    Usu_ID CHAR(12) NOT NULL,
    Usu_Telefono CHAR(9) NOT NULL,
    Usu_FechaRegistro DATETIME NOT NULL,
    Per_ID CHAR(12) NOT NULL,
    Ubi_ID CHAR(12) NOT NULL,
    CONSTRAINT PK_Usuario PRIMARY KEY (Usu_ID),
    CONSTRAINT FK_Usuario_Persona
        FOREIGN KEY (Per_ID)
        REFERENCES Persona(Per_ID),
    CONSTRAINT FK_Usuario_Ubicacion
        FOREIGN KEY (Ubi_ID)
        REFERENCES Ubicacion(Ubi_ID)
);
GO

CREATE TABLE Estacion(
    Est_ID CHAR(12) NOT NULL,
    Est_Nombre VARCHAR(60) NOT NULL,
    Est_Latitud DECIMAL(10,6) NOT NULL,
    Est_Longitud DECIMAL(10,6) NOT NULL,
    Est_Estado VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Estacion PRIMARY KEY (Est_ID)
);
GO

CREATE TABLE Suscripcion(
    Sus_ID CHAR(12) NOT NULL,
    Sus_TipoAlerta VARCHAR(50) NOT NULL,
    Sus_Canal VARCHAR(30) NOT NULL,
    Sus_FechaRegistro DATETIME NOT NULL,
    Usu_ID CHAR(12) NOT NULL,
    Est_ID CHAR(12) NOT NULL,
    CONSTRAINT PK_Suscripcion PRIMARY KEY (Sus_ID),
    CONSTRAINT FK_Suscripcion_Usuario
        FOREIGN KEY (Usu_ID)
        REFERENCES Usuario(Usu_ID),
    CONSTRAINT FK_Suscripcion_Estacion
        FOREIGN KEY (Est_ID)
        REFERENCES Estacion(Est_ID)
);
GO

CREATE TABLE Registro_Climatico(
    Reg_ID CHAR(12) NOT NULL,
    Reg_FechaHora DATETIME NOT NULL,
    Reg_Temperatura DECIMAL(5,2) NOT NULL,
    Reg_Humedad DECIMAL(5,2) NOT NULL,
    Reg_Precipitacion DECIMAL(5,2) NOT NULL,
    Reg_VelocidadViento DECIMAL(5,2) NOT NULL,
    Est_ID CHAR(12) NOT NULL,
    CONSTRAINT PK_Registro_Climatico PRIMARY KEY (Reg_ID),
    CONSTRAINT FK_Registro_Estacion
        FOREIGN KEY (Est_ID)
        REFERENCES Estacion(Est_ID)
);
GO

CREATE TABLE Alerta(
    Alerta_ID CHAR(12) NOT NULL,
    Alerta_Tipo VARCHAR(50) NOT NULL,
    Alerta_Nivel VARCHAR(20) NOT NULL,
    Alerta_FechaHora DATETIME NOT NULL,
    Alerta_Descripcion VARCHAR(200) NOT NULL,
    Alerta_Estado VARCHAR(20) NOT NULL,
    Reg_ID CHAR(12) NOT NULL,
    Adm_ID CHAR(12) NOT NULL,
    CONSTRAINT PK_Alerta PRIMARY KEY (Alerta_ID),
    CONSTRAINT FK_Alerta_Registro
        FOREIGN KEY (Reg_ID)
        REFERENCES Registro_Climatico(Reg_ID),
    CONSTRAINT FK_Alerta_Administrador
        FOREIGN KEY (Adm_ID)
        REFERENCES Administrador(Adm_ID)
);
GO

CREATE TABLE Notificacion(
    Noti_ID CHAR(12) NOT NULL,
    Noti_Canal VARCHAR(30) NOT NULL,
    Noti_FechaEnvio DATETIME NOT NULL,
    Noti_EstadoLectura VARCHAR(20) NOT NULL,
    Alerta_ID CHAR(12) NOT NULL,
    Usu_ID CHAR(12) NOT NULL,
    CONSTRAINT PK_Notificacion PRIMARY KEY (Noti_ID),
    CONSTRAINT FK_Notificacion_Alerta
        FOREIGN KEY (Alerta_ID)
        REFERENCES Alerta(Alerta_ID),
    CONSTRAINT FK_Notificacion_Usuario
        FOREIGN KEY (Usu_ID)
        REFERENCES Usuario(Usu_ID)
);
GO

CREATE TABLE Historial_Alertas(
    Hist_ID CHAR(12) NOT NULL,
    Hist_Fecha DATETIME NOT NULL,
    Hist_EstadoAnterior VARCHAR(30) NOT NULL,
    Hist_EstadoNuevo VARCHAR(30) NOT NULL,
    Hist_Observacion VARCHAR(200) NOT NULL,
    Alerta_ID CHAR(12) NOT NULL,
    CONSTRAINT PK_Historial PRIMARY KEY (Hist_ID),
    CONSTRAINT FK_Historial_Alerta
        FOREIGN KEY (Alerta_ID)
        REFERENCES Alerta(Alerta_ID)
);
GO

CREATE TABLE Reporte(
    Reporte_ID CHAR(12) NOT NULL,
    Reporte_Fecha DATETIME NOT NULL,
    Reporte_Zona VARCHAR(50) NOT NULL,
    Reporte_Fenomeno VARCHAR(50) NOT NULL,
    Reporte_Periodo VARCHAR(50) NOT NULL,
    Reporte_Estadisticas VARCHAR(200) NOT NULL,
    Adm_ID CHAR(12) NOT NULL,
    CONSTRAINT PK_Reporte PRIMARY KEY (Reporte_ID),
    CONSTRAINT FK_Reporte_Administrador
        FOREIGN KEY (Adm_ID)
        REFERENCES Administrador(Adm_ID)
);
GO