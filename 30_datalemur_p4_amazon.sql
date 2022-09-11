/*
#Purchasing Activity by Product Type
1) This is the same question as problem #4 in the SQL Chapter of Ace the Data Science Interview!
2) Assume you are given the table below for purchasing activity by product type. 
3) Write a query to calculate the cumulative purchases for each product type over time in chronological order. 
4) Output the transaction date, product type, and the cumulative number of quantities purchased (conveniently abbreviated as cum_purchased).
*/

CREATE TABLE total_trans (
  
  order_id INT,
  product_type VARCHAR(100),
  quantity INT,
  order_date DATETIME

  );
  
DROP TABLE total_trans;

INSERT INTO total_trans VALUES(213824, 'printer', 20, '2022-06-27 12:00:00');
INSERT INTO total_trans VALUES(212312, 'hair dryer', 5, '2022-06-28 12:00:00');
INSERT INTO total_trans VALUES(132842, 'printer', 18, '2022-06-28 12:00:00');
INSERT INTO total_trans VALUES(284730, 'standing lamp', 8, '2022-07-05 12:00:00');

# As mentioned above,  we need to output the transaction date, product type,
# and the cumulative number of quantities purchased (conveniently abbreviated as cum_purchased).
# This table should be of follwoing form

CREATE TABLE example_output_total_trans (
  
  order_date DATETIME,
  product_type VARCHAR(100),
  cum_purchased INT
  
  );
  
DROP TABLE example_output_total_trans;
INSERT INTO example_output_total_trans VALUES('2022-06-27 12:00:00', 'printer', 20);
INSERT INTO example_output_total_trans VALUES('2022-06-28 12:00:00', 'hair dryer', 5);
INSERT INTO example_output_total_trans VALUES('2022-06-28 12:00:00', 'printer', 38);
INSERT INTO example_output_total_trans VALUES('2022-07-05 12:00:00', 'standing lamp	', 8);

SELECT * FROM example_output_total_trans;

#continued in sqlite

