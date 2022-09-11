/*

Nested Queries in SQL

1) Nested queries are queries wherein we are going to be using multiple select statements in order to
get a specific piece of information
2) Bit more advanced

*/

-- Find the names of all employees who have sold
-- more than 30,000 to a client

/* 

1) Start looking at the works_with table
2) Total Sales is here
3) We ned actual employees

*/

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN(

  SELECT works_with.emp_id
  FROM works_with
  WHERE works_with.total_sales > 30000
  
);  


-- Find all clients who are handled by the branch that Michael Scott handles
-- Assume that you know Michael's id

SELECT client.client_name
FROM client
WHERE client.branch_id = (

SELECT branch.branch_id
FROM branch
WHERE branch.mgr_id = 102 

);





