-- SHOW DATABASES;
-- SHOW TABLES;
-- DROP DATABASE IF EXISTS taller_mtto;
-- CREATE DATABASE taller_mtto;
-- USE taller_mtto;
-- DROP DATABASE taller_mtto;
-- DROP VIEW IF EXISTS Reporte_Mantenimientos_Completo;
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS taller_mtto;
USE taller_mtto;
show tables;
-- Tabla de Roles
CREATE TABLE IF NOT EXISTS Rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- Insertar roles por defecto
INSERT INTO Rol (nombre) VALUES ('Admin'), ('Auxiliar de Mantenimiento')
ON DUPLICATE KEY UPDATE nombre=nombre;

-- Tabla de Equipos
CREATE TABLE IF NOT EXISTS Equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('Neumatico', 'Hidraulico', 'Mecanico', 'Electrico') NOT NULL,
    descripcion TEXT,
    fecha_adquisicion DATE,
    ubicacion VARCHAR(100)
);

-- Tabla de Repuestos Asociados a Equipos
CREATE TABLE IF NOT EXISTS Repuestos_Equipos (
    id_repuesto INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT NOT NULL,
    nombre_repuesto VARCHAR(100) NOT NULL,
    referencia VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo) ON DELETE CASCADE
);

-- Tabla de Mantenimientos
CREATE TABLE IF NOT EXISTS Mantenimientos (
    id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT,
    id_usuario INT,
    tipo_mantenimiento ENUM('Correctivo', 'Preventivo', 'Predictivo') NOT NULL,
    fecha_realizacion DATE NOT NULL,
    observaciones TEXT,
    estado_aprobacion ENUM('Pendiente Aprobacion', 'Aprobado', 'Rechazado') DEFAULT 'Pendiente Aprobacion',
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES auth_user(id) ON DELETE SET NULL
);

-- Tabla de Aprobaciones de Mantenimiento
CREATE TABLE IF NOT EXISTS Aprobaciones_Mantenimientos (
    id_aprobacion INT AUTO_INCREMENT PRIMARY KEY,
    id_mantenimiento INT,
    id_usuario_aprobador INT,
    fecha_aprobacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('Aprobado', 'Rechazado') NOT NULL,
    comentario TEXT,
    FOREIGN KEY (id_mantenimiento) REFERENCES Mantenimientos(id_mantenimiento) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario_aprobador) REFERENCES auth_user(id) ON DELETE SET NULL
);

-- Tabla de Archivos de Mantenimiento
CREATE TABLE IF NOT EXISTS Archivos_Mantenimiento (
    id_archivo INT AUTO_INCREMENT PRIMARY KEY,
    id_mantenimiento INT,
    tipo_archivo ENUM('Imagen', 'Documento', 'Otro') NOT NULL,
    nombre_archivo VARCHAR(255) NOT NULL,
    ruta_archivo VARCHAR(500) NOT NULL,
    version INT DEFAULT 1,
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_mantenimiento) REFERENCES Mantenimientos(id_mantenimiento) ON DELETE CASCADE
);

-- Tabla del Cronograma de Mantenimiento
CREATE TABLE IF NOT EXISTS Cronograma_Mantenimiento (
    id_cronograma INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT NOT NULL,
    tipo_actividad ENUM('Lubricacion', 'Revision', 'Otro') NOT NULL,
    fecha_programada DATE NOT NULL,
    anio INT GENERATED ALWAYS AS (YEAR(fecha_programada)) STORED,
    mes INT GENERATED ALWAYS AS (MONTH(fecha_programada)) STORED,
    semana_anio INT GENERATED ALWAYS AS (WEEK(fecha_programada, 3)) STORED,
    dia_mes INT GENERATED ALWAYS AS (DAY(fecha_programada)) STORED,
    responsable VARCHAR(100),
    estado ENUM('Pendiente', 'Realizado', 'Cancelado') DEFAULT 'Pendiente',
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo) ON DELETE CASCADE
);

-- Crear un usuario por defecto en auth_user con rol Admin
-- Se crea con python manage.py createsuperuser

-- Asignar el rol Admin al usuario creado
INSERT INTO Rol (nombre) VALUES ('Admin') ON DUPLICATE KEY UPDATE nombre=nombre;

SELECT username, email FROM auth_user;
