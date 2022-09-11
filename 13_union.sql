/*
Unions in SQL:

1) Union is basically a special SQL operator which we can use to combine the rsults of multiple selct statements into one
2) You might use 2 or 3 select statements and you can combine them to get a big table back into the database
3) It should be noted hat you should have the same number of columns that you are using in SELECT
4) Also Columns in UION should ahve similar data type
*/

SELECT first_name
FROM employee
UNION
SELECT branch_name
FROM branch;


-- Find a list of all clients and branch suppliers as names

SELECT client_name AS Clients, client.branch_id
FROM client
UNION
SELECT supplier_name, supplier_name.branch_id
FROM branch_supplier;

-- Find a list of all money spent or earned by a company

/*
1) money_spent comes from salary
2) Money earned comes from total_sales
*/

SELECT salary 
FROM employee
UNION
SELECT total_sales
FROM works_with;


