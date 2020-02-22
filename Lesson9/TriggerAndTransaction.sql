USE MyFunkDB

SELECT * FROM Employees
SELECT * FROM PersonalInfo
SELECT * FROM WorkInfo
GO

CREATE TRIGGER EmployeesNotExist
ON Employees
FOR INSERT
AS
IF EXISTS
(
SELECT * FROM Inserted AS i
JOIN Employees
ON i.EmployeeID=Employees.EmployeeID
WHERE i.Name = Employees.Name AND i.Surname = Employees.Surname
)
BEGIN
RAISERROR('Сотрудник уже расположен в базе данных',1,16);
ROLLBACK TRAN
END
GO

INSERT INTO Employees
VALUES
('Nerzul', 'Lichkovskiy', '8(999)9999999', 'Moscow')