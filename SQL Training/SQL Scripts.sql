use hsbc;
select * from employee;

-- Operators
select * from employee 
where age=27 AND salary=335000;

select * from employee 
where name='Akshay' OR age>30;

select * from employee
where age between 30 and 40;

select * from employee
where name in ('Akshay', 'Rahul');

 select * from employee
 limit 2;
 
 -- Aggregate Finctions
 
 select * from employee
 order by salary ASC;
 
select * from employee
 order by age DESC;
 
 select count(*) from employee;
 
 select sum(salary) from employee;
 
insert into employee
values(6, 'Ritik', 33, 650000);

select name, count(age) from employee
group by name;

use hsbc;

create table dept(
emp_id int primary key,
department varchar(50)
);

insert into dept
(emp_id, department)
values
(7, 'Analytics'),
(8, 'IT Support'),
(9, 'Security');

select * from dept;

-- Inner Join

select * 
from employee as e
inner join dept as d
on e.id = d.emp_id;

 -- Left Join
 
select * 
from employee as e
left join dept as d 
on e.id = d.emp_id;
 
 -- Right Join
 
select * 
from employee as e
right join dept as d 
on e.id = d.emp_id;

-- Full join
 
select * 
from employee as e
left join dept as d 
on e.id = d.emp_id
union
select * 
from employee as e
right join dept as d 
on e.id = d.emp_id;

-- Left Exclusive Join

select * 
from employee as e
left join dept as d 
on e.id = d.emp_id
where d.emp_id is null;

-- Right Exclusive join

select * 
from employee as e
right join dept as d 
on e.id = d.emp_id
where e.id is null;

use hsbc;

create table student
(id int Primary key,
name varchar(50) not null,
frnd_id int
);

insert into student(id, name, frnd_id)
values
(1, 'Janhavi', 3),
(2, 'Viraj', 1),
(3, 'Arnav',2);

use hsbc;
select * from student;

-- Self Join

select b.name, a.name as Friend_name
from student as a
join student as b 
on a.id = b.frnd_id;

select * from employee;

-- Case Statement
select id, name,
case
	when age>=30 then 'Eligible for voting!'
	when age<30 then 'Not eligible for voting!'
    else 'Wrong Entry!'
End as Voting_Status
from employee;

-- If Else

select *,
if (age between 20 AND 30, 'Eligible for voting', 'Can not vote')
as status_
from employee;

select * from student;

Alter table student
Add column marks int;

Update student
set marks=100
where id=3;

insert into student(id, name, frnd_id, marks)
values
(4, 'Rohit', 1, 69),
(5, 'Sylvi', 3, 96),
(6, 'Ritik', 4, 55);

-- Sub-Query
select * from student;
select name, marks
from student
where marks> (select avg(marks)from student);

with cte as
(select avg(marks) as avg_marks from student)
select name, marks
from student, cte
where marks>avg_marks; 

select id, name
from student
where id%2=0;

-- Find students who have scored higher marks than their 
-- friends.

select a.name, a.marks, s.name as student_name, s.marks
from student as s 
inner join student as a
on s.id = a.frnd_id
where s.marks>a.marks;

-- List students who have no friends

select a.name as students_with_no_friends
from student as a
left join student as b
on a.id = b.frnd_id
where b.id is null;

-- Retrieve the names of students who have scored more 
-- marks than the average marks obtained by all students.

select name, marks
from student
where marks>(select avg(marks) from student); 

-- Find the students who have friends with names 
-- starting with the letter 'A'

select s.name as student_name
from student s
where s.frnd_id in (
	select id
    from student
    where name like 'A%');
    
-- Retrieve the names of students who have friends with 
-- a higher average score than themselves

SELECT s.name AS student_name
FROM student s
WHERE EXISTS (
    SELECT 1
    FROM student f
    WHERE s.frnd_id = f.id
    GROUP BY f.id
    HAVING AVG(f.marks) > s.marks
);
select * from employee;
-- Common Table Expression (CTE)

create table stores(
	store_id int primary key,
    store_name varchar(100) not null,
    product varchar(100), 
    quantity int,
    cost int
);

select * from stores;

insert into stores(store_id, store_name, product, quantity, cost)
values
(1, 'Apple Store', 'Iphone 13', 1, 79000),
(2, 'Samsung Store', 'Samsung S24 Ultra', 3, 110000),
(3, 'Oneplus Store', 'Oneplus 11 Pro', 2, 45000),
(4, 'Vivo Store', 'Vivo V23', 4, 28000);

-- Find stores whose sales where better than the average 
-- sales across all stores

select *
from stores 
where cost > (select avg(cost) as average_sales
from stores);

-- Union

select name from employee
Union
select name from employee;

-- Union All

select name from employee
Union All
select name from student;

-- Except

select name from employee
Except
select name from student;

-- Intersect

select name from employee
Intersect
select name from student;
