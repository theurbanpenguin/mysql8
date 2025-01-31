-- Step 1: Create a new database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Step 2: Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Step 3: Create tables
CREATE TABLE Departments (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL,
    ManagerID INT DEFAULT NULL,
    CONSTRAINT fk_manager FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID) ON DELETE SET NULL
);

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID) ON DELETE SET NULL
);

CREATE TABLE Managers (
    ManagerID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL UNIQUE,
    DeptID INT NOT NULL UNIQUE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID) ON DELETE CASCADE
);

-- Step 4: Enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- Step 5: Create views

-- View to show Employees with their Department Name
CREATE VIEW EmployeeDetails AS
SELECT e.EmployeeID, e.Name, d.DeptName
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID;

-- View to show Departments and their Manager
CREATE VIEW DepartmentManagers AS
SELECT d.DeptID, d.DeptName, e.Name AS ManagerName
FROM Departments d
JOIN Employees e ON d.ManagerID = e.EmployeeID;

-- Step 6: Create stored procedures

-- Procedure to add a Department
DELIMITER //
CREATE PROCEDURE AddDepartment(IN dept_name VARCHAR(100))
BEGIN
    INSERT INTO Departments (DeptName) VALUES (dept_name);
END //
DELIMITER ;

-- Procedure to add an Employee
DELIMITER //
CREATE PROCEDURE AddEmployee(IN emp_name VARCHAR(100), IN dept_id INT)
BEGIN
    INSERT INTO Employees (Name, DeptID) VALUES (emp_name, dept_id);
END //
DELIMITER ;

-- Procedure to add a Manager
DELIMITER //
CREATE PROCEDURE AddManager(IN emp_id INT, IN dept_id INT)
BEGIN
    UPDATE Departments SET ManagerID = emp_id WHERE DeptID = dept_id;
    INSERT INTO Managers (EmployeeID, DeptID) VALUES (emp_id, dept_id);
END //
DELIMITER ;

-- Step 7: Insert sample data

-- Disable foreign key checks before inserting data
SET FOREIGN_KEY_CHECKS = 0;

-- Insert a new department
CALL AddDepartment('IT');

-- Insert an employee
CALL AddEmployee('Alice Johnson', 1);

-- Assign Alice as the manager of the IT department
CALL AddManager(1, 1);

-- Enable foreign key checks after inserting data
SET FOREIGN_KEY_CHECKS = 1;

-- Verify data
SELECT * FROM EmployeeDetails;
SELECT * FROM DepartmentManagers;
