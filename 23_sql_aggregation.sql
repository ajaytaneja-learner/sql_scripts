/*

1) References: https://youtu.be/5Ighj_2PGV0?list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH
2) All about SQL aggregation
3) There are 6 to 7 different ways of doing SQL aggregation.
4) All flavours discussed
5) Aggregate functions: sum(), avg(), min(), max()
6) Concepts in this script are declared using SUM()

Concepts discussed
7) Plain SUM()
8) SUM() using group by fo each salesperson_id
9) Now, the limitation of group by is hat you can have only the column displayed with which you have done the group by
10) We overcome this limitation by using windows functions
11) First we demonstrate the use of over() which just sums all he amount not grouped by any column. So, the value of 7) above is simply copied to each row

 */
 
 # Lets create a table called int_orders which comprises of 
 
CREATE TABLE int_orders(
 salesperson_id INT NOT NULL,
 order_number INT NOT NULL,
 order_date DATE NOT NULL,
 amount FLOAT NOT NULL
);

DROP TABLE int_orders;

INSERT INTO int_orders VALUES (1, 30, CAST(N'1995-07-14' AS DATE), 460);
INSERT INTO int_orders VALUES (2, 10, CAST(N'1996-08-02' AS DATE), 540);
INSERT INTO int_orders VALUES (2, 40, CAST(N'1998-01-29' AS DATE), 2400);
INSERT INTO int_orders VALUES (7, 50, CAST(N'1998-02-03' AS DATE), 600);
INSERT INTO int_orders VALUES (7, 60, CAST(N'1998-03-02' AS DATE), 720);
INSERT INTO int_orders VALUES (7, 70, CAST(N'1998-05-06' AS DATE), 150);
INSERT INTO int_orders VALUES (8, 20, CAST(N'1999-01-30' AS DATE), 1800);


SELECT * FROM int_orders;

# As seen from the table, a single sales person can take multiple orders

# Common use cases of aggregates

-- Simple sum

SELECT SUM(amount) FROM int_orders;

-- Get the sum for each sales person id (you want to see the performance)

SELECT salesperson_id, SUM(amount) FROM int_orders
GROUP BY salesperson_id;







