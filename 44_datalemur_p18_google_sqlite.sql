/*
1)In consulting, being "on the bench" means you have a gap between two client engagements. 
2)Google wants to know how many days of bench time each consultant had in 2021. 
3)Assume that each consultant is only staffed to one consulting engagement at a time.
4)Write a query to pull each employee ID and their total bench time in days during 2021.
5)Assumptions:
a)All listed employees are current employees who were hired before 2021.
b)The engagements in the consulting_engagements table are complete for the year 2022.

CREATE TABLE staffing (
  
  employee_id INTEGER,
  is_consultant BOOLEAN,
  job_id INTEGER
  
  );
  
INSERT INTO staffing VALUES(111, true, 7898);
INSERT INTO staffing VALUES(121, false, 6789);
INSERT INTO staffing VALUES(156, true, 4455);

CREATE TABLE consulting_engagements (
  
  job_id INTEGER,
  client_id INTEGER,
  start_date DATETIME,
  end_date DATETIME,
  contract_amount INTEGER
  );
INSERT INTO consulting_engagements VALUES (7898, 20076, "2021-05-25 00:00:00", "2021-06-30 00:00:00", 11290.00); 	 
INSERT INTO consulting_engagements VALUES (6789, 20045, "2021-06-01 00:00:00", "2021-11-12 00:00:00", 33040.00);  
INSERT INTO consulting_engagements VALUES (4455, 20001, "2021-01-25 00:00:00", "2021-05-31 00:00:00", 31839.00);  

SELECT * FROM staffing;
SELECT * FROM consulting_engagements;


with t3 AS
(
SELECT job_id, 
CASE WHEN start_date < "2021-01-01 00:00:00" THEN "2021-01-01 00:00:00"
        ELSE start_date END AS [start_date_modified],
CASE WHEN end_date >= "2022-01-01 00:00:00" THEN "2021-12-31 00:00:00" 
        ELSE end_date END AS [end_date_modified]
FROM consulting_engagements
)

,t2 AS
(
SELECT staffing.employee_id AS employee_id, staffing.job_id AS job_id, 
(JULIANDAY(t3.end_date_modified) - JULIANDAY(t3.start_date_modified) + 1) AS days_worked
FROM staffing
LEFT JOIN t3
ON staffing.job_id = t3.job_id
WHERE staffing.is_consultant = TRUE
)

,t4 AS
(
SELECT t2.employee_id AS employee_id, SUM(days_worked) AS days_worked
FROM t2
GROUP BY employee_id
)

SELECT employee_id, 365 - days_worked AS bench_days
FROM t4









