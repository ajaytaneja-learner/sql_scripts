/*
1) This is the same question as problem #2 in the SQL Chapter of Ace the Data Science Interview!
2) You are given the tables below containing information on Robinhood trades and users. Write a query to list the top three cities that 
have the most completed trade orders in descending order. Output the city and number of orders.
3) Output should be as shown in table Example_output
*/

CREATE TABLE trades (
  order_id INT,
  user_id INT,
  price decimal,
  quantity integer,
  status VARCHAR(40),
  signup_date DATETIME
  
  );
  
  DROP TABLE trades;
  
INSERT INTO trades VALUES(100101, 111, 9.80, 10, 'Cancelled', '2022-08-17 12:00:00');
INSERT INTO trades VALUES(100102, 111, 10.00, 10, 'Completed', '2022-08-17 12:00:00');
INSERT INTO trades VALUES(100259, 148, 5.10, 35, 'Completed', '2022-08-25 12:00:00');
INSERT INTO trades VALUES(100264, 148, 4.80, 40, 'Completed', '2022-08-26 12:00:00');
INSERT INTO trades VALUES(100305, 300, 10.00, 15, 'Completed', '2022-09-05 12:00:00');
INSERT INTO trades VALUES(100400, 178, 9.90, 15, 'Completed', '2022-09-09 12:00:00');
INSERT INTO trades VALUES(100565, 265, 25.60, 5, 'Completed', '2022-12-19 12:00:00');

CREATE TABLE users (
  user_id INT,
  city VARCHAR(40),
  email VARCHAR(200),
  signupdate DATETIME
  
  );
  
  DROP TABLE users;
  
INSERT INTO users VALUES(111, 'San Francisco', 'rrok10@gmail.com', '2021-08-03 12:00:00');
INSERT INTO users VALUES(148, 'Boston',	'sailor9820@gmail.com',	'2021-08-20 12:00:00');
INSERT INTO users VALUES(178, 'San Francisco', 'harrypotterfan182@gmail.com', '2022-01-05 12:00:00');
INSERT INTO users VALUES(265, 'Denver',	'shadower_@hotmail.com', '2022-02-26 12:00:00');
INSERT INTO users VALUES(300, 'San Francisco', 'houstoncowboy1122@hotmail.com',	'2022-06-30 12:00:00');

SELECT * FROM trades;
SELECT * FROM users;

CREATE TABLE example_output (
 
  city VARCHAR(40),
  total_orders INTEGER
  
  );
  
DROP TABLE example_output;
  
INSERT INTO example_output VALUES('San Francisco', 3);
INSERT INTO example_output VALUES('Boston', 2);
INSERT INTO example_output VALUES('Denver', 1);

SELECT 
  *,
  CASE
  WHEN status = 'Completed' THEN 1
  WHEN status = 'Cancelled' THEN 0
  END AS status_category
  , SUM(status_category) OVER (partition by 
FROM trades;

SELECT status, status_category FROM trades;