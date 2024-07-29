use practice;

CREATE TABLE CustomerInfo (
    Name_ContactNo VARCHAR(50)
);

INSERT INTO CustomerInfo (Name_ContactNo)
VALUES
    ('Abhishek_809812345'),
    ('Animesh_12387901'),
    ('Priyanka_3489123'),
    ('Rajshree_6547812');
    
    -- Create the CalendarInfo table
CREATE TABLE Calendar (
    Date DATE
);

-- Insert data into the CalendarInfo table
INSERT INTO Calendar (Date) VALUES
('2022-01-23'),
('2021-03-31'),
('2021-04-23'),
('2022-05-16'),
('2023-07-22'),
('1999-08-13'),
('1889-07-12');

CREATE TABLE Salesmann (
    EmpId INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptId INT
);

INSERT INTO Salesmann (EmpId, FirstName, LastName, Salary, DeptId)
VALUES
    (59551, 'David', 'Gower', 239800.00, 3),
    (28257, 'Rajesh', 'Sharma', 600453.00, 1),
    (39242, 'Marshal', 'Quinn', 240219.00, 1),
    (92520, 'Arnold', 'Rowen', 100566.00, 2),
    (85040, 'Michael', 'Atherton', 676880.00, 3),
    (36964, 'Rob', 'Stark', 706799.00, 3),
    (64297, 'Robert', 'Baratheon', 533853.00, 2),
    (85909, 'Jon', 'Snow', 654964.00, 1),
    (10324, 'Jamie', 'Lannister', 548932.00, 3);

CREATE TABLE Departmentt (
    DeptId INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departmentt (DeptId, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

CREATE TABLE Revenue (
    CompanyId INT,
    Year INT,
    Revenue DECIMAL(15, 2),
    Cost DECIMAL(15, 2)
);

INSERT INTO Revenue (CompanyId, Year, Revenue, Cost)
VALUES
    (1, 2020, 1097822.00, 557090.00),
    (2, 2020, 537271.00, 696811.00),
    (3, 2020, 1173318.00, 867646.00),
    (4, 2020, 934230.00, 480960.00),
    (5, 2020, 1468340.00, 563882.00),
    (1, 2021, 1126912.00, 968109.00),
    (2, 2021, 1014120.00, 643535.00),
    (3, 2021, 831331.00, 610626.00),
    (4, 2021, 1049440.00, 732067.00),
    (5, 2021, 1232390.00, 421167.00),
    (1, 2022, 1386292.00, 831139.00),
    (2, 2022, 1201449.00, 765034.00),
    (3, 2022, 519894.00, 581652.00),
    (4, 2022, 1160877.00, 515489.00),
    (5, 2022, 629294.00, 663988.00),
    (1, 2023, 849305.00, 724245.00),
    (2, 2023, 1169339.00, 876085.00),
    (3, 2023, 1046349.00, 763601.00),
    (4, 2023, 1192425.00, 422241.00),
    (5, 2023, 629244.00, 531300.00);

CREATE TABLE Company (
    CompanyId INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Country VARCHAR(50)
);

INSERT INTO Company (CompanyId, CompanyName, Country) VALUES
(1, 'HSBC', 'US'),
(2, 'Paypal', 'UK'),
(3, 'Mastercard', 'US'),
(4, 'Amex', 'US'),
(5, 'Standard Chartered', 'UK'),
(6, 'Tata Capitals', 'India'),
(7, 'Commonwealth Bank', 'Australia');

-- Create the salesman table
CREATE TABLE salessman (
    Salesman_id INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Commission DECIMAL(5, 2)
);

-- Insert data into the salesman table
INSERT INTO salessman (Salesman_id, Name, City, Commission)
VALUES
    (81651, 'Ros', 'Paris', 0.20),
    (60952, 'Jos', 'London', 0.08),
    (57603, 'Edwin', 'Seoul', 0.15),
    (71230, 'Kane', 'Milan', 0.15),
    (28217, 'Steve', 'Frankfurt', 0.21),
    (22594, 'Joe', 'Berlin', 0.13),
    (26563, 'John', 'Munich', 0.06),
    (13220, 'Kate', 'Boston', 0.07),
    (22902, 'Jennifer', 'Chicago', 0.18);
    
    -- Create the customerr table
CREATE TABLE customerr (
    Customer_id INT,
    Cust_name VARCHAR(255),
    City VARCHAR(255),
    Grade INT,
    Salesman_id INT
);

-- Insert data into the customerr table
INSERT INTO customerr (Customer_id, Cust_name, City, Grade, Salesman_id)
VALUES
    (6167, 'David', 'Berlin', 120, 81651),
    (6306, 'Ernest', 'Oslo', 172, 60952),
    (2797, 'Daryll', 'Chicago', 169, 57603),
    (7431, 'Dwight', 'Brussels', 118, 81651),
    (8111, 'Neil', 'Moscow', 109, 60952),
    (3974, 'Kevin', 'Madrid', 178, 57603),
    (4795, 'Robert', 'Capetown', 173, 81651),
    (5312, 'Ned', 'Paris', 186, 60952),
    (4756, 'Joffrey', 'London', 121, 57603);

-- Create the "orders" table
CREATE TABLE orders (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

-- Insert data into the "orders" table
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(16798, 447.00, '2021-12-21', 6167, 81651),
(93262, 267.00, '2021-12-21', 6306, 60952),
(68300, 140.00, '2021-12-21', 2797, 57603),
(55812, 112.00, '2021-12-21', 6167, 81651),
(97882, 444.00, '2021-12-21', 6306, 60952),
(76685, 297.00, '2021-12-23', 2797, 57603),
(47489, 400.00, '2021-12-23', 6167, 81651),
(75076, 462.00, '2021-12-23', 6306, 60952),
(54094, 145.00, '2021-12-23', 2797, 57603);


-- 1] Write a Query to get profits for each company for year 2021? (Profit = Revenue-Cost) -Company Id, Year, Revenue

select CompanyId, Year, Revenue, (Revenue - Cost) Profit
from Revenue
where Year = 2021;

-- 2] Write a Query to get profits for each company (Profit = Revenue-Cost)- Company id,Company Name,Total revenue,total cost,total profit

select c.CompanyId, c.CompanyName, sum(r.Revenue) TotalRevenue, sum(r.Cost) TotalCost, sum(r.Revenue - r.Cost) TotalProfit
from Company c
inner join Revenue r
on c.CompanyId = r.CompanyId
group by c.CompanyId;

-- 3] For Customer Table, create a two new columns for name and contact number
select * 
from Customer;

-- 4] For Calendar table, write SQL query to create new columns for 
-- 1. Year 
-- 2. Date after a month 
-- 3. Difference between date and today’s date 
-- 4. Century

-- 5] Write a Query to get profits for each company for year 2021? (Profit = Revenue-Cost) - Company id, Company Name, Maximum Profit

with cte as
(select CompanyId, Year, max(Revenue - Cost) MaxProfit
from Revenue
where year = 2021
group by CompanyId)
select c.CompanyId, c.CompanyName, e.Year, e.MaxProfit
from Company c
inner join cte e 
on c.CompanyId = e.CompanyId;

-- 6] Write a Query to get profits for each company for year 2021? (Profit = Revenue-Cost)- ORD_NO, PURCH_AMT, CUST_NAME, CITY

select c.cust_name, c.city, o.ord_no, o.purch_amt
from customerr c
inner join orders o
on c.customer_id = o.customer_id;

-- 7] from the customers table, write a sql query to find the highest grade of the customers in each city. return city, maximum grade

select city, max(grade) Max_Grade
from customerr
group by city;

-- 8] Query to get all the records of the employees where salary is maximum in each of the departments-First_Name,Last_Name,Salary,Dept_Name

with cte as
(select DeptId, max(salary) Max_Salary
from Salesmann
group by DeptId)

select s.FirstName, s.LastName, d.DepartmentName, s.Salary
from Salesmann s
inner join Departmentt d
on s.DeptId = d.DeptId
inner join cte c
on c.DeptId = s.DeptId and s.salary = c.Max_Salary;

-- 9]Query to get all the employees records with the 3rd highest salary in each department- First_Name,Last_Name,Salary,Dept_Name

with cte as
(select *, rank() over (partition by DeptId order by salary desc) as salary_rank
from Salesmann)
select c.FirstName, c.LastName, c.Salary, d.DepartmentName
from cte c
inner join Departmentt d
on c.DeptId = d.DeptId
where c.salary_rank = 3;

-- 10] Write a query to get Total Revenue and Cost for all the 5 companies in company master table-Company Name, Total Profit

with cte as
(select CompanyId, sum(Revenue) TotalRevenue, sum(Cost) TotalCost
from Revenue
group by CompanyId)

select c.CompanyId, co.CompanyName, c.TotalRevenue, c.TotalCost, (c.TotalRevenue - c.TotalCost) as TotalProfit
from cte c
inner join Company co
on c.CompanyId = co.CompanyId;

-- 11] Write a query to get year in which HSBC, Paypal and Amex received their max profit - Company Name, Year, Profit

with cte as 
(select CompanyId, Year, sum(Revenue) TotalRevenue, sum(Cost) TotalCost
from Revenue
group by CompanyId, Year
order by CompanyId),

cte1 as 
(select c.CompanyId, co.CompanyName CompanyName, c.Year Max_Profit_Year, (c.TotalRevenue - c.TotalCost) TotalProfit
from cte c
inner join Company co
on c.CompanyId = co.CompanyId)

select c1.CompanyName, max(TotalProfit) MaxProfit
from cte1 c1
WHERE c1.CompanyName IN ('HSBC', 'Paypal', 'Amex')
group by c1.CompanyName;

































