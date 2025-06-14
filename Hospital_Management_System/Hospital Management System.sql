-- Hospital Management System

-- Create Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    disease VARCHAR(100)
 );

-- Create Doctors Table
 CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100)
 );

-- Create Appointments Table
 CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATE,
    time TIME,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
 );

-- Insert sample data into Patients
    (101, 'Sunil Shetty', 40, 'Male', 'Fever')
    (102, 'Simran Shaikh', 69, 'Female', 'Brain Tumor')
    (103, 'Sarang Desai', 30, 'Male', 'Cancer')

-- Insert sample data into Doctors
    (1, 'Dr.Nikhil Patil', 'Physician')
    (2, 'Dr.Rakhi Varma', 'Neurologist')
    (3, 'Dr.Teena Mehta', 'Oncologist')

-- Insert sample data into Appointments
    (1111, 101, 1, 2023-02-10, 00:00:08)
    (1112, 102, 2, 2023-03-15, 00:00:10)
    (1113, 103, 3, 2023-04-01, 00:00:07)

-- Select all patients records
SELECT * FROM Patients;

-- Display all appointments
SELECT * FROM Appointments;

-- Show appointments with patient and doctor names
 SELECT a.date, a.time, p.name AS patient, d.name AS doctor
 FROM Appointments a
 JOIN Patients p ON a.patient_id = p.patient_id
 JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- Count appointments per doctor
 SELECT d.name, COUNT(*) AS total_appointments
 FROM Appointments a
 JOIN Doctors d ON a.doctor_id = d.doctor_id
 GROUP BY d.name;

-- Patients having fever
 SELECT name FROM Patients WHERE disease = 'Fever';


