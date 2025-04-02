CREATE TABLE books (
    book_id INT IDENTITY(1, 1) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) CHECK (price > 0),
    genre VARCHAR(255) DEFAULT 'Unknown'
);

INSERT INTO books(title, price, genre) VALUES
('The psychology of money', 10.00, 'Finance');

INSERT INTO books(title, price, genre) VALUES
('', 34.43, 'Fiction');

INSERT INTO books(title, price, genre) VALUES
('Atomic Habits', -32.45, 'Classic');

INSERT INTO books(title, price) VALUES
('Why we sleep', 23.00);

SELECT * from books