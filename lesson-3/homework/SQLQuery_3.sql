SELECT DISTINCT Category, Price,
    IIF(Stock = 0, 'Out of Stock',
        IIF(Stock BETWEEN 1 AND 10, 'Low Stock','In Stock')) AS QAZ
FROM Products AS P
WHERE P.Price = (SELECT MAX(Price) FROM Products WHERE Category = P.Category)
ORDER BY Price DESC