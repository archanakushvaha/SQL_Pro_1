CREATE DATABASE DATA_DIGGER;

SHOW DATABASES;

USE DATA_DIGGER;

CREATE TABLE IF NOT EXISTS Customers(
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Address VARCHAR(50));

SHOW TABLES;
DESC Customers;

INSERT INTO Customers (CustomerTD , Name, Email , Address) VALUES
(1 , 'Amirt', 'amirt@gmail.com', 'Surat'),
(2 , 'Rahul', 'rahul@gmail.com', 'Vadodara'),
(3 , 'Priya', 'priya@gmail.com', 'Ahmedabad'),
(4 , 'Amit', 'amit@gmail.com', 'Rajkot'),
(5 ,'Neha', 'neha@gmail.com', 'Mumbai');

SELECT * FROM Customers;

UPDATE Customers SET ADDRESS = 'PUNE' WHERE CustomerID = 1;

SELECT * FROM Customers;

DELETE FROM Customers WHERE CustomerID = 5;

SELECT * FROM Customers;  

INSERT INTO Customers (Name, Email, Address)VALUES
('Alice', 'Alice@gmail.com', 'Rajkort');

SELECT * FROM Customers WHERE NAME = 'Alice';

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
SELECT CustomerID, Name
FROM Customers;

INSERT INTO Orders(CustomerID, OrderDate, TotalAmount) VALUES
(1, '2026-01-10', 1500.00),
(2, '2026-01-12', 2500.00),
(3, '2026-01-15', 1800.50),
(1, '2026-01-20', 3200.00),
(2, '2026-01-25', 900.00);

SELECT * FROM Orders;

SELECT * FROM Orders WHERE CustomerID = 1;

UPDATE Orders SET TotalAmount = 3500.00 WHERE OrderID = 1;

DELETE FROM Orders WHERE OrderID = 12; 

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES (1, CURDATE(), 1200.00);

SELECT * FROM Orders WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY AND OrderDate <= CURDATE();

SELECT 
MAX(TotalAmount) AS Highest_Amount,
MIN(TotalAmount) AS Lowest_Amount,
AVG(TotalAmount) AS Average_Amount
FROM Orders;

CREATE TABLE Products(
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT);

SHOW TABLES;
DESC Products;

INSERT INTO Products (ProductName, Price, Stock) VALUES
('Headphones', 1500.00, 20),
('Keyboard', 800.00, 15),
('Mouse', 500.00, 30),
('Monitor', 12000.00, 10),
('USB Cable', 250.00, 50);

SELECT * FROM Products;

SELECT * FROM Products ORDER BY Price DESC;

UPDATE Products SET Price = 900 WHERE ProductID = 2;

DELETE FROM Products WHERE Stock = 0;

UPDATE Products SET Stock = 0 WHERE ProductID = 5;

SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

SELECT ProductName, Price FROM Products WHERE Price = (SELECT MAX(Price) FROM Products) OR Price = (SELECT MIN(Price) FROM Products);

CREATE TABLE Orderdetails(
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

SHOW TABLES; 
DESC Orderdetails;

SELECT OrderID FROM Orders ORDER BY OrderID;

SELECT ProductID, ProductName FROM Products ORDER BY ProductID;

INSERT INTO Orderdetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(31, 1, 2, 3000.00),
(32, 2, 1, 900.00),
(13, 3, 2, 1000.00),
(14, 4, 1, 12000.00),
(15, 1, 3, 4500.00);

SELECT * FROM Orderdetails;

SELECT * FROM Orderdetails WHERE OrderID = 31;

SELECT SUM(SubTotal) AS Total_Revenue FROM Orderdetails;

SELECT ProductID, SUM(Quantity) AS Total_Quantity FROM Orderdetails
GROUP BY ProductID
ORDER BY Total_Quantity DESC
LIMIT 3;

SELECT ProductID, COUNT(*) AS Times_Sold FROM Orderdetails
WHERE ProductID = 1 GROUP BY ProductID;
