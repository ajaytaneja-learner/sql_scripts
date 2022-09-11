CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name  VARCHAR(20),
    major VARCHAR(20)
);

DROP TABLE student;

SELECT * FROM student;
INSERT INTO student(student_id, name, major)VALUES(1, 'Jack', 'Biology');
INSERT INTO student(student_id, name, major)VALUES(2, 'Kate', 'Sociology');
INSERT INTO student(student_id, name)VALUES(3, 'Claire');

/* Adding with same primary id will raise an error*/

INSERT INTO student(student_id, name, major)VALUES(2, 'Kate', 'Sociology');

/*Adding with different ame and major but with different primary id is acceptable*/

INSERT INTO student(student_id, name, major)VALUES(4, 'Jack', 'Biology');