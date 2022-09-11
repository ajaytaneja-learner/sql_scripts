/*
1)This is the same question as problem #9 in the SQL Chapter of Ace the Data Science Interview!
2) Assume you are given the table below on user transactions. Write a query to obtain the list of customers 
whose first transaction was valued at $50 or more. Output the number of users.
3)Clarification: 
a)Use the transaction_date field to determine which transaction should be labeled as the first for each user. 
b)Use a specific function (we can't give too much away!) 
to account for scenarios where a user had multiple transactions on the same day, and one of those was the first.
*/

CREATE TABLE user_transactions1 (
  
  transaction_id INTEGER,
  user_id INTEGER,
  spend decimal,
  transaction_date timestamp

  );
  
INSERT INTO user_transactions1 VALUES(759274, 111, 49.50, "2022-02-03 00:00:00");
INSERT INTO user_transactions1 VALUES(850371, 111, 51.00, "2022-03-15 00:00:00");
INSERT INTO user_transactions1 VALUES(615348, 145, 36.30, "2022-03-22 00:00:00");
INSERT INTO user_transactions1 VALUES(615348, 145, 36.30, "2022-03-22 00:00:00");
INSERT INTO user_transactions1 VALUES(137424, 156, 151.00, "2022-04-04 00:00:00");
INSERT INTO user_transactions1 VALUES(248475, 156, 87.00, "2022-04-16 00:00:00");

SELECT * FROM user_transactions1;
with ut1 AS
(
SELECT user_id, spend, transaction_date
, RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS rn
FROM user_transactions1
)

SELECT COUNT(DISTINCT user_id) AS users
FROM ut1
WHERE spend >=50 and rn = 1 
