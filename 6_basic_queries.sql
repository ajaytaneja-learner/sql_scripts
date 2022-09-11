#Basic Queries
#Getting information from rhe database
#Huge topic that will be covered for the rest of the course
#As the data schema gets complex, queries can also get complex
#These are very basic queies

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name  VARCHAR(20),
    major VARCHAR(20)
);

DROP TABLE student;

INSERT INTO student(student_id, name, major)VALUES(1, 'Jack', 'Biology');
INSERT INTO student(student_id, name, major)VALUES(2, 'Kate', 'Chemistry');
INSERT INTO student(student_id, name)VALUES(3, 'Claire');

INSERT INTO student(student_id, name, major)VALUES(4, 'Rob', 'Physics');

INSERT INTO student(student_id, name, major)VALUES(5, 'Bill', 'Computer Science');

SELECT * #* means all columns
FROM student # from student table
ORDER BY student_id DESC;

SELECT student.name, student.major 
FROM student
ORDER BY student_id ASC;

SELECT * #* means all columns
FROM student # from student table
ORDER BY student_id ASC;

SELECT student.name, student.major
FROM student
ORDER BY student_id DESC;

SELECT*
FROM student
ORDER BY major, student_id DESC;     #first it'll order by major and thn by student_id

SELECT*
FROM student 
ORDER BY student_id DESC
LIMIT 2;                            #limiting to number of rows by 2 and ordering by descending

SELECT name, major 
FROM student
WHERE major = 'Chemistry' OR name = 'Kate';

SELECT * 
FROM student
WHERE student_id < 3;

#IN keyword of sql

SELECT*
FROM student
WHERE name IN ('Claire', 'Kate', 'Mike'); #that is select from student table where he name is "in" the group of values

SELECT*
FROM student
WHERE major IN ('Biology', 'Chemistry');

SELECT*
FROM student
WHERE major IN ('Biology', 'Chemistry') AND student_id > 2;







