                  (-- Author:--> Abhishek kumar)
				  
--- Case Study Solve the Business Problem:--->
--- Sales Order Dataset - Case Study Problem Statements:

SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q.1 Identify the total no of products sold ?

1st Approach:-
SELECT SUM(quantity) FROM sales_order

-- 2nd Approach:--
SELECT SUM(quantity) AS total_sold_products
FROM sales_order

-- Q.2 Other than Completed, display the available delivery status's ?

SELECT-- Mension all the columns
FROM--   The Table Which has the data
WHERE--  Filter Condition

1st Approach:--

SELECT status
FROM sales_order
WHERE status <> 'Completed';  -- <>,!= that both means not equal to

2nd Approach:--

SELECT status
FROM sales_order
WHERE status not in ('Completed', 'completed');

SELECT DISTINCT status
FROM sales_order
WHERE status not in ('Completed', 'completed');

-- Q.3   Display the order id, order_date and product_name for all the completed orders

select so.order_id, so.order_date, p.name  --SO MEANS Sales_order and p.name from product table
from sales_order so
join products p on p.id=so.prod_id
where lower(so.status) = 'completed';

--- Q.4 Sort the above query to show the earliest orders at the top. Also display the customer who purchased these orders ?

select so.order_id, so.order_date, p.name as product, c.name as customer
from sales_order so
join products p on p.id=so.prod_id
join customers c on c.id = so.customer_id
where lower(so.status) = 'completed'
order by so.order_date 

--- Q.5 Display the total no of orders corresponding to each delivery status ?
SELECT * FROM sales_order;
SELECT status FROM sales_order

select status, count(*) as tot_orders
from sales_order so
group by status;


--- Q.6 For orders purchasing more than 1 item, how many are still not completed?

select count(status) as not_completed_orders
from sales_order so
where quantity > 1
and lower(status) <> 'completed';

--- Q.7  Find the total no of orders corresponding to each delivery status by ignoring ?
---the case in delivery status. Status with highest no of orders should be at the top ?

-- by ignoring the case in delivery status. 
-- Status with highest no of orders should be at the top ? 

1st Approach:--->

select status, count(*) as tot_orders
from (select case when lower(status) = 'completed' 
							       then 'Completed' 
					     else status 
						 end as status
		from sales_order) sq
group by status 
order by tot_orders desc;


2nd Approach:--->

select upper(status) as status, count(*) as tot_orders
from sales_order so
group by upper(status)
order by tot_orders desc;	


--- Q.8) Write a query to identify the total products purchased by each customer ?

SELECT * FROM customers;
SELECT * FROM sales_order;

SELECT c.name as customer, SUM(quantity) AS total_product   -- as means you see that you want to show
FROM sales_order so
JOIN customers c ON c.id = so.customer_id
GROUP BY c.name


--- Q.9) Display the total sales and average sales done for each day ?

1st Approach:--->
SELECT * FROM sales_order;
SELECT * FROM products;

SELECT order_date, SUM(price) AS total_sales, AVG(price) AS avg_sales
FROM sales_order so
JOIN products p ON p.id = so.prod_id
GROUP BY order_date

2nd Approach:--->

select order_date, sum(quantity*price) as total_sales
, avg(quantity*p.price) as avg_sales
from sales_order so
join products p on p.id = so.prod_id
group by order_date
order by order_date;


--- Q.10) Display the customer name, employee name and total sale amount of all orders which are either on hold or pending.
SELECT * FROM sales_order;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

SELECT c.name AS customer, e.name AS employee,  SUM(so.quantity * p.price) AS total_sales
FROM sales_order so
JOIN employees e ON so.emp_id = e.id
JOIN products p ON so.prod_id = p.id
JOIN customers c ON so.customer_id = c.id
WHERE so.status in ('On Hold', 'Pending')
GROUP BY c.name, e.name


--- Q.11) Fetch all the orders which were neither completed/pending 
--or were handled bythe employee Abrar. Display employee name and all details or order ?

select e.name as employee, so.*
from sales_order so
join employees e on e.id = so.emp_id
where lower(e.name) like '%abrar%'
or lower(status) not in ('completed', 'pending');

SELECT * FROM sales_order 
WHERE emp_id = 2


--- Q.12) Fetch the orders which cost more than 2000 but did not include the macbook pro ?
--Print the total sale amount as well ?

select (so.quantity * p.price) as total_sale, so.*
from sales_order so
join products p on p.id = so.prod_id
where prod_id not in (select id from products 
										  where name = 'Macbook Pro')
and (so.quantity * p.price)	> 2000;


--- Q.13) Identify the customers who have not purchased any product yet ?
1st Approach:--->

select * from customers
where id not in (select distinct customer_id 
				 from sales_order);

2nd Approch:--->
				 
select c.*
from customers c
left join sales_order so on so.customer_id = c.id
where so.order_id is null;

3rd Approach:--->

select  c.*
from sales_order so
right join customers c on so.customer_id = c.id
where so.order_id is null;


--- Q.14) Write a query to identify the total products purchased by each 
-- customer. Return all customers irrespective of wether they have 
		-- made a purchase or not. Sort the result with highest no of orders 
		-- at the top ?
		
select c.name , coalesce(sum(quantity), 0) as tot_prod_purchased
from sales_order so
right join customers c on c.id = so.customer_id
group by c.name
order by tot_prod_purchased desc;


-- 15. Corresponding to each employee, display the total sales they 
		-- made of all the completed orders. Display total sales as 0 if 
		-- an employee made no sales yet ?
		
select e.name as employee, coalesce(sum(p.price * so.quantity),0) as total_sale
from sales_order so
join products p on p.id = so.prod_id
right join employees e on e.id = so.emp_id and lower(so.status) = 'completed'
group by e.name
order by total_sale desc;


-- 16. Re-write the above query so as to display the total sales made 
		-- by each employee corresponding to each customer. If an employee 
		-- has not served a customer yet then display "-" under the customer ?

	
select e.name as employee, coalesce(c.name, '-') as customer
, coalesce(sum(p.price * so.quantity),0) as total_sale
from sales_order so
join products p on p.id = so.prod_id
join customers c on c.id = so.customer_id
right join employees e on e.id = so.emp_id
and lower(so.status) = 'completed'
group by e.name, c.name
order by total_sale desc;



-- 17. Re-write above query so as to display only those records where 
		-- the total sales is above 1000 ?
		
select e.name as employee, coalesce(c.name, '-') as customer
, coalesce(sum(p.price * so.quantity),0) as total_sale
from sales_order so
join products p on p.id = so.prod_id
join customers c on c.id = so.customer_id
right join employees e on e.id = so.emp_id
and lower(so.status) = 'completed'
group by e.name, c.name
having sum(p.price * so.quantity) > 1000
order by total_sale desc;


-- 18. Identify employees who have served more than 2 customer ?

select e.name, count(distinct c.name) as total_customers
from sales_order so
join employees e on e.id = so.emp_id
join customers c on c.id = so.customer_id
group by e.name
having count(distinct c.name) > 2;


-- 19. Identify the customers who have purchased more than 5 products
select c.name as customer, sum(quantity) as total_products_purchased
from sales_order so
join customers c on c.id = so.customer_id
group by c.name
having sum(quantity) > 5;


-- 20. Identify customers whose average purchase cost exceeds the 
		-- average sale of all the orders ?

		
select c.name as customer, avg(quantity * p.price)
from sales_order so
join customers c on c.id = so.customer_id
join products p on p.id = so.prod_id
group by c.name
having avg(quantity * p.price) > (select avg(quantity * p.price)
																	from sales_order so
																	join products p on p.id = so.prod_id);