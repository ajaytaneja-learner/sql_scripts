/*
SQL Joins

1) Joins are basically used to combine rows from 2 or more tables based on a related column between them
2) Joins can be eally useful for combining inormation from different tables
*/

# Lets add another branch to the branch table
# We will add a buffalo branch and that buffalo branch has no manager id and hence manager start_date


INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);
SELECT *
FROM branch;


-- Find all branches and names of their managers

/* 

Note:

1) We have: employee table and branch table
2) branch table has manager id
3) manager is also an employee 
4) Thus, the manager id correponds to some of the employe id in the employee table
5) ideal case of JOIN
6) Join is used to combine rows from two or more tables based on a related column
7) In the above case, the related column is the id of he employees

*/

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;


/*
Types of Join:

1) Above is the inner join
2) LEFT JOIN - see below - when using LEFT JOIN, all of the employees in the employee table get included
3) RIGHT JOIN - see below - all of the rows rom the branch table get included
*/


SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;


SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;