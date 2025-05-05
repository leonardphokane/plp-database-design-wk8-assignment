-- Create Database
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- Authors Table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Categories Table
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Books Table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    author_id INT NOT NULL,
    category_id INT,
    copies_available INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Members Table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE DEFAULT CURRENT_DATE
);

-- Loans Table
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE DEFAULT CURRENT_DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Sample Data
INSERT INTO authors (name, bio) VALUES 
('Chinua Achebe', 'Nigerian novelist and poet'),
('J.K. Rowling', 'British author of Harry Potter series');

INSERT INTO categories (name) VALUES ('Fiction'), ('Fantasy'), ('Biography');

INSERT INTO books (title, isbn, author_id, category_id, copies_available) VALUES
('Things Fall Apart', '9780435905255', 1, 1, 5),
('Harry Potter and the Sorcerer\'s Stone', '9780747532699', 2, 2, 10);

INSERT INTO members (name, email) VALUES
('John Doe', 'john@example.com'),
('Jane Smith', 'jane@example.com');

INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2025-05-01', NULL),
(2, 2, '2025-05-02', '2025-05-05');
