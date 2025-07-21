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

SELECT * FROM products
WHERE EXTRACT(year from released_data) ='2023'

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

CREATE TABLE products_bkp
AS
SELECT * FROM products
SELECT * FROM products_bkp

CREATE TABLE products_bkp2
AS
SELECT * FROM products;
WHERE 1 = 2;

-- Drop Table is use for delect the table does not exist
DROP TABLE products

DROP TABLE IF EXISTS products
SELECT * FROM products;

-- Modify Command:---
SELECT * FROM products;
SELECT * FROM products_bkp;
SELECT * FROM products_bkp2;

-- i want to rename the backup table to products table:----using alter
ALTER TABLE products_bkp RENAME TO products
-- Now check the products table
SELECT * FROM products; -- Now it work proparly

-- Now We rename the product_code to ID:--
ALTER TABLE products RENAME COLUMN product_code TO product_id
SELECT * FROM products; --- it convert code to id

-- change the product_id datatype into float:--->
ALTER TABLE products ALTER COLUMN product_id type float;
SELECT * FROM products;


--- Constraints Command in sql:---> means it kinds of that you add some Restiction to sum of columns table

-- Let's Create Table 
DROP TABLE IF EXISTS products;
CREATE TABLE products
(
      product_code  int PRIMARY KEY,
	  product_name  varchar(50),
	  price         float,
	  released_date  date
	  
);

-- Now Check the All Table from product:--->

SELECT * FROM products;

-- Now AGAIN CHANGE AND  Fill The Value Record into the Product Table:--->
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (2,'IPHONE 15', 999.5,TO_DATE('22-08-2023', 'DD-MM-YYYY'));
INSERT INTO products (product_code, product_name, price, released_date)
values(3,'iPhone 16', 900, to_date('12-08-2023','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_date)
values(4,'Macbook Pro', 2200, to_date('12-10-2022','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_date)
values(5,'Apple Watch 9', 590, to_date('04-09-2022','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_date)
values(7,'iPad', 1480, to_date('25-08-2020','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_date)
values(6,'AirPods', 1420, to_date('30-03-2024','dd-mm-yyyy'));

SELECT * FROM products;

DROP TABLE IF EXISTS products;
CREATE TABLE products
(
      product_code  int,
	  product_name  varchar(50),
	  price         float,
	  released_date  date,
	  CONSTRAINT pk_prod PRIMARY KEY (product_code, product_name)
	  
	  
);
SELECT * FROM products;

-- Now AGAIN CHANGE AND  Fill The Value Record into the Product Table:--->
INSERT INTO products (product_code, product_name, price, released_date)
VALUES (2,'IPHONE 15', 999.5,TO_DATE('22-08-2023', 'DD-MM-YYYY'));
INSERT INTO products (product_code, product_name, price, released_date)
values(3,'iPhone 16', 900, to_date('12-08-2023','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_date)
values(4,'Macbook Pro', 2200, to_date('12-10-2022','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_date)
values(5,'Apple Watch 9', 590, to_date('04-09-2022','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_date)
values(7,'iPad', 1480, to_date('25-08-2020','dd-mm-yyyy'));
INSERT INTO products (product_code, product_name, price, released_date)
values(6,'AirPods', 1420, to_date('30-03-2024','dd-mm-yyyy'));

SELECT  * FROM products

SELECT  * FROM sales_orders;

--- Now I want to create Sales order table:--->
DROP TABLE IF EXISTS sales_orders;
CREATE TABLE sales_orders
(
      order_id   int generated always as identity primary key,
	  order_date date,
	  quantity   int,
	  prod_id    int,
	  status     varchar(30)
);    

-- Now AGAIN CHANGE AND  Fill The Value Record into the Product Table:--->
INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
VALUES(default,to_date('01-01-2024','dd-mm-yyyy'),2,1,'Completed');

INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
values(default,to_date('01-01-2024','dd-mm-yyyy'),2,1,'Completed');
INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
values(default,to_date('01-01-2024','dd-mm-yyyy'),3,1,'Completed');
INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
values(default,to_date('02-01-2024','dd-mm-yyyy'),3,2, 'Rejected');
INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
values(default,to_date('03-01-2024','dd-mm-yyyy'),3,3, 'Cancelled');
INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
values(default,to_date('04-01-2024','dd-mm-yyyy'),1,1,'Completed');

INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
values(default,to_date('04-01-2024','dd-mm-yyyy'),1,2,'On Hold');
INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
values(default,to_date('05-02-2024','dd-mm-yyyy'),4,2,'Rejected');
INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
values(default,to_date('06-04-2024','dd-mm-yyyy'),5,5,'Completed');
INSERT INTO sales_orders(order_id, order_date, quantity, prod_id, status)
values(default,to_date('06-09-2024','dd-mm-yyyy'),1,1,'Cancelled')
 
-- check the total table value 
SELECT * FROM sales_orders 
SELECT * FROM products


	constraint fk_so_emp foreign key (emp_id) references employees(id)
);
