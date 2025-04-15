-- Utiliza la base de datos sakila, disponible en MySQL Workbench,
-- para resolver estos ejercicios 

USE sakila;


-- 1) Actores que tienen el primer nombre "Gary"
SELECT * FROM sakila.actor WHERE first_name = 'Gary' ;


-- 2) Actores que tiene de primer apellido "Streep"
SELECT * FROM sakila.actor WHERE last_name = 'Streep' ;


-- 3) Actores que contengan una "o" en su nombre
SELECT * FROM sakila.actor WHERE first_name LIKE '%o%' OR last_name like '%o%' ;


-- 4) Actores que contengan una "a" en su nombre y una "e" en su apellido
SELECT * FROM sakila.actor WHERE first_name like '%a%' AND last_name like '%e%' ;


-- 5) Actores que contengan dos "o" en su nombre (en cualquier posicion) y una "a" en su apellido
SELECT * FROM sakila.actor WHERE first_name like '%o%o%' AND last_name like '%a%' ;


-- 6) Actores cuya tercera letra del nombre sea "b"
SELECT * FROM sakila.actor WHERE first_name like '___b%' ;

-- 7) Ciudades que empiezan por "a"
SELECT * FROM sakila.city WHERE city like 'a%' ; 



-- 8) Ciudades que acaban por "s"
SELECT * FROM sakila.city WHERE city like '%s' ; 


-- 9) Ciudades del country "France"
SELECT * FROM sakila.city WHERE country_id = ( 
SELECT country_id FROM sakila.country WHERE country = 'France' );


-- 10) Ciudades con nombres compuestos (como New York)
SELECT * FROM sakila.city WHERE city LIKE '% %' ; 



-- 11) películas con una duración entre 80 y 100 m.
SELECT * FROM sakila.film WHERE length BETWEEN 80 AND 100 ;





-- 12) películas con un rental_rate entre 1 y 3
SELECT * FROM sakila.film WHERE rental_rate BETWEEN 1 AND 3 ;


-- 13) películas con un título de más de 11 letras.
--
--


-- 14) películas con un rating de PG o G.
SELECT * FROM sakila.film WHERE rating IN ('PG', 'G');


 
-- 15) ¿Cuantas ciudades tiene el country ‘France’? 
-- SELECT * FROM sakila.city WHERE country_id = ( 
-- SELECT country_id FROM sakila.country WHERE country = 'France' );


-- 16) Películas que no tengan un rating de NC-17
SELECT * FROM sakila.film WHERE rating NOT IN ('NC-17');


-- 17) Películas con un rating PG y duración de más de 120.
SELECT * FROM sakila.film WHERE rating LIKE 'PG' AND length > 120 ;


-- 18) ¿Cuantos actores hay?
SELECT COUNT(actor_id) AS 'Cantidad de Actores' FROM sakila.actor;


-- 19) Película con mayor duración.



-- 20) ¿Cuantos clientes viven en Indonesia?
SELECT * FROM sakila.customer WHERE address_id = 
(SELECT address_id FROM sakila.address WHERE city_id = 
(SELECT city_id FROM sakila.city WHERE country_id = 
(SELECT country_id FROM sakila.country WHERE country = 'Indonesia'
)));

