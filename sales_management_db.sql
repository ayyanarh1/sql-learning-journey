create database sales_management;
use sales_management;

create table productLines(
productLine varchar(50) primary key,
textDescription varchar(4000) default null, # it takes null value
htmlDescription mediumtext,
image blob);

create table offices(
officeCode varchar(10) primary key,
city varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50) default null,
state varchar(50),
country varchar(50),
postalCode varchar(15),
territory varchar(10));

create table employees(
employeeNumber int primary key,
lastName varchar(50) not null,
firstName varchar(50) not null,
extension varchar(10) not null,
email varchar(50) not null,
officeCode varchar(10) not null,
reportsTo int default null,
jobTitle varchar(50) not null,
foreign key (reportsTo) references employees(employeeNumber),
foreign key (officeCode) references offices(officeCode)
);

create table customers(
customerNumber varchar(15) primary key,
customerName varchar(50) not null,
contactLastName varchar(50) not null,
contactFirstName varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50) default null,
city varchar(50) not null,
state varchar(50) default null,
postalCode varchar(15) default null,
country varchar(50) not null,
salesRepEmployeeNumber int default null,
creditLimit decimal(10,2),
foreign key (salesRepEmployeeNumber) references employees(employeeNumber));
ALTER TABLE customers MODIFY addressLine1 VARCHAR(100);
ALTER TABLE customers MODIFY customerName VARCHAR(100);



create table products(
productCode varchar(15) primary key,
productName varchar(70) not null, # user must enter the data
productLine varchar(50),
productScale varchar(70),
productVendor varchar(70),
productDescription text,
quantityInStock smallint,
buyPrice decimal(10,2),
MSRP decimal(10,2),# deciding digits after and before the point
foreign key (productLine) references productLines(productLine)
); 


create table orders(
orderNumber varchar(15) primary key,
orderDate date not null,
requiredDate date not null,
shippedDate date,
status varchar(15),
comments text default null,
customerNumber varchar(15) not null,
foreign key (customerNumber) references customers(customerNumber)
);

create table orderdetails(
orderNumber varchar(15) ,
productCode varchar(15) ,
quantityOrdered int,
priceEach  decimal(10,2),
orderLineNumber smallint,
foreign key (orderNumber) references orders(orderNumber),
foreign key (productCode) references products(productCode)
);


create table payments(
customerNumber varchar(15) not null,
checkNumber varchar(50) primary key,
paymentDate date not null,
amount decimal(10,2) not null,
foreign key (customerNumber) references customers(customerNumber)
);

insert into productLines(productLine,textDescription,htmlDescription,image)
values
('Classic Cars', 'Vintage and classic model cars', NULL, NULL),
('Motorcycles', 'Racing and sports bikes', NULL, NULL);

insert into productLines(productLine,textDescription,htmlDescription,image)
values
('Planes', 'Aircrafts of various sizes', '<p>Aircrafts of various sizes</p>', NULL),
('Ships', 'Passenger and freight ships', '<p>Passenger and freight ships</p>', NULL),
('Trains', 'Locomotives and railcars', '<p>Locomotives and railcars</p>', NULL),
('Trucks and Buses', 'Utility vehicles', '<p>Utility vehicles</p>', NULL),
('Vintage Cars', 'Classic and vintage cars', '<p>Classic and vintage cars</p>', NULL),
('Tools', 'Model building tools', '<p>Model building tools</p>', NULL),
('Figures', 'Model figurines', '<p>Model figurines</p>', NULL),
('Accessories', 'Additional parts and accessories', '<p>Additional parts and accessories</p>', NULL);

SELECT * FROM productLines;  # to view the table

insert into offices(officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory)
values ('1', 'Chennai', '+91-44-12345678', 'T Nagar', NULL, 'Tamil Nadu', 'India', '600017', 'APAC'),
('2', 'Bangalore', '+91-80-87654321', 'MG Road', NULL, 'Karnataka', 'India', '560001', 'APAC');

insert into offices(officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory)
values
(3, 'Chicago', '+1 312 219 4782', '223 W. Erie Street', NULL, 'IL', 'USA', '60610', 'NA'),
(4, 'Paris', '+33 14 755 4782', '43 Rue Jouffroy', NULL, NULL, 'France', '75017', 'EMEA'),
(5, 'Tokyo', '+81 3 219 4782', '1-2-2 Shibuya', NULL, NULL, 'Japan', '150-0002', 'APAC'),
(6, 'Sydney', '+61 2 219 4782', '10 Bond Street', NULL, NULL, 'Australia', '2000', 'APAC'),
(7, 'London', '+44 20 219 4782', '14-15 Southampton Place', NULL, NULL, 'UK', 'WC1A 2AJ', 'EMEA'),
(8, 'Berlin', '+49 30 219 4782', 'Hardenbergstraße 28', NULL, NULL, 'Germany', '10623', 'EMEA'),
(9, 'Mexico City', '+52 55 219 4782', 'Av. Insurgentes Sur 1234', NULL, 'Mexico', 'Mexico', '03100', 'NA'),
(10, 'Toronto', '+1 416 219 4782', '21 Bloor Street East', NULL, 'ON', 'Canada', 'M4W 1A9', 'NA');


SELECT * FROM offices;

insert into employees(employeeNumber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle)
values  (1002, 'Kumar', 'Arun', 'x101', 'arun.kumar@classic.com', '1', NULL, 'Sales Manager'),
(1056, 'Ravi', 'Suresh', 'x102', 'suresh.ravi@classic.com', '1', 1002, 'Sales Rep'),
(1076, 'Sharma', 'Neha', 'x103', 'neha.sharma@classic.com', '2', 1002, 'Sales Rep');

insert into employees(employeeNumber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle)
values (1088, 'Bondur', 'Leslie', 'x5408', 'lbondur@classicmodelcars.com', 1, 1002, 'Sales Manager'),
(1102, 'Bow', 'Anthony', 'x5428', 'abow@classicmodelcars.com', 1, 1002, 'Sales Rep'),
(1143, 'Jennings', 'Christopher', 'x5784', 'cjennings@classicmodelcars.com', 2, 1056, 'Sales Rep'),
(1165, 'Thompson', 'Kim', 'x5411', 'kthompson@classicmodelcars.com', 2, 1056, 'Sales Rep'),
(1173, 'Firrelli', 'Julie', 'x2173', 'jfirrelli@classicmodelcars.com', 3, 1076, 'Sales Rep'),
(1216, 'Patterson', 'Steve', 'x8821', 'spatterson@classicmodelcars.com', 4, 1076, 'Sales Rep'),
(1286, 'Tseng', 'George', 'x7834', 'gtseng@classicmodelcars.com', 4, 1076, 'Sales Rep');

select * from  employees;

insert into customers(customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit)
values (2001, 'ABC Traders', 'Rao', 'Vikram', '+91-9876543210','Anna Nagar', NULL, 'Chennai', 'Tamil Nadu', '600040', 'India', 1056, 150000),
(2002, 'XYZ Electronics', 'Patel', 'Amit', '+91-9123456789', 'Indiranagar', NULL, 'Bangalore', 'Karnataka', '560038', 'India', 1076, 200000);

insert into customers(customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit)
values
(103, 'Atelier graphique', 'Schmitt', 'Carine', '40.32.2555', '54 rue Royale', NULL, 'Nantes', NULL, '44000', 'France', 1216, 21000.00),
(112, 'Signal Gift Stores', 'King', 'Jean', '7025551838', '8489 Strong St.', NULL, 'Las Vegas', 'NV', '83030', 'USA', 1286, 71800.00),
(114, 'Australian Collectors, Co.', 'Ferguson', 'Peter', '03 9520 4555', '636 St Kilda Road', NULL, 'Melbourne', 'Victoria', '3004', 'Australia', 1286, 117300.00),
(119, 'La Rochelle Gifts', 'Labrune', 'Janine', '40.67.8555', '67 rue des Cinquante Otages', NULL, 'Nantes', NULL, '44000', 'France', 1216, 118200.00),
(121, 'Baane Mini Imports', 'Bergulfsen', 'Jonas', '+45 543 55 543', 'Erling Skakkes gate 78', NULL, 'Stavern', NULL, '4110', 'Norway', 1286, 81700.00),
(124, 'Mini Gifts Distributors Ltd.', 'Nelson', 'Susan', '4155551450', '5677 Pierce Rd.', NULL, 'San Francisco', 'CA', '94217', 'USA', 1216, 21000.00),
(125, 'Technics Stores Inc.', 'Hashimoto', 'Yoshi', '+81 3 5420 5555', 'Higashi 9-3-1', NULL, 'Tokyo', 'Tokyo Pref.', '150-8677', 'Japan', 1216, 99000.00),
(128, 'Gift Depot Inc.', 'King', 'Alice', '+1 203 555-1234', '564 Elm Street', NULL, 'Bridgewater', 'CT', '93277', 'USA', 1286, 58000.00),
(129, 'Royal Canadian Collectables, Ltd.', 'Nishi', 'Shu', '+1 604 555-5555', '590 Nicomekl Rd.', NULL, 'Vancouver', 'BC', 'V3F 3F3', 'Canada', 1286, 98000.00),
(130, 'Alpha Cognition', 'Jimenez', 'Fernando', '+1 416 555-5555', '14 Bloor Street', NULL, 'Toronto', 'ON', 'M4W 3A5', 'Canada', 1056, 66000.00);

select * from customers
where customerNumber in (2001,2002);

insert into products(productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyPrice,MSRP)
values
('S10_1678', '1969 Harley Davidson', 'Motorcycles', '1:10','Min Lin Diecast','Classic Harley Davidson bike model', 100, 4800, 6500),
('S12_1099', '1968 Ford Mustang', 'Classic Cars', '1:12','Autoart Studio', 'Classic Ford Mustang model', 50, 9500, 12000);

INSERT IGNORE INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) VALUES
('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', '1:10', 'Min Lin Diecast', 'This replica features rotating wheels and working kickstand.', 7933, 48.81, 95.70),
('S10_1949', '1952 Alpine Renault 1300', 'Classic Cars', '1:10', 'Classic Metal Creations', 'Turnable front wheels; steerable with steering column.', 7305, 98.58, 214.30),
('S12_1099', '1996 Moto Guzzi 1100i', 'Motorcycles', '1:12', 'Highway 66 Mini Classics', 'Highly detailed replica.', 6801, 68.99, 118.94),
('S12_3891', '1928 Ford Phaeton Deluxe', 'Classic Cars', '1:12', 'Classic Metal Creations', 'Fully detailed interior.', 8208, 35.99, 78.75),
('S18_2248', '1917 Grand Touring Sedan', 'Vintage Cars', '1:18', 'Autoart Studio Design', 'Reproduced in high detail.', 6303, 123.42, 245.00),
('S18_1367', '2001 Ferrari Enzo', 'Classic Cars', '1:18', 'Red Start Diecast', 'Finely detailed exterior and interior.', 6951, 207.79, 447.32),
('S32_4289', '1970 Dodge Charger', 'Classic Cars', '1:32', 'Welly Diecast Productions', 'Realistic paint and detailing.', 7055, 32.59, 74.84),
('S18_2795', '1974 Ducati 750', 'Motorcycles', '1:18', 'Min Lin Diecast', 'Highly detailed diecast model.', 6405, 58.48, 116.50),
('S24_1937', '1936 Mercedes Benz 500k Roadster', 'Classic Cars', '1:24', 'Highway 66 Mini Classics', 'Detailed undercarriage.', 7505, 40.32, 78.94),
('S50_1514', '1932 Model A Ford', 'Classic Cars', '1:50', 'Red Start Diecast', 'Classic styling.', 7231, 47.32, 97.25);

select * from products;

INSERT into orders(orderNumber,orderDate,requiredDate,shippedDate,status,comments,customerNumber)
values 
(30001, '2026-01-10', '2026-01-15', '2026-01-13', 'Shipped', 'Delivered on time', 2001),
(30002, '2026-01-12', '2026-01-18', NULL, 'In Process', NULL, 2002);

INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber) 
VALUES
(10100, '2024-12-01', '2024-12-05', '2024-12-04', 'Shipped', NULL, 103),
(10101, '2024-12-02', '2024-12-07', NULL, 'In Process', NULL, 112),
(10102, '2024-12-02', '2024-12-09', '2024-12-07', 'Shipped', NULL, 114),
(10103, '2024-12-03', '2024-12-10', NULL, 'Cancelled', 'Requested delay in shipment.', 119),
(10104, '2024-12-04', '2024-12-15', NULL, 'In Process', NULL, 121),
(10105, '2024-12-05', '2024-12-20', NULL, 'On Hold', 'Awaiting approval.', 124),
(10106, '2024-12-06', '2024-12-18', '2024-12-16', 'Shipped', NULL, 125),
(10107, '2024-12-07', '2024-12-20', NULL, 'In Process', NULL, 128),
(10108, '2024-12-08', '2024-12-22', '2024-12-20', 'Shipped', NULL, 129),
(10109, '2024-12-09', '2024-12-23', NULL, 'On Hold', 'Customer requested specific packaging.', 130);

select * from orders;

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (30001, 'S10_1678', 2, 6500, 1),
       (30002, 'S12_1099', 1, 12000, 1);

INSERT IGNORE INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber) 
VALUES
(10100, 'S10_1678', 30, 95.70, 1),
(10101, 'S10_1949', 20, 214.30, 1),
(10102, 'S12_1099', 15, 118.94, 1),
(10103, 'S12_3891', 10, 78.75, 1),
(10104, 'S18_2248', 5, 245.00, 1),
(10105, 'S18_1367', 25, 447.32, 1),
(10106, 'S32_4289', 8, 74.84, 1),
(10107, 'S18_2795', 12, 116.50, 1),
(10108, 'S24_1937', 30, 78.94, 1),
(10109, 'S50_1514', 20, 97.25, 1);

select * from orderdetails;

INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
VALUES (2001, 'CHK1001', '2026-01-16', 13000),
       (2002, 'CHK1002', '2026-01-17', 12000);
INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount) VALUES
(103, 'HQ336338', '2024-12-05', 21000.00),
(112, 'ZQ098098', '2024-12-06', 50000.00),
(114, 'TY111111', '2024-12-07', 117300.00),
(119, 'XZ222222', '2024-12-08', 100000.00),
(121, 'AB333333', '2024-12-09', 81700.00),
(124, 'PQ444444', '2024-12-10', 21000.00),
(125, 'MN555555', '2024-12-11', 99000.00),
(128, 'XY666666', '2024-12-12', 58000.00),
(129, 'CD777777', '2024-12-13', 98000.00),
(130, 'FG888888', '2024-12-14', 66000.00);


select * from payments;

select productName,productLine,productScale,productVendor,buyPrice,MSRP 
from products;

 #CONDITION
select productName,productLine,productScale,productVendor,buyPrice,MSRP 
from products
where buyPrice > 80; 

select productName,productLine,productScale,productVendor,buyPrice,MSRP 
from products
where MSRP < 80;

#MUTIPLE CONDITION
select productName,productLine,productScale,productVendor,buyPrice,MSRP 
from products
where MSRP >80 and productLine = 'Classic Cars';

#order by (sort)
select productName,productLine,productScale,productVendor,buyPrice,MSRP 
from products
order by buyprice;

select productName,productLine,productScale,productVendor,buyPrice,MSRP 
from products
order by buyprice desc;

#limit

select productName,productLine,productScale,productVendor,buyPrice,MSRP 
from products
order by buyprice
limit 5;

# CHAPTER 3 TASK

# 1. High-Value Customer Outreach: The sales team wants to call all customers in the USA who have a creditLimit greater than $50,000. Provide a list of their customerName, contactFirstName, and phone number.

select customerName,contactFirstName,phone,country,creditLimit
from customers
where creditLimit > 50000 and country = 'USA';

# 2. Geographic Distribution Report: Management needs to know how many customers are located in each country.

select country,
count(customerNumber) as total_customers
from customers
group by country
order by count(customerNumber) desc;

# 3. The "VIP" Status Upgrade: The company decided that any customer with a creditLimit over 100,000 is now a "VIP." Update their contactLastName to be prefixed with 'VIP 
SET SQL_SAFE_UPDATES = 0;

update customers
set contactLastName = concat('VIP -', contactLastName)
where creditLimit >100000.00;

SET SQL_SAFE_UPDATES = 1;

select * from customers;

# 4. Monthly Revenue Report: The finance team needs to see how much money was collected in a specific month in December 2024.
select sum(amount) as total_revenue
from payments
where paymentDate like '2024-12%'; 

# 5.Inventory Value: What is the total dollar value of our current stock for 'Motorcycles'?
select sum(quantityInStock * buyPrice) as total_inventory_value
from products
where productLine = 'Motorcycles';

# 6. Email Format Update: The company is changing its domain from @classicmodelcars.com to @models.com

set sql_safe_updates =0;

update employees
set email = replace(email,'@classicmodelcars.com', '@models.com');
set sql_safe_updates =1;

select email
from employees;

# 7. Organizational Hierarchy: The HR department needs to know who reports to whom.
select concat(firstName, ' ' , lastName) as employee_name,
reportsTo as manager_id,
jobTitle
from employees
order by reportsTo;

# 8. Sales Team Distribution: Management wants to see how many "Sales Reps" are working in each office.

select officeCode, 
count(employeeNumber) as total_reps
from employees
where jobTitle = 'Sales Rep'
group by officeCode;

#9. Shipping Delay Audit: Management wants to know if we are shipping orders on time.

select orderNumber, orderDate, requiredDate, shippedDate
from orders
where shippedDate > requiredDate;

#10. Order Status Summary : The warehouse needs a quick count of how many orders are still being packed vs. how many are gone.
select status, 
count(orderNumber) as total_orders
from orders
group by status;

#Aggregate functions

select count(*) # when i run this, it gives total, but no specific column, to do that let us continue next..as below
from products;

select count(*) as total_product
from products;

select sum(amount) as total_payment
from payments;

select avg(buyPrice) as avg_buyPrice
from products;

select 
min(buyPrice) as min_buyPrice,
max(buyPrice) as max_buyPrice
from products;

# How to use the same with where function

select count(*) as order_2024
from orders
where year(orderDate) = 2024;

select sum(amount) as cust_112_totalPaid
from payments
where customerNumber = 103;

# Aggregate funtions Groupby

select productLine, count(*) as total_productLine
from products
group by productLine;

select jobTitle, count(*) as total_jobTitle
from employees
group by jobTitle;

select productCode, count(*) as total_productCode
from orderdetails
group by productCode;

select customerNumber, sum(amount) as total_paymnets
from payments
group by customerNumber;

#AGGREGATE FUNCTION USING HAVING

select customerNumber, sum(amount) as total_paymnets
from payments
group by customerNumber
having total_paymnets >50000;


# sub queries

select customerNumber, amount
from payments
where amount = (
	select max(amount)
    from payments
);


select customerName, customerNumber
from customers
where customerNumber in  (
	select customerNumber
    from orders
);





