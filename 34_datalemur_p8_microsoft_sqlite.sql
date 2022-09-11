/*
1) Microsoft Azure's capacity planning team wants to understand how much data its customers are using, 
and how much spare capacity is left in each of it's data centers. You’re given three tables: 
customers, datacenters, and forecasted_demand.
2) Write a query to find the total monthly unused server capacity for each data center. 
Output the data center id in ascending order and the total spare capacity.
*/

CREATE TABLE customers (
  
  name VARCHAR(100),
  customer_id_id INTEGER

  );
  
DROP TABLE customers;
  
INSERT INTO customers VALUES("Florian Simran", 144);
INSERT INTO customers VALUES("Esperanza A. Luna", 109);
INSERT INTO customers VALUES("Garland Acacia", 852);

CREATE TABLE datacenters (
  
  datacenter_id INTEGER,
  name VARCHAR(100),
  monthly_capacity INTEGER

  );
  
  DROP TABLE datacenters;
  
INSERT INTO datacenters VALUES(1, "London", 100);
INSERT INTO datacenters VALUES(3, "Amsterdam", 250);
INSERT INTO datacenters VALUES(4,	"Hong Kong", 400);

CREATE TABLE forecasted_demand (
  
  customer_id INTEGER,
  datacenter_id INTEGER,
  monthly_demand INTEGER

  );
  
  DROP TABLE forecasted_demand;
  
INSERT INTO forecasted_demand VALUES(109, 4, 120);
INSERT INTO forecasted_demand  VALUES(144, 3, 60);
INSERT INTO forecasted_demand  VALUES(144,	4, 105);
INSERT INTO forecasted_demand  VALUES(852, 1, 60);
INSERT INTO forecasted_demand  VALUES(852, 3, 178);

CREATE TABLE example_output_microsoft (
  
  datacenter_id INTEGER,
  spare_capacity INTEGER

  );
  
DROP TABLE example_output_microsoft;
  
INSERT INTO example_output_microsoft VALUES(1, 40);
INSERT INTO example_output_microsoft  VALUES(3, 12);
INSERT INTO example_output_microsoft  VALUES(4, 175);

SELECT * FROM customers;
SELECT * FROM datacenters;
SELECT * FROM forecasted_demand;
  
with forecasted_demand_ctc AS                                                  
(SELECT datacenter_id AS ctc1_dc_id
, SUM(monthly_demand) AS ctc1_datacenter_demand
FROM forecasted_demand
GROUP BY ctc1_dc_id)
, demand_capacity AS
(SELECT forecasted_demand_ctc.ctc1_dc_id AS ctc2_dcid1
, forecasted_demand_ctc.ctc1_datacenter_demand AS ctc2_dc_demand
, datacenters.datacenter_id AS ctc2_dcid2 , datacenters.monthly_capacity AS ctc2_dc_month_capacity

FROM forecasted_demand_ctc
JOIN datacenters
ON ctc2_dcid1 = ctc2_dcid2)


SELECT ctc2_dcid1 AS datacenter_id, ctc2_dc_month_capacity - ctc2_dc_demand AS spare_capacity
FROM demand_capacity 
ORDER BY datacenter_id ASC

