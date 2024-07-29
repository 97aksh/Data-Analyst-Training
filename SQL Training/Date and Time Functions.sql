 -- Date & Time Functions

select current_date();
select current_time();
select current_timestamp();
select curtime();

-- Get only date from timestamp
select Date(current_timestamp());

-- Get only time from timestamp
select Time(current_timestamp());

-- Get only year from date 
select year(current_date());

-- Get only month from date 
select month(current_date());

-- Get only day from date 
select day(current_date());

-- Get only hour from time 
select hour(current_time());

-- Get only minutes from time 
select minute(current_time());

-- Get only seconds from time 
select second(current_time());

-- Extract
use hsbc;
select emp_no, first_name, extract(year from birth_date) year
from employees;

select emp_no, first_name, extract(day from birth_date) day
from employees;

select emp_no, first_name, extract(month from birth_date) month
from employees;

-- DateDiff
select datediff('2024-04-28', '2024-04-25') as date_diff;

-- TimeDiff
select timediff('2024-04-23 11:43:54', '2024-04-23 11:40:50')
 as time_diff;

-- Date_add - to add the date
select emp_no, first_name, date_add(birth_date, interval 1 year)
as updated_birth_date
from employees;

-- Date_sub - to subtract the date
select emp_no, first_name, date_sub(birth_date, interval 1 year)
as updated_birth_date
from employees;

-- Date_format
select emp_no, first_name, date_format(birth_date, '%D %b %Y')
as updated_birth_date
from employees;

select date_format(current_timestamp(), '%h : %i %p') as time;

















