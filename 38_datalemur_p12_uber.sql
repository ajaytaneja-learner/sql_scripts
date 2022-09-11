/*
Uber: User's Third Transaction
1) This is the same question as problem #11 in the SQL Chapter of Ace the Data Science Interview!
2) Assume you are given the table below on Uber transactions made by users. 
3) Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.
*/

CREATE TABLE transactions (
  
  user_id INTEGER,
  spend decimal,
  transaction_date timestamp

  );
  
  INSERT INTO transactions VALUES(111, 100.50, "2022-01-08 12:00:00");
  INSERT INTO transactions VALUES(111, 55.00, "2022-01-10 12:00:00");