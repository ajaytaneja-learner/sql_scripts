/* SQL function is a block of code that we can call which will do something for us. Can do the follwoing:

1) count things
2) Avearges
*/

-- Find the number of employees
SELECT COUNT(emp_id)
FROM employee;

-- Find the numbe rof employees that have a supervisor
#Fist you can see from the employee table that 1 employee does not have a supervisor
SELECT * FROM employee;
SELECT count(super_id)
FROM employee; #answer is 8

-- Find the number of female employees born after 1970

SELECT count(emp_id)
FROM employee
WHERE sex = 'F' AND birth_day > '1970-01-01';

-- Find the average of all employes salaries

SELECT AVG(salary)
FROM employee;

-- Find average all of all male employees salaries

SELECT AVG(salary)
FROM Employee
WHERE sex = 'M'; #David Wallance makes 250000 per year!

-- Find the sum of all employees salry

SELECT SUM(salary)
FROM employee;


/* Aggregation:

1) Agregation is basically where we can use theese functions and we can display the data that we get back in a more helpful way


*/


-- Find out how many males and how many females there are

SELECT COUNT(sex), sex
FROM employee
GROUP BY sex; 

-- Find the total sales of each salesman

SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;


-- Find out how much money each client spent

SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id;



