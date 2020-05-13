-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.ProductName, c.categoryName
from product as p
join category as c on p.categoryId = c.Id;

-- Display the order Id and shipper CompanyName ("ShipperName") for all orders placed before August 9 2012. Shows 429 records.
select O.id, S.companyName
from [Order] as O
join Shipper as S on O.ShipVia = S.Id
where O.orderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
    --productName from product, quantity from OD
    --join products and OD
    --where orderID = 10251
select p.ProductName, OD.Quantity, OD.OrderId
from OrderDetail as OD
join Product as p on p.Id = OD.ProductId
where OD.OrderId = 10251
order by p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    --ID from Order, CompanyName from Customer, LastName from Employee
    --label
select o.id as "Order Id", c.companyName as "Company Name", e.lastName as "Employee Last Name"
from [Order] as o
join Customer as c on o.customerId = c.Id
join Employee as e on o.employeeId = e.Id;