USE northwind;
ALTER VIEW employee_manager
AS
SELECT CONCAT(e.firstname, ' ', e.lastname) AS EmployeeName,
CONCAT(m.firstname, ' ', m.lastname) AS ManagerName
FROM employees as e
LEFT OUTER JOIN employees as m
ON e.reportsto = m.employeeid;