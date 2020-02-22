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

-- ������� - ������, ����������, �������.

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
('Dmitriy','Andreev','������� �������','(908)1111111',1),
('Vladimir','Petuhov','������� 2-�� ���������','(908)2222222',1),
('Aleksey', 'Enotovich', '������� �������', '(923)1231231',2),
('Petr', 'Baklan', '������� 1-�� ���������','(900)0001122',3),
('Petr', 'Petrov', '������� 2-�� ���������','(911)0002111',3),
('Victor', 'Wooten', '������� �������','(900)5554443',4),
('Oleg', 'Oleg', ' ������� 3-�� ���������','(953)0005005',4),
('Tatyana', ' Gubach', '������� �������','(923)2331231',5),
('Victorya','Secret','������� 2-�� ���������','(922)2223223',5);

INSERT INTO [TASKS]
(TaskName,TaskDate,EmployeeID)
VALUES
('����� ���� ����������������','2020.06.18',1),
('����� ���� ����������������','2020.06.18',3),
('����� ���� ����������������','2020.06.18',6),
('����� ���� ����������������','2020.06.18',8),
('����� ���� ���������','2020.08.14',2),
('����� ���� ���������','2020.08.14',3),
('����� ���� ���������','2020.08.14',5),
('����� ���� ���������','2020.08.14',7),
('����� ���� ���������','2020.08.14',9);
