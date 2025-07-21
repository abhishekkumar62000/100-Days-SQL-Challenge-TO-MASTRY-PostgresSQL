-- Let's Create Table 
CREATE TABLE products
(
      product_code  int,
	  product_name  varchar(50),
	  price         float,
	  released_date  date
	  
);

-- Now Check the All Table from product:--->
SELECT * FROM products;

-- Now Fill The Value Record into the Product Table:--->
INSERT INTO products (product_code, product_name, price, released_data)
VALUES (1,'IPHONE 15', 999.5,TO_DATE('22-08-2023', 'DD-MM-YYYY'));
INSERT INTO products (product_code, product_name, price, released_data)
values(default,'iPhone 15', 800, to_date('22-08-2023','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_data)
values(default,'Macbook Pro', 2100, to_date('12-10-2022','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_data)
values(default,'Apple Watch 9', 550, to_date('04-09-2022','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_data)
values(default,'iPad', 400, to_date('25-08-2020','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_data)
values(default,'AirPods', 420, to_date('30-03-2024','dd-mm-yyyy'));


-- Now Check the All Table from product:--->
SELECT * FROM products
WHERE price>1000;

SELECT product_name FROM products
WHERE price>1000;

SELECT product_code FROM products

SELECT * FROM products
WHERE to_char (released_data,'yyyy') = '2023'

select * from products
where to_char (released_date, 'dd-mm-yyyy') = '22-08-2023'

--similar command for show date ---

select * from products
where extract(year from released_Date) = '2025'

SELECT * FROM products
WHERE EXTRACT(month from released_Date)= '08'


SELECT * FROM products
WHERE EXTRACT(year from released_data) ='2023'

SELECT product_name as product from products   -- as product is aliass
WHERE price > 800;

SELECT product_name as product FROM products
WHERE price > 1000;

SELECT * FROM products

SELECT COUNT (*) FROM products
WHERE price > 1000;

SELECT sum (price) FROM products
SELECT AVG (price) FROM Products


-- Update change value:--->
update products
set price = 1000
where product_name = 'iPad';

SELECT * FROM products

update products
set price = 1200
,   released_data = to_date('2023-08-30', 'yyyy-mm-dd')
where product_name = 'Macbook Pro';
 
update products
set price = 999
WHERE product_code = 1

update products
set price = 2000
WHERE product_name = 'iPhone 15'

SELECT * FROM products

update products
set product_code = 2
WHERE product_name = 'iPhone 15'

update products
set product_code = 3
WHERE product_name = 'Apple Watch 9'

update products
set product_code = 4
WHERE product_name = 'iPad'

-- like function
update products
set price = 2000
WHERE product_name like 'iPhone 15'

update products
set price = 999.5
WHERE product_name like '%15%'

-- Delect Function:--->

DELETE FROM products
WHERE product_name LIKE '%iPhone%';

SELECT * FROM products

-- TRUNCATE COMMAND:---> DELECT ALL VALUE IN ONE WAY
TRUNCATE TABLE products;