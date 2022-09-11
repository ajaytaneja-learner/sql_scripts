/*

1)This is the same question as problem #3 in the SQL Chapter of Ace the Data Science Interview!
2)Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). 
Define “mobile” as the sum of tablet and phone viewership numbers. Write a query to compare the viewership on laptops versus mobile devices
3)Output the total viewership for laptop and mobile devices in the format of "laptop_views", "mobile_views".

*/

CREATE TABLE viewership (
  
  user_id INT,
  device_type VARCHAR(100),
  view_time DATETIME

  );
  
DROP TABLE viewership;
  
INSERT INTO viewership VALUES(123, 'tablet', '2022-01-02 00:00:00');
INSERT INTO viewership VALUES(125, 'laptop', '2022-01-07 00:00:00');
INSERT INTO viewership VALUES(128, 'laptop', '2022-02-09 00:00:00');
INSERT INTO viewership VALUES(129, 'phone', '2022-02-09 00:00:00');
INSERT INTO viewership VALUES(145, 'tablet', '2022-02-24 00:00:00');

SELECT * FROM viewership;

#The output table should be of follwoing form

CREATE TABLE example_output_viewership (

laptop_views INT,
mobile_views INT

);

DROP TABLE example_output_viewership;
INSERT INTO example_output_viewership VALUES(2, 3);

SELECT * FROM example_output_viewership;

SELECT 
SUM(case when device_type = 'laptop' then 1 else 0 end) AS laptop_views,
SUM(case when device_type = 'tablet' or device_type = 'phone' then 1 else 0 end) AS mobile_views
FROM viewership;

#Instead of using 'OR' use 'IN'
SELECT 
SUM(case when device_type = 'laptop' then 1 else 0 end) AS laptop_views,
SUM(case when device_type IN ('tablet', 'phone') then 1 else 0 end) AS mobile_views
FROM viewership


