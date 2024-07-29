use hsbc;

create table sales
(category varchar(20),
year int,
sales int);

insert into sales(category, year, sales)
values
('c1', 2021, 10),
('c1', 2022, 20),
('c1', 2023, 25),
('c2', 2021, 12),
('c2', 2022, 19),
('c2', 2023, 31);

select * from sales;

-- Convert the following table in required output format 

-- Category	2021_sales	2022_sales	2023_sales
-- C1	10	20	25
-- C2	12	19	31

SELECT
    category,
    MAX(CASE WHEN year = 2021 THEN sales ELSE NULL END) AS 2021_sales,
    MAX(CASE WHEN year = 2022 THEN sales ELSE NULL END) AS 2022_sales,
    MAX(CASE WHEN year = 2023 THEN sales ELSE NULL END) AS 2023_sales
FROM
    sales
GROUP BY
    category;







