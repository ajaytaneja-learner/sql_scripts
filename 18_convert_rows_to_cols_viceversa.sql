/*
SQL Convert Rows to Columns and Columns to Rows without using Pivot Functions

Reference: https://youtu.be/O6mDdUIvx9k?list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH

*/

CREATE TABLE emp_compensation (
emp_id int,
salary_component_type varchar(20),
val int
);


INSERT INTO emp_compensation
VALUES (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10)
, (2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8)
, (3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);

SELECT * FROM emp_compensation;