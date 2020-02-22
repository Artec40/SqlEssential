CREATE DATABASE HomeWork
ON
(
NAME = 'HomeWork',
FILENAME ='C:\Repositories\SQLEssential\Lesson2\HomeWork.mdf',
SIZE = 10 MB,
MAXSIZE = 100 MB,
FILEGROWTH = 10 MB
)

LOG ON
(
NAME ='logHomeWork',
FILENAME = 'C:\Repositories\SQLEssential\Lesson2\HomeWork.ldf',
SIZE = 5 MB,
MAXSIZE = 50 MB,
FILEGROWTH = 5 MB
)

COLLATE Cyrillic_General_CI_AS

USE HomeWork

CREATE TABLE HomeWork
(
ID smallint IDENTITY NOT NULL,
Name varchar(20) NOT NULL,
Number varchar(20) NOT NULL,
Cost float NOT NULL,
Count int NOT NULL,
SellStartDate DateTime NOT NULL
)

ALTER TABLE HomeWork
ALTER COLUMN SellStartDate Date

SELECT * FROM HomeWork
WHERE Count > 50 OR Count = 50

SELECT [Name] AS [Product], [Cost], [SellStartDate] FROM [HomeWork]
WHERE [Cost] < 3 AND [SellStartDate] > '2011-08-20'

SELECT [Name], COUNT (*) AS Count FROM HomeWork
GROUP BY [Name]
HAVING COUNT (*) = 2

UPDATE [HomeWork]
SET [Cost] = 5.25
WHERE [Name] = 'Свиточ'
SELECT * FROM [HomeWork]

