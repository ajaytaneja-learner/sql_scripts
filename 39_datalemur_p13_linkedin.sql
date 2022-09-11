/*
LinkedIN Power Creators
1) The LinkedIn Creator team is looking for power creators who use their personal profile as a company or influencer page. 
2) If someone's LinkedIn page has more followers than the company they work for, we can safely assume that person is a power creator. 
3) Write a query to return the IDs of these LinkedIn power creators.
4)Assumption: Each person with a LinkedIn profile in this database works at one company only.
*/

CREATE TABLE personal_profiles (
  
  profile_id INTEGER,
  name VARCHAR(500),
  followers INTEGER,
  employer_id INTEGER

  );
  
  DROP TABLE personal_profiles;
  
  INSERT INTO personal_profiles VALUES(1, "Nick Singh", 92000, 4);
  INSERT INTO personal_profiles VALUES(2, "Zach Wilson", 199000,2);
  INSERT INTO personal_profiles VALUES(3,"Daliana Liu", 171000, 1);
  INSERT INTO personal_profiles VALUES(4, "Ravit Jain", 107000, 3);
  INSERT INTO personal_profiles VALUES(5, "Vin Vashishta", 139000, 6);
  INSERT INTO personal_profiles VALUES(6, "Susan Wojcicki", 39000, 5);
  
  SELECT * FROM personal_profiles;
  
  CREATE TABLE company_pages (
  
  company_id INTEGER,
  name VARCHAR(500),
  followers INTEGER
  
  );
  
 DROP TABLE company_pages;
 
INSERT INTO company_pages VALUES(1, "The Data Science Podcast", 8000);
INSERT INTO company_pages VALUES(2, "Airbnb", 700000);
INSERT INTO company_pages VALUES(3, "The Ravit Show", 6000);
INSERT INTO company_pages VALUES(4, "DataLemur", 200);
INSERT INTO company_pages VALUES(5, "YouTube", 16000000);
INSERT INTO company_pages VALUES(6, "DataScience.Vin", 4500);

SELECT * FROM company_pages;

#Continued in sqlite
  



  