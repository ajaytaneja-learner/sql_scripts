/*

Common sql questions:

1) Reference: https://youtu.be/Iv9qBz-cyVA?list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH
2) Question 1) ow to find duplicates? To do his: in whichever column we have to find duplicates, 
we have to do group there
2) Question 2) Difference between UNION And UNION ALL

*/


-- Question 1) Counting the numbr of duplicates in a column

CREATE TABLE emp(
emp_id INT,
emp_name VARCHAR(20),
department_id INT,
salary INT,
manager_id INT
);

DROP TABLE emp;

INSERT INTO emp
VALUES (1, 'Ankit', 100,10000, 4);
INSERT INTO emp
VALUES (2, 'Mohit', 100, 15000, 5);
INSERT INTO emp
VALUES (3, 'Vikas', 100, 10000,4);
INSERT INTO emp
VALUES (4, 'Rohit', 100, 5000, 2);
INSERT INTO emp
VALUES (5, 'Mudit', 200, 12000, 6);
INSERT INTO emp
VALUES (6, 'Agam', 200, 12000,2);
INSERT INTO emp
VALUES (7, 'Sanjay', 200, 9000, 2);
INSERT INTO emp
VALUES (8, 'Ashish', 200,5000,2);
INSERT INTO emp
VALUES (1, 'Saurabh',900,12000,2);


SELECT * FROM emp;
SELECT emp_id, COUNT(1) FROM emp GROUP BY emp_id;
SELECT manager_id, COUNT(*) FROM emp GROUP BY manager_id; #count(*) and count(1) are same
SELECT emp_id, COUNT(*) FROM emp GROUP BY emp_id HAVING COUNT(1) > 1  # having clause to filter on an aggregation



