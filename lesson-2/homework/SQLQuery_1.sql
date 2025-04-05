CREATE TABLE test_identity (
    id INT IDENTITY(1, 1), 
    name NVARCHAR(255)
);

INSERT INTO test_identity
VALUES
('John'),
('Mike'),
('Jane'),
('Alice'),
('James');

select * from test_identity;

delete from test_identity where id=7;

TRUNCATE TABLE test_identity;

DROP TABLE test_identity;

-- 1. DELETE deletes specific data from the table using WHERE keyword. If it does not use WHERE keyword, it deletes all rows. Identity columns stays intact.
-- 2. TRUNCATE can not delete specific row. It deletes all rows from a table. It resets identity columns. TRUNCATE is much quicker than DELETE.
-- 3. DROP completely removes table, database.