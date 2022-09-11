/*
Cross Join

Reference: https://youtu.be/G-5Mm8ezt3I?list=PLBTZqjSKn0IcR6DhoLUibOG8frnWbZdSH
Reference for CTE: https://youtu.be/QNfnuK-1YYY

This tutorial covers follwoing aspects of cross join
1) What is a cross join?

And then the common use cases of cross join

2) Preparing master data
3) Prepare large number of rows for performance testing

*/

-- Cross Join: What is a cross join? Given two tables we join them wthout explicitly specifying the type of join. The tables are comined covering all possible permutations

CREATE TABLE products(
id INT,
name VARCHAR(20)
);

INSERT INTO products
VALUES (1, 'A');

INSERT INTO products
VALUES (2, 'B');

INSERT INTO products
VALUES (3, 'C');

INSERT INTO products
VALUES (4, 'D');

INSERT INTO products
VALUES (5, 'E');

SELECT * FROM products;

DROP TABLE products;

CREATE TABLE colours(
colour_id INT,
color VARCHAR(20)
);

INSERT INTO colours
VALUES (1, 'Blue');

INSERT INTO colours
VALUES (2, 'Green');

INSERT INTO colours
VALUES (3, 'Orange');

SELECT * FROM colours;

DROP TABLE colours;

# As seen below without using the join keyword we have 'joined' the 2 tables with all posisble permutations
SELECT prod.*, col.* 
FROM products AS prod, colours AS col;

-- Now, we see the use case corresponing to preparation of master data

/*

1) We hav 2 more tables: sizes table and transactions table
2) Lets create these tales fist below

*/

CREATE TABLE sizes(
size_id INT,
size VARCHAR(20)
);

DROP TABLE sizes;

INSERT INTO sizes
VALUES (1, 'M');

INSERT INTO sizes
VALUES (2, 'L');

INSERT INTO sizes
VALUES (3, 'XL');

SELECT * FROM sizes;



CREATE TABLE transactions(
order_id INT,
product_name VARCHAR(20),
colour VARCHAR(20),
size VARCHAR(20),
amount INT
);

DROP TABLE transactions;

INSERT INTO transactions
VALUES (1, 'A', 'Blue', 'L', 300);

INSERT INTO transactions
VALUES (2, 'B', 'Blue', 'XL', 150);

INSERT INTO transactions
VALUES (2, 'B', 'Blue', 'XL', 150);

INSERT INTO transactions
VALUES (3, 'B', 'Green', 'L', 250);

INSERT INTO transactions
VALUES (4, 'C', 'Blue', 'L', 250);

INSERT INTO transactions
VALUES (5, 'E', 'Green', 'L', 270);

INSERT INTO transactions
VALUES (6, 'D', 'Orange', 'L', 200);

INSERT INTO transactions
VALUES (7, 'D', 'Green', 'M', 250);

SELECT * FROM transactions;

/*

Note:

1) As ou can see from the transactions table, there are some transactions
2) The store manager says to gve him the sales for each product, colour and size

*/

# So, we do the follwoing

SELECT product_name, colour, size, sum(amount)  FROM transactions
GROUP BY product_name, colour, size;

/* 

3) Inspite of doing the above, we do not have all permutations
4) Store manager says he wants all the prrmutations
5) If a particular permutation such as: , Green, XL has no sales, 
he wants to see a '0' amount
6) Now you need all the combinations/permutations
7) Here you can make use of cross join as defined above

*/

# Firstly, let us get all he permutations from he definition of cross join as above

SELECT prod_name.name AS poduct_name, item_col.color AS item_colour , item_size.size AS item_size
FROM products AS prod_name, colours AS item_col, sizes AS item_size;

# Doing the above, we get all the permutations

# Now create a cte


with master_data AS 
(SELECT prod_name.name AS poduct_name, item_col.color AS item_colour , item_size.size AS item_size
FROM products AS prod_name, colours AS item_col, sizes AS item_size)
,sales AS (SELECT product_name, colour, size, sum(amount)  FROM transactions
GROUP BY product_name, colour, size)
SELECT md.product_name, md.colour, md.size, s.total_amount FROM master_data md
LEFT JOIN sales s ON md.product_name = s.product_name AND md.colour = s.colour and md.size = s.size







 
