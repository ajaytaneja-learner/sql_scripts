/*
1) Google's marketing team is making a Superbowl commercial and needs a simple statistic to put on their TV ad: 
the median number of searches a person made last year.
2) However, at Google scale, querying the 2 trillion searches is too costly. 
Luckily, you have access to the summary table which tells you the number of searches made last year 
and how many Google users fall into that bucket.
3) Write a query to report the median of searches made by a user. Round the median to one decimal point.
*/

CREATE TABLE search_frequency (
  
  searches INTEGER,
  num_users INTEGER
  
  );
  
DROP TABLE search_frequency;

--INSERT INTO search_frequency VALUES(1, 2);
--INSERT INTO search_frequency VALUES(3, 1);
--INSERT INTO search_frequency VALUES(5, 3);
--INSERT INTO search_frequency VALUES(7, 2);

INSERT INTO search_frequency VALUES(1, 2);
INSERT INTO search_frequency VALUES(4, 1);
INSERT INTO search_frequency VALUES(2, 2);
INSERT INTO search_frequency VALUES(3, 3);
INSERT INTO search_frequency VALUES(6, 1);
INSERT INTO search_frequency VALUES(5, 3);
INSERT INTO search_frequency VALUES(7, 2);

SELECT * FROM search_frequency;


with t0 AS 
(

SELECT CAST(searches AS DECIMAL) AS searches, CAST(num_users AS DECIMAL) AS num_years
FROM search_frequency

)

, t1 AS
(
SELECT searches AS searches, num_users AS num_users
, SUM(num_users) OVER(ORDER BY searches) AS cumulative_frequency
FROM search_frequency
)




, t2 AS
(

SELECT searches AS searches, cumulative_frequency AS cumulative_frequency
FROM  (
SELECT searches, cumulative_frequency 
FROM t1
WHERE cumulative_frequency <=
(
 SELECT (MAX(cumulative_frequency) + 1)/2.0
 FROM t1
)

ORDER BY cumulative_frequency DESC
LIMIT 1
)

UNION

SELECT searches AS searches, cumulative_frequency AS cumulative_frequency
FROM ( 
SELECT searches, cumulative_frequency
FROM t1
WHERE cumulative_frequency >
(
 SELECT (MAX(cumulative_frequency) + 1)/2.0
 FROM t1
)
ORDER BY cumulative_frequency ASC
LIMIT 1
)
)


, t3 AS

(

SELECT ROW_NUMBER() OVER(ORDER BY cumulative_frequency) AS row_id,
searches AS searches, cumulative_frequency AS cumulative_frequency
FROM t2

)

, t4 AS
(

SELECT row_id AS row_id,  searches AS searches, cumulative_frequency AS cumulative_frequency 
FROM t3

)




SELECT 
CASE
WHEN
(SELECT (MAX(cumulative_frequency) + 1)/2.0 AS max_value
FROM t1) = (

SELECT t4.cumulative_frequency
FROM t4
WHERE t4.row_id = 1 OR
t4.row_id = 2

) THEN cumulative_frequency

WHEN 

(SELECT (MAX(cumulative_frequency) + 1)/2.0 AS max_value
FROM t1) > 
(

SELECT t4.cumulative_frequency
FROM t4
WHERE t4.row_id = 1

)

and

(SELECT (MAX(cumulative_frequency) + 1)/2.0 AS max_value
FROM t1) < 
(

SELECT t4.cumulative_frequency
FROM t4
WHERE t4.row_id = 2

) 

and

(

SELECT (MAX(cumulative_frequency) + 1)/2.0 AS max_value
FROM t1

) < (SELECT t4.cumulative_frequency
FROM t4
WHERE t4.row_id = 1 + 1.0)

THEN 

(

SELECT AVG(searches) 
FROM t4

)

ELSE
(
SELECT t4.searches 
FROM t4
WHERE t4.row_id = 2

)  END AS median

FROM t4
WHERE row_id = 1














