USE northwind;
CREATE VIEW mailing
AS
SELECT CONCAT(firstname, ' ', lastname) as Employees,
City From employees
UNION
SELECT CompanyName , City
FROM customers
ORDER BY city;