CREATE TABLE data_types_demo (
    num_type1 INT,
    num_type2 DECIMAL(10, 2),
    char_type1 NCHAR(10),
    char_type2 NVARCHAR(255),
    date_type1 DATE,
    date_type2 TIME,
    unique_identifier UNIQUEIDENTIFIER
);

INSERT INTO data_types_demo (num_type1, num_type2, char_type1, char_type2, date_type1, date_type2, unique_identifier)
VALUES
(10,
10.23,
'A',
'Hello',
'2025-01-01',
'9:41:00', NEWID());

SELECT * FROM data_types_demo;