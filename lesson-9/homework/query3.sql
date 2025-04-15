DECLARE @N INT = 10;

WITH Fibonacci_Numbers AS (
    SELECT 1 AS Num, 1 AS Fibonacci_Number
    UNION ALL
    SELECT 2, 1
    UNION ALL
    SELECT Num + 1, 
        (SELECT Fibonacci_Number FROM Fibonacci_Numbers WHERE Num = FN.Num - 1) +
        (SELECT Fibonacci_Number FROM Fibonacci_Numbers WHERE Num = FN.Num - 2)
    FROM Fibonacci_Numbers AS FN
    WHERE Num < @N
)

SELECT *
FROM Fibonacci_Numbers
ORDER BY Num
OPTION (MAXRECURSION 1000);
