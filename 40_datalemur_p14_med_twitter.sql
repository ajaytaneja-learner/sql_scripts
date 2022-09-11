/*
Twitter: Tweets' Rolling Averages
1) This is the same question as problem #10 in the SQL Chapter of Ace the Data Science Interview!
2) The table below contains information about tweets over a given period of time. 
3) Calculate the 3-day rolling average of tweets published by each user for each date that a tweet was posted. 
4) Output the user id, tweet date, and rolling averages rounded to 2 decimal places.

Important Assumptions:

a) Rows in this table are consecutive and ordered by date.
b) Each row represents a different day
c) A day that does not correspond to a row in this table is not counted. The most recent day is the next row above the current row.
d) Note: Rolling average is a metric that helps us analyze data points by creating a series of averages based on different subsets of a dataset. 
e) It is also known as a moving average, running average, moving mean, or rolling mean.

*/

CREATE TABLE tweets (
  
  tweet_id INTEGER,
  user_id INTEGER,
  tweet_date timestamp
  
  );
  
  DROP TABLE tweets;
  
  INSERT INTO tweets VALUES(214252, 111, "2022-06-01 12:00:00");
  INSERT INTO tweets VALUES(739252, 111, "2022-06-01 12:00:00");
  INSERT INTO tweets VALUES(846402,	111, "2022-06-02 12:00:00");
  INSERT INTO tweets VALUES(241425, 254, "2022-06-02 12:00:00");
  INSERT INTO tweets VALUES(137374, 111, "2022-06-04 12:00:00");
  
  SELECT * FROM tweets;
  
  #Continued in sqlite
