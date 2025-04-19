CREATE TABLE Orders_DB1 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    Product VARCHAR(255) NOT NULL,
    Quantity INT NOT NULL
);

INSERT INTO Orders_DB1 (OrderID, CustomerName, Product, Quantity)
VALUES
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2),
(103, 'Charlie', 'Tablet', 1),
(104, 'David', 'Monitor', 1);

CREATE TABLE Orders_DB2 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    Product VARCHAR(255) NOT NULL,
    Quantity INT NOT NULL
);

INSERT INTO Orders_DB2 (OrderID, CustomerName, Product, Quantity)
VALUES
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2);

DECLARE @MissingOrders TABLE (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

INSERT INTO @MissingOrders (OrderID, CustomerName, Product, Quantity)
SELECT OrderID, CustomerName, Product, Quantity
FROM Orders_DB1
WHERE OrderID NOT IN (SELECT OrderID FROM Orders_DB2);

SELECT OrderID, CustomerName, Product, Quantity
FROM @MissingOrders;