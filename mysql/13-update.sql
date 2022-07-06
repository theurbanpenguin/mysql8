USE northwind;
SELECT Lastname, Title
FROM employees;

UPDATE title
SET Title = 'Customer Development'
WHERE Title = 'Sales Representative';

SELECT Lastname, Title
FROM employees;