/*Difference between union and union all

1)  Union gives a union of ONLY unique values
2) Union all gives a union of ALL valus (including repetitive)
3) See script below

*/

CREATE TABLE emp1(
emp_id INT,
emp_name VARCHAR(20),
department_id INT,
salary INT,
manager_id INT
);

DROP TABLE emp1;

INSERT INTO emp1
VALUES (1, 'Ankit', 100,10000, 4);
INSERT INTO emp1
VALUES (2, 'Mohit', 100, 15000, 5);
INSERT INTO emp1
VALUES (3, 'Vikas', 100, 10000,4);
INSERT INTO emp1
VALUES (4, 'Rohit', 100, 5000, 2);
INSERT INTO emp1
VALUES (5, 'Mudit', 200, 12000, 6);
INSERT INTO emp1
VALUES (6, 'Agam', 200, 12000,2);
INSERT INTO emp1
VALUES (7, 'Sanjay', 200, 9000, 2);
INSERT INTO emp1
VALUES (8, 'Ashish', 200,5000,2);
INSERT INTO emp1
VALUES (1, 'Saurabh',900,12000,2);


SELECT * FROM emp1;

CREATE TABLE emp2(
emp_id INT,
emp_name VARCHAR(20),
department_id INT,
salary INT,
manager_id INT
);

DROP TABLE emp2;

INSERT INTO emp2
VALUES (1, 'Ankit', 100,10000, 4);
INSERT INTO emp2
VALUES (2, 'Mohit', 100, 15000, 5);
INSERT INTO emp2
VALUES (3, 'Vikas', 100, 10000,4);
INSERT INTO emp2
VALUES (4, 'Rohit', 100, 5000, 2);
INSERT INTO emp2
VALUES (5, 'Mudit', 200, 12000, 6);
INSERT INTO emp2
VALUES (6, 'Agam', 200, 12000,2);
INSERT INTO emp2
VALUES (7, 'Sanjay', 200, 9000, 2);
INSERT INTO emp2
VALUES (8, 'Ashish', 200,5000,2);

SELECT * FROM emp2;

SELECT manager_id from emp1
union all
SELECT manager_id from emp2;

SELECT manager_id from emp1
union
SELECT manager_id from emp2;
