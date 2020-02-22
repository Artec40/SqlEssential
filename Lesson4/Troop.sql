CREATE DATABASE Troop
ON
(
NAME = 'Troop',
FILENAME = 'C:\Repositories\SQLEssential\Lesson4\Troop.mdf',
SIZE = 30 MB,
MAXSIZE = 100 MB,
FILEGROWTH = 5 MB
)

LOG ON
(
NAME = 'LogTroop',
FILENAME = 'C:\Repositories\SQLEssential\Lesson4\Troop.ldf',
SIZE = 30 MB,
MAXSIZE = 100 MB,
FILEGROWTH = 5 MB
)

COLLATE Cyrillic_General_CI_AS

Use Troop

CREATE TABLE SoldierInfo
(
SoldierID int NOT NULL
FOREIGN KEY REFERENCES Soldier(SoldierID),
WeaponID int NOT NULL
FOREIGN KEY REFERENCES Weapon(WeaponID),
WeaponIssuedID int NOT NULL
FOREIGN KEY REFERENCES WeaponIssuedSoldier(WeaponIssuedSoldierID)
)

INSERT INTO SoldierInfo
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 3),
(2, 2, 2),
(3, 1, 1),
(3, 2, 2),
(4, 1, 1);

CREATE TABLE Soldier
(
SoldierID int IDENTITY NOT NULL
PRIMARY KEY,
SoldierName varchar(20) NOT NULL,
SoldierOffice varchar(60),
Troop int NOT NULL
)

INSERT INTO Soldier
VALUES
('Петров В.А.', 'оф.205', 222),
('Лодарев П.С.', 'оф.221', 232),
('Леонтьев К.В.', 'оф.201', 212),
('Духов Р.М.',NULL, 200)

CREATE TABLE WeaponIssuedSoldier
(
WeaponIssuedSoldierID int IDENTITY NOT NULL
PRIMARY KEY,
WeaponIssuedName varchar(60) NOT NULL,
WeaponIssuedPossition varchar(60) NOT NULL
)

INSERT INTO WeaponIssuedSoldier
VALUES
('Буров О.С.', 'майор'),
('Рыбаков Н.Г.', 'майор'),
('Деребанов В.Я.', 'подполковник')

CREATE TABLE Weapon
(
WeaponID int IDENTITY NOT NULL
PRIMARY KEY,
WeaponName varchar(20) NOT NULL
)

DROP TABLE Weapon
DROP TABLE WeaponIssuedSoldier
DROP TABLE Soldier
DROP TABLE SoldierInfo

INSERT INTO Weapon
VALUES
('AK-47'),
('Глок20'),
('AK-74')

SELECT * FROM Soldier
SELECT * FROM Weapon
SELECT * FROM WeaponIssuedSoldier
SELECT * FROM SoldierInfo