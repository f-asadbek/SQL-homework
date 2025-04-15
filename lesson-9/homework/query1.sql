CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');
  
WITH EmployeeRank AS (
	SELECT *, 0 AS DEPTH
	FROM Employees
	WHERE EmployeeID IS NULL
  	UNION ALL 
  	SELECT E.*, ER.DEPTH + 1
  	FROM Employee AS E
  	INNER JOIN EmployeeRank AS ER
  	ON E.ManagerID = ER.EmployeeID
)
SELECT *
FROM EmployeeRank
ORDER BY EmployeeID;