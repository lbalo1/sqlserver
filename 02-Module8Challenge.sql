/*
Module 8 Challenge: SQL Statements
*/

/*
Instructions:
For this challenge, we'll be retrieving, sorting, and 
filtering data from the Northwind Database. 
We'll also insert records, update, and delete records.


Use the Northwind database for this assignment. Use the
instructions in the comments to write the SQL statements
for this assignment.
 
Run and test your SQL code using the sqlcmd command in the Terminal.
Here's an example: 
sqlcmd -S localhost -U sa -P P@ssw0rd -d Northwind -Q "SELECT * FROM Customers;"
*/


USE Northwind;

/*
1.	
Retrieve a list of products. 
The list should include the product name, unit price, 
and how many units Northwind has in stock.
*/

Select ProductName, UnitPrice, UnitsInStock From Products;

/*
2.	
List the product name and units in stock for products where UnitsInStock equals zero.
*/

Select ProductName, UnitsInStock From Products Where UnitsInStock = 0;


/*
3.	List the product name and the unit price for each product. 
Sort the list with the smallest unit price on top.
*/

Select ProductName, UnitPrice From Products
Order By UnitPrice ASC;


/*
4.	List all products with the brand "Sir Rodney's" in the product name. 
*/

Select * From Products Where ProductName LIKE '%Sir Rodney''s%';


/*
5.	Create a list of product names and product IDs for products 
with supplier ID 20. Order by product name. */

Select ProductID, ProductName From Products Where SupplierID = 20
Order By ProductName ASC;

/*
6.	List the product ID and product name for products with 
zero units on order. Order by product ID. 
*/

Select ProductID, ProductName From Products Where UnitsOnOrder = 0
Order By ProductID ASC; 

/*
7. Your boss has asked you for a list of orders for
       the employee Janet Leverling. 
       The list should contain the order ID, the company name
	   of the customer, and the name of the employee who
	   helped place the order.
       (Hint: Use a JOIN to retrieve data from more than one table.)
*/
 
Select o.OrderID, c.CompanyName, e.FirstName + ' ' + e.LastName AS EmployeeName
From Orders o 
Join Customers c ON o.CustomerID = c.CustomerID
Join Employees e ON o.EmployeeID = e.EmployeeID
Where e.FirstName = 'Janet' AND e.LastName = 'Leverling';



/*
8. Insert a new record into the products table with a product name
    that is your favorite food, a unit price that is $4.55, supplier ID 26, and category ID 5.
*/
 
INSERT INTO Products (ProductName, UnitPrice, SupplierID, CategoryID)
VALUES ('Curry', 4.55, 26, 5);


/*
9. Display the new record you added to the products table 
where the product name is your favorite food.
*/

SELECT * FROM Products WHERE ProductName = 'Curry';

/*
10. Insert a record into the suppliers table.
    The record should contain the following values:
    - Supplier ID 30
	- Your school's name as the CompanyName
	- Your name as the ContactName
	- Manager as the ContactTitle
	- 123 Sesame Street as the address
    - Saint Paul as the city
*/

SET IDENTITY_INSERT Suppliers ON;

INSERT INTO Suppliers (SupplierID, CompanyName, ContactName, ContactTitle, Address, City)
VALUES (30, 'Minneapolis College', 'Luo Balo', 'Manager', '123 Sesame Street', 'Saint Paul');

/*
11. Display the new record that you created in the suppliers
    table to ensure it was inserted correctly.
*/

SELECT * FROM Suppliers WHERE SupplierID = 30;

/*
12. Update the record in the products table for your favorite food.
Change the unit price from $4.55 to $9.99.
*/

UPDATE Products SET UnitPrice = 9.99 WHERE ProductName = 'Curry';

/*
13. Insert a new record into the Categories table. 
Insert the values 'Ice Cream'and 'Frosty desserts' into the 
CategoryName and Description columns. You don't need to insert
a value into the CategoryID column because that it auto-populated.
You don't need to insert a value into the Picture column 
because it is optional.
*/

INSERT INTO Categories (CategoryName, Description)
VALUES ('Ice Cream', 'Frosty desserts');

/*
14. Delete the record you just inserted into the Categories table.
*/
 
DELETE FROM Categories WHERE CategoryName = 'Ice Cream';





	
 
