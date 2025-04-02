CREATE TABLE invoice (
    invoice_id INT IDENTITY(1, 1) PRIMARY KEY,
    amount DECIMAL(10, 2)
);

INSERT INTO invoice (amount) VALUES (10.00), (20.00), (30.00), (40.00), (50.00);

SET IDENTITY_INSERT invoice ON;
INSERT INTO invoice (invoice_id, amount) VALUES (100, 60.00)
SET IDENTITY_INSERT invoice OFF;