create database practice;
use practice;

CREATE TABLE vendors (
vend_id char(10) NOT NULL,
vend_name char(50) NOT NULL,
vend_address char(50) ,
vend_city char(50),
vend_state char(5),
vend_zip char(10),
vend_country char(50),
PRIMARY KEY (vend_id)
);

CREATE TABLE products (
prod_id char(10) NOT NULL,
vend_id char(10),
prod_name char(255) NOT NULL,
prod_price decimal(8,2) NOT NULL,
prod_desc text,
PRIMARY KEY (prod_id),
FOREIGN KEY (vend_id) REFERENCES vendors (vend_id)
);

INSERT INTO Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
VALUES
('BRS01', 'Bears R Us', '123 Main Street', 'Bear Town', 'MI', '44444', 'USA'),
('BRE02', 'Bear Emporium', '500 Park Street', 'Anytown', 'OH', '44333', 'USA'),
('DLL01', 'Doll House Inc.', '555 High Street', 'Dollsville', 'CA', '99999', 'USA'),
('FRB01', 'Furball Inc.', '1000 5th Avenue', 'New York', 'NY', '11111', 'USA'),
('FNG01', 'Fun and Games', '42 Galaxy Road', 'London', NULL, 'N16 6PS', 'England'),
('JTS01', 'Jouets et ours', '1 Rue Amusement', 'Paris', NULL, '45678', 'France');

INSERT INTO Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
VALUES
('BR01', 'BRS01', '8 inch teddy bear', 5.99, '8 inch teddy bear, comes with cap and jacket'),
('BR02', NULL, '12 inch teddy bear', 8.99, '12 inch teddy bear, comes with cap and jacket'),
('BR03', 'BRS01', '18 inch teddy bear', 11.99, '18 inch teddy bear, comes with cap and jacket'),
('BNBG01', 'DLL01', 'Fish bean bag toy', 3.49, 'Fish bean bag toy, complete with bean bag worms with which to feed it'),
('BNBG02', 'DLL01', 'Bird bean bag toy', 3.49, 'Bird bean bag toy, eggs are not included'),
('BNBG03', NULL, 'Rabbit bean bag toy', 3.49, 'Rabbit bean bag toy, comes with bean bag carrots'),
('RGAN01', 'DLL01', 'Raggedy Ann', 4.99, '18 inch Raggedy Ann doll'),
('RYL01', 'FNG01', 'King doll', 9.49, '12 inch king doll with royal garments and crown'),
('RYL02', 'FNG01', 'Queen doll', 9.49, '12 inch queen doll with royal garments and crown');

select * from products;
select * from vendors;

-- Retrieve the names of all products along with the names of their corresponding vendors
select p.prod_name, v.vend_name
from products p
inner join vendors v
on p.vend_id=v.vend_id;

-- Retrieve the product names, prices, and the cities where the vendors are located.
select p.prod_name, p.prod_price, v.vend_country
from products p
inner join vendors v
on p.vend_id=v.vend_id;

-- Retrieve the product names and their corresponding vendor names, but only for products with vendors located in the USA

select p.prod_name, v.vend_name, v.vend_country
from products p
inner join vendors v
on p.vend_id=v.vend_id
where v.vend_country='USA';

-- Display products even if vendor details are missing
select p.prod_id, p.prod_name, v.vend_id, v.vend_name
from products p
left join vendors v
on p.vend_id=v.vend_id;

-- List vendors along with their products, including those vendors who don't have any products.
select  v.*, p.*
from products p
right join vendors v
on p.vend_id=v.vend_id;

use hsbc;

create table number1
( num int);

create table number2
( num int );

insert into number1(num)
values
(1),
(1),
(1),
(2),
(2),
(3),
(null),
(null);

insert into number2(num)
values
(2),
(2),
(3),
(3),
(null);

select * from number1;
select * from number2;

-- inner join
select n1.num, n2.num
from number1 n1
inner join number2 n2
on n1.num = n2.num;

-- left join
select n1.num, n2.num
from number1 n1
left join number2 n2
on n1.num = n2.num;

-- right join
select n1.num, n2.num
from number1 n1
right join number2 n2
on n1.num = n2.num;

-- cross join
-- select n1.num, n2.num
-- from number1 n1
-- cross join number2 n2
-- on n1.num = n2.num;


	





