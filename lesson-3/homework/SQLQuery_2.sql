SELECT 
    CASE 
        WHEN Status = 'Pending' THEN 'Pending'
        WHEN Status = 'Cancelled' THEN 'Cancelled'
        WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
    END AS OrderStatus,
    COUNT(*) AS TotalOrders,
    SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    CASE 
        WHEN Status = 'Pending' THEN 'Pending'
        WHEN Status = 'Cancelled' THEN 'Cancelled'
        WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
    END
HAVING SUM(TotalAmount) > 5000
ORDER BY TotalRevenue DESC;