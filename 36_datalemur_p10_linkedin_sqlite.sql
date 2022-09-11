/*
This is the same question as problem #8 in the SQL Chapter of Ace the Data Science Interview!
1) Assume you are given the table below that shows job postings for all companies on the LinkedIn platform.
2) Write a query to get the number of companies that have posted duplicate job listings (two jobs at the same company with the same title and description).
*/


CREATE TABLE job_listings (
  
  job_id INT,
  company_id INT,
  title VARCHAR(500),
  description VARCHAR(1000)

  );
  
DROP TABLE job_listings;
  
INSERT INTO job_listings VALUES(248, 827, "Business Analyst", "Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.");
INSERT INTO job_listings VALUES(149, 845, "Business Analyst", "Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.");
INSERT INTO job_listings VALUES(945, 345, "Data Analyst", "Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems.");
INSERT INTO job_listings VALUES(164, 345, "Data Analyst", "Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems.");
INSERT INTO job_listings VALUES(172, 244, "Data Engineer", "Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.");

with jl AS(
SELECT job_id, company_id AS coid, title, description
, COUNT(title) OVER(partition by title) AS count_title
, COUNT(description) OVER(partition by description) AS count_desc
, COUNT(company_id) OVER(partition by company_id)  AS count_coid
FROM job_listings)

SELECT COUNT(DISTINCT coid) AS duplicate_companies
FROM jl
WHERE jl.count_title = jl.count_desc and jl.count_title > 1 and jl.count_coid >= jl.count_title 





