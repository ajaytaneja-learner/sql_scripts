/*

1) This covers SQL analytical functions: ANK(), DENSE_RANK and ROW_NUMBEr
2) Let us see all the three
3) There is a sligh difference between each of the 3 functions and we will try and understand the differences
4) These are called as window functions as well as analytical functions as well

The follwoing concepts are discussed

5) We rank ordered by salay deending with highest salary getting best rank 
*/

SELECT emp_id, emp_name, department_id, salary
FROM emp;

SELECT emp_id, emp_name, department_id, salary
, RANK() OVER(order by salary DESC) 
FROM emp

# Continued in sqlite as this version of mysql does no support