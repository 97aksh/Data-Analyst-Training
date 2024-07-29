use employees;

-- Order of execution in SQL
-- From/join-> where-> group by-> having-> select-> order by&limit/offset

-- Select employee_no, birth_date, avg_salary, dept_name, title from employees

select e.emp_no, e.birth_date, avg(s.salary)as avg_salary, d.dept_name, t.title
from employees e

inner join salaries s
on e.emp_no = s.emp_no

inner join dept_emp de
on e.emp_no = de.emp_no

inner join departments d
on de.dept_no = d.dept_no

inner join titles t
on e.emp_no = t.emp_no
group by e.emp_no, e.birth_date, d.dept_name, t.title;

with 
cte1 as
(select emp_no, birth_date from employees),
cte2 as
(select emp_no, round(avg(salary),2) as avg_salary from salaries group by emp_no),
cte3 as
(select dm.emp_no, d.dept_name from dept_manager dm join departments d on dm.dept_no=d.dept_no
	union
    select de.emp_no, d.dept_name from dept_emp de join departments d on de.dept_no=d.dept_no),
cte4 as
(select emp_no, title from titles)
select cte1.*, cte2.avg_salary, cte3.dept_name, cte4.title 
from cte1 
join cte2 on cte1.emp_no=cte2.emp_no
join cte3 on cte1.emp_no=cte3.emp_no
join cte4 on cte1.emp_no=cte4.emp_no;

-- List all employees along with their department names.
-- This query would involve joining the employees table with the dept_emp and departments tables.

select e.*, s.dept_name
from employees e
inner join dept_emp d
on e.emp_no=d.emp_no
inner join departments s
on d.dept_no=s.dept_no;

-- Find the current managers of each department with their employee details.
-- This query requires joining the employees, dept_manager, and departments tables to get the current managers along with their 
-- employee details.

WITH CurrentManagers AS (
    SELECT
        dm.emp_no AS manager_emp_no,
        dm.dept_no,
        e.first_name AS manager_first_name,
        e.last_name AS manager_last_name,
        d.dept_name
    FROM
        dept_manager dm
    JOIN
        employees e ON dm.emp_no = e.emp_no
    JOIN
        departments d ON dm.dept_no = d.dept_no
)
SELECT
    cm.manager_emp_no,
    cm.manager_first_name,
    cm.manager_last_name,
    cm.dept_name AS department_name,
    e.emp_no,
    e.first_name,
    e.last_name
FROM
    CurrentManagers cm
JOIN
    dept_emp de ON cm.dept_no = de.dept_no
JOIN
    employees e ON de.emp_no = e.emp_no;

-- List all departments and the number of employees in each department.


-- Find the average salary of employees in each department.
-- List all employees who have held a managerial position (manager title) along with the department they managed.
-- Show the current department of each employee along with their job title.
-- Find the highest-paid employee in each department.
-- List the names of all employees who have never changed departments.
-- Show the average salary of employees who have 'Engineer' in their job title.
-- List all employees who have held multiple titles within the company.
-- Find the department with the highest number of employees.
-- List all employees who have worked in the company for more than 10 years, along with their current job titles and departments.

use practice;

-- write a query to get average profits for each company (profit =revenue-cost)
-- output: company_name | average_profit

select c.company_name, avg(r.revenue-r.cost) as average_profit
from company c
inner join revenue r
on c.company_id = r.company_id
group by c.company_name;

use hsbc;
select * from employees;

-- Query to find all the employees whose salary is between 45000 and 50000

select * 
from employees
where salary between 45000 and 50000;

-- Write O/P with 3 more columns as Rank(), Dense_Rank() and Row_Number()

select emp_no, salary,
row_number() over (partition by emp_no ) as row_no,
rank() over (partition by emp_no ) as rank_no,
dense_rank() over (partition by emp_no) as dense_rank_no
from employees;

create table customer
(
cust_id int, 
cust_name varchar(50),
salary int
);

INSERT INTO customer (cust_id, cust_name, salary)
VALUES
    (1, 'John', 50000),
    (2, 'Alice', 60000),
    (3, 'Bob', 50000),
    (4, 'Sarah', 55000),
    (5, 'Emma', 60000),
    (6, 'Michael', 55000),
    (7, 'Sophia', 50000),
    (8, 'William', 60000),
    (9, 'Olivia', 55000),
    (10, 'James', 50000);
    
-- row_number(), rank, dense_rank()

select *, 
row_number() over (partition by salary order by salary) as row_num,
rank() over (order by salary) as rank_num,
dense_rank() over (order by salary) as dense_rank_num
from customer;

-- DDL

Use practice;

create table A (
A_Id int primary key,
A_Name varchar(20)
);

insert into A(A_Id, A_Name)
values
(1, 'Akshay'),
(2, 'Viraj');

alter table A
add column (A_Age int);

alter table A
add(A_Salary int, A_Dept varchar(100));

update A set A_Age = 27, A_Salary = 32000, A_Dept = 'Development' where A_Id = 1;
update A set A_Age = 23, A_Salary = 2100, A_Dept = 'Testing' where A_Id = 2;
update A set A_Salary = null where A_Id = 2;

delete from A where A_Id = 2;

alter table A drop column A_Dept;

truncate table A;

drop table A;

select * from A;

create table A(
id int
);

insert into A(id)
values
(1),
(1),
(1),
(null);

create table B(
id int
);

insert into B(id)
values
(1),
(1),
(2),
(null);

truncate table B;

select *
from A 
right join B
on A.id = B.id;

use practice;

create table employees (
emp_id int primary key, 
emp_name varchar(50), 
manager_id int);

Insert into employees (emp_id, emp_name, manager_id)
values
(1, 'Akshay', 2),
(2, 'Rohit', 4),
(3, 'Virat', 1),
(4, 'Sachin', 1);

select * from employees;

-- Find the manager of each employee
select e.*, p.emp_name as manager_name
from employees e
left join employees p
on p.emp_id = e.manager_id
order by e.emp_id;

alter table employees
add(salary int);

update employees set salary = 2000 where emp_id = 1;
update employees set salary = 3000 where emp_id = 2;
update employees set salary = 1000 where emp_id = 3;
update employees set salary = 22000 where emp_id = 4;

-- Find the highest and lowest salaried employee

select *
from employees
where salary = (select max(salary) from employees)
union all
select *
from employees
where salary = (select min(salary) from employees);

use hsbc;

create table country
(c_id int primary key,
c_name varchar(50));

insert into country(c_id, c_name)
values
(1,'India'),
(2,'Pakistan'),
(3,'SriLanka'),
(4,'Africa'),
(5, 'Australia');

select * from country;

-- Write query to get O/P (All combinations)
-- India - Pakistan
-- India - SriLanka
-- India - Africa
-- India - Australia
-- Pakistan - SriLanka
-- Pakistan - Africa
-- Pakistan - Australia
-- SriLanka - Africa
-- SriLanka - Australia
-- Africa - Australia 

select c1.c_name as Team1, c2.c_name as Team2
from country c1
join country c2
on c1.c_id < c2.c_id
order by Team1, Team2;

use hsbc;

create table emails(email varchar(50));

insert into emails(email)
values
('akshay@g.com'),
('rahul@c.com'),
('akshay@g.com');

select * from emails;

-- Write an SQL query to report all the duplicate emails

select email from
(select email, count(email) as email_count
from emails
group by email) as subquery
where email_count>1;

select email
from emails
group by email
having count(email) > 1;









