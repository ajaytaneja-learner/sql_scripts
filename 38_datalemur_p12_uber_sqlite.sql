/*
Uber: User's Third Transaction
1) This is the same question as problem #11 in the SQL Chapter of Ace the Data Science Interview!
2) Assume you are given the table below on Uber transactions made by users. 
3) Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.
*/

CREATE TABLE transactions1 (
  
  user_id INTEGER,
  spend decimal,
  transaction_date timestamp

  );
  
DROP TABLE transactions1;

INSERT INTO transactions1 VALUES(111, 100.50, "2022-01-08 12:00:00");
INSERT INTO transactions1 VALUES(111, 55.00, "2022-01-10 12:00:00");
INSERT INTO transactions1 VALUES(121, 36.00, "2022-01-18 12:00:00");
INSERT INTO transactions1 VALUES(145, 24.99, "2022-01-26 12:00:00");
INSERT INTO transactions1 VALUES(111, 89.60, "2022-02-05 12:00:00");

SELECT * FROM transactions1;

with tr AS
(
SELECT user_id, spend, transaction_date,
COUNT(user_id) OVER(PARTITION BY user_id ORDER BY transaction_date) AS trans_count
FROM transactions1
)

SELECT user_id, spend, transaction_date 
FROM tr
WHERE trans_count = 3
