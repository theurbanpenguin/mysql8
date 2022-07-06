USE northwind;
SELECT EmployeeID, firstname, lastname
FROM employees WHERE EmployeeID < 5;

SELECT EmployeeID, firstname, lastname
FROM employees WHERE EmployeeID > 5;

SELECT EmployeeID, firstname, lastname
FROM employees WHERE EmployeeID >= 5 AND EmployeeID <= 8;

SELECT firstname, lastname
FROM employees WHERE firstname = 'Nancy';

SELECT firstname, lastname
FROM employees WHERE firstname LIKE '%an%';

SELECT firstname, lastname
FROM employees WHERE lastname LIKE '%an%';