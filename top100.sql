CREATE DATABASE peliculas

\c peliculas

CREATE TABLE pelicula (
    id serial,
    nombre_pelicula varchar(255) not null,
    anio int not null,
    director varchar(255) not null,
    PRIMARY KEY (id)
);

CREATE TABLE reparto (
    pelicula_id int not null,
    actor varchar(255) not null,
    PRIMARY KEY (pelicula_id, actor)
);

\copy pelicula from 'peliculas.csv' csv header;
\copy reparto from 'reparto.csv' csv;

--requerimiento 3

select id from pelicula where nombre_pelicula='Titanic';

-- requerimiento 4

select actor from reparto where pelicula_id=2;

-- requerimiento 5

select pelicula.nombre_pelicula from pelicula join reparto on pelicula.id = reparto.pelicula_id where reparto.actor='Harrison Ford';

--requerimiento 6

select nombre_pelicula, anio from pelicula where anio >= 1990 and anio <= 1999 order by nombre_pelicula asc;

-- requerimiento 7

select nombre_pelicula, length(nombre_pelicula) as longitud_titulo from pelicula;