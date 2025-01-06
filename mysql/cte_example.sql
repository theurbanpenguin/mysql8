USE northwind;
WITH RECURSIVE EmployeeHierarchy AS (
    -- Anchor member: Select top-level employees (those without a manager)
    SELECT
        EmployeeID,
        FirstName AS EmployeeFirstName,
        LastName AS EmployeeLastName,
        ReportsTo,
        CAST(NULL AS CHAR(50)) AS ManagerFirstName,
        CAST(NULL AS CHAR(50)) AS ManagerLastName
    FROM employees
    WHERE ReportsTo IS NULL

    UNION ALL

    -- Recursive member: Join employees with their managers
    SELECT
        e.EmployeeID,
        e.FirstName AS EmployeeFirstName,
        e.LastName AS EmployeeLastName,
        e.ReportsTo,
        m.EmployeeFirstName AS ManagerFirstName,
        m.EmployeeLastName AS ManagerLastName
    FROM employees e
    INNER JOIN EmployeeHierarchy m
        ON e.ReportsTo = m.EmployeeID
)
SELECT
    EmployeeID,
    EmployeeFirstName,
    EmployeeLastName,
    ManagerFirstName,
    ManagerLastName
FROM EmployeeHierarchy
ORDER BY ManagerLastName, EmployeeLastName;
