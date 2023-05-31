--DML

--Data Insertion
INSERT INTO users VALUES(1, 'John', 'john@gmail.com', 'Male', DATE'1990-05-15', 'USA', 'Extra data 1');
INSERT INTO users VALUES(2, 'Sarah', 'sarah@outlook.com', 'Female', DATE'1985-09-20', 'Canada', 'Extra data 2');
INSERT INTO users VALUES(3, 'Michael', 'michael@hotmail.com', 'Male', DATE'1995-02-10', 'UK', 'Extra data 3');
INSERT INTO users VALUES(4, 'Emily', 'emily@outlook.com', 'Female', DATE'1992-11-03', 'Spain', 'Extra data 4');

INSERT INTO channel VALUES(1, 'Gaming Channel', DATE'2022-07-10', 'Gaming', 'Public', 1);
INSERT INTO channel VALUES(2, 'Cooking Channel', DATE'2021-03-25', 'Cooking', 'Private', 2);
INSERT INTO channel VALUES(3, 'Travel Vlogs', DATE'2023-01-05', 'Travel', 'Public', 3);
INSERT INTO channel VALUES(4, 'Fitness Channel', DATE'2022-11-18', 'Fitness', 'Public', 4);
INSERT INTO channel VALUES(5, 'Tech Reviews', DATE'2023-04-02', 'Tech', 'Private', 1);

INSERT INTO subscription VALUES (1, 1, 2, DATE'2022-01-01');
INSERT INTO subscription VALUES (2, 2, 3, DATE'2022-02-02');
INSERT INTO subscription VALUES (3, 3, 4, DATE'2022-03-03');
INSERT INTO subscription VALUES (4, 4, 1, DATE'2022-04-04');

INSERT INTO video VALUES(1, 1, 'Introduction to Gaming', 'English', DATE'2022-07-12', 600, 'Tutorial', 'Public');
INSERT INTO video VALUES(2, 2, 'Easy Pasta Recipe', 'Spanish', DATE'2021-03-27', 450, 'Cooking', 'Private');
INSERT INTO video VALUES(3, 3, 'Exploring Bali', 'French', DATE'2023-01-07', 900, 'Travel', 'Public');
INSERT INTO video VALUES(4, 4, 'Full Body Workout', 'German', DATE'2022-11-20', 800, 'Fitness', 'Public');
INSERT INTO video VALUES(5, 1, 'iPhone 13 Review', 'English', DATE'2023-04-04', 720, 'Tech', 'Private');
INSERT INTO video VALUES(6, 2, 'Summer Fashion Trends', 'Spanish', DATE'2021-08-17', 600, 'Fashion', 'Public');
INSERT INTO video VALUES(7, 3, 'Acoustic Cover', 'French', DATE'2022-05-05', 300, 'Music', 'Private');

INSERT INTO videoQuality VALUES (1, 1, '480p');
INSERT INTO videoQuality VALUES (2, 1, '1080p');
INSERT INTO videoQuality VALUES (3, 2, '720p');
INSERT INTO videoQuality VALUES (4, 2, '1080p');
INSERT INTO videoQuality VALUES (5, 3, '720p');
INSERT INTO videoQuality VALUES (6, 3, '1080p');
INSERT INTO videoQuality VALUES (7, 4, '720p');
INSERT INTO videoQuality VALUES (8, 4, '1080p');
INSERT INTO videoQuality VALUES (9, 5, '720p');
INSERT INTO videoQuality VALUES (10, 5, '1080p');
INSERT INTO videoQuality VALUES (11, 6, '480p');
INSERT INTO videoQuality VALUES (12, 6, '1080p');
INSERT INTO videoQuality VALUES (13, 7, '480p');
INSERT INTO videoQuality VALUES (14, 7, '720p');

INSERT INTO playlist VALUES(1, 1, 'Gaming Favorites', DATE'2022-08-05', 'Private');
INSERT INTO playlist VALUES(2, 2, 'Recipes to Try', DATE'2021-04-15', 'Public');
INSERT INTO playlist VALUES(3, 3, 'Adventure Time', DATE'2023-02-20', 'Private');
INSERT INTO playlist VALUES(4, 4, 'Workout Motivation', DATE'2022-12-25', 'Public');

INSERT INTO playlistVideo VALUES (1, 1, DATE'2022-01-01');
INSERT INTO playlistVideo VALUES (1, 2, DATE'2022-02-02');
INSERT INTO playlistVideo VALUES (1, 3, DATE'2022-03-03');
INSERT INTO playlistVideo VALUES (2, 4, DATE'2022-04-04');
INSERT INTO playlistVideo VALUES (2, 5, DATE'2022-05-05');
INSERT INTO playlistVideo VALUES (3, 6, DATE'2022-06-06');
INSERT INTO playlistVideo VALUES (3, 7, DATE'2022-07-07');
INSERT INTO playlistVideo VALUES (4, 1, DATE'2022-08-08');
INSERT INTO playlistVideo VALUES (4, 3, DATE'2022-09-09');
INSERT INTO playlistVideo VALUES (4, 5, DATE'2022-10-10');

INSERT INTO watch VALUES (1, 1, 1, DATE'2022-01-01');
INSERT INTO watch VALUES (2, 2, 2, DATE'2022-02-02');
INSERT INTO watch VALUES (3, 3, 3, DATE'2022-03-03');
INSERT INTO watch VALUES (4, 4, 4, DATE'2022-04-04');
INSERT INTO watch VALUES (5, 1, 5, DATE'2022-05-05');
INSERT INTO watch VALUES (6, 2, 6, DATE'2022-06-06');
INSERT INTO watch VALUES (7, 3, 7, DATE'2022-07-07');
INSERT INTO watch VALUES (8, 4, 1, DATE'2022-08-08');
INSERT INTO watch VALUES (9, 1, 2, DATE'2022-09-09');
INSERT INTO watch VALUES (10, 2, 3, DATE'2022-10-10');

INSERT INTO react VALUES (1, 1, 1, DATE'2022-01-01', 'Like');
INSERT INTO react VALUES (2, 2, 2, DATE'2022-02-02', 'Dislike');
INSERT INTO react VALUES (3, 3, 3, DATE'2022-03-03', 'Like');
INSERT INTO react VALUES (4, 4, 4, DATE'2022-04-04', 'Dislike');
INSERT INTO react VALUES (5, 1, 5, DATE'2022-05-05', 'Like');
INSERT INTO react VALUES (6, 2, 2, DATE'2022-06-06', 'Dislike');

--See All the Inserted Data
SELECT * FROM users;
SELECT * FROM channel;
SELECT * FROM subscription;
SELECT * FROM video;  
SELECT * FROM videoQuality; 
SELECT * FROM playlist; 
SELECT * FROM playlistVideo; 
SELECT * FROM watch; 
SELECT * FROM react;

--Drop a Column from users Table
ALTER TABLE users
DROP COLUMN user_extra_column;

--Add a column in users table
ALTER TABLE users
ADD user_extra_column VARCHAR(100);

--Rename the column name of "user_extra_coulum" in users TABLE
ALTER TABLE users
RENAME COLUMN user_extra_column TO users_religion;

--Modify column attribute
ALTER TABLE users
MODIFY users_religion VARCHAR(15);

--Update value of a query using "AND" operator
SELECT * FROM react;
UPDATE react SET react_type='Like' WHERE video_id=6 AND user_id=2;
SELECT * FROM react;

--Delete value of a query using "AND" operator
DELETE FROM react where video_id=6 AND user_id=2;
SELECT * FROM react;

--Select Clause
--Video length in hours
SELECT video_title, (video_duration/60) AS video_duration_in_hours FROM video;

--Where Clause
SELECT video_title FROM video WHERE video_type='Cooking';

--From Clause
SELECT * FROM video, videoQuality WHERE video.video_id = videoQuality.video_id;

--Between Comparison Operator
SELECT * FROM video WHERE video_upload_date BETWEEN DATE'2022-01-01' AND DATE'2022-12-31';

--String Operation (Finding "Gamil" users)
SELECT * FROM users WHERE user_email LIKE '%gmail%';

--Ordering the Display of Tuples
SELECT * FROM video ORDER BY video_upload_date;

--Set Membership 

--In (Videos In set of Languages)
SELECT video_title FROM video WHERE video_language IN('Spanish', 'English');

--Not In (Videos that are Not In set of Languages)
SELECT video_title FROM video WHERE video_language NOT IN('Spanish', 'English');


--Aggregate Functions

--Count (The number of subscriber of a channel)
SELECT COUNT(channel_id) FROM subscription WHERE channel_id=2;

--Max (The maximum video duration)
SELECT MAX(video_duration) FROM video;

--Distinct (Distinct video qualities)
SELECT DISTINCT(video_quality) FROM videoQuality;

--Avg (Average Video duration)
SELECT AVG(video_duration) FROM video;

--Sum (Summation of the video durations)
SELECT SUM(video_duration) FROM video;

--Group By .... Where (Quality wise video number count where video id is greater than 3)
SELECT video_quality, COUNT(video_quality) FROM videoQuality
WHERE video_id > 3 GROUP BY video_quality;

--Group By .... Having (Privacy wise video count where average video duration greater than 500)
SELECT video_privacy,  COUNT(video_privacy) FROM video
GROUP BY video_privacy HAVING AVG(video_duration)>500;


--Sub Query(React details of a user name Sarah)
SELECT * FROM react WHERE user_id = (SELECT user_id FROM users WHERE user_name='Sarah');


--Set operation

--Union (Video titles of the videos of video type is Travel or video quality is 720p or react type is Dislike)
SELECT video_title FROM video where video_id 
IN ((SELECT video_id FROM video WHERE video_type='Travel')
UNION
(SELECT video_id FROM videoQuality WHERE video_quality='720p')
UNION
(SELECT video_id FROM react WHERE react_type='Dislike'));

--Intersect (Video titles of the videos of video type is Travel and react type is Dislike)
SELECT video_title FROM video where video_id 
IN ((SELECT video_id FROM video WHERE video_type='Travel')
INTERSECT
(SELECT video_id FROM react WHERE react_type='Like'));

--Except (Video titles of the videos of video type is Travel but not reacted Disliked)
SELECT video_title FROM video where video_id 
IN ((SELECT video_id FROM video WHERE video_type='Travel')
EXCEPT
(SELECT video_id FROM react WHERE react_type='Dislike'));

--Union ALL (Will take all the duplicates)
SELECT video_title FROM video where video_id 
IN ((SELECT video_id FROM video WHERE video_type='Travel')
UNION ALL
(SELECT video_id FROM videoQuality WHERE video_quality='720p')
UNION ALL
(SELECT video_id FROM react WHERE react_type='Dislike'));


--Join

--Natural JOIN (Natural Join users and channel table)
SELECT user_name, channel_name FROM users NATURAL JOIN channel;

--Join (Join video and videoQuality table to find the video titles where video quality is 480p)
SELECT video.video_title FROM video JOIN videoQuality 
ON video.video_id = videoQuality.video_id AND video_quality = '480p';

--Inner Join (Inner Join video and videoQuality table to find the video titles where video quality is 480p)
SELECT video.video_title FROM video INNER JOIN videoQuality 
ON video.video_id = videoQuality.video_id AND video_quality = '480p';

--Outer JOIN

--Left Outer Join (Count the number of Dislikes where video title is 'Easy Pasta Recipe')
SELECT count(react.react_type) FROM video LEFT OUTER JOIN react
on video.video_id = react.video_id 
AND video.video_id = (SELECT video_id FROM video WHERE video_title='Easy Pasta Recipe') 
AND react.react_type='Dislike';

--Right Outer Join
SELECT count(react.react_type) FROM video RIGHT OUTER JOIN react
on video.video_id = react.video_id 
AND video.video_id = (SELECT video_id FROM video WHERE video_title='Easy Pasta Recipe') 
AND react.react_type='Dislike';

--Full Outer Join
SELECT * FROM video FULL OUTER JOIN react on video.video_id = react.video_id;


--Views
--Create a virtual table combining users & channel table
CREATE VIEW users_channel AS SELECT u.user_id ,u.user_name, c.channel_id, c.channel_name, c.channel_type FROM users u, channel c WHERE u.user_id=c.user_id;

--Find the user_name from the virtual table having more than 1 channels and the number of channels
SELECT user_name, count(channel_id) AS No_of_Channels FROM users_channel GROUP BY user_id, user_name HAVING count(channel_id)>=2;

--Drop View
DROP VIEW users_channel;