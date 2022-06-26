CREATE ROLE nwind_reader;
GRANT SELECT ON employee_manager to nwind_reader;
GRANT nwind_reader TO 'bob'@'localhost';
SET DEFAULT ROLE ALL TO 'bob'@'localhost' ;