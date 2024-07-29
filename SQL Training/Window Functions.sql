-- WINDOW FUNCTIONS
Use employees;
select * from salaries;

select emp_no, sum(salary)
over(partition by emp_no) as total_salary
from salaries;

-- Find the salary department wise with emp_no

select emp_no, first_name, department, sum(salary) 
over(partition by department order by salary desc) as total_salary
from employees;

-- Row_Number()

select emp_no, salary, row_number() 
over(partition by emp_no order by salary desc) row_num
from salaries;

with cte as
(select emp_no, salary, row_number() 
over(partition by emp_no order by salary desc) row_num
from salaries)
select emp_no, salary, row_num
from cte
where row_num=3;


-- Rank

select emp_no, salary, rank() 
over(order by emp_no) rank_num
from salaries;

-- dense rank()

select emp_no, salary, dense_rank() 
over(order by emp_no) dense_num
from salaries;

-- Find the third largest salary from the database

select * from
(select emp_no, salary, row_number() 
over(partition by emp_no 
order by salary desc) as row_num
from salaries) a
where row_num=3;

with cte as
(select emp_no, salary, row_number() 
over(partition by emp_no 
order by salary desc) as row_num
from salaries)
select * from cte
where row_num=3;

-- running/rolling

-- lead & lag

select emp_no, salary, to_date as curr_date,
lead(to_date) over(partition by emp_no order by to_date) as next_date,
lag(to_date) over(partition by emp_no order by to_date) as prev_date
from salaries;

-- row_number(), rank, dense_rank()
use hsbc;
select * from customer;

select *, 
row_number() over (order by salary) as row_num,
rank() over (order by salary) as rank_num,
dense_rank() over (order by salary) as dense_rank_num
from customer;

use practice;

CREATE TABLE Sales (
    Transaction_ID INT PRIMARY KEY,
    Product_ID INT,
    Sale_Date DATE,
    Sale_Amount DECIMAL(10, 2)
);

INSERT INTO Sales (Transaction_ID, Product_ID, Sale_Date, Sale_Amount)
VALUES
    (1, 101, '2024-01-01', 100),
    (2, 102, '2024-01-02', 150),
    (3, 101, '2024-01-02', 120),
    (4, 103, '2024-01-03', 200),
    (5, 101, '2024-01-04', 110),
    (6, 102, '2024-01-05', 180);
    
    select * from Sales;
    
    select s.*, max(Sale_Amount) over(partition by Product_Id) as Max_Salary
    from Sales s;
    
    select s.*, row_number() over(partition by Product_Id) as rn
    from Sales s;
    
-- Calculating Running Total Sales:
-- Calculate the running total of sales amount for each product.
SELECT
    Transaction_ID,
    Product_ID,
    Sale_Date,
    Sale_Amount,
    SUM(Sale_Amount) OVER (PARTITION BY Product_ID ORDER BY Sale_Date) AS Running_Total
FROM
    Sales;

-- Calculating Daily Total Sales:
-- Calculate the total sales amount for each day.
select Sale_Date, sum(Sale_Amount) over(partition by Sale_Date order by Sale_Date) as Total_Sale
from Sales;

-- Calculating Average Sales Amount:
-- Calculate the average sales amount for each product.
select Product_Id, avg(Sale_Amount) over (partition by Product_Id) as Avg_Sale
from Sales;

use hsbc;
select * from employee;

-- For each employee, retrieve the previous employee's salary within the same department.

select firstName, lastName, salary, lag(salary)over(order by EmployeeID) as prevoius_emp_salary
from employee;

-- For each employee, retrieve the joining date of the previous employee (sorted by joining_date).

select first_name, last_name, joining_date, lag(joining_date)over(order by joining_date) as prev_emp_joining_date
from employees;

-- For each employee, retrieve the emp_no of the previous employee within the same gender group.

select first_name, last_name, gender ,emp_no, lag(emp_no)over(partition by gender order by emp_no) as prev_emp_no
from employees;

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    score INT
);

INSERT INTO student (id, name, score) VALUES
(1, 'Alice', 85),
(2, 'Bob', 85),
(3, 'Charlie', 87),
(4, 'David', 91),
(5, 'Eve', 91);

use hsbc;
select * from student;

select *, 
row_number() over (order by score desc) as row_num,
rank() over (order by score desc) as rank_num,
dense_rank() over (order by score desc) as dense_rank_num
from student;

use hsbc;

CREATE TABLE CarReadings (
    car_id VARCHAR(10),
    reading_date DATE,
    meter_reading INT
);

INSERT INTO CarReadings (car_id, reading_date, meter_reading) VALUES
('c1', '2023-01-01', 145),
('c1', '2023-01-02', 270),
('c1', '2023-01-03', 350),
('c2', '2023-01-01', 120),
('c2', '2023-01-02', 230),
('c3', '2023-01-01', 80),
('c3', '2023-01-02', 250);

-- Write a query to get actual distance traveled by cars each day
-- car id	Date	meter_reading
-- c1	01-01-2023	145
-- c1	02-01-2023	270
-- c1	03-01-2023	350
-- c2	01-01-2023	120

-- Output:

-- car id	Date	meter_reading	distance_travelled
-- c1	01-01-2023	145	145
-- c1	02-01-2023	270	125
-- c1	03-01-2023	350	80
-- c2	01-01-2023	120	120
-- c2	02-01-2023	230	110
-- c3	01-01-2023	80	80
-- c3	02-01-2023	250	170

WITH cte AS (
    SELECT
        car_id,
        reading_date,
        meter_reading,
        COALESCE(meter_reading - LAG(meter_reading) OVER (PARTITION BY car_id ORDER BY reading_date), meter_reading) AS distance_travelled
    FROM
        CarReadings
)
SELECT
    car_id,
    reading_date,
    meter_reading,
    distance_travelled
FROM
    cte
ORDER BY
    car_id, reading_date;
























