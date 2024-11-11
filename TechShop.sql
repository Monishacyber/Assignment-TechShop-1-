 --creating the database named as techshop

 CREATE DATABASE TechShop

 --defining the schema

 --creating customer table


 CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) UNIQUE NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  Address VARCHAR(200) NOT NULL
)

-- creating pruduct table

CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100) NOT NULL,
  Description VARCHAR(200) NOT NULL,
  Price DECIMAL NOT NULL
)

-- creating orders table

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT NOT NULL,
  OrderDate DATE NOT NULL,
  TotalAmount DECIMAL NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)

--creating order details table

CREATE TABLE OrderDetails (
  OrderDetailID INT PRIMARY KEY,
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)

--creating inventory table

CREATE TABLE Inventory (
  InventoryID INT PRIMARY KEY,
  ProductID INT NOT NULL,
  QuantityInStock INT NOT NULL,
  LastStockUpdate DATE NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)

-- ER Diagram is created

--the primary key and foreign key constraints for referential integrity is created in thr step 2

--inserting 10 sample values for each the tables

 --inserting 10 sample records in customer table


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St'),
(3, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-123-4567', '789 Oak St'),
(4, 'Alice', 'Williams', 'alice.williams@example.com', '901-234-5678', '321 Maple St'),
(5, 'Mike', 'Davis', 'mike.davis@example.com', '111-222-3333', '456 Pine St'),
(6, 'Emily', 'Taylor', 'emily.taylor@example.com', '444-555-6666', '789 Cedar St'),
(7, 'David', 'Lee', 'david.lee@example.com', '777-888-9999', '321 Spruce St'),
(8, 'Sarah', 'Hall', 'sarah.hall@example.com', '333-444-5555', '456 Fir St'),
(9, 'Kevin', 'White', 'kevin.white@example.com', '666-777-8888', '789 Birch St'),
(10, 'Lisa', 'Brown', 'lisa.brown@example.com', '999-000-1111', '321 Beech St')


--inserting 10 sample rocords in products table


INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(1, 'Laptop', 'High-performance laptop', 500),
(2, 'Phone', 'Smartphone', 300),
(3, 'Tablet', 'Portable tablet', 200),
(4, 'Headset', 'Gaming headset', 50),
(5, 'Monitor', '24-inch monitor', 150),
(6, 'Keyboard', 'Wireless keyboard', 30),
(7, 'Mouse', 'Wireless mouse', 20),
(8, 'Printer', 'Home printer', 100),
(9, 'Scanner', 'Document scanner', 80),
(10, 'Webcam', 'HD webcam', 40);


--inserting 10 sample records in the order table


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2022-01-01', 500),
(2, 2, '2022-01-05', 300),
(3, 3, '2022-01-10', 800),
(4, 4, '2022-01-15', 200),
(5, 5, '2022-01-20', 1200),
(6, 6, '2022-01-25', 600),
(7, 7, '2022-02-01', 900),
(8, 8, '2022-02-05', 400),
(9, 9, '2022-02-10', 1100),
(10, 10, '2022-02-15', 700)


--inserting 10 sample records in the orderdetails table


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 2),
(4, 3, 1, 2),
(5, 4, 4, 1),
(6, 5, 2, 3),
(7, 6, 5, 1),
(8, 7, 1, 2),
(9, 8, 6, 1),
(10, 9, 7, 2)


--inserting 10 sample records in the inventry table


INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES

(1, 1, 10, '2022-01-01'),
(2, 2, 20, '2022-01-05'),
(3, 3, 15, '2022-01-10'),
(4, 4, 30, '2022-01-15'),
(5, 5, 25, '2022-01-20'),
(6, 6, 40, '2022-01-25'),
(7, 7, 50, '2022-02-01'),
(8, 8, 35, '2022-02-05'),
(9, 9, 45, '2022-02-10'),
(10, 10, 60, '2022-02-15')

--task 2
--1: Write an SQL query to retrieve the names and emails of all customers.


SELECT  CONCAT (FirstName,' ',LastName) as CustomerNAme, Email
FROM Customers


--2: Write an SQL query to list all orders with their order dates and corresponding customer names.

SELECT CONCAT (FirstName,' ',LastName) as CustomerNAme ,OrderId,OrderDate
from Orders , Customers
WHERE Customers.CustomerID = Orders.OrderId



--3: Write an SQL query to insert a new customer record into the "Customers" table.


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) 
VALUES (11, 'New', 'Customer', 'new.customer@example.com', '123-456-7890', '123 New St')


--4: Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

SELECT *FROM Products

UPDATE Products 
SET Price = Price * 1.10



--5: Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables.

DECLARE @OrderId INT = 2

DELETE FROM Orders
WHERE OrderId = 2

--6: Write an SQL query to insert a new order into the "Orders" table.

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) 
VALUES (11, 11, '2024-03-01', 100.00)

SELECT * FROM Orders

--7: Write an SQL query to update the contact information of a specific customer.

 
UPDATE Customers 
SET Email = 'updated.email@eg.com', 
    Address = 'update 321 Main st' 
WHERE CustomerID = 2;

UPDATE Customers
SET Phone = 0987654321
WHERE CustomerId = 2

SELECT * FROM Customers

--8: Write an SQL query to recalculate and update the total cost of each order.


UPDATE O 
SET TotalAmount = (SELECT SUM(OD.Quantity * P.Price) 
                   FROM OrderDetails OD 
                   JOIN Products P 
                   ON OD.ProductID = P.ProductID 
                   WHERE OD.OrderID = O.OrderID) 
FROM Orders O;


--9: Write an SQL query to delete all orders and order details for a specific customer.

DELETE FROM OrderDetails
WHERE Orderld in (
    SELECT OrderID
    FROM Orders
    WHERE CustomerId=4
)

DELETE FROM Orders
WHERE CustomerID=4 




--10. Write an SQL query to insert a new electronic gadget product.


INSERT INTO Products (ProductID, ProductName, Description, Price) 
VALUES (11, 'New Gadget', 'Description of new gadget', 99.99)


--11.: Write an SQL query to update the status of a specific order

--here i dont have status column so im adding one more new column to see the status of the ordered items

ALTER TABLE Orders
ADD Status VARCHAR(50) CHECK (Status IN('Pending','Shipped','Delivered','Cancelled'))

SELECT * FROM Orders

--Setting the status values in the order table

UPDATE Orders
SET Status = 'Pending'
WHERE OrderId IN (11,4,7)


UPDATE Orders
SET Status = 'Shipped'
WHERE OrderId IN (2,5,8)


UPDATE Orders
SET Status = 'Delivered'
WHERE OrderId IN (3,6,9)


--updating the specific order in the orders table

UPDATE Orders
SET Status = 'Delivered'
WHERE OrderId IN (10)

SELECT * FROM Orders
--12.: Write an SQL query to calculate and update the number of orders placed by each customer

SELECT CustomerId , COUNT (OrderId) as OrderCount
FROM Orders
GROUP BY CustomerId 

ALTER TABLE Customers ADD Ordercount INT DEFAULT 0

UPDATE Customers
SET Ordercount=(SELECT count(*) 
               from Orders
where Orders.CustomerID=Customers.CustomerID)

--task 3
--1. Retrieve a list of all orders along with customer information

SELECT CONCAT (C.FirstNAme,' ',C.LastName) AS CustomerName , O.OrderId,  C.Email, O.OrderDate , O.Status
FROM Orders O
JOIN Customers C ON O.CustomerId = C.CustomerId

--2. Find the total revenue generated by each electronic gadget product


UPDATE Products
SET Category = 'Electronic'
WHERE ProductID IN (1,2,3,4,5,6,7,8,9,10,11)


SELECT P.ProductName, SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM OrderDetails OD
JOIN Products P ON OD.ProductId = P.ProductId
WHERE P.Category = 'Electronic'
GROUP BY P.ProductName

--3.List all customers who have made at least one purchase


select CustomerId, count(CustomerId)as TotalCount
from Orders
group by CustomerID
having count(CustomerID)=1

--4. Find the most popular electronic gadget

SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC


--5. Retrieve a list of electronic gadgets along with their corresponding categories

SELECT ProductName, Category
FROM Products 
WHERE Category = 'Electronic'


--6. Calculate the average order value for each customer

SELECT  C.CustomerId , AVG(O.TotalAmount) AS AverageOrderValue
FROM Customers C
JOIN Orders O ON C.CustomerId = O.CustomerId
GROUP BY C.CustomerId
ORDER BY CustomerID ASC

--7. Find the order with the highest total revenue

SELECT O.OrderId, C.CustomerID, O.TotalAmount
FROM Orders O
JOIN Customers C ON O.CustomerId = C.CustomerId
ORDER BY O.TotalAmount DESC

--8. List electronic gadgets and the number of times each product has been ordered

SELECT P.ProductName, COUNT(OD.OrderId) AS OrderFrequency
FROM OrderDetails OD
JOIN Products P ON OD.ProductId = P.ProductId

GROUP BY P.ProductName



--9. Find customers who have purchased a specific electronic gadget product

DECLARE @ProductName VARCHAR(50) = 'Mouse';

SELECT CONCAT(C.FirstName,' ',C.LastName) AS [Customer Name], C.Email
FROM Customers C
JOIN Orders O ON C.CustomerId = O.CustomerId
JOIN OrderDetails OD ON O.OrderId = OD.OrderId
JOIN Products P ON OD.ProductId = P.ProductId
WHERE P.ProductName = 'Mouse'

--10. Calculate the total revenue generated by all orders placed within a specific time period

DECLARE @StartDate DATE = '2022-01-01';
DECLARE @EndDate DATE = '2022-12-31';

SELECT SUM(O.TotalAmount) AS TotalRevenue
FROM Orders O
WHERE O.OrderDate BETWEEN @StartDate AND @EndDate

--TASK 4
--1. Find customers who have not placed any orders


SELECT CONCAT (FirstName,' ',LastName) AS CustomerNAme
FROM Customers
WHERE CustomerId NOT IN (
  SELECT CustomerId
  FROM Orders
)


--2. Total number of products available for sale


SELECT COUNT(*) AS TotalProducts
FROM (
  SELECT ProductId
  FROM Products
) AS P


--3. Total revenue generated by TechShop

SELECT SUM (TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderId IN (SELECT OrderId
                  FROM Orders)


--4. Average quantity ordered for products in a specific category


DECLARE @CategoryName VARCHAR(50) = 'Electronics';

SELECT AVG(Quantity) AS AverageQuantity
FROM (
  SELECT OD.Quantity
  FROM OrderDetails OD
  JOIN Products P ON OD.ProductId = P.ProductId
  WHERE P.Category = 'Electronic'
) AS Q


--5. Total revenue generated by a specific customer


DECLARE @CustomerId INT = 1;

SELECT SUM(TotalAmount) AS TotalRevenue
FROM (
  SELECT O.TotalAmount
  FROM Orders O
  WHERE O.CustomerId = 1
) AS R;


--6. Customers who have placed the most orders

SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--7. Most popular product category


SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING SUM(od.Quantity) = (SELECT MAX(TotalQuantity)
FROM (SELECT SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
) AS CategoryTotals
);


--8. Customer who has spent the most money on electronic gadgets


SELECT C.CustomerID, C.FirstName, C.LastName, SUM(OD.Quantity * P.Price) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.Category = 'Electronic'
GROUP BY C.CustomerID, C.FirstName, C.LastName
HAVING SUM(OD.Quantity * P.Price) = (
  SELECT MAX(TotalSpent)
  FROM (
    SELECT C.CustomerID, SUM(OD.Quantity * P.Price) AS TotalSpent
    FROM Customers C
    JOIN Orders O ON C.CustomerID = O.CustomerID
    JOIN OrderDetails OD ON O.OrderID = OD.OrderID
    JOIN Products P ON OD.ProductID = P.ProductID
    WHERE P.Category = 'Electronic'
    GROUP BY C.CustomerID
  ) AS Subquery
);


--9. Average order value for all customers


SELECT AVG(TotalAmount) AS AverageOrderValue
FROM (
  SELECT O.TotalAmount
  FROM Orders O
) AS OA;


--10. Total number of orders placed by each customer


SELECT c.CustomerID, c.FirstName, c.LastName, 
       (SELECT COUNT(o.OrderID) 
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID) AS TotalOrders
FROM Customers c;


