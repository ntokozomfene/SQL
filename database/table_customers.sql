-- Create a database called “Umuzi”.
create database Umuzi

-- Create the following tables in the Umuzi database:

-- Customers
create table Customers(
customerid      SERIAL PRIMARY KEY,
first_Name      VARCHAR (50),
lastname        VARCHAR(50),
gender          VARCHAR,
addresses       VARCHAR(200),
phone           bigint,
email           VARCHAR(100),
city            VARCHAR(20),
country         VARCHAR(50)
);

INSERT INTO customers (CUSTOMERID, FIRST_NAME, LASTNAME, GENDER, ADDRESSES, PHONE,EMAIL, 
CITY,COUNTRY)

VALUES (1, 'John','Hibert', 'Male', '284 chaucer st', 084789657, 'john@gmail.com', 
'Johannesburg', 'South Africa');


INSERT INTO customers (CUSTOMERID, FIRST_NAME, LASTNAME, GENDER, ADDRESSES, PHONE,EMAIL, 
CITY,COUNTRY)

VALUES (2, 'Thando', 'Sithole', 'Female', '240 sect 1', 0794445584, 'thando@gmail.com',
'Cape Town', 'South Africa');


INSERT INTO customers (CUSTOMERID, FIRST_NAME, LASTNAME, GENDER, ADDRESSES, PHONE,EMAIL, 
CITY,COUNTRY)
VALUES (3, 'Leon', 'Glen', 'Male', '81 Everton Rd,Gillits', 0820832830,
'leon@gmail.com', 'Durban', 'South Africa');

INSERT INTO customers (CUSTOMERID, FIRST_NAME, LASTNAME, GENDER, ADDRESSES, PHONE,EMAIL, 
CITY,COUNTRY)

VALUES (4, 'Charl', 'muller', 'Male', '290A Dorset Ecke', 44856872553,
'charl.muller@yahoo.com', 'Berlin', 'Germany');



INSERT INTO customers (CUSTOMERID, FIRST_NAME, LASTNAME, GENDER, ADDRESSES, PHONE,EMAIL, 
CITY,COUNTRY)

VALUES (5, 'Julia', 'Stein', 'Female', '2 Wernerring', 448672445058,
'Js234@yahoo.com', 'Frankfurt', 'Germany');

-- Employees
create table Employees (
Employeeid      Serial Primary key,
first_Name      VARCHAR (50),
lastname        VARCHAR(50),
email           VARCHAR(100),
JobTitle        VARCHAR(20)
);

INSERT INTO Employees (Employeeid, FIRST_NAME, LASTNAME, EMAIL, JobTitle)

VALUES (1, 'Kani', 'Matthew', 'mat@gmail.com', 'Manager');

INSERT INTO Employees (Employeeid, FIRST_NAME, LASTNAME, EMAIL, JobTitle)

VALUES (2, 'lesly', 'Cronje', 'LesC@gmail.com', 'Clerk');

INSERT INTO Employees (Employeeid, FIRST_NAME, LASTNAME, EMAIL, JobTitle)

VALUES (3, 'Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

-- Orders
create table Orders (
OrderId                Serial Primary key,
ProductID              integer,
PaymentID              integer,
FUlfilledByEmployeeID  integer,
DateRequired           timestamp,
DateShipped            timestamp,
Status                 varchar(20)
);

INSERT INTO orders (Orderid, productid, paymentid, FulfilledByEmployeeid, Daterequired, DateShipped, Status)
VALUES (1, 1, 1, 2, '05-09-2018', Null , 'Not shipped');

INSERT INTO orders (Orderid, productid, paymentid, FulfilledByEmployeeid, Daterequired, DateShipped, Status)
VALUES (2, 1, 2, 2, '04-09-2018', '03-09-2018', 'Shipped');

INSERT INTO orders (Orderid, productid, paymentid, FulfilledByEmployeeid, Daterequired, DateShipped, Status)
VALUES (3, 3, 3, 3, '06-09-2018', Null , 'Not shipped');

-- Payments
create table Payments(
customerid      Serial Primary key,
PaymentID       integer,
PaymentDate     timestamp,
Amount          decimal
);


INSERT INTO payments (customerid, paymentid, paymentdate, amount)
VALUES (1, 1, '01-09-2018', 150.75);

INSERT INTO payments (customerid, paymentid, paymentdate, amount)
VALUES (5, 2, '03-09-2018', 150.75);

INSERT INTO payments (customerid, paymentid, paymentdate, amount)
VALUES (4, 3, '03-09-2018', 700.60);

-- Products
create table Products(
ProductId       Serial Primary key,
ProductName     VARCHAR (100),
Description     VARCHAR(300),
BuyPrice        decimal
);

INSERT INTO products (productid, productname, Description, buyprice)
VALUES (1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75);
INSERT INTO products (productid, productname, Description, buyprice)
VALUES (2, 'classic Car', 'Turnable front wheels, steering function', 550.75);
INSERT INTO products (productid, productname, Description, buyprice)
VALUES (3, 'Sports car', 'Turnable front wheels, steering function', 700.60);


-- Part 2: Querying a database
-- 1.SELECT ALL records from table Customers.
select * from customers
-- 2.SELECT records only from the name column in the Customers table.
select first_name from customers
-- 3.Show the name of the Customer whose CustomerID is 1.
select * FROM customers where customerid=1
-- 4.UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”.
UPDATE Customers SET first_name = 'Lerato', lastname= 'Mabitso' WHERE CustomerID = 1
-- 5.DELETE the record from the Customers table for customer 2 (CustomerID = 2).
DELETE FROM Customers WHERE Customerid=1
-- 6.Select all unique statuses from the Orders table and get a count of the number of orders for each unique status.
SELECT count(Distinct status) from orders
-- 7.Return the MAXIMUM payment made on the PAYMENTS table.
SELECT MAX(amount) as LargestPrice FROM Payments
-- 8.Select all customers from the “Customers” table, sorted by the “Country” column.
SELECT * FROM Customers ORDER BY Country
-- 9.Select all products with a price BETWEEN R100 and R600.
select * from products where buyprice between 100 AND 600
-- 10.Select all fields from “Customers” where country is “Germany” AND city is “Berlin”.
SELECT * FROM customers WHERE country='Germany' AND city='Berlin'
-- 11.Select all fields from “Customers” where city is “Cape Town” OR “Durban”.
SELECT * FROM customers WHERE (city = 'Cape town') or (city='Durban')
-- 12.Select all records from Products where the Price is GREATER than R500.
SELECT * FROM Products WHERE buyprice > 500
-- 13.Return the sum of the Amounts on the Payments table.
select sum(amount) FROM payments
-- 14.Count the number of shipped orders in the Orders table.
select count(status='shipped') FROM Orders
-- 15.Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar).
select avg(buyprice)*12 from Products 
-- 16.Using INNER JOIN create a query that selects all Payments with Customer information.
select * From customers inner join payments on payments.customerid = customers.customerid
-- 17.Select all products that have turnable front wheels.
select * FROM products WHERE description='Turnable front wheels, steering function'