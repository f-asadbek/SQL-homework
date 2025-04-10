CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,      
    Name VARCHAR(100) NOT NULL,      
    DepartmentID INT,              
    Salary INT NOT NULL               
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,     
    DepartmentName VARCHAR(100) NOT NULL 
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,    
    ProjectName VARCHAR(100) NOT NULL,
    EmployeeID INT,                  
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary)
VALUES
    (1, 'Alice', 101, 60000),
    (2, 'Bob', 102, 70000),
    (3, 'Charlie', 101, 65000),
    (4, 'David', 103, 72000),
    (5, 'Eva', NULL, 68000);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (101, 'IT'),
    (102, 'HR'),
    (103, 'Finance'),
    (104, 'Marketing');

INSERT INTO Projects (ProjectID, ProjectName, EmployeeID)
VALUES
    (1, 'Alpha', 1),
    (2, 'Beta', 2),
    (3, 'Gamma', 1),
    (4, 'Delta', 4),
    (5, 'Omega', NULL);

-- TASK 1
SELECT E.EmployeeID, E.Name, E.Salary, D.DepartmentName
FROM Employees AS E
INNER JOIN Departments AS D
ON E.DepartmentID = D.DepartmentID;

-- TASK 2
SELECT E.*, D.*
FROM Employees AS E
LEFT OUTER JOIN  Departments AS D
ON E.DepartmentID = D.DepartmentID;

-- TASK 3
SELECT E.*, D.*
FROM Employees AS E
RIGHT OUTER JOIN Departments AS D
ON E.DepartmentID = D.DepartmentID;

-- TASK 4
SELECT E.*, D.*
FROM Employees AS E
FULL OUTER JOIN Departments AS D
ON E.DepartmentID = D.DepartmentID;

-- TASK 5
SELECT D.DepartmentName,
    SUM(E.Salary) AS TotalSalaryExpense
FROM Departments AS D
JOIN Employees AS E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName;

-- TASK 6
SELECT D.DepartmentName, P.ProjectName 
FROM Departments AS D 
CROSS JOIN Projects AS P;

-- TASK 7
SELECT E.*, D.*, P.*
FROM Employees AS E
LEFT OUTER JOIN Departments AS D
ON E.DepartmentID = D.DepartmentID
LEFT OUTER JOIN Projects AS P
ON E.EmployeeID = P.EmployeeID;