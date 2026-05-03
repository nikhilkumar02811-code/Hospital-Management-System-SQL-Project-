
CREATE TABLE Departments(
DepartmentID int primary key,
DepartmentName varchar(100) not null
)

CREATE TABLE Doctors(
DoctorID int primary key,
FirstName varchar(50),
LastName varchar(50),
Specialization varchar(100),
Email varchar(100),
Phone varchar(15),
DepartmentID int,
foreign key (DepartmentID) references Departments(DepartmentID)
)


CREATE TABLE Patients(
PatientID int primary key,
FirstName varchar(50),
LastName varchar(50),
Gender varchar(10),
DateofBirth date,
Phone varchar(20),
Email varchar(30)
)


CREATE TABLE Appointments(
AppointmentID int primary key,
PatientID int,
DoctorID int,
AppointmentDate date,
Reason varchar(30),
foreign key (PatientID) references Patients(PatientID),
foreign key (DoctorID)   references Doctors(DoctorID)
)

CREATE TABLE Treatments(
TreatmentId int primary key,
PatientID int,
DoctorID int,
Diagnosis VARCHAR(255),
Treatment VARCHAR(255),
TreatmentDate DATE,
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
)


-- Departments
INSERT INTO Departments VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics');

-- Doctors
INSERT INTO Doctors VALUES
(1, 'John', 'Doe', 'Cardiologist', 'john.doe@hospital.com', '1234567890', 1),
(2, 'Emily', 'Clark', 'Neurologist', 'emily.clark@hospital.com', '2345678901', 2),
(3, 'Michael', 'Brown', 'Orthopedic Surgeon', 'michael.brown@hospital.com', '3456789012', 3);

-- Patients
INSERT INTO Patients VALUES
(101, 'Alice', 'Smith', 'Female', '1985-04-12', '4567890123', 'alice@example.com'),
(102, 'Bob', 'Williams', 'Male', '1990-08-22', '5678901234', 'bob@example.com'),
(103, 'Catherine', 'Johnson', 'Female', '1978-11-02', '6789012345', 'catherine@example.com');

-- Appointments
INSERT INTO Appointments VALUES
(1001, 101, 1, '2025-07-01', 'Checkup'),
(1002, 102, 2, '2025-07-02', 'Headache'),
(1003, 103, 1, '2025-07-03', 'Chest Pain');

-- Treatments
INSERT INTO Treatments VALUES
(501, 101, 1, 'Hypertension', 'Medication', '2025-07-01'),
(502, 103, 1, 'Angina', 'Surgery', '2025-07-03');
