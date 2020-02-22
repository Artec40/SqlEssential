-- Создать базу данных с именем "MyDB"
-- В созданной базе данных создать 3 таблицы:
-- 1-я содержит имена и номера телефонов сотрудников некой компании
-- 2-я содержит ведомости об их зарплате и должностях
-- 3-я содержит информацию о семейном положении, дате рождения и месте проживания

CREATE DATABASE MyDB
ON
(
NAME = 'MyDB',
FILENAME ='C:\Repositories\SQLEssential\Lesson1\MyDB.mdf',
SIZE = 10 MB,
MAXSIZE = 100 MB,
FILEGROWTH = 10 MB
)

LOG ON
(
NAME ='logMyDB',
FILENAME = 'C:\Repositories\SQLEssential\Lesson1\MyDB.ldf',
SIZE = 5 MB,
MAXSIZE = 50 MB,
FILEGROWTH = 5 MB
)

COLLATE Cyrillic_General_CI_AS

USE MyDB

CREATE TABLE PersonalInfo
(
EmployeeName Varchar(20) NOT NULL,
PhoneNumber char(10) NOT NULL
)

CREATE TABLE WorkInfo
(
Salary int NOT NULL,
Position Varchar(20) NOT NULL
)

CREATE TABLE PassportInfo
(
MaritalStatus bit NOT NULL,
BirthDate date NOT NULL,
PlaceOfResidence Varchar(20) NOT NULL
)
GO