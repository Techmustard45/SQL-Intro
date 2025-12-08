/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name, c.Name FROM products AS p INNER JOIN categories AS c ON c.CategoryID = 1 = p.CategoryID;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating FROM products AS p INNER JOIN reviews AS r ON r.ProductID = p.ProductID WHERE r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT sum(s.Quantity), e.FirstName, e.LastName FROM sales AS s INNER JOIN employees AS e ON s.EmployeeID = e.EmployeeID GROUP BY s.EmployeeID ORDER BY SUM(s.Quantity) DESC;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.name, d.name FROM categories AS c INNER JOIN departments AS d ON c.DepartmentID = d.DepartmentID WHERE c.name = "Appliances" OR c.name = "Games";
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.name, SUM(s.quantity * p.Price), SUM(s.Quantity) FROM products AS p INNER JOIN sales AS s ON p.ProductID = s.ProductID WHERE p.name = "Eagles: Hotel California";
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name, r.reviewer, r.rating, r.comment FROM reviews AS r INNER JOIN products AS p ON r.ProductID = p.ProductID WHERE p.name = "Visio TV" AND r.rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.firstname, e.lastname, p.name, SUM(s.quantity) FROM employees AS e INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID INNER JOIN products AS p ON s.ProductID = p.ProductID GROUP BY e.EmployeeID, p.name ORDER BY e.EmployeeID;