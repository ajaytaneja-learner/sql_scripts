/*
1) Assume you are given the table below containing the information on the searches 
attempted and the percentage of invalid searches by country. 
2) Write a query to obtain the percentage of invalid search result.
3) Output the country (in ascending order), total number of searches and percentage of invalid search rounded to 2 decimal places.
4) Not

e that to find the percentages, multiply by 100.0 and not 100 to avoid integer division.
5) Definition and assumptions:
a)num_search is the number of searches attempted and invalid_result_pct is the percentage of invalid searches.
b)In cases where countries has search attempts but does not have an invalid result percentage, it should be excluded, and vice versa.
*/


CREATE TABLE search_category (
  
  country VARCHAR(100),
  search_cat VARCHAR(100),
  num_search INTEGER,
  invalid_result_pct
  
  );
 

DROP TABLE  search_category;

INSERT INTO search_category VALUES("UK", "home", null, null);
INSERT INTO search_category VALUES("UK", "tax", 98000, 1.00);
INSERT INTO search_category VALUES("UK", "travel",  100000, 3.25);

SELECT * FROM search_category;

with t1 AS
(
SELECT country AS country, search_cat AS search_cat, CAST(num_search AS decimal) AS num_search,
invalid_result_pct AS invalid_result_pct, num_search*invalid_result_pct/100 AS invalid_search
FROM search_category
WHERE country is not null and search_cat is not null and invalid_result_pct is not null
)

, t2 AS 
(
SELECT country AS country, SUM(num_search) AS total_search, SUM(invalid_search) AS invalid_search
FROM t1
GROUP BY country
)

SELECT country, total_search, ROUND((invalid_search/total_search)*100, 2) AS invalid_result_pct
FROM t2

