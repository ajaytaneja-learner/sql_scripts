/*
1)Google marketing managers are analyzing the performance of various advertising accounts over the last month. 
2)They need your help to gather the relevant data.
3)Write a query to calculate the return on ad spend (ROAS) for each advertiser across all ad campaigns. 
4)Round your answer to 2 decimal places, and order your output by the advertiser_id.
5)Hint: ROAS = Ad Revenue / Ad Spend
*/

CREATE TABLE ad_campaigns (
  
  campaign_id INTEGER,
  spend INTEGER,
  revenue float,
  advertiser_id integer

  );
  
DROP TABLE ad_campaigns;

INSERT INTO ad_campaigns VALUES(1, 5000, 7500, 3);
INSERT INTO ad_campaigns VALUES(2, 1000, 900, 1);
INSERT INTO ad_campaigns VALUES(3, 3000, 12000, 2);
INSERT INTO ad_campaigns VALUES(4, 500, 2000, 4);
INSERT INTO ad_campaigns VALUES(5, 100, 400, 4);

SELECT * FROM ad_campaigns;

with adc AS
(
 SELECT CAST(spend AS decimal) AS sp, CAST(revenue AS decimal) AS re, advertiser_id AS aid
 FROM ad_campaigns

)
SELECT aid AS advertiser_id, ROUND(SUM(re) / SUM(sp), 2)
FROM adc
GROUP BY aid
ORDER BY aid;

