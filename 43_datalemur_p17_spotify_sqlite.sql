/*
1) Assume there are three Spotify tables containing information about the artists, songs, and music charts. 
2) Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times. 
3) From now on, we'll refer to this ranking number as "song appearances".
Output the top 5 artist names in ascending order along with their song appearances ranking 
(not the number of song appearances, but the rank of who has the most appearances). The order of the rank should take precedence.
----
4)For example, Ed Sheeran's songs appeared 5 times in Top 10 list of the global song rank table; 
this is the highest number of appearances, so he is ranked 1st. Bad Bunny's songs appeared in the list 4, so he comes in at a close 2nd.
---
Assumptions:
5) If two artists' songs have the same number of appearances, the artists should have the same rank.
The rank number should be continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5).
*/

CREATE TABLE artists (
  
  artist_id INTEGER,
  artist_name VARCHAR(100)
  
  );
  
CREATE TABLE songs (
  
  song_id INTEGER,
  artist_id INTEGER
  
  );
  
CREATE TABLE global_song_rank (
  
  day integer,
  song_id INTEGER,
  rank INTEGER
  
  );
  
DROP TABLE artists;
INSERT INTO artists VALUES(101, "Ed Sheeran");
INSERT INTO artists VALUES(120, "Drake");

DROP TABLE songs;
INSERT INTO songs VALUES(45202, 101);
INSERT INTO songs VALUES(19960,	120);

DROP TABLE global_song_rank;
INSERT INTO global_song_rank VALUES(1, 45202, 5);
INSERT INTO global_song_rank VALUES(3, 45202, 2);
INSERT INTO global_song_rank VALUES(1, 19960, 3);
INSERT INTO global_song_rank VALUES(9, 19960, 15);

with t1 AS
(
SELECT artists.artist_id AS aid, artists.artist_name AS an, songs.song_id AS sid, songs.artist_id
FROM artists
LEFT JOIN songs
ON artists.artist_id = songs.artist_id
)

, t2 AS
(
SELECT DISTINCT t1.aid AS aid, t1.sid, global_song_rank.rank AS gsr, t1.an AS an
, COUNT(t1.aid)  OVER(PARTITION BY t1.aid ORDER BY global_song_rank.rank) AS total
FROM t1
LEFT JOIN global_song_rank
ON t1.sid = global_song_rank.song_id
WHERE global_song_rank.rank <=10 --top 10
--GROUP BY t1.aid, global_song_rank.rank
)

SELECT DISTINCT t2.aid
, DENSE_RANK() OVER(ORDER BY t2.gsr, t2.total)
FROM t2
GROUP BY t2.aid








