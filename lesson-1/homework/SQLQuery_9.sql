CREATE TABLE book (
    book_id INT IDENTITY(1, 1) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year INT
);

CREATE TABLE member (
    member_id INT  IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE loan (
    loan_id INT IDENTITY(1, 1) PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

INSERT INTO book (title, author, published_year) VALUES
('The psychology of money', 'John Doe', 2016),
('The changing world order', 'Ray Dalio', 2021);

INSERT INTO member (name, email, phone_number) VALUES
('Jane Doe', 'jane@gmail.com', '901234567'),
('Michael Brown', 'brown@gmail.com', '907654321');

INSERT INTO loan (book_id, member_id, loan_date) VALUES
(1, 1, '02/04/2025'),
(2, 2, '03/03/2025');

SELECT * FROM book;
SELECT * FROM member;
SELECT * FROM loan;