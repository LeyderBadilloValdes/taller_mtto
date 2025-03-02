-- SHOW DATABASES;
-- SHOW TABLES;
-- DROP DATABASE IF EXISTS taller_mtto;
-- CREATE DATABASE taller_mtto;
-- USE taller_mtto;
-- DROP DATABASE taller_mtto;
-- DROP VIEW IF EXISTS Reporte_Mantenimientos_Completo;

-- Crear la base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS taller_mtto;
USE taller_mtto;

-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    rol ENUM('Admin', 'Tecnico', 'Supervisor') NOT NULL
);

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
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE SET NULL
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
    FOREIGN KEY (id_usuario_aprobador) REFERENCES Usuarios(id_usuario) ON DELETE SET NULL
);

-- Tabla de Piezas Reemplazadas
CREATE TABLE IF NOT EXISTS Piezas_Reemplazadas (
    id_pieza INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT,
    nombre_pieza VARCHAR(100) NOT NULL,
    fabricante_pieza VARCHAR(100),
    fecha_instalacion DATE NOT NULL,
    vida_util_estimada INT COMMENT 'En meses',
    estado ENUM('Nueva', 'Usada', 'Defectuosa') DEFAULT 'Nueva',
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo) ON DELETE CASCADE
);

-- Tabla de Archivos de Mantenimiento (Con control de versiones)
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
    semana_anio INT GENERATED ALWAYS AS (WEEK(fecha_programada, 3)) STORED, -- Semana ISO 8601
    dia_mes INT GENERATED ALWAYS AS (DAY(fecha_programada)) STORED,
    responsable VARCHAR(100),
    estado ENUM('Pendiente', 'Realizado', 'Cancelado') DEFAULT 'Pendiente',
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo) ON DELETE CASCADE
);

-- Vista: Reporte Completo de Mantenimientos
CREATE OR REPLACE VIEW Reporte_Mantenimientos_Completo AS
SELECT 
    m.id_mantenimiento, 
    e.nombre AS equipo, 
    u.nombre AS responsable,
    m.tipo_mantenimiento, 
    m.fecha_realizacion, 
    m.observaciones, 
    m.estado_aprobacion AS estado_mantenimiento,  
    a.fecha_aprobacion, 
    a.estado AS estado_aprobacion_mantenimiento,  
    a.comentario AS comentario_aprobacion, 
    f.nombre_archivo, 
    f.ruta_archivo, 
    f.tipo_archivo, 
    f.version
FROM Mantenimientos m
JOIN Equipos e ON m.id_equipo = e.id_equipo
JOIN Usuarios u ON m.id_usuario = u.id_usuario
LEFT JOIN Aprobaciones_Mantenimientos a ON m.id_mantenimiento = a.id_mantenimiento
LEFT JOIN Archivos_Mantenimiento f ON m.id_mantenimiento = f.id_mantenimiento;

-- Vista: Cronograma de Mantenimiento por Mes y Semana
CREATE OR REPLACE VIEW Vista_Cronograma_Mantenimiento AS
SELECT 
    c.id_cronograma,
    e.nombre AS equipo,
    c.tipo_actividad,
    c.fecha_programada,
    c.anio,
    c.mes,
    c.semana_anio,
    c.dia_mes,
    c.responsable,
    c.estado
FROM Cronograma_Mantenimiento c
JOIN Equipos e ON c.id_equipo = e.id_equipo;
