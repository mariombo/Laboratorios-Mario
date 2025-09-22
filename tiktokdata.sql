

DROP DATABASE IF EXISTS TikTokDB;
CREATE DATABASE TikTokDB;
USE TikTokDB;


-- Tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro DATE NOT NULL,
    pais_origen VARCHAR(50) NOT NULL
);

-- Tabla Videos
CREATE TABLE Videos (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_publicacion DATE NOT NULL,
    duracion_segundos INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabla Comentarios
CREATE TABLE Comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_video INT NOT NULL,
    id_usuario INT NOT NULL,
    texto TEXT NOT NULL,
    fecha_comentario DATE NOT NULL,
    FOREIGN KEY (id_video) REFERENCES Videos(id_video),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabla Likes
CREATE TABLE Likes (
    id_like INT AUTO_INCREMENT PRIMARY KEY,
    id_video INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_like DATE NOT NULL,
    FOREIGN KEY (id_video) REFERENCES Videos(id_video),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabla Seguidores
CREATE TABLE Seguidores (
    id_seguidor INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_seguidor INT NOT NULL,
    id_usuario_seguido INT NOT NULL,
    fecha_seguimiento DATE NOT NULL,
    FOREIGN KEY (id_usuario_seguidor) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_usuario_seguido) REFERENCES Usuarios(id_usuario),
    CONSTRAINT chk_autoseguir CHECK (id_usuario_seguidor <> id_usuario_seguido)
);


-- Usuarios
INSERT INTO Usuarios (nombre_usuario, correo, fecha_registro, pais_origen) VALUES
('sofia',       'sofia@example.com',       '2025-01-08', 'Colombia'),
('nico_21',     'nico21@example.com',      '2025-02-05', 'Perú'),
('valen_music', 'valen.music@example.com', '2025-03-02', 'Uruguay'),
('proGamer',    'progamer@example.com',    '2025-03-18', 'Ecuador');

-- Videos
INSERT INTO Videos (id_usuario, titulo, descripcion, fecha_publicacion, duracion_segundos) VALUES
(1, 'Primer vlog en la ciudad', 'Mini tour por el centro',       '2025-03-20', 35),
(2, 'Pasta carbonara fácil',    'Receta en cinco pasos',         '2025-03-21', 50),
(3, 'Cover de piano',           'Versión instrumental sencilla', '2025-03-22', 75),
(4, 'Speedrun en Minecraft',    'Intento personal comentado',    '2025-03-23', 110);

-- Comentarios
INSERT INTO Comentarios (id_video, id_usuario, texto, fecha_comentario) VALUES
(1, 2, 'Buen recorrido, me gustó la toma final', '2025-03-20'),
(2, 1, 'La prepararé esta noche',                '2025-03-21'),
(3, 4, 'Suena muy limpio, gran cover',           '2025-03-22'),
(4, 3, 'Esa estrategia estuvo increíble',        '2025-03-23');

-- Likes
INSERT INTO Likes (id_video, id_usuario, fecha_like) VALUES
(1, 3, '2025-03-20'),
(1, 4, '2025-03-20'),
(2, 1, '2025-03-21'),
(3, 2, '2025-03-22'),
(4, 1, '2025-03-23');

-- Seguidores
INSERT INTO Seguidores (id_usuario_seguidor, id_usuario_seguido, fecha_seguimiento) VALUES
(2, 1, '2025-03-19'), -- nico_21 sigue a sofia
(3, 1, '2025-03-20'), -- valen_music sigue a sofia
(4, 3, '2025-03-22'), -- proGamer sigue a valen_music
(1, 2, '2025-03-21'); -- sofia sigue a nico_21


SELECT * FROM Usuarios;

-- 2. Ver todos los videos publicados
SELECT V.id_video, V.titulo, V.fecha_publicacion, U.nombre_usuario AS publicado_por
FROM Videos V
JOIN Usuarios U ON V.id_usuario = U.id_usuario;

-- 3. Ver los comentarios realizados en los videos
SELECT C.id_comentario, U.nombre_usuario AS autor, V.titulo AS video, C.texto, C.fecha_comentario
FROM Comentarios C
JOIN Usuarios U ON C.id_usuario = U.id_usuario
JOIN Videos V ON C.id_video = V.id_video;

-- 4. Ver todos los likes dados a los videos
SELECT L.id_like, U.nombre_usuario AS usuario, V.titulo AS video, L.fecha_like
FROM Likes L
JOIN Usuarios U ON L.id_usuario = U.id_usuario
JOIN Videos V ON L.id_video = V.id_video;

-- 5. Ver las relaciones de seguimiento entre los usuarios
SELECT S.id_seguidor, U1.nombre_usuario AS seguidor, U2.nombre_usuario AS seguido, S.fecha_seguimiento
FROM Seguidores S
JOIN Usuarios U1 ON S.id_usuario_seguidor = U1.id_usuario
JOIN Usuarios U2 ON S.id_usuario_seguido  = U2.id_usuario;