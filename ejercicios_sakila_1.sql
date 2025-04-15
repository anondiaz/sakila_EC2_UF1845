-- Utiliza la base de datos sakila, disponible en MySQL Workbench,
-- para resolver estos ejercicios 

USE sakila;


-- 1) Actores que tienen el primer nombre "Gary"
SELECT first_name, last_name
FROM sakila.actor
WHERE first_name = 'Gary' ;


-- 2) Actores que tiene de primer apellido "Streep"
SELECT first_name, last_name
FROM sakila.actor
WHERE last_name = 'Streep' ;


-- 3) Actores que contengan una "o" en su nombre
SELECT first_name, last_name
FROM sakila.actor
WHERE first_name
LIKE '%o%' OR last_name LIKE '%o%' ;


-- 4) Actores que contengan una "a" en su nombre y una "e" en su apellido
SELECT first_name, last_name
FROM sakila.actor
WHERE first_name
LIKE '%a%' AND last_name LIKE '%e%' ;


-- 5) Actores que contengan dos "o" en su nombre (en cualquier posicion) y una "a" en su apellido
SELECT first_name, last_name
FROM sakila.actor
WHERE first_name
LIKE '%o%o%' AND last_name LIKE '%a%' ;


-- 6) Actores cuya tercera letra del nombre sea "b"
SELECT first_name, last_name
FROM sakila.actor
WHERE first_name
LIKE '___b%' ;


-- 7) Ciudades que empiezan por "a"
SELECT city
FROM sakila.city
WHERE city
LIKE 'a%' ; 


-- 8) Ciudades que acaban por "s"
SELECT city
FROM sakila.city
WHERE city
LIKE '%s' ; 


-- 9) Ciudades del country "France"
SELECT ci.city, co.country 
FROM sakila.city ci
JOIN sakila.country co 
ON ci.country_id = co.country_id
WHERE country = 'France' ;


-- 10) Ciudades con nombres compuestos (como New York)
SELECT city
FROM sakila.city
WHERE city
LIKE '% %' ; 


-- 11) películas con una duración entre 80 y 100 m.
SELECT title, length
FROM sakila.film
WHERE length
BETWEEN 80 AND 100
ORDER BY length DESC;


-- 12) películas con un rental_rate entre 1 y 3
SELECT title, rental_rate
FROM sakila.film
WHERE rental_rate
BETWEEN 1 AND 3 ;


-- 13) películas con un título de más de 11 letras.
SELECT title, char_length(title) AS longitud 
FROM sakila.film
WHERE char_length(title) > 11
ORDER BY longitud ASC;


-- 14) películas con un rating de PG o G.
SELECT title, rating
FROM sakila.film
WHERE rating
IN ('PG', 'G');

 
-- 15) ¿Cuantas ciudades tiene el country ‘France’? 
SELECT count(city_id) AS 'Cantidad de ciudades'
FROM sakila.city
WHERE country_id = ( 
SELECT country_id
FROM sakila.country
WHERE country = 'France' );


-- 16) Películas que no tengan un rating de NC-17
SELECT title, rating
FROM sakila.film
WHERE rating
NOT IN ('NC-17');


-- 17) Películas con un rating PG y duración de más de 120.
SELECT title, rating, length
FROM sakila.film
WHERE rating
LIKE 'PG' AND length > 120
ORDER BY length ASC ;


-- 18) ¿Cuantos actores hay?
SELECT COUNT(actor_id) AS 'Cantidad de Actores'
FROM sakila.actor;


-- 19) Película con mayor duración.
SELECT fi.title, fi.length
FROM sakila.film fi
WHERE length =
(SELECT length
FROM sakila.film
ORDER BY length DESC
LIMIT 1)
;

-- 20) ¿Cuantos clientes viven en Indonesia?
SELECT count(customer_id) AS 'Cantidad de clientes'
FROM sakila.customer 
WHERE address_id IN 
(
SELECT address_id
FROM sakila.address
WHERE city_id IN 
(
SELECT city_id
FROM sakila.city
WHERE country_id = 
(
SELECT country_id
FROM sakila.country
WHERE country = 'Indonesia'
)
)
);

