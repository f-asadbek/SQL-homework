WITH Top10 AS (
    SELECT TOP 10 *
    FROM Employees
    ORDER BY Salary DESC
),
SalaryWithCategory AS (
    SELECT *,
        CASE 
            WHEN Salary > 80000 THEN 'High'
            WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
            ELSE 'Low'
        END AS SalaryCategory
    FROM Top10
),
DepartmentAvg AS (
    SELECT Department,
    AVG(Salary) AS AverageSalary
    FROM SalaryWithCategory
    GROUP BY Department
)
SELECT 
    S.EmployeeID,
    S.FirstName,
    S.LastName,
    D.Department,
    S.Salary,
    D.AverageSalary,
    S.SalaryCategory
FROM SalaryWithCategory AS S
JOIN DepartmentAvg AS D ON S.Department = D.Department
ORDER BY D.AverageSalary DESC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;
