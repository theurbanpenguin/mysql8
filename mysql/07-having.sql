USE northwind;
SELECT CONCAT(firstname, ' ', lastname) AS EmployeeName,
TIMESTAMPDIFF(YEAR, BirthDate , CURDATE()) AS Age
FROM employees
HAVING Age > 70;