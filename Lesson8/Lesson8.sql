
CREATE DATABASE MyFunkDB
ON
(
NAME = 'MyFunkDB',
FILENAME = 'C:\Repositories\SQLEssential\Lesson8\MyFunkDB.mdf',
SIZE = 10 MB,
MAXSIZE = 100 MB,
FILEGROWTH = 10 MB
)
LOG ON
(
NAME = 'LogMyFunkDB',
FILENAME = 'C:\Repositories\SQLEssential\Lesson8\MyFunkDB.ldf',
SIZE = 5 MB,
MAXSIZE = 50 MB,
FILEGROWTH = 5 MB
)

COLLATE Cyrillic_General_CI_AS

USE MyFunkDB

CREATE TABLE Employees
(
EmployeeID int IDENTITY NOT NULL PRIMARY KEY,
Name varchar(20) NOT NULL,
Surname varchar(20) NOT NULL,
Phone varchar(20) NOT NULL,
PlaceOfResidence varchar(20) NOT NULL
)

INSERT Employees
VALUES
('Nerzul','Lichkovskiy','8(908)9530505','Moscow'),
('Gul','Undeadov','8(908)9530606','Tyumen'),
('Kel','Tuzadov','8(908)9530707','Vladivostok'),
('Meat','Wagon','8(905)9050505','Vladivostok'),
('Arthas','Menetil','8(943)9430506', 'Saint-Petersburg')

CREATE TABLE WorkInfo
(
EmployeeID int NOT NULL FOREIGN KEY
REFERENCES Employees(EmployeeID),
Salary int NOT NULL,
Position varchar(20) NOT NULL
)

INSERT WorkInfo
VALUES
(1, 200000,'Главный директор'),
(2, 30000, 'Рабочий'),
(3, 70000, 'Менеджер'),
(4, 40000, 'Рабочий'),
(5, 80000, 'Менеджер')

CREATE TABLE PersonalInfo
(
EmployeeID int NOT NULL FOREIGN KEY
REFERENCES Employees(EmployeeID),
Married varchar(20) NOT NULL,
Birthday varchar(20) NOT NULL,
Adress varchar(20) NOT NULL
)

INSERT PersonalInfo
VALUES
(1, 'Married', '03.12.1976', 'Lenina 56'),
(2, 'Married', '01.01.1996', 'Lenina 53'),
(3, 'Not married', '05.11.1988', 'Malysheva 34'),
(4, 'Not married', '03.10.1985', 'Moskovskaya 35'),
(5, 'Married', '02.02.1996','Severnaya 3')

SELECT * FROM Employees
SELECT * FROM WorkInfo
SELECT * FROM PersonalInfo
GO

CREATE FUNCTION EmployeeContact()
RETURNS TABLE
AS
RETURN
(SELECT Employees.EmployeeID, Name, Surname, Adress FROM
Employees
INNER JOIN
PersonalInfo
ON Employees.EmployeeID = PersonalInfo.EmployeeID);
GO

SELECT * FROM EmployeeContact()
GO

CREATE PROC BirthdayInfo
AS
SELECT Employees.EmployeeID, Name, Surname, Phone, Birthday FROM
(Employees
INNER JOIN
PersonalInfo
ON Employees.EmployeeID = PersonalInfo.EmployeeID)
WHERE Married = 'Not married';
GO

EXEC BirthdayInfo
GO

CREATE FUNCTION ManagerBirthday()
RETURNS TABLE
AS
RETURN
SELECT Employees.EmployeeID, Name, Surname, Birthday, Phone FROM
(Employees
INNER JOIN
PersonalInfo
ON Employees.EmployeeID = PersonalInfo.EmployeeID)
INNER JOIN
WorkInfo
ON Employees.EmployeeID = WorkInfo.EmployeeID
WHERE WorkInfo.Position = 'Менеджер';
GO

SELECT * FROM ManagerBirthday()