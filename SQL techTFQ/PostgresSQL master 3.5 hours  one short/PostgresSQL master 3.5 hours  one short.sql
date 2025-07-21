CREATE TABLE employees(
emp_id  SERIAL PRIMARY KEY,
fname   VARCHAR(50) NOT NULL,
lname   VARCHAR(50) NOT NULL,
email   VARCHAR(100) NOT NULL UNIQUE,
dept    VARCHAR(50),
salary  DECIMAL(10,2) DEFAULT 30000.00,
hire_Date DATE NOT NULL DEFAULT CURRENT_DATE
)

SELECT * FROM employees;

INSERT INTO employees (emp_id, fname, lname, email, dept, salary, hire_date) 
VALUES
 (1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),
 (2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),
 (3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),
 (4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),
 (5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),
 (6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),
 (7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),
 (8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),
 (9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),
 (10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19')


-- we have Understand all basic (Clauses)
 Where
 Distinct
 Order By
 Limit
 Like



-- Find employees whose salary is more than 50000

SELECT * FROM employees
where salary >= '50000';

-- Find employees From following department
-- IT
-- Finance
-- HR

SELECT * FROM employees 
WHERE dept = 'IT'
 OR dept = 'HR'
 OR dept = 'Finance';

select * from employees
where dept = 'IT'
OR dept = 'Marketing'

select * from employees
where dept = 'IT'
OR dept = 'Finance'


--BETWEEN clouses
-- Find employees whose salary is more than
--40000 and Less than 65000
-- >40000
-- <65000

SELECT * FROM employees 
WHERE 
salary >=40000 AND salary <=65000;

-- Use of between clous

SELECT * FROM employees 
WHERE 
salary BETWEEN 40000 AND 65000;


-- DISTINCT cloues
SELECT DISTINCT fname FROM employees;

-- ORDER BY
SELECT * FROM employees ORDER BY fname;

--LIMIT cloues
SELECT * FROM employees LIMIT 3;


-- LIKE cloues
Select * FROM employees
         WHERE dept LIKE '%Fin%';

select * from employees
         where dept LIKE 'I%';

-- Important point 
-- Starts with 'A': LIKE 'A%'
-- Ends with 'A': LIKE '%A'
-- Contains 'A': LIKE '%A%'
-- Second character is 'A': LIKE '_A%'
-- Case-insensitive contains 'john': ILIKE '%john%


-- Section - 5
Q1. How to find total no. of employees?
Q2. Employee with Max salary
Q3. Average salary of employees

Using:--

COUNT
SUM
AVG
MIN
MAX

-- COUNT use:-
 SELECT COUNT(*) FROM employees;

-- MAX & MIN use:-- 
 SELECT MAX(age) FROM employees;
 SELECT MIN(age) FROM employees;

 select * from employees

 SELECT emp_id, fname, salary FROM employees
 WHERE 
salary = (SELECT MAX(salary) FROM employees);


-- Use of SUM & AVG
 SELECT SUM(salary) FROM employees;
 SELECT AVG(salary) FROM employees;


-- Use of GROUP BY
-- we check No. of employees in each department:--

SELECT dept FROM employees GROUP BY dept;
 SELECT dept, COUNT(fname) FROM employees GROUP
 BY dept;

-- Section - 6 :- String Functions Using

 CONCAT, CONCAT_WS
 SUBSTR
 LEFT, RIGHT
 LENGTH
 UPPER, LOWER
 TRIM, LTRIM, RTRIM
 REPLACE
 POSITION


-- CONCAT use:-
 CONCAT(first_col, sec_col) 
CONCAT(first_word, sec_word, ...)

select CONCAT('Abhi', 'Yadav')

SELECT fname, lname FROM employees  -- now we have add both using CONCAT function
select CONCAT(fname, lname) as Fullname from employees

SELECT * FROM employees


-- CONCAT_WS  -- With seperator :. -, _, + etc
Select CONCAT_WS('-', fname, lname) from employees

select CONCAT_WS(':', fname, lname) from employees

select emp_id, CONCAT_WS(' ', fname, lname,  salary) AS Fullname, dept from employees;



-- SUBSTRING usecase:- 
 SELECT SUBSTRING('Hey Buddy', 1, 4);

 SELECT SUBSTRING('Hey Buddy', 4, 9); 
SELECT SUBSTRING('Hey Buddy', 1, 9);   -- WORD COUNT


-- REPLACE USECASE:-
REPLACE(str, from_str, to_str)

SELECT REPLACE('Hey Buddy', 'Hey', 'Hello')
SELECT REPLACE(dept, 'IT', 'TECH') from employees

SELECT REPLACE('Hey ABHISHEK YADAV','Hey', 'Nice too MEET YOU') --replace hey into 'NICE TO MEET YOU'



-- REVERSE usecase
 SELECT REVERSE('Hello World'); -- ulta typing

-- LENGTH usecase
 Select LENGTH('Hello World');


-- UPPER & LOWER
 SELECT UPPER('Hello World'); ----> only in Capital letter me 
 SELECT LOWER('Hello World'); ----> only in small letter me



 -- Other Functions
SELECT LEFT('Abcdefghij', 3); 
SELECT RIGHT('Abcdefghij', 4); 
SELECT TRIM('  Alright!  '); 
SELECT POSITION('om' in 'Thomas');


--- Exercise usecase practise
Task 1:  1:Raj:Sharma:IT

select emp_id, CONCAT_WS(' ', fname, lname,  salary) AS Fullname, dept from employees;

SELECT CONCAT_WS(':', emp_id, fname, lname, dept) from employees
 
 
 Task2:
 1:Raju Sharma:IT:50000

 SELECT CONCAT_WS(':', emp_id, fname, lname, dept, SALARY) from employees
 
Task3
 4:Suman:FINANCE

SELECT CONCAT_WS(':', emp_id, fname, dept) from employees
 


           --- Exercise DISTINCT, ORDER BY, LIKE and LIMIT:---
		   

-- Q1.  Find Different type of departments in database?

SELECT dept from employees

-- Q2.  Display records with High-low salary ?

SELECT salary FROM employees ORDER BY salary DESC

-- Q3. How to see only top 3 records from a table?

SELECT * from employees LIMIT 3


-- Q4. Show records where first name start with letter 'A' ?

select * from employees
where fname Like 'A%'


-- Q5. Show records where length of the lname is 4 characters ?

select lname from employees
where L




      --- Exercise using COUNT, GROUP BY, MIN, MAX and SUM and AVG---


-- Q1.  Find Total no. of employees and with names and salary in database?
SELECT COUNT(*) FROM employees;

SELECT emp_id, fname, salary FROM employees
 WHERE 
salary = (SELECT MAX(salary) FROM employees);


-- Q2: Find no. of employees in each department?
select emp_id, dept from employees


 
Q3: Find lowest salary paying


 
Q4: Find highest salary paying?

select * from employees
where
salary=(select max(salary) from employees)

--
select * from employees
ORDER BY salary desc limit 1

 
Q5: Find total salary paying in Loan department ?

Select SUM(salary) from employees where dept='HR'

 
Q6: Average salary paying in each department

--->



-- Section - 7  ALTERING Tables means:- How to add or remove a column?
ALTER TABLE employees
ADD COLUMN age INT;   ----> Add columns age

select * from employees

ALTER TABLE employees
drop COLUMN age;    ----> delete columns age

ALTER TABLE employees
RENAME COLUMN fname TO name;  ----> rename column

ALTER TABLE employees
RENAME COLUMN name TO fname;




--- CHECK CONSTRAINT usecase
-- We want to make sure phone no. is atleast 10 digits...

ALTER TABLE employees
ADD COLUMN mob varchar(20) check (LENGTH(mob) >= 10);

INSERT INTO employees(mob)
values (6200);

ALTER TABLE employees
drop constraint employees_mob_check;


select * from employees


                   
				  --- CASE Study:-

				  
-- Q1. display the name and salary with show high low salary ?

SELECT fname, salary,
CASE
     WHEN salary >= 50000 then 'High'
	 ELSE 'Low'
END AS sal_cat
FROM employees

-- Q2. display the name and salary with show high low salary show 10 % bonus ?

SELECT fname, salary,
CASE
        WHEN salary > 0 then salary*0.10

END AS Bonus
       FROM employees




SELECT
CASE
     WHEN salary > 50000 THEN 'High'
	 WHEN salary BETWEEN 40000 AND 49999 THEN  'Mid'
	 ELSE 'LOW'
	 
END AS Bonus
    COUNT(emp_id) from employees

	GROUP BY 
	     CASE
         WHEN salary > 50000 THEN 'High'
		 WHEN salary BETWEEN 40000 AND 49999 THEN 'Mid'
		 ELSE 'Low'
END;



--- IS NULL usecase:--
 SELECT * FROM employees 
WHERE fname IS NULL;


--- IS not like
 SELECT * FROM employees 
WHERE fname NOT LIKE 'A%';


