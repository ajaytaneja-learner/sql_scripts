/*
Highest Number of Products

1)Assume that you are given the table below containing information on various orders made by eBay customers. 
2)Write a query to obtain the user IDs and number of products purchased by the top 3 customers; these customers must have spent at least $1,000 in total.
3)Output the user id and number of products in descending order. 
4)To break ties (i.e., if 2 customers both bought 10 products), the user who spent more should take precedence.

*/

CREATE TABLE user_transactions (
  
  transaction_id INT,
  product_id INT,
  user_id INT,
  spend decimal

  );
  
DROP TABLE user_transactions;
  
#Let us see an example input
  
INSERT INTO user_transactions VALUES(131432, 1324, 128, 699.78);
INSERT INTO user_transactions VALUES(131433, 1313, 128, 501.00);
INSERT INTO user_transactions VALUES(153853, 2134, 102, 1001.20);
INSERT INTO user_transactions VALUES(247826, 8476, 133,	1051.00);
INSERT INTO user_transactions VALUES(247265, 3255, 133, 1474.00);
INSERT INTO user_transactions VALUES(136495, 3677, 133, 247.56);

CREATE TABLE example_output_user_transactions (
  
  user_id INT,
  product_num INT

  );
  
DROP TABLE example_output_user_transactions;
  
INSERT INTO example_output_user_transactions VALUES(133, 3);
INSERT INTO example_output_user_transactions VALUES(128, 2);
INSERT INTO example_output_user_transactions VALUES(102, 1);

SELECT * FROM example_output_user_transactions;

SELECT user_id, product_num
FROM user_interactions 
GROUP BY user_id
#WHERE SUM(spend) over 

#Continued is sqlite