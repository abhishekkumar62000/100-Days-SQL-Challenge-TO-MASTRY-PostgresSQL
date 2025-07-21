CREATE TABLE person (id INT, name VARCHAR(100), city
 VARCHAR(50))


CREATE TABLE person (
id    INT,
name  VARCHAR(100),
city  VARCHAR(100)
);

select * from person

INSERT INTO person(id, name, city)
VALUES
(102, 'Abhi', 'Mumbai'),
(103, 'Paul', 'Chennai'),

INSERT INTO person(id, name, city)
VALUES
(104, 'Shayam', 'Madhubani'),
(105, 'Pappu', 'goa'),
(106, 'Shashi', 'Delhi'),
(107, 'Piyush', 'Kolkata'),
(108, 'Sita', 'Darbhanga'),
(109, 'Abhishek', 'patna')

select name from person;

update person
set city = 'USA'
where name = 'Abhishek';


select * from person


DELETE FROM person
WHERE name='Raju'

CREATE TABLE employees(
emp_id  SERIAL PRIMARY KEY,
fname   VARCHAR(50) NOT NULL,
lname   VARCHAR(50) NOT NULL,
email   VARCHAR(100) NOT NULL UNIQUE,
dept    VARCHAR(50),
salary  DECIMAL(10,2) DEFAULT 30000.00,
hire_Date DATE NOT NULL DEFAULT CURRENT_DATE
)

SELECT * FROM employees


select * from person


ALTER TABLE person
ADD COLUMN age INT;

ALTER TABLE person
drop COLUMN age;