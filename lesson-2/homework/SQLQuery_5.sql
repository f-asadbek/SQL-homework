CREATE TABLE worker (
    id INT PRIMARY KEY,
    name NVARCHAR(100)
);

BULK INSERT worker
FROM '/Users/a.fayzullayev/PycharmProjects/PythonProject1/data.csv'
WITH (
    fieldterminator = ',',
    rowterminator = '\n',
    firstrow = 2
);

SELECT * FROM worker;