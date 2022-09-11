/*
--
1) This covers SQL analytical functions: ANK(), DENSE_RANK and ROW_NUMBER
2) Let us see all the three
3) There is a sligh difference between each of the 3 functions and we will try and understand the differences
4) These are called as window functions as well as analytical functions sometimes
---
The follwoing concepts are discussed
--
5) We fist create the emp table 
6) We rank ordered by salary descending with highest salary getting best rank 
7) We then use dense_rank. he difference between pue rank and ense_rank() is that dense_rank doesn't skip the rank 
unlike just rank()
8) ROW_NUMBER does not repea anks unlike rank() or dense _rank but if 2 items/ppl have same rank it just randomly 
allocates a number
9) Suppose that we want the rank based on departments we add a clause partition by department_id
10) Let us take another use case wherein we want to get the highest salary in ach department. We do this through a subqury usingg 8 and WHERE clause
*/


-- Point number 5 in the explanatory notes
CREATE TABLE emp (
  emp_id INT,
  emp_name VARCHAR(40),
  department_id INT,
  salary INT
);  
  
INSERT INTO emp VALUES(1, 'Ankit', 100, 10000);
INSERT INTO emp VALUES(2, 'Mohit', 100, 15000);
INSERT INTO emp VALUES(3, 'Vikas', 100, 10000);
INSERT INTO emp VALUES(4, 'Rohit', 100, 5000);
INSERT INTO emp VALUES(5, 'Mudit', 200, 12000);
INSERT INTO emp VALUES(6, 'Agam', 200, 12000);
INSERT INTO emp VALUES(7, 'Sanjay', 200, 9000);
INSERT INTO emp VALUES(8, 'Ashish', 200, 5000);

DROP TABLE emp;

SELECT emp_id, emp_name, department_id, salary
FROM emp;


-- Point number 6 in the explanatory notes
SELECT emp_id, emp_name, department_id, salary
, RANK() OVER(order by salary DESC) AS ranked_salary
FROM emp;

-- Point number 7 from the explanatory notes
SELECT emp_id, emp_name, department_id, salary
, DENSE_RANK() OVER (ORDER BY salary DESC) AS ranked_salary
FROM emp;

--Point number 8 in the explanatory notes
SELECT emp_id, emp_name, department_id, salary
, ROW_NUMBER() OVER (ORDER BY salary DESC) AS ranked_salary
FROM emp;

-- Point number 9 in the explanatory notes
SELECT emp_id, emp_name, department_id, salary
, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS ranked_salary
FROM emp;

SELECT * FROM (
SELECT emp_id, emp_name, department_id, salary
, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS ranked_salary
FROM emp
)
WHERE ranked_salary = 1;
