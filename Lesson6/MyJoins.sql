CREATE DATABASE MyJoinsDBLesson6
ON
(
NAME = 'MyJoinsDBLesson6',
FILENAME = 'C:\Repositories\SQLEssential\Lesson6\MyJoinsDBLesson6.mdf',
SIZE = 30 MB,
MAXSIZE = 100 MB,
FILEGROWTH = 5 MB
)
LOG ON
(
NAME = 'LogMyJoinsDB',
FILENAME = 'C:\Repositories\SQLEssential\Lesson6\MyJoinsDBLesson6.ldf',
SIZE = 5 MB,
MAXSIZE = 30 MB,
FILEGROWTH = 5 MB
)

USE MyJoinsDBLesson6

CREATE TABLE Employee
(
EmployeeID int IDENTITY NOT NULL
PRIMARY KEY,
EmployeeName varchar(20) NOT NULL,
EmployeeSurname varchar(20) NOT NULL,
EmployeePhone varchar(14)  CHECK (EmployeePhone LIKE '+7([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL 
)
	
INSERT INTO Employee
VALUES
('Mihail', 'Meladze', '+7(908)9103736'),
('Alexey', 'Abuzin', '+7(953)9539539'),
('Vasiliy', 'Pupkin', '+7(955)1234567');

CREATE TABLE EmployeeWorkInformation
(
EmployeeID int NOT NULL
FOREIGN KEY REFERENCES Employee(EmployeeID),
Salary int NOT NULL,
Position varchar(20) NOT NULL
)

INSERT INTO EmployeeWorkInformation
VALUES
(1, 150000, 'Главный директор'),
(2, 50000, 'Менеджер'),
(3, 25000, 'Рабочий');

CREATE TABLE EmployeePersonalInformation
(
EmployeeID int NOT NULL
FOREIGN KEY REFERENCES Employee(EmployeeID),
MaritalStatus varchar(10) NOT NULL,
DateofBirth Date NOT NULL,
PlaceOfResidence varchar(20) NOT NULL
)

INSERT INTO EmployeePersonalInformation
VALUES
(1, 'Женат', '1996-03-03', 'Yekaterinburg'),
(2, 'Женат', '1994-07-15', 'Yekaterinburg'),
(3, 'Не женат', '1992-03-01', 'Yekaterinburg');

SELECT * FROM Employee
SELECT * FROM EmployeeWorkInformation
SELECT * FROM EmployeePersonalInformation

SELECT Employee.EmployeeID, Employee.EmployeePhone, PlaceOfResidence FROM 
Employee
INNER JOIN 
EmployeePersonalInformation
ON Employee.EmployeeID = EmployeePersonalInformation.EmployeeID

SELECT Employee.EmployeeID, EmployeeName, DateofBirth, EmployeePhone FROM 
Employee
INNER JOIN
EmployeePersonalInformation
ON Employee.EmployeeID = EmployeePersonalInformation.EmployeeID
WHERE EmployeePersonalInformation.MaritalStatus = 'Не женат'

SELECT Employee.EmployeeID, EmployeeName, DateofBirth, PlaceOfResidence FROM
Employee
INNER JOIN
EmployeePersonalInformation
ON Employee.EmployeeID = EmployeePersonalInformation.EmployeeID
INNER JOIN
EmployeeWorkInformation
ON Employee.EmployeeID = EmployeeWorkInformation.EmployeeID
WHERE Position = 'Менеджер'

SELECT EmployeeName, EmployeePhone, PlaceOfResidence FROM Employee, EmployeePersonalInformation
WHERE Employee.EmployeeID = 
(SELECT EmployeeWorkInformation.EmployeeID FROM EmployeeWorkInformation
WHERE Employee.EmployeeID = EmployeeWorkInformation.EmployeeID
and Employee.EmployeeID = EmployeePersonalInformation.EmployeeID)
