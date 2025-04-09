CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Jack', 'HR', 52000, '2021-03-29')
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');

-- TASK 1
SELECT *, 
    ROW_NUMBER() OVER(ORDER BY Salary DESC) AS RANK
FROM Employees;

--TASK 2
SELECT 
    *,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS Rank
FROM Employees
WHERE Salary IN (
    SELECT Salary
    FROM Employees
    GROUP BY Salary
    HAVING COUNT(*) > 1
)
ORDER BY EmployeeID;


-- TASK 3
SELECT *
FROM(
    SELECT Department, Salary,
    DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS RANK
    FROM Employees
) AS RANK
WHERE RANK <= 2;

-- TASK 4
SELECT *
FROM(
    SELECT *,
    DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary) AS RANK
    FROM Employees
) AS RANK
WHERE RANK = 1;

-- TASK 5
SELECT *,
    SUM(Salary) OVER(PARTITION BY Department ORDER BY Salary) AS RANK
FROM Employees;

-- TASK 6
SELECT  Distinct Department, 
    SUM(SALARY) OVER(PARTITION BY Department) AS TotalSalary
FROM Employees
ORDER BY Department;

-- TASK 7
SELECT  Distinct Department, 
    CAST(AVG(SALARY) OVER(PARTITION BY Department) AS DECIMAL(10, 2)) AS TotalSalary
FROM Employees
ORDER BY Department;

-- TASK 8
SELECT  *,
    CAST(Salary - AVG(Salary) OVER(PARTITION BY Department) AS DECIMAL(10, 2)) AS Difference
FROM Employees
ORDER BY EmployeeID;

-- TASK 9
SELECT *,
    CAST(AVG(Salary) OVER(ORDER BY EmployeeID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS DECIMAL(10, 2)) AS MovingAvgSalary
FROM Employees;

-- TASK 10
SELECT *,
    SUM(Salary) OVER(ORDER BY HireDate DESC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Last3SalarySum
FROM Employees;

-- TASK 11
SELECT *, 
    CAST(AVG(Salary) OVER(ORDER BY HireDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS DECIMAL(10, 2)) AS RunningAvgAllEmp
FROM Employees;

--TASK 12
SELECT *,
    MAX(Salary) OVER(ORDER BY EmployeeID ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS MaxSalaryWindow
FROM Employees;

-- TASK 13
SELECT *,
    CAST(Salary * 100 / SUM(Salary) OVER(PARTITION BY Department) AS DECIMAL(10, 2))
FROM Employees