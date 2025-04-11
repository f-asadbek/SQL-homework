CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES 
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Products (ProductID, ProductName, Category) VALUES 
(101, 'Laptop', 'Electronics'),
(102, 'Smartphone', 'Electronics'),
(103, 'Desk Chair', 'Furniture');

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES 
(1001, 1, '2025-04-01'),
(1002, 2, '2025-04-03'),
(1003, 3, '2025-04-05');

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES 
(1, 1001, 101, 1, 1200.00),
(2, 1001, 103, 2, 150.00),
(3, 1002, 102, 1, 800.00),
(4, 1003, 103, 4, 600.00);

SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM OrderDetails
SELECT * FROM Products
-- TASK 1
SELECT C.*, O.OrderID, O.OrderDate
FROM Customers AS C 
JOIN Orders AS O  
ON C.CustomerID = O.CustomerID;

-- TASK 2
SELECT C.*, O.OrderID, O.OrderDate
FROM Customers AS C 
JOIN Orders AS O  
ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL;

--TASK 3
SELECT OD.ProductID, P.ProductName, OD.Quantity, OD.Price, P.Category
FROM OrderDetails AS OD
JOIN Products AS P 
ON OD.ProductID = P.ProductID;

-- TASK 4
SELECT C.CustomerID, C.CustomerName, COUNT(O.OrderID) AS OrderCount
FROM Customers AS C
JOIN Orders AS O 
ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CustomerName
HAVING COUNT(O.OrderID) > 1;

-- TASK 5
SELECT OD.OrderID, P.ProductName, OD.Price
FROM OrderDetails AS OD
JOIN Products AS P 
ON OD.ProductID = P.ProductID
WHERE OD.Price = (
    SELECT MAX(OD2.Price)
    FROM OrderDetails AS OD2
    WHERE OD2.OrderID = OD.OrderID
);

-- TASK 6
SELECT C.CustomerID, C.CustomerName, O.OrderDate
FROM Customers AS C 
JOIN Orders AS O 
ON C.CustomerID = O.CustomerID
WHERE O.OrderDate = (
    SELECT MAX(O2.OrderDate)
    FROM Orders AS O2
    WHERE O2.CustomerID = O.CustomerID
);

-- TASK 7
SELECT C.CustomerID, C.CustomerName
FROM Customers AS C
JOIN Orders AS O 
ON C.CustomerID = O.CustomerID
JOIN OrderDetails AS OD 
ON O.OrderID = OD.OrderID
JOIN Products AS P 
ON OD.ProductID = P.ProductID
GROUP BY C.CustomerID, C.CustomerName
HAVING COUNT(DISTINCT P.Category) = 1 AND MAX(P.Category) = 'Electronics';

-- TASK 8
SELECT DISTINCT C.CustomerID, C.CustomerName
FROM Customers AS C
JOIN Orders AS O 
ON C.CustomerID = O.CustomerID
JOIN OrderDetails AS OD 
ON O.OrderID = OD.OrderID
JOIN Products AS P 
ON OD.ProductID = P.ProductID
WHERE P.Category = 'Stationery';

-- TASK 9
SELECT C.CustomerID, C.CustomerName,
    SUM(OD.Quantity * OD.Price) AS TotalSpent
FROM Customers AS C
JOIN Orders AS O 
ON C.CustomerID = O.CustomerID
JOIN OrderDetails AS OD 
ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.CustomerName;