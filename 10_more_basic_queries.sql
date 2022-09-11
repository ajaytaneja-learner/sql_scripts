-- Find all employees

SELECT*
FROM employee;

-- Find all clients

SELECT*
FROM client;

-- Find all employes ordered by their salary

SELECT *
FROM employee
ORDER BY salary;

-- Find all employee ordered by salary with richest employee at the top

SELECT *
FROM employee
ORDER BY salary DESC;

-- Find all employes ordered by sex and then name

SELECT *
FROM employee
ORDER BY sex, first_name, last_name;


-- Find the first 5 employees from the table

SELECT *
FROM employee
LIMIT 5;

-- Find the first and the last name of all employees

SELECT first_name, last_name
FROM employee;

-- Find the forename and last name of all employees

SELECT first_name AS forename, last_name AS surname
FROM employee;

-- Find out all different genders

SELECT DISTINCT sex
FROM employee;

-- Find out all distinct branch ids
SELECT distinct branch_id
FROM employee;




