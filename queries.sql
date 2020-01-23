-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.productName, c.categoryName
FROM product as p
JOIN category as c ON p.categoryId = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id, s.companyName
FROM [order] as o
JOIN shipper as s ON o.shipVIA = s.id
WHERE o.orderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT od.quantity, p.productName
FROM orderDetail as od
JOIN product as p 
	ON od.productId = p.id
WHERE od.orderId = 10251
ORDER BY p.id asc;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id as "Order Number", c.companyName as "Customer Company Name", e.lastName as "Employee Name"
FROM [order] as o
JOIN employee as e
	ON o.employeeID = e.id
JOIN customer as c
	ON o.customerID = c.id;