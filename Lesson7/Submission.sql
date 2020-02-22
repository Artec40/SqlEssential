USE MyJoinsDB

SELECT * FROM Employee
SELECT * FROM EmployeePersonalInformation
SELECT * FROM EmployeeWorkInformation
GO

CREATE VIEW ContactInfo
AS SELECT EmployeeName, EmployeePhone, PlaceOfResidence FROM Employee, EmployeePersonalInformation
WHERE Employee.EmployeeID=EmployeePersonalInformation.EmployeeID;
GO

CREATE VIEW NotMarriedWorkers
AS 
SELECT EmployeeName, EmployeePhone, DateOfBirth 
FROM Employee
INNER JOIN
EmployeePersonalInformation
ON Employee.EmployeeID=EmployeePersonalInformation.EmployeeID
WHERE MaritalStatus='Не женат';
GO

CREATE VIEW Managers
AS
SELECT EmployeeName, DateOfBirth, Position, EmployeePhone
FROM Employee
INNER JOIN
EmployeePersonalInformation
ON Employee.EmployeeID=EmployeePersonalInformation.EmployeeID
INNER JOIN
EmployeeWorkInformation
ON Employee.EmployeeID=EmployeeWorkInformation.EmployeeID
WHERE Position = 'Менеджер'
GO

SELECT * FROM ContactInfo
SELECT * FROM NotMarriedWorkers
SELECT * FROM Managers