use practice;

CREATE TABLE `product_jan` (
`prod_id` int NOT NULL,
`prod_name` varchar(45) NOT NULL,
`price` decimal(10,0) NOT NULL,
`quantity` int NOT NULL,
`expiry_date` date NOT NULL,
PRIMARY KEY (`prod_id`)
);

INSERT INTO `product_jan` VALUES
(1,'Chocolate',10,15,'2024-05-10'),
(2,'Biscuits',20,10,'2025-10-30'),
(3,'Noodles',60,5,'2025-11-01'),
(4,'Peanuts',15,20,'2024-06-06'),
(5,'Lays',25,30,'2025-05-17'),
(6,'Oats',40,25,'2025-02-14'),
(7,'Almonds',150,6,'2026-01-18'),
(8,'Pickle',80,3,'2024-12-25');

CREATE TABLE `product_feb` (
`prod_id` int NOT NULL,
`prod_name` varchar(45) NOT NULL,
`price` decimal(10,0) NOT NULL,
`quantity` int NOT NULL,
`expiry_date` date NOT NULL,
PRIMARY KEY (`prod_id`)
);

INSERT INTO `product_feb` VALUES
(1,'Cold Drink',90,10,'2024-08-21'),
(2,'Milk',30,50,'2023-06-20'),
(3,'Noodles',60,5,'2025-11-01'),
(4,'Oil',65,18,'2024-02-28'),
(5,'Lays',25,30,'2025-05-17'),
(6,'Oats',40,25,'2025-02-14');

select * from product_jan;
select * from product_feb;

-- Write an SQL query to retrieve all the products from 
-- both tables where the quantity sold is greater than 5 
-- in January and February. 

select prod_name, quantity
from product_jan 
where quantity > 5
Union All
select prod_name, quantity
from product_feb 
where quantity > 5;

-- Write an SQL query to retrieve the common records 
-- from the two tables, i.e., the products that were sold
-- in both January and February

select * from product_jan
Intersect
select * from product_feb;

-- Write an SQL query to find the common product names 
-- that were sold in both January and February, along with 
-- their respective quantities, prices, and total sales.




