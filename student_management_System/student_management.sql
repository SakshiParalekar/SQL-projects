
-- Student Management System SQL Script

-- Create Students table
CREATE TABLE student (
  CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name varchar(50),
    age INT,
    gender VARCHAR(10),
    course_id INT
    );

-- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration_months INT
    );

-- Create Results table
CREATE TABLE Results (
    result_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
    );

-- Insert sample data into Students
INSERT INTO Students VALUES
    (101, 'Sanika Patil', 20, 'Female', 1),
    (102, 'rahul Sharma', 21, 'Male', 2),
    (103, 'Priya Verma', 20, 'Female', 1),
    (104, 'Amit Joshi', 24, 'Male', 3);

-- Insert sample data into Courses
INSERT INTO Courses VALUES
    (1, 'Computer Science', 36),
    (2, 'Commerce', 36),
    (3, 'Arts', 36);

-- Insert sample data into Results
INSERT INTO Results VALUES
    (1, 101, 1, 90),
    (2, 102, 2, 85),
    (3, 103, 1, 94),
    (4, 104, 3, 70);

-- Select all student records
SELECT * FROM Students;

-- Display Results
SELECT * FROM Results;

-- Join query to display student results with their names
SELECT s.NAME, r.marks
    FROM Students s
    JOIN Results r on s.student_id =
    r.student_id
    ORDER BY r.marks DESC
    LIMIT 3;

-- Average Marks in each Course
SELECT c.course_name, AVG(r.marks) AS avg_marks
    FROM Courses c
    JOIN Results r ON c.course_id = r.course_id
    GROUP BY c.course_name;

-- Students who scored above 40 marks
SELECT s.name, r.marks
    FROM Students s
    JOIN Results r on s.student_id =
    r.student_id
    WHERE r.marks >= 40;

-- List of Female Students
SELECT name
    FROM Students
    WHERE gender = 'Female';

