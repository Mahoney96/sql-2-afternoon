-- Practice Join 

-- 1

SELECT *
FROM invoice i
JOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

-- 2

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id;

-- 3

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id;

-- 4

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

--5

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id
WHERE p.name = 'Music';


-- 6

SELECT t.name 
FROM track t
JOIN playlist_track pt ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;

--7 

SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlst_id = p.playlist_id;

--8

SELECT t.name, a.title
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alterantive & Punk';

-- PRACTICING UPDATING ROWS

-- 1

UPDATE customer
SET fax = null
WHERE fax IS NOT null;

-- 2

UPDATE customer
SET company = 'Self'
WHERE company IS null;

--3

UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia ' AND last_name = 'Barnett';

--4

UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

-- 5

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')

AND composer IS null;


-- GROUP BY SECTION --

-- 1

SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name;

--2

SELECT COUNT(*), g.name
FROM track t 
JOIN genre g ON t.genre_id = genre_id
WHERE g.name = 'Pop' or g.name = 'Rock'
GROUP BY g.name;

--3

SELECT DISTINCT company
FROM customer;




--  Delete Rows

-- Practice Table to Use for Delete problems: 

-- practice_delete TABLE
CREATE TABLE practice_delete ( name TEXT, type TEXT, value INTEGER );
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);

SELECT * FROM practice_delete;

-- 1
DELETE 
FROM practice_delete
WHERE type = 'bronze';

-- 2
DELETE 
FROM practice_delete
WHERE type = 'silver';

-- 3
DELETE
FROM practice_delete
WHERE type = 150;


--  e-commerce Problem

-- Need tables for: 
-- USERS, PRODUCTS, ORDERS.
--     -USERS:
--         - Name
--         - email
--     PRODUCTS:
--     - name
--     - price

--     ORDERS:
--     -ref to products

--      

CREATE TABLE users ( name TEXT, email TEXT, user_id INTEGER);

INSERT INTO users ( name, email, user_id) VALUES ('Bob', 'Bob@aol.com', 1);
INSERT INTO users ( name, email, user_id) VALUES ('Joe', 'Joe@aol.com', 2);
INSERT INTO users ( name, email, user_id) VALUES ('Jim', 'Jim@aol.com', 3);

-- 1 
 SELECT * users


CREATE TABLE products ( product_name TEXT, sku INTEGER);

INSERT INTO products ( product_name, sku) VALUES ('mouse', 6785);
INSERT INTO products ( product_name, sku) VALUES ('wireless keyboard', 6854);
INSERT INTO products ( product_name, sku) VALUES ('laptop', 4594);

CREATE TABLE  orders ( ) VALUES ( );