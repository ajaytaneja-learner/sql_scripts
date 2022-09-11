/* 
SELF JOIN

1) Reference example: https://youtu.be/G7v7TZ3ylDI?list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH
2) Here we have to find which employee arn more han their managers
3) We get 2 instances of same table using aliases
4) And hen use INNER JOIN

*/

create table emp_manager(emp_id int,emp_name varchar(50),salary int(20),manager_id int(10));
insert into emp_manager values(	1	,'Ankit',	10000	,4	);
insert into emp_manager values(	2	,'Mohit',	15000	,5	);
insert into emp_manager values(	3	,'Vikas',	10000	,4	);
insert into emp_manager values(	4	,'Rohit',	5000	,2	);
insert into emp_manager values(	5	,'Mudit',	12000	,6	);
insert into emp_manager values(	6	,'Agam',	12000	,2	);
insert into emp_manager values(	7	,'Sanjay',	9000	,2	);
insert into emp_manager values(	8	,'Ashish',	5000	,2	);

SELECT * FROM emp_manager;

SELECT emp.emp_id AS emp_id, emp.emp_name AS emp_name, emp.salary AS emp_salary, emp.manager_id AS mgr_id, mgr.emp_name AS mgr_name, mgr.salary AS mgr_salary
FROM emp_manager AS mgr
INNER JOIN emp_manager AS emp
ON emp.manager_id = mgr.emp_id;


