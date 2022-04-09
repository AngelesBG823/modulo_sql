-- Crear una base de datos con nombre “Posts”. (1 Punto)
\c angelesbg823
DROP DATABaSE post;
CREATE DATABASE posts;
\c posts

-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción. (1 Punto
CREATE TABLE post(
    id SERIAL, --serial es que va por cada argumento
    userName VARCHAR(30), --Camelcase porque no aguanta el "_"
    createdAt DATE,
    content VARCHAR,
    descripcion VARCHAR,
    primary key(id)
);
\dt

-- Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)
INSERT INTO post (userName, createdAt, content, descripcion)
VALUES('Pamela', '08-04-2021', 'Como sabes que creciste?', 'Cuando nadie te pregunta')
INSERT INTO post (userName, createdAt, content, descripcion)
VALUES('Pamela', '10-10-2020', 'Como sabes?', 'me lo cuenta un pajarito')
INSERT INTO post (userName, createdAt, content, descripcion)
VALUES('Carlos', '02-05-2019', 'Qué dato es este?', 'Archivos clasificados')
--seleccionar toda la tabla post para que muestre resultado en pantalla
SELECT * FROM post;
-- 4. Modificar la tabla post, agregando la columna título. (1 Punto)
ALTER TABLE post ADD title VARCHAR(20);
SELECT * FROM post;
-- 5. Agregar título a las publicaciones ya ingresadas. (1 Punto)
UPDATE post SET title = 'Dinosaurios' WHERE id = 1;
UPDATE post SET title = 'Curas' WHERE  id = 2; 
UPDATE post SET title = 'Gramática' WHERE id = 3;
SELECT * FROM post;
-- 6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)
INSERT INTO post (userName, createdAt, content, descripcion)
VALUES('Pedro', '2021-04-11', 'te pillaron', 'te pillaron2');
INSERT INTO post (userName, createdAt, content, descripcion)
VALUES('Pedro', '2020-06-10', 'shingeki no kyojin', 'temporada 3, parte 10');
SELECT * FROM post;
-- 7. Eliminar el post de Carlos. (1 Punto)
DELETE FROM post WHERE userName = 'Carlos';
SELECT * FROM post;
-- 8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)
INSERT INTO post (userName, createdAt, content, descripcion, title)
VALUES('Carlos', '09-08-2021', 'Jamás nunca', 'nunca jamás', 'neverland');
SELECT * FROM post;

-- Parte 2
-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts. (1 Punto)
CREATE TABLE comentarios(
    id SERIAL,
    post_id INT,
    createdAt TIMESTAMP,
    content VARCHAR,
    FOREIGN KEY (post_id) REFERENCES post (id)
);
\dt
-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(1, '2021-05-10 15:16:13', 'el mio era un gatito');
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(1, '2021-05-11 10:09:08', 'vivan los perros yeah');
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(6, '2021-02-06 21:07:14', 'hierba mala nunca muere');
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(6, '2020-04-04 18:58:09', 'penita toy story 3');
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(6, '2021-10-06 21:07:14', 'encanto sobrevalorada');
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(6, '2020-04-10 18:58:09', 'aguante turning red');
SELECT * FROM comentarios;
-- 3. Crear un nuevo post para "Margarita". (1 Punto)
INSERT INTO post (userName, createdAt, content, descripcion, title)
VALUES('Margarita', '2020-11-12', 'tatakae', 'itadakimas', 'arigato');
SELECT * FROM post;
-- 4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(7, '2021-05-11 10:00:00', 'Margarita stop');
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(7, '2021-05-12 10:00:02', 'Margarita amarilla');
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(7, '2021-01-11 10:30:00', 'Margarita de frambuesa');
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(7, '2021-03-01 09:00:00', 'Margarita y girasol');
INSERT INTO comentarios(post_id, createdAt, content)
VALUES(7, '2021-03-10 15:00:00', 'Girasoles Van Gogh');
SELECT * FROM comentarios;