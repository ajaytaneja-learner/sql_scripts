/*1) NOT NULL, UNIQUE to constrain the data
  2) Setting default values
  3) Setting primary keys as auto increment*/

CREATE TABLE student (
    student_id INT AUTO_INCREMENT,
    name  VARCHAR(20) NOT NULL, /*This column cannot be NULL*/
    major VARCHAR(20) UNIQUE,
    minor VARCHAR(20) DEFAULT 'undecided',
    PRIMARY KEY (student_id)
);

DROP TABLE student;

SELECT * FROM student;
INSERT INTO student(name, major)VALUES('Jack', 'Biology');
INSERT INTO student(name, major)VALUES('Kate', 'Sociology');
INSERT INTO student(name, major)VALUES(NULL, 'Chemistry');         /*This will create an error*/



INSERT INTO student(name, major)VALUES('Kate', 'Sociology'); /* error because not unique*/

/*Adding with different ame and major but with different primary id is acceptable*/

INSERT INTO student(name, major)VALUES('Jack', 'Biology'); /*This will again create an error as there cannot 
be 2 people of name JAcck and Biology major*/ 
INSERT INTO student(name, major)VALUES('Mike', 'Mathematics');