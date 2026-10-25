CREATE DATABASE DataDigger;

USE DataDigger;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(200));

INSERT INTO Customers(CustomerID, Name, Email, Address)VALUES
(1, 'Alice', 'alice@gmail.com', 'Surat'),
(2, 'Bob', 'bob@gmail.com', 'Ahmedabad'),
(3, 'Alice', 'alice2@gmail.com', 'Vadodara'),
(4, 'Charlie', 'charlie@gmail.com', 'Rajkot'),
(5, 'David', 'david@gmail.com', 'Mumbai');

SELECT * FROM Customers;

UPDATE Customers SET Address = 'Gandhinagar' WHERE CustomerID = 2;

DELETE FROM Customers WHERE CustomerID = 5;

SELECT * FROM Customers WHERE Name = 'Alice';

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)ON DELETE CASCADE);

INSERT INTO Orders(OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, CURDATE() - INTERVAL 2 DAY, 2500),
(102, 2, CURDATE() - INTERVAL 5 DAY, 1200),
(103, 3, CURDATE() - INTERVAL 10 DAY, 3500),
(104, 1, CURDATE() - INTERVAL 20 DAY, 800),
(105, 4, CURDATE() - INTERVAL 40 DAY, 4500);

SELECT * FROM Orders;

SELECT * FROM Orders WHERE CustomerID = 1;

UPDATE Orders SET TotalAmount = 2800 WHERE OrderID = 101;

DELETE FROM Orders WHERE OrderID = 105;

SELECT * FROM Orders WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY AND OrderDate <= CURDATE();

SELECT
    MAX(TotalAmount) AS HighestAmount,
    MIN(TotalAmount) AS LowestAmount,
    AVG(TotalAmount) AS AverageAmount FROM Orders;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT);

INSERT INTO Products(ProductID, ProductName, Price, Stock) VALUES
(201, 'Laptop', 45000, 10),
(202, 'Keyboard', 800, 25),
(203, 'Mouse', 500, 30),
(204, 'Monitor', 12000, 8),
(205, 'Headphones', 1500, 0);

SELECT * FROM Products;

SELECT *FROM Products ORDER BY Price DESC;

UPDATE Products SET Price = 900 WHERE ProductID = 202;

DELETE FROM Products WHERE Stock = 0;

SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

SELECT MAX(Price) AS HighestPrice FROM Products;

SELECT MIN(Price) AS LowestPrice FROM Products;

SELECT * FROM Products WHERE Price = (SELECT MAX(Price) FROM Products);

SELECT * FROM Products WHERE Price = (SELECT MIN(Price) FROM Products);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE);

INSERT INTO OrderDetails(OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 101, 201, 1, 45000),
(2, 101, 202, 2, 1600),
(3, 102, 203, 3, 1500),
(4, 103, 204, 1, 12000),
(5, 104, 202, 1, 800);

SELECT * FROM OrderDetails;

SELECT * FROM OrderDetails WHERE OrderID = 101;

SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;

SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantityOrdered DESC
LIMIT 3;

SELECT
    ProductID,
    COUNT(*) AS TimesSold
FROM OrderDetails
WHERE ProductID = 202
GROUP BY ProductID;

