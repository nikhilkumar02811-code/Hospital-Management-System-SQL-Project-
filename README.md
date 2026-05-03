🏥 Hospital Management System (SQL Project)

📌 Overview

This project is a **Hospital Management System** built using SQL to manage and analyze hospital data including departments, doctors, patients, appointments, and treatments.
It demonstrates hands-on experience in **database design, data insertion, and advanced SQL querying** using real-world scenarios.


🛠️ Tech Stack

* SQL Server
* SQL Server Management Studio (SSMS)


🗂️ Project Structure

```text
Hospital-Management-SQL-Project/
│── schema.sql      # Table creation + data insertion  
│── queries.sql     # Analysis queries  
│── README.md  
```


🏗️ Database Schema

The project consists of the following tables:

🔹 Departments

Stores hospital departments

* DepartmentID (Primary Key)
* DepartmentName

🔹 Doctors

Stores doctor details and department mapping

* DoctorID (Primary Key)
* FirstName, LastName
* Specialization
* Email, Phone
* DepartmentID (Foreign Key)

🔹 Patients

Stores patient information

* PatientID (Primary Key)
* FirstName, LastName
* Gender
* DateOfBirth
* Phone, Email

🔹 Appointments

Tracks appointments between patients and doctors

* AppointmentID (Primary Key)
* PatientID (Foreign Key)
* DoctorID (Foreign Key)
* AppointmentDate
* Reason

🔹 Treatments

Stores diagnosis and treatment details

* TreatmentID (Primary Key)
* PatientID (Foreign Key)
* DoctorID (Foreign Key)
* Diagnosis
* Treatment
* TreatmentDate


🔗 Relationships

* One **Department → Many Doctors**
* One **Doctor → Many Appointments & Treatments**
* One **Patient → Many Appointments & Treatments**


📊 Data Included

* 3 Departments (Cardiology, Neurology, Orthopedics)
* 3 Doctors with specializations
* 3 Patients with demographic details
* Appointment records with reasons
* Treatment records with diagnosis and treatment


🧠 SQL Concepts Used

* Basic SELECT Queries
* INNER JOIN (multi-table joins)
* Aggregation Functions (COUNT, GROUP BY)
* Subqueries (nested queries)
* Date Filtering (MONTH, YEAR conditions)
* DML Operations (INSERT, UPDATE, DELETE)


📸 Key Queries

🔹 Appointments with Patient & Doctor Names

```sql
SELECT A.AppointmentID, P.FirstName AS PatientName, D.FirstName AS DoctorName, A.AppointmentDate
FROM Appointments A
JOIN Patients P ON P.PatientID = A.PatientID
JOIN Doctors D ON D.DoctorID = A.DoctorID;
```

🔹 Treatments with Diagnosis

```sql
SELECT T.TreatmentID, P.FirstName AS PatientName, D.FirstName AS DoctorName,
       T.Treatment, T.Diagnosis, T.TreatmentDate
FROM Treatments T
JOIN Patients P ON P.PatientID = T.PatientID
JOIN Doctors D ON D.DoctorID = T.DoctorID;
```


🔹 Patient Count by Gender

```sql
SELECT Gender, COUNT(*) AS Total
FROM Patients
GROUP BY Gender;
```


🔹 Appointments per Doctor

```sql
SELECT D.FirstName, COUNT(*) AS AppointmentCount
FROM Appointments A
JOIN Doctors D ON D.DoctorID = A.DoctorID
GROUP BY D.FirstName;
```

🔹 Patients Treated by Dr. John Doe

```sql
SELECT FirstName, LastName
FROM Patients
WHERE PatientID IN (
    SELECT PatientID
    FROM Appointments
    WHERE DoctorID = (
        SELECT DoctorID FROM Doctors
        WHERE FirstName = 'John' AND LastName = 'Doe'
    )
);
```


🔹 Doctors with No Appointments

```sql
SELECT FirstName, LastName
FROM Doctors
WHERE DoctorID NOT IN (SELECT DoctorID FROM Appointments);
```

🔹 Appointments in July 2025

```sql
SELECT *
FROM Appointments
WHERE MONTH(AppointmentDate) = 7 AND YEAR(AppointmentDate) = 2025;
```

🚀 How to Run

1. Open SQL Server Management Studio (SSMS)
2. Run `schema.sql` to create tables and insert data
3. Run `queries.sql` to perform analysis

---

## 📈 Key Insights

* Distribution of patients by gender
* Doctor workload based on appointment count
* Patients treated by specific doctors
* Identification of doctors with no appointments
* Time-based analysis of appointments and treatments


## 🙌 Connect with Me

* 🔗 LinkedIn: https://www.linkedin.com/in/nikhil-kumar-97350b2a6
* 💻 GitHub: https://github.com/nikhilkumar02811-code

---

⭐ If you found this project useful, feel free to star the repository!
