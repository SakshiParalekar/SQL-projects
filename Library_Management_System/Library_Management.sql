
-- Library Management System

-- Create Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    quantity INT(11)
);

-- Create Students table
 CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(50),
    year INT
 );

-- Create Issued Books table
 CREATE TABLE Issued_Books (
    issue_id INT PRIMARY KEY,
    book_id INT,
    student_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
 );

-- Insert sample data into Books
INSERT INTO Books VALUES
    (111, 'The Cricket on the Hearth', 'Charles Dickens', 2)
    (112, 'Gitanjali', 'Rabindranath Tagore', 4)
    (113, '1984', 'George Orwell', 3)
    (114, 'Macbeth', 'William Shakespeare', 5)

-- Insert sample data into Students
INSERT INTO Students VALUES
    (1, Shreya, Computer Science, 2023)
    (2, Samarth, Information Technology, 2024)
    (3, Ronak, Biotechnology, 2024)
    (4, Vaidehi, Commerce, 2025)

-- Insert sample data into Issued Books
INSERT INTO Issued_Books VALUES
    (1, 111, 1, 2025-01-01, 2025-01-10)
    (2, 112, 2, 2025-02-15, 2025-02-25)
    (3, 113, 3, 2025-02-15, 2025-02-20)
    (4, 114, 4, 2025-04-06, 2025-04-18)

-- Select all student records
SELECT * FROM Students;

-- Display all Books
SELECT * FROM Books;

-- Join query to display Students who have issued books
 SELECT s.name, b.title, i.issue_date
 FROM Issued_Books i
 JOIN Students s ON i.student_id = s.student_id
 JOIN Books b ON i.book_id = b.book_id;

-- Books which are currently issued
 SELECT b.title
 FROM Issued_Books i
 JOIN Books b ON i.book_id = b.book_id
 WHERE i.return_date IS NULL;

-- Total issued books by each student
 SELECT s.name, COUNT(i.issue_id) AS total_issued
 FROM Issued_Books i
 JOIN Students s ON i.student_id = s.student_id
 GROUP BY s.name;

