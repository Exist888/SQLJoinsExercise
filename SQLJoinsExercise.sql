/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
-- SELECT * FROM products
-- WHERE CategoryID = 1;
-- SELECT * FROM categories;
SELECT p.Name AS ProductName, c.Name AS CategoryName
FROM products AS p
INNER JOIN categories AS c
ON p.CategoryID = c.CategoryID
WHERE c.Name = "Computers";
 
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
-- SELECT * FROM products;
-- SELECT * FROM reviews;
SELECT p.Name, p.Price, r.Rating
FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
 
 
/* joins: find the employee* with the most total quantity* sold.  use the sum() function and group by */
-- tables(columns) - employees(EmpID, FirstN, LastN) and sales(EmpID, Quantity)
-- SELECT * FROM employees;
-- SELECT * FROM sales;
-- SELECT SUM(Quantity) AS TotalSales FROM sales
-- WHERE EmployeeID = 33809;
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS TotalSales
FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
-- WHERE s.Quantity = MAX(s.Quantity)
GROUP BY e.EmployeeID
ORDER BY TotalSales DESC
LIMIT 2;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
-- SELECT * FROM departments;
-- SELECT * FROM categories;
SELECT d.Name AS DepartmentName, c.Name AS CategoryName
FROM departments AS d
INNER JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" 
OR c.Name = "Games";


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
-- work with products(Name, ProductID) and sales(Quantity, PricerPerUnit)
-- SELECT * FROM products
-- WHERE Name LIKE "%Hotel California%";
-- SELECT * FROM sales
-- WHERE ProductID = 97;
SELECT p.Name AS ProductName, SUM(s.Quantity) AS TotalSales, SUM(s.PricePerUnit) AS TotalRevenue
FROM products AS p
INNER JOIN sales AS s
ON p.ProductID = s.ProductID
WHERE p.Name LIKE "%Hotel California%"
GROUP BY p.ProductID;


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
(only return for the lowest rating!) */
-- work with products(Name = Visio TV, ProductID for JOIN)  and reviews(Reviewer, Rating, Comment)
-- SELECT * FROM products WHERE Name LIKE "%Visio%";
-- SELECT * FROM reviews WHERE ProductID = 857;
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.Name = "Visio TV"
AND r.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID (employees), the employee's first and last name (employees)
-  the name of each product (products), and how many of that product they sold (sales)*/
-- JOIN employees to sales by EmployeeID
-- JOIN sales to product by ProductID
SELECT * FROM employees;
SELECT * FROM sales;
SELECT * FROM products;
SELECT e.EmployeeID AS SalesPersonID, e.FirstName, e.LastName, p.Name AS ProductName, s.Quantity As NumberSold
FROM employees AS e
INNER JOIN sales AS S
ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p
ON s.ProductID = p.ProductID;