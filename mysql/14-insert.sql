USE northwind;
INSERT INTO employees (LastName, FirstName , Title, BirthDate)
VALUES ('Smith', 'Brenda', 'IT', '1992-01-23');

SELECT LastName, FirstName, Title, BirthDate
FROM employees
WHERE employeeid = LAST_INSERT_ID();