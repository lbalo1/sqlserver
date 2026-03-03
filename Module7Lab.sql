USE Northwind;

-- Retrieve records from shippers 
Select * From Shippers; 

-- Retrieve a list of customers sorted by country and contact name 
Select Top 5 ContactName, Country, Phone FROM Customers ORDER BY Country, ContactName;

-- Filter records to see only one customer's order
SELECT CustomerID, OrderDate, ShipCity FROM Orders 
WHERE CustomerID = 'ALFKI';

-- Retrieve records from two tables at once 
-- Join to retrieve data from the customes and orders
SELECT TOP 5 c.CompanyName, o.OrderDate FROM Customers AS c JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE c.CompanyName = 'Quick-Stop';

-- Add a record to the database 
-- using Insert statements
INSERT INTO Customers (CustomerID, ContactName, CompanyName, Country) 
VALUES ('ALICE', 'Alice Johnson', 'Wonderful Widgets', 'USA');

-- Double Check that it was added
SELECT * FROM Customers WHERE CustomerID='ALICE';

-- Use the update statment to modify data
UPDATE Customers SET ContactName = 'Maria Anders'
WHERE CustomerID = 'ALFKI';

-- DELETE statements removes records from the databases
DELETE FROM Orders WHERE OrderID = 10248;



