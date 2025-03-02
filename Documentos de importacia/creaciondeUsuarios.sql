USE taller_mtto; -- Asegúrate de estar en la base de datos correcta

SELECT * FROM usuarios; -- Verifica si hay usuarios registrados
INSERT INTO Usuarios (nombre, email, password_hash, rol)
VALUES ('Admin', 'admin@example.com', SHA2('admin123', 256), 'Admin');

ALTER TABLE auth_user MODIFY COLUMN first_name VARCHAR(150) NULL;
ALTER TABLE auth_user MODIFY COLUMN last_name VARCHAR(150) NULL;

INSERT INTO auth_user (username, email, password, is_active, is_staff, is_superuser, date_joined)
VALUES ('prueba', 'prueba@example.com', 'pbkdf2_sha256$260000$hash_aqui', 1, 0, 0, NOW());

DELETE FROM auth_user WHERE username = 'prueba';
DROP TABLE Usuarios_usuario;
