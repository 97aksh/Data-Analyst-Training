create database hsbc;
use hsbc;
CREATE TABLE employees
(
    emp_no INT NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary INT,
    birth_date DATE NOT NULL,
    gender ENUM ('M','F') NOT NULL,
    joining_date DATE NOT NULL,
    department VARCHAR(20),
    PRIMARY KEY (emp_no)
);

INSERT INTO employees 
(emp_no, first_name, last_name, salary, birth_date, gender, joining_date, department)
VALUES 
(1001, 'James', 'Bond', 45300, '1998-01-19', 'M', '2020-11-29', 'Marketing'),
(1002, 'Robert', 'Lee', 69410, '1998-09-02', 'M', '2019-12-26', 'IT'),
(1003, 'Mary', 'Wood', 39518, '1997-11-07', 'F', '2019-09-12', 'Business Development'),
(1004, 'John', 'Cole', 36264, '1999-02-01', 'M', '2021-04-14', 'HR'),
(1005, 'Jennifer', 'Gill', 48941, '1996-06-05', 'F', '2019-06-28', 'Marketing'),
(1006, 'Michael', 'Watts', 23800, '1999-04-16', 'M', '2022-06-09', 'HR'),
(1007, 'David', 'Mills', 39400, '1998-04-26', 'M', '2021-10-17', 'IT'),
(1008, 'William', 'Hill', 26392, '1999-10-21', 'M', '2019-09-30', 'Business Development'),
(1009, 'Linda', 'Potter', 55231, '1998-01-24', 'F', '2021-08-07', 'Finance'),
(1010, 'Richard', 'Martin', 25600, '1996-08-07', 'M', '2021-03-23', 'IT'),
(1011, 'Susan', 'Hall', 54152, '1999-12-27', 'F', '2020-08-07', 'Finance'),
(1012, 'Joseph', 'Turner', 60556, '1997-05-13', 'M', '2019-09-02', 'Marketing'),
(1013, 'Mary', 'Gill', 58246, '1999-01-21', 'F', '2021-04-30', 'Business Development'),
(1014, 'Thomas', 'Ryan', 23676, '1996-10-12', 'M', '2022-03-02', 'IT'),
(1015, 'Charles', 'Williams', 57226, '2000-01-29', 'M', '2019-11-05', NULL),
(1016, 'Jessica', 'Clark', NULL, '2000-01-25', 'F', '2020-01-24', 'IT'),
(1017, 'Nancy', 'Parker', 66900, '1996-10-24', 'F', '2022-01-09', 'Finance'),
(1018, 'Betty', 'Barker', 35288, '1998-11-13', 'F', '2019-12-26', 'HR'),
(1019, 'Christopher', 'Gibson', 59341, '1998-04-23', 'M', '2019-05-02', 'Marketing'),
(1020, 'Daniel', 'Elliott', 44012, '1999-01-21', 'M', '2023-01-08', 'IT'),
(1021, 'David', 'Mills', NULL, '1998-01-24', 'M', '2019-12-26', 'IT'),
(1022, 'Sarah', 'Harrison', 44692, '1996-03-20', 'F', '2020-05-03', 'Finance'),
(1023, 'Matthew', 'Hill', 41365, '1998-05-16', 'M', '2019-05-23', 'IT'),
(1024, 'Anthony', 'Miller', 56794, '1996-06-30', 'M', '2019-02-28', 'Business Development'),
(1025, 'Mark', 'Wood', 65120, '1998-10-29', 'M', '2020-07-30', 'Business Development'),
(1026, 'Elizabeth', 'Walker', 47030, '1998-08-11', 'F', '2021-06-18', NULL),
(1027, 'Barbara', 'Anderson', NULL, '1999-12-27', 'F', '2021-03-14', 'HR'),
(1028, 'Jessica', 'Clark', 63836, '1998-01-24', 'F', '2021-05-23', 'IT'),
(1029, 'Nancy', 'Cole', 63669, '2000-01-26', 'F', '2019-12-26', 'Finance'),
(1030, 'Joe', 'Brooks', 44000, '1999-08-05', 'M', '2021-03-09', 'Business Development');

select * from employees;

--  Find the total salary expenditure categorized by gender from employee table.

select gender, sum(salary) as salary
from employees
group by gender;

select gender, department, count(*)
from employees
group by gender, department
order by department;

-- Retrieve the average salary for each department as avg_salary from the employee table and display 
-- the results ascending order of the average salary.

select department, avg(salary) as avg_salary
from employees
-- where department is not null
group by department
order by avg_salary; 

-- Find the minimum salary in each department as min_salary whose department is not null from the employee tab

select department, min(salary) as min_salary
from employees
where department is not null
group by department;

-- Find the average salary as average_salary and maximum salary as max_salary for each department from the employee table.

select department, avg(salary) as avg_salary, max(salary) as max_salary
from employees
group by department;

-- Determine the number of employees as total_employees in each department, sorted in descending order of the count from the
-- employee table.

select department, count(*) as total_employees
from employees
group by department
order by total_employees desc;

--  Count of employees hired each month

select Month(joining_date) as month, count(*) as total_employees
from employees
group by month
order by total_employees desc;

-- Who is the oldest and youngest employee in each department?

select department, min(birth_date) as oldest_employees, max(birth_date) as youngest_employee 
from employees
group by department;

-- How many male and female employees were hired in each year?

select year(joining_date) as year, gender, count(*) as total_employees
from employees
group by year, gender
order by year;

