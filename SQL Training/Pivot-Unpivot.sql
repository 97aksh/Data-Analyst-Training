use hsbc;
Create Table geeksforgeeks 
( 
CourseName nvarchar(50), 
CourseCategory nvarchar(50),
Price int  
);

Insert into geeksforgeeks(CourseName, CourseCategory, Price)
values
('C', 'PROGRAMMING', 1000),
('JAVA', 'PROGRAMMING', 3000),
('PYTHON', 'INTERVIEWPREPARATION', 5000),
('PLACEMENT 100', 'INTERVIEWPREPARATION', 9000);

select * from geeksforgeeks;

-- Pivot Table

select * from geeksforgeeks;
select distinct CourseName,
case when CourseCategory='PROGRAMMING' then Price end as PROGRAMMING,
case when CourseCategory='INTERVIEWPREPARATION' then Price end as INTERVIEWPREPARATION
from geeksforgeeks;

Select CourseName, 
round(avg(case when CourseCategory="PROGRAMMING" then Price end),2) as PROGRAMMING,
round(avg(case when CourseCategory="INTERVIEWPREPARATION" then Price end),2) as INTERVIEWPREPARATION
from geeksforgeeks
group by CourseName;



