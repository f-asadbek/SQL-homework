CREATE TABLE student(
    id INT,
    name VARCHAR(100),
    age INT
);

ALTER TABLE dbo.student
ALTER COLUMN id INT NOT NULL;