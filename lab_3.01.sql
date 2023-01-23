USE sakila;
-- 1. Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

-- 2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
-- Update the database accordingly.
SELECT * FROM staff;
SELECT * FROM customer
WHERE first_name = 'TAMMY';

INSERT INTO staff
VALUES
(3,'TAMMY','SANDERS',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy',NULL,'2006-02-15 04:57:20');


/*
3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
You can use current date for the rental_date column in the rental table. 
Hint: Check the columns in the table rental and see what information you would need to add there. 
You can query those pieces of information. 
For eg., you would notice that you need customer_id information as well. 
To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
Use similar method to get inventory_id, film_id, and staff_id.
*/
SELECT * FROM rental;
SELECT * FROM film
WHERE title = "Academy Dinosaur";
-- to get customer_id
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- to get staff_id
select staff_id from staff
where first_name ='Mike' and last_name ='Hillyer';
-- to get inventory_id 
-- （the result shows 1,2,3,4 inventory_id.Don't know how it can be more precise. I chose inventory_id=1 finally.)
select i.inventory_id, i.film_id, i.store_id,f.title
from inventory as i
join film as f
on i.film_id = f.film_id
where f.title = "Academy Dinosaur" and f.film_id =1 and i.store_id =1;
-- to add rental
INSERT INTO rental (rental_id, rental_date,inventory_id,customer_id,return_date,staff_id,last_update)
VALUES
(16050,current_timestamp(),1, 130,NULL,1,'2006-02-15 05:03:42');
