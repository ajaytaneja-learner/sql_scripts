/*
Histogram of Tweets
1) This is the same question as problem #6 in the SQL Chapter of Ace the Data Science Interview!
2) Assume you are given the table below containing tweet data. Write a query to obtain a histogram of tweets posted per user in 2022. 
3) Output the tweet count per user as the bucket, and then the number of Twitter users who fall into that bucket.
*/

CREATE TABLE tweets (
  
  tweet_id INT,
  user_id INT,
  msg VARCHAR(500),
  tweet_date DATETIME

  );
  
  DROP TABLE tweets;
  
  INSERT INTO tweets VALUES(214252, 111, "Am considering taking Tesla private at $420. Funding secured", '2021-12-30 00:00:00');
  INSERT INTO tweets VALUES(739252, 111, "Despite the constant negative press covfefe", '2022-01-01 00:00:00');
  INSERT INTO tweets VALUES(846402, 111, "Following @NickSinghTech on Twitter changed my life!", '2022-02-14 00:00:00');
  INSERT INTO tweets VALUES(241425, 254, "If the salary is so competitive why won’t you tell me what it is?", '2022-03-01 00:00:00');
  INSERT INTO tweets VALUES(231574, 148, "I no longer have a manager. I can't be managed", '2022-03-01 00:00:00');
  
  CREATE TABLE example_output_tweets (
  
  tweet_bucket INT,
  users_num INT

  );
  
  DROP TABLE example_output_tweets;
  
  INSERT INTO example_output_tweets VALUES(1, 2);
  INSERT INTO example_output_tweets VALUES(2, 1);
  
  SELECT * FROM tweets;
  
  SELECT * FROM example_output_tweets;
  
  SELECT COUNT(*) AS tweet_bucket FROM
  (
  SELECT 
  DISTINCT COUNT(user_id) AS users_num
  FROM tweets
  WHERE tweet_date >= '2022-01-01 00:00:00'
  GROUP BY user_id
  );
  
  SELECT  DISTINCT COUNT(user_id) AS users_num,
  ROW_NUMBER() OVER() AS tweet_bucket
  FROM tweets
  WHERE tweet_date >= '2022-01-01 00:00:00' 
  GROUP BY user_id;
 
  WITH HistogramTweets AS
  (
  SELECT
  DISTINCT COUNT(user_id) AS users_num
  FROM tweets
  WHERE tweet_date >= '2022-01-01 00:00:00'
  GROUP BY user_id
  ORDER BY user_id
)
SELECT ROW_NUMBER() OVER() AS tweet_bucket,
users_num
FROM HistogramTweets
ORDER BY users_num DESC

