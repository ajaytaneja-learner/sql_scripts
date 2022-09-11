/*
1) The idea to introduce this tutorial that a running sum using analytical functio over()  will no work if 
there are repeated values
2) This is demonstarted by the queries below
*/

CREATE TABLE prod_costs (
  prod_id VARCHAR(40),
  cost INT
);

DROP TABLE prod_costs;

INSERT INTO prod_costs VALUES('P1', 200); 
INSERT INTO prod_costs VALUES('P2', 300); 
INSERT INTO prod_costs VALUES('P3', 300); 
INSERT INTO prod_costs VALUES('P4', 1300); 
INSERT INTO prod_costs VALUES('P5', 2100); 

SELECT * 
,SUM(cost) OVER(ORDER BY cost asc)
FROM prod_costs;

SELECT *
, sum(cost) OVER(ORDER BY cost asc rows between unbounded preceding AND current row) as running_cost
FROM prod_costs;