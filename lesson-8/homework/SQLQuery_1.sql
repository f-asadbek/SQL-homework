CREATE TABLE Groupings
(
StepNumber  INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NOT NULL,
[Status]    VARCHAR(100) NOT NULL
);
INSERT INTO Groupings (StepNumber, TestCase, [Status]) 
VALUES
(1,'Test Case 1','Passed'),
(2,'Test Case 2','Passed'),
(3,'Test Case 3','Passed'),
(4,'Test Case 4','Passed'),
(5,'Test Case 5','Failed'),
(6,'Test Case 6','Failed'),
(7,'Test Case 7','Failed'),
(8,'Test Case 8','Failed'),
(9,'Test Case 9','Failed'),
(10,'Test Case 10','Passed'),
(11,'Test Case 11','Passed'),
(12,'Test Case 12','Passed');

SELECT 
    MIN(StepNumber) AS "Min Step Number",
    MAX(StepNumber) AS "Max Step Number",
    Status,
    COUNT(*) AS "Consecutive Count"
FROM (
    SELECT 
        StepNumber,
        Status,
        (ROW_NUMBER() OVER (ORDER BY StepNumber) - 
         ROW_NUMBER() OVER (PARTITION BY Status ORDER BY StepNumber)) AS GroupNum
    FROM Groupings
) AS StatusGroups
GROUP BY Status, GroupNum
ORDER BY "Min Step Number";