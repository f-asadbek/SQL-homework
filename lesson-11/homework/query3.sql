CREATE TABLE Employee_WorkLogs (
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(255) NOT NULL,
    Department VARCHAR(255) NOT NULL,
    WorkDate DATE NOT NULL,
    HoursWorked INT NOT NULL,
    PRIMARY KEY (EmployeeID, WorkDate)
);

INSERT INTO Employee_WorkLogs (EmployeeID, EmployeeName, Department, WorkDate, HoursWorked)
VALUES
(1, 'Alice', 'HR', '2024-03-01', 8),
(2, 'Bob', 'IT', '2024-03-01', 9),
(3, 'Charlie', 'Sales', '2024-03-02', 7),
(1, 'Alice', 'HR', '2024-03-03', 6),
(2, 'Bob', 'IT', '2024-03-03', 8),
(3, 'Charlie', 'Sales', '2024-03-04', 9);

GO
  
CREATE VIEW vw_MonthlyWorkSummary AS
SELECT EmployeeID, EmployeeName, Department,
SUM(HoursWorked) AS TotalHoursWorked,
SUM(HoursWorked) OVER(PARTITION BY EmployeeID) AS TotalHoursDepartment,
AVG(HoursWorked) OVER(PARTITION BY EmployeeID) AS AvgHoursDepartment
FROM Employee_WorkLogs;

GO 
  
SELECT * FROM vw_MonthlyWorkSummary;