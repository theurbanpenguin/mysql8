USE sample;
CREATE TABLE many_users
SELECT e1.firstname , e2.lastname
FROM northwind.employees as e1
CROSS JOIN northwind.employees as e2;