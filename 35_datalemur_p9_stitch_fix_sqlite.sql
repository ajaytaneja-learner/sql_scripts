/*
Repeat Purchases on Multiple Days
1)Assume you are given the table below containing information on user purchases.
2)Write a query to obtain the number of users who purchased the same product on two or more different days. 
3)Output the number of users.
*/

CREATE TABLE purchases (
  
  user_id INTEGER,
  product_id INTEGER,
  quantity INTEGER,
  purchase_date DATETIME

  );
  
DROP TABLE purchases;
  
INSERT INTO purchases VALUES(536, 3223, 6, "2022-01-11 12:33:44");
INSERT INTO purchases  VALUES(827, 3585, 35, "2022-02-20 14:05:26");
INSERT INTO purchases  VALUES(536, 3223, 5, "2022-03-02 09:33:28");
INSERT INTO purchases  VALUES(536, 1435, 10, "2022-03-02 08:40:00");
INSERT INTO purchases  VALUES(827, 2452, 45, "2022-04-09 00:00:00");

CREATE TABLE example_output_purchases (
  
  users_num INTEGER
  
  );
  
 
DROP TABLE example_output_purchases;
  
INSERT INTO example_output_purchases VALUES(1);

SELECT * FROM purchases;
SELECT * FROM example_output_purchases;

WITH user_id_count AS
(
SELECT user_id AS uid, product_id, purchase_date AS date
, COUNT(product_id) over(partition by product_id)AS COUNT1
, COUNT(purchase_date) over(partition by DATE(purchase_date))AS COUNT2
FROM purchases

)

SELECT COUNT(DISTINCT uid) AS users_num
FROM user_id_count
WHERE COUNT1 > 1 and COUNT2 = 1;