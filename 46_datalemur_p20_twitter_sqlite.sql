/*
1)This is the same question as problem #24 in the SQL Chapter of Ace the Data Science Interview!
2)Assume you are given the table below containing information on user session activity. 
3) Write a query that ranks users according to their total session durations (in minutes) by 
descending order for each session type between the start date (2022-01-01) and end date (2022-02-01). 
4)Output the user id, session type, and the ranking of the total session duration.
*/

CREATE TABLE sessions (
  
  session_id INTEGER,
  user_id INTEGER,
  session_type	VARCHAR(100),
  duration INTEGER,
  start_date timestamp
  
  );
  
--To rank the users in accordance to their total session duration
--First let us find total duration grouping by user_id, session_type

DROP TABLE sessions;
  
INSERT INTO sessions VALUES(6368, 111, "like", 3, "2021-12-25 12:00:00");
INSERT INTO sessions VALUES(1742, 111, "retweet", 6, "2022-01-02 12:00:00");
INSERT INTO sessions VALUES(8464, 222, "reply", 8, "2022-01-16 12:00:00");
INSERT INTO sessions VALUES(7153, 111, "retweet", 5, "2022-01-28 12:00:00");
INSERT INTO sessions VALUES(3252, 333, "reply", 15, "2022-01-10 12:00:00");

with t1 AS
(
SELECT user_id AS uid, session_type AS stype, SUM(duration) AS total_duration
FROM sessions
WHERE date(start_date) >= "2022-01-01" and date(start_date) <= "2022-02-01"
GROUP BY user_id, session_type
ORDER BY total_duration DESC
)

--Next, to write a query that ranks the users according to their 
--total session durattions

SELECT uid AS uid1, stype AS stype1, total_duration AS td
, RANK() OVER(PARTITION BY stype ORDER BY total_duration DESC) AS ranking
FROM t1
