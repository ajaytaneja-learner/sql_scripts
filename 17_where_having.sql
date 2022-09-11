/*
Difference btween WHERE And HAVING in SQL
Reference: https://www.youtube.com/watch?v=4xPxGX4mfb4&list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH

1) When you use WHERE, SQL will go through each row and check for the condition
2) Now, suppose in the employee table we want to find ou the branches where the average
salary of the employees > 65000. hat is we want the department where the salary is greater 
than 65000
3) In the above (2) case if we want to apply filter, we cannot apply on individual rows
4) We will ahve to look at ALL the branch ids and that is where we will have to do the aggregation
5) Whenever we have to apply filter on aggregated values, we ahve to use 'HAVING' clause


*/

/*

VERY IMPORTANT:
Order of commands also matters we can never use having before where.

Because in the backend order of execution goes as below:

Query Process Steps
1. Getting Data (From, Join)
2. Row Filter (Where)
3. Grouping (Group by)
4. Group Filter (Having)
5. Return Expressions (Select)
6. Order & Paging (Order by & Limit / Offset)

*/

SELECT * FROM employee;

# WHERE clause
SELECT first_name, salary FROM employee
WHERE salary > 65000;


#HAVING class
SELECT branch_id, AVG(salary)
FROM employee
GROUP BY branch_id
HAVING AVG(salary) > 65000;


/*

1) There can be instances where you have to apply both filters
2) First find out the employees whose salary is greater than 65000
3) Then those department ids whose average salary is greater than 65000

*/


SELECT branch_id, AVG(salary) AS AVERAGE_SALARY
FROM employee
WHERE salary > 65000
GROUP BY branch_id;

SELECT branch_id, AVG(salary) AS AVERAGE_SALARY
FROM employee
WHERE salary > 65000
GROUP BY branch_id
HAVING AVG(salary) > 75000;




