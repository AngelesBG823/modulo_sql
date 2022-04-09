-- Crear una base de datos con nombre “Posts”. (1 Punto)
\c angelesbg823
DROP DATABaSE post;
CREATE DATABASE posts;
\c posts

-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción. (1 Punto
CREATE TABLE post(
    id SERIAL,
    userName VARCHAR(30),
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