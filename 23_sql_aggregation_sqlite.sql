/*

1) References: https://youtu.be/5Ighj_2PGV0?list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH
2) All about SQL aggregation
3) There are 6 to 7 different ways of doing SQL aggregation.
4) All flavours discussed
5) Aggregate functions: sum(), avg(), min(), max()
6) Concepts in this script are declared using SUM()
.......
Concepts discussed
7) Plain SUM()
8) SUM() using group by for each salesperson_id
9) Now, the limitation of group by is hat you can have only the column displayed with which you have done the group by
10) We overcome this limitation by using windows functions
11) First we demonstrate the use of over() which just sums all the amount not grouped by any column. 
So, the value of 7) above is simply copied to each row
12) We create a partition by window over salesperson_id
13) We use oder by without any partition but with over and get the running sum over order date
14) to 13 we add partition_by salesperson_id where we get running sum over sales person id
15) next we want a rolling sum - i.e. sum over some rows
*/

CREATE TABLE int_orders(
 salesperson_id INT NOT NULL,
 order_number INT NOT NULL,
 order_date DATE NOT NULL,
 amount FLOAT NOT NULL
);

DROP TABLE int_orders;

INSERT INTO int_orders VALUES (1, 30, '1995-07-14' , 460);
INSERT INTO int_orders VALUES (2, 10, '1996-08-02', 540);
INSERT INTO int_orders VALUES (2, 40, '1998-01-29', 2400);
INSERT INTO int_orders VALUES (7, 50, '1998-02-03' , 600);
INSERT INTO int_orders VALUES (7, 60, '1998-03-02', 720);
INSERT INTO int_orders VALUES (7, 70, '1998-05-06' , 150);
INSERT INTO int_orders VALUES (8, 20, '1999-01-30' , 1800);


SELECT * FROM int_orders;

--# As seen from the table, a single sales person can take multiple orders

--# Common use cases of aggregates

-- Simple sum

SELECT SUM(amount) FROM int_orders; --Point number 7) in the explanatory notes

-- Get the sum for each sales person id (you want to see the performance)

SELECT salesperson_id, SUM(amount) FROM int_orders --Point number 8) in the explanatory notes
GROUP BY salesperson_id; --Point number 8) in the explanatory notes

SELECT salesperson_id, order_number, order_date, amount --Point number 11) in the explanatory notes
, sum(amount) over() AS total_sum FROM int_orders; --Point number 11) in the explanatory notes

-- 12) We create a partition by window over salesperson_id

SELECT salesperson_id, order_number, order_date, amount -- Point number 12 in the explanatory notes
, sum(amount) over(partition by salesperson_id) AS total_per_salespeson FROM int_orders; -- Point number 12 in the explanatory notes

-- Use order by order_date and get the running/cumulative sum over order date

SELECT salesperson_id, order_number, order_date, amount -- Point number 13 in the explanatory notes
, sum(amount) over(order by order_date) AS running_sum FROM int_orders; -- Point number 13 in the explanatory notes

-- Next we parition by salesperson_id and continue using order by order_date which gives us running sum over sales person id
SELECT salesperson_id, order_number, order_date, amount -- Point number 14 in the explanatory notes
, sum(amount) over(partition by salesperson_id order by order_date) AS running_sum_salesperson FROM int_orders; -- Point number 14 in the explanatory notes


-- Next we want a kind of rolling sum over sum rows in the table

SELECT salesperson_id, order_number, order_date, amount -- Point number 15 in the explanatory notes
, sum(amount) over(order by order_date rows between 2 preceding and current row)AS rolling_sum FROM int_orders; -- Point number 15 in the explanatory notes


SELECT salesperson_id, order_number, order_date, amount -- Point number 15 in the explanatory notes
, sum(amount) over(order by order_date rows between 3 preceding and current row)AS rolling_sum FROM int_orders; 


SELECT salesperson_id, order_number, order_date, amount -- Point number 15 in the explanatory notes
, sum(amount) over(order by order_date rows between unbounded preceding and current row)AS rolling_sum FROM int_orders; 
