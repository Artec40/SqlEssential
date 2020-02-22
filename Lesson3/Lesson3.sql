CREATE DATABASE CompanyDB
ON
(
NAME = 'CompanyDB',
FILENAME ='C:\Repositories\SQLEssential\Lesson3\CompanyDB.mdf',
SIZE = 30 MB,
MAXSIZE = 100 MB,
FILEGROWTH = 10 MB
)

LOG ON
(
NAME ='logCompanyDB',
FILENAME = 'C:\Repositories\SQLEssential\Lesson3\CompanyDB.ldf',
SIZE = 5 MB,
MAXSIZE = 50 MB,
FILEGROWTH = 5 MB
)

COLLATE Cyrillic_General_CI_AS

USE CompanyDB

-- Таблицы - отделы, сотрудники, задания.

CREATE TABLE [Departments]
(
[DepartmentID] int IDENTITY NOT NULL
PRIMARY KEY,
[DepartmentName] varchar(30) NOT NULL,
)

CREATE TABLE [Staff]
(
[EmployeeID] int IDENTITY NOT NULL
PRIMARY KEY,
[EmployeeName] varchar(30) NOT NULL,
[EmployeeSurname] varchar(30) NOT NULL,
[EmployeePosition] varchar(30) NOT NULL,
[EmployeePhone] char(12) CHECK ([EmployeePhone] LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

ALTER TABLE [Staff]
ADD [DepartmentID] int NOT NULL


ALTER TABLE [Staff]
ADD CONSTRAINT [FK_DepartmentsDepartmentID]
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)

CREATE TABLE [Tasks]
([TaskID] int IDENTITY NOT NULL
PRIMARY KEY,
[TaskName] varchar(30) NOT NULL,
[TaskDate] Date NOT NULL,
[EmployeeID] int NOT NULL
)

ALTER TABLE [Tasks]
ADD CONSTRAINT [FK_StaffEmployeeID]
FOREIGN KEY (EmployeeID) REFERENCES Staff(EmployeeID)

SELECT * FROM Departments
SELECT * FROM Staff
SELECT * FROM Tasks

INSERT INTO [Departments]
VALUES
('Architector'),
('GeneralPlan'),
('Ventilation'),
('WaterSupply'), 
('PowerSupply');
GO

INSERT INTO [STAFF]
(EmployeeName,EmployeeSurname,EmployeePosition,EmployeePhone,DepartmentID)
VALUES
('Dmitriy','Andreev','Ведущий инженер','(908)1111111',1),
('Vladimir','Petuhov','Инженер 2-ой категории','(908)2222222',1),
('Aleksey', 'Enotovich', 'Ведущий инженер', '(923)1231231',2),
('Petr', 'Baklan', 'Инженер 1-ой категории','(900)0001122',3),
('Petr', 'Petrov', 'Инженер 2-ой категории','(911)0002111',3),
('Victor', 'Wooten', 'Ведущий инженер','(900)5554443',4),
('Oleg', 'Oleg', ' Инженер 3-ей категории','(953)0005005',4),
('Tatyana', ' Gubach', 'Ведущий инженер','(923)2331231',5),
('Victorya','Secret','Инженер 2-ой категории','(922)2223223',5);

INSERT INTO [TASKS]
(TaskName,TaskDate,EmployeeID)
VALUES
('Жилые дома Верхнеуфалейская','2020.06.18',1),
('Жилые дома Верхнеуфалейская','2020.06.18',3),
('Жилые дома Верхнеуфалейская','2020.06.18',6),
('Жилые дома Верхнеуфалейская','2020.06.18',8),
('Жилые дома Куйбышева','2020.08.14',2),
('Жилые дома Куйбышева','2020.08.14',3),
('Жилые дома Куйбышева','2020.08.14',5),
('Жилые дома Куйбышева','2020.08.14',7),
('Жилые дома Куйбышева','2020.08.14',9);
