-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.ProductName as [Product Name], c.CategoryName as [Category Name] from [Product] as p
join [Category] as c
on p.CategoryID = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
-- ? -> Returns 2323 records?
SELECT o.Id as [Shipping ID], s.CompanyName as [Company Name] FROM [Order] as o
JOIN [Shipper] AS s ON o.ShipVia = s.Id
WHERE o.OrderDate < "20120909"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select od.Id, p.ProductName as [Product Name], od.Quantity from [OrderDetail] as od
join [Product] as p on od.ProductId = p.Id
where od.OrderId = '10251'

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.Id as [Order ID], c.CompanyName as [Company Name], e.LastName as [Employee Last Name] from [Order] as o
join [Customer] as c on o.CustomerId = c.Id
join [Employee] as e on o.EmployeeId = e.Id