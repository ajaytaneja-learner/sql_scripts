/*

1) In this tutorial we demonstarate the difference between tpes of counts. That is:
2) count(*), count(1), count(0) and count(column) and count(distinct_col)

Let us do this in the following order
3) First, let us create a table
4) See how count(*) works
5) count(*), coun(1), count(2),coun(--1) are all same
6) count(column_name) does not include null values
7) You can count distinct values


*/

CREATE TABLE demo_counts (
  emp_id INT,
  emp_name VARCHAR(40),
  salary INT,
  manager_id INT,
  emp_age INT,
  dep_id INT,
  dep_name VARCHAR(40),  
  gender VARCHAR(40)
  );
  
INSERT INTO demo_counts VALUES(1, 'Ankit', 14300, 4, 39, 100, 'Analytics', 'Female');
INSERT INTO demo_counts VALUES(2, 'Mohit', 15600, 5, 48, 200, 'IT', 'Male');
INSERT INTO demo_counts VALUES(3, 'Vikas', 12100, 4, 37, 100, 'Analytics', 'Female');
INSERT INTO demo_counts VALUES(4, 'Rohit', 7260, 2, 16, 100, 'Analytics', 'Female');
INSERT INTO demo_counts VALUES(5, 'Mudit', 15600, 6, 55, 200, 'IT', 'Male');
INSERT INTO demo_counts VALUES(6, 'Agam', 15600, 2, 14, 200, 'IT', 'Male');
INSERT INTO demo_counts VALUES(7, 'Sanjay', 12000, 2, 13, 200, 'IT', 'Female');
INSERT INTO demo_counts VALUES(8, 'Ashish', 7200, 2, 12, 200, 'IT', 'Female');
INSERT INTO demo_counts VALUES(9, 'Mukesh', 7000, 6, 51, 300, 'HR', 'Male');
INSERT INTO demo_counts VALUES(10, 'Rakesh', 8000, 6, 50, 300, 'HR', 'Male');
INSERT INTO demo_counts VALUES(11, 'Akhil', 4000, 1, 31, 500, NULL, 'Male');
INSERT INTO demo_counts VALUES(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

SELECT * FROM demo_counts;
SELECT count(*) FROM demo_counts; # Point number frrom 4 from explanatory notes
SELECT count(-2) from demo_counts; #Point number 5 from explanatory notes
SELECT count(dep_name) from demo_counts; #Point number 6 in he explanatory notes - null values no counted
SELECT count(distinct gender); # Point number 7 in the explantaory notes
