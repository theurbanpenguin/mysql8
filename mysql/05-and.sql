USE northwind;
SELECT EmployeeID, firstname, lastname
FROM employees
WHERE EmployeeID < 8 ORDER BY lastname;

SELECT EmployeeID, firstname, lastname
FROM employees
WHERE EmployeeID < 8 AND firstname LIKE 'M%'
ORDER BY lastname;