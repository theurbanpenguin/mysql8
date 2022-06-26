USE northwind;
SELECT CONCAT(e.firstname, ' ', e.lastname) AS EmployeeName,
CONCAT(m.firstname, ' ', m.lastname) AS ManagerName
FROM employees as e
JOIN employees as m
ON e.reportsto = m.employeeid;