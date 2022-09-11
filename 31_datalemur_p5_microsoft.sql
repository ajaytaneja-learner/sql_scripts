/*
Teams Power Users
1) Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. 
2) Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.
3) Assumption: No two users sent the same number of messages in August 2022.
*/

CREATE TABLE messages (
  
  message_id INT,
  sender_id INT,
  receiver_id INT,
  content VARCHAR(200),
  sent_date DATETIME

  );
  
DROP TABLE messages;
  
#Let us see an example input
  
INSERT INTO messages VALUES(901, 3601, 4500, 'You up?', '2022-08-03 00:00:00');
INSERT INTO messages VALUES(902, 4500, 3601, "Only if you're buying?", '2022-08-03 00:00:00');
INSERT INTO messages VALUES(743, 3601, 8752, "Let's take this offline", '2022-06-14 00:00:00');
INSERT INTO messages VALUES(922, 3601, 4500, "Get on the call", '2022-08-10 00:00:00');

SELECT * FROM messages;

#The example output should look like this

CREATE TABLE example_output_messages (
  
  sender_id INT,
  message_count INT

  );
  
DROP TABLE example_output_messages;
  
INSERT INTO example_output_messages VALUES(3601, 2);
INSERT INTO example_output_messages VALUES(4500, 1);
  
SELECT * FROM example_output_messages;
  
SELECT sender_id, COUNT(message_id) AS message_count
FROM messages
WHERE sent_date >= '2022-08-01 00:00:00' and sent_date < '2022-09-01 00:00:00'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;
  