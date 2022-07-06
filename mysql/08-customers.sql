USE northwind;
SELECT count(CustomerID) AS Customers, country
FROM customers
GROUP BY country WITH ROLLUP
ORDER BY Customers;