
------------- Basic SELECT Queries----------------------

--List all patients

SELECT * FROM Patients

--List all doctors

SELECT * FROM Doctors

--List all appointments

SELECT * FROM Appointments

--Show all departments

SELECT * FROM Departments


--JOIN Queries

--Show appointments with doctor and patient names

SELECT A.AppointmentID, P.FirstName as PatientName , D.FirstName as DoctorName ,A.AppointmentDate
FROM Appointments A
join Patients P on P.PatientID = A.PatientID
join Doctors D on D.DoctorID = A.DoctorID


--Show treatments with diagnosis and doctor info

SELECT T.TreatmentID , P.FirstName as PatientName , D.FirstName as DoctorName ,T.Treatment ,T.Diagnosis,T.TreatmentDate
FROM Treatments T
join Patients P on P.PatientID = T.PatientID
join Doctors D on D.DoctorID = T.DoctorID

--Aggregate Functions

--Count of patients per gender

SELECT Gender,count(*) as Total
FROM Patients
Group by Gender

--Number of appointments per doctor

SELECT D.FirstName ,count(*) as ApponitmentCount
FROM Appointments A
join Doctors D on D.DoctorID = A.DoctorID
GROUP BY D.FirstName

--Subqueries

--Find patients who had appointments with Dr. John Doe

SELECT FirstName,LastName FROM Patients
WHERE PatientID IN (
SELECT  PatientID FROM Appointments
       WHERE DoctorID =(SELECT DoctorID FROM Doctors WHERE FirstName = 'John' AND LastName = 'Doe')
)


--List doctors who have not had any appointments

SELECT FirstName ,LastName FROM Doctors
WHERE DoctorID NOT IN (SELECT DoctorID FROM Appointments)



--Date Queries
--Appointments in July 2025

SELECT * FROM Appointments
WHERE MONTH(AppointmentDate) = 7 AND YEAR(AppointmentDate) = 2025

--Treatments done after July 1, 2025

SELECT * FROM Treatments
WHERE TreatmentDate > '1-july-2025'


--DML Queries
--Update patient's phone number

UPDATE Patients SET Phone =111111
WHERE PatientID = 101

--Delete an appointment record

DELETE FROM Appointments
WHERE AppointmentID = 1002
 

--Insert a new doctor
INSERT INTO Doctors 
VALUES(4, 'Sarah', 'Lee', 'Dermatologist', 'sarah.lee@hospital.com', '7654321098', 1)

select * from Doctors
