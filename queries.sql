-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT
    ProductName,
	CategoryName
FROM Product
JOIN Category
ON CategoryId=Category.Id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT
    'Order'.Id,
	CompanyName
FROM 'Order'
JOIN Shipper
ON ShipVia=Shipper.Id
WHERE OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
    ProductName,
	Quantity
FROM OrderDetail
JOIN 'Order'
ON OrderId='Order'.id
JOIN Product
ON ProductId=Product.Id
WHERE OrderDetail.OrderId=10251
ORDER BY ProductName;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT
    OrderId,
    CompanyName,
    LastName
FROM OrderDetail
JOIN 'Order'
ON OrderId='Order'.id
JOIN Customer
ON CustomerId=Customer.id
JOIN Employee
ON EmployeeId=Employee.id
GROUP BY OrderId;