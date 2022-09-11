/*
1) Assume you are given the tables below about Facebook pages and page likes. 
2) Write a query to returns the page IDs of all the Facebook pages that don't have any likes. 
3) The output should be in ascending order.

*/

CREATE TABLE pages (
  
  page_id INT,
  name VARCHAR(100)

  );
  
  DROP TABLE pages;
  
  CREATE TABLE page_likes (
  
  user_id INT,
  page_id INT,
  liked_date DATETIME

  );
  
  DROP TABLE page_likes;
  
INSERT INTO pages VALUES(20001, 'SQL Solutions');
INSERT INTO pages VALUES(20045, 'Brain Exercises');
INSERT INTO pages VALUES(20701, 'Tips for Data Analysts');

INSERT INTO page_likes VALUES(111, 20001,  '2022-04-08 00:00:00');
INSERT INTO page_likes VALUES(121, 20045,  '2022-03-12 00:00:00');
INSERT INTO page_likes VALUES(156, 20001,  '2022-07-25 00:00:00');

#We have to write a query that returns the page ids of all the Facebook pages that do not have a like.
#The output table should look as the one below

CREATE TABLE example_output (
  
  output_page_id INT
 
  );
  
DROP TABLE example_output;
  
INSERT INTO example_output VALUES(20701);
  
SELECT * FROM pages;
SELECT * FROM page_likes;
SELECT * FROM example_output;

#Query

SELECT pages.page_id, pages.name, page_likes.user_id, page_likes.page_id, page_likes.liked_date
FROM pages
LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id;

#Query in fromat asked

SELECT pages.page_id AS page_id
FROM pages
LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id
WHERE page_likes.page_id IS NULL
ORDER BY page_id ASC;

