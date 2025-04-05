CREATE TABLE student (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    classes INT NOT NULL,
    tuition_per_class DECIMAL(10, 2),
    total_tuition AS (classes * tuition_per_class)
);

INSERT INTO student (classes, tuition_per_class)
VALUES
(5, 100.00),
(7, 234.43),
(3, 150.23);

SELECT * FROM student;