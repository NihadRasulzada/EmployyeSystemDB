CREATE DATABASE EmployeeSystem
GO

USE EmployeeSystem
GO

CREATE TABLE Employee(
    Id int IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email VARCHAR(30) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Salary FLOAT NOT NULL
)
GO

CREATE TABLE Address(
    Id int IDENTITY PRIMARY KEY,
    [Address] NVARCHAR(50) NOT NULL,
    [Type] VARCHAR(10)
)
GO

ALTER TABLE Address
ADD EmployeeId int NOT NULL
GO

ALTER TABLE Address
ADD FOREIGN KEY (EmployeeId) REFERENCES Employee(Id)
GO

-- Insert data into Employee table
INSERT INTO Employee (FirstName, LastName, Email, Phone, Salary)
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', 50000),
('Jane', 'Smith', 'jane.smith@example.com', '1234567891', 60000),
('Alice', 'Johnson', 'alice.johnson@example.com', '1234567892', 55000),
('Bob', 'Brown', 'bob.brown@example.com', '1234567893', 45000),
('Emma', 'Davis', 'emma.davis@example.com', '1234567894', 70000);
GO

-- Insert data into Address table
INSERT INTO Address ([Address], [Type], EmployeeId)
VALUES
('123 Main St', 'Home', 1),
('456 Oak St', 'Office', 1),
('789 Pine St', 'Home', 2),
('101 Maple St', 'Office', 3),
('202 Birch St', 'Home', 4),
('303 Cedar St', 'Office', 5),
('404 Elm St', 'Home', 5);
GO

SELECT Employee.FirstName, Employee.LastName, Address.Address, Address.[Type] From Employee
JOIN Address
ON Address.EmployeeId = Employee.Id