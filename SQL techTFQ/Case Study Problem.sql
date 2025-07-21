--- Case Study Solve the Business Problem:--->
--- Sales Order Dataset - Case Study Problem Statements:

SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q.1 Identify the total no of products sold ?

1st Approach:-
SELECT SUM(quantity) FROM sales_order

2nd Approach:--
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
-- Status with highest no of orders should be at the top.

select status, count(*) as tot_orders
from (select case when lower(status) = 'completed' 
											then 'Completed' else status 
						 end as status
			from sales_order) sq
group by status 
order by tot_orders desc;

select upper(status) as status, count(*) as tot_orders
from sales_order so
group by upper(status)
order by tot_orders desc;	


--- Q.8 Write a query to identify the total products purchased by each customer ?

select c.name as customer, sum(quantity) as total_products
from sales_order so
join customers c on c.id = so.customer_id 
group by c.name;






