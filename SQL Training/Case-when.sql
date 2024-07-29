use hsbc;

-- Write a query to categorize employees based on their years of experience. The categories are:
-- "Junior" for less than 5 years
-- "Mid-Level" for 5 to 10 years
-- "Senior" for more than 10 years

select emp_no, first_name, (year(current_date())- year(joining_date)) as experience,
	case 
		when year(joining_date) <= 2019 then 'senior'
		when year(joining_date) between 2020 and 2021 then 'mid-level'
		else 'junior'
	end as experience_level
from employees;

-- Calculate Bonus Based on Department:
-- Write a query to calculate a bonus for each employee based on their department. The bonuses are:
-- HR: 10% of their salary
-- IT: 15% of their salary
-- Finance: 12% of their salary
-- Marketing: 8% of their salary

select emp_no, first_name, department, salary,
	case
		when department = 'HR' then salary * 0.10
        when department = 'IT' then salary * 0.15
        when department = 'Finance' then salary * 0.12
        when department = 'Marketing' then salary * 0.08
        else salary * 0.11
	end as Bonus
from employees;

-- Determine Age Group:
-- Write a query to categorize employees into different age groups:
-- "Young" for ages below 30
-- "Middle-aged" for ages 30 to 40
-- "Senior" for ages above 40

select emp_no, first_name, birth_date, (year(current_date())-year(birth_date)) as age,
	case
		when (year(current_date())-year(birth_date)) < 25 then 'Young'
		when (year(current_date())-year(birth_date)) between 25 and 26 then 'Middle-Aged'
        when (year(current_date())-year(birth_date)) > 26 then 'Senior'
	end as age_group
    from employees;


