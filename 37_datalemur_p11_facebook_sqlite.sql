/*
Average Post Hiatus (Part 1)
1) Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to 
find the number of days between each user’s first post of the year and last post of the year in the year 2021. 
2) Output the user and number of the days between each user's first and last post.
*/

CREATE TABLE posts (
  
  user_id INTEGER,
  post_id INTEGER,
  post_date timstamp,
  post_content timestamp

  );
  
DROP TABLE posts;



INSERT INTO posts VALUES(151652, 599415, "2021-07-10 12:00:00", "Need a hug");
INSERT INTO posts VALUES(661093, 624356, "2021-07-29 13:00:00",	 "Bed. Class 8-12. Work 12-3. Gym 3-5 or 6. Then class 6-10. Another day that's gonna fly by. I miss my girlfriend");
INSERT INTO posts VALUES(004239, 784254, "2021-07-04 11:00:00",	"Happy 4th of July!");
INSERT INTO posts VALUES(661093, 442560, "2021-07-08 14:00:00", "Just going to cry myself to sleep after watching Marley and Me.");
INSERT INTO posts VALUES(151652, 111766, "2021-07-12 19:00:00", "I'm so done with covid - need travelling ASAP!");
  
SELECT * FROM posts;

with p1 AS
(
SELECT user_id AS uid, post_id AS pid, (julianday(post_date)) AS pd
, COUNT(user_id) OVER(PARTITION BY user_id ORDER BY post_date) AS lag_calc
FROM posts
WHERE post_date < "2022-01-01 00:00:00"
)
, p2 AS
(
SELECT uid, pid, pd, lag_calc 
, pd - lag(pd, lag_calc- 1, 0) OVER(ORDER BY uid)AS days
FROM p1
)
SELECT uid AS user_id, ROUND(MAX(days)) AS days_between
FROM p2
WHERE days > 0
GROUP BY uid


--SELECT julianday("2021-07-10 12:00:00") - julianday('1947-08-15 12:00:00') as datediff;

 