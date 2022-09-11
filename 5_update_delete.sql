#Updating and deelting rows inside of a database table

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name  VARCHAR(20),
    major VARCHAR(20)
);

DROP TABLE student;

SELECT * FROM student;
INSERT INTO student(student_id, name, major)VALUES(1, 'Jack', 'Biology');
INSERT INTO student(student_id, name, major)VALUES(2, 'Kate', 'Chemistry');
INSERT INTO student(student_id, name)VALUES(3, 'Claire');

INSERT INTO student(student_id, name, major)VALUES(4, 'Rob', 'Physics');

INSERT INTO student(student_id, name, major)VALUES(5, 'Bill', 'Computer Science');

UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';

UPDATE student
SET major = 'Computer Sci'
WHERE major = 'Computer Science';

UPDATE student
SET major = 'Computer Sci'
WHERE student_id = 4;

UPDATE student
SET major = 'Biochemistry'
WHERE major = 'Bio' OR major = 'Chemistry';

UPDATE student
SET name = 'Tom', major = 'undecided'
WHERE student_id = 1;

#Deleting

DELETE FROM student
WHERE student_id = 5; # no row with student_d = 5 deleted following the run of his query

DELETE FROM student
WHERE name = 'Tom' AND major = 'undecided';  

DELETE FROM student; #everything deleted from student
