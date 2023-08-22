
/*
actions a user can be able to do 
1. create (create its actions)
2. read  (get a list of records)
3. update (reupdate its data)
4. delete (delete its actions) 
*/


--user endpoints and profile endpoits
--create user
--update user data
--delete user
--list users


--create a session
--create a profile
--delete a profile
--modify profile content

/*
TO BE CONSIDERED
--me  =  1, another account = 2 , any post = 10
--any search = 7 , any album = 8, any collection = 3
*/
----------------------------------------------------------------
--BLOCKED AND PROFILE TABLES USED
--blocking a profile
INSERT INTO `BLOCKED` (`profile_id_em`, `profile_id_rec`) VALUES
(1, 2);
--unblocking a profile
DELETE FROM BLOCKED WHERE profile_id_em = 1 AND profile_id_rec = 2;
--get a list 
SELECT * FROM BLOCKED WHERE profile_id_em = 1;

--FOLLOWING TABLE USED AND PROFILE TABLE
--follow a profile
INSERT INTO FOLLOWING (profile_id_em, profile_id_rec) VALUES (1, 2);
--unfollow a profile
DELETE FROM FOLLOWING WHERE profile_id_em = 1;
--delete follower
DELETE FROM FOLLOWING WHERE profile_id_em = 2 AND profile_id_rec = 1;
--get a list of my followers
SELECT * FROM FOLLOWING WHERE profile_id_rec = 1;
--get a list of profiles I follow
SELECT * FROM FOLLOWING WHERE profile_id_em = 1;


--RATE AND PROFILES TABLES USED
--rate a profile
INSERT INTO RATE_ME (profile_id_em, profile_id_rec, datetime, description, rate)
VALUES (1, 2, NOW(), 'Great photographer!', 10.5);
--unrate a profile
DELETE FROM RATE_ME WHERE profile_id_em = 1 and profile_id_rec = 2;
--get my rate
SELECT AVG(rate) AS average_rate FROM RATE_ME WHERE profile_id_rec = 1;
--get a list of profiles I rate
SELECT * FROM RATE_ME WHERE profile_id_em = 1;

--TAG , POST AND PROFILE TABLES USED
--create a tag post
INSERT INTO TAGS (post_id, profile_id) VALUES (10, 2);
--untag a profile of a post
DELETE FROM TAGS WHERE post_id = 10 AND profile_id = 2;
--tags list of a post
SELECT * FROM TAGS WHERE post_id = 1;


--SEARCH TABLE USED AND PROFILE
--create a search
INSERT INTO SEARCHES (profile_id, search_text, datetime) VALUES (1, 'Travel destinations', NOW());
--searching records (get list)
SELECT * FROM SEARCHES WHERE profile_id = 1;
--last 6 recent records 
SELECT * FROM SEARCHES ORDER BY datetime DESC LIMIT 6; 
--delete my records from searching table
DELETE FROM SEARCHES WHERE search_id = 7;


--ALBUM, POST AND PROFILE TABLES USED
--create an album
INSERT INTO ALBUM (album_name, profile_id, description) VALUES ('Vacation Album', 1, 'Our amazing trip');
--delete an album
--DELETE FROM POST WHERE album_id = 8; --its posts, but ...
DELETE FROM ALBUM WHERE album_id = 8;
--update album
UPDATE ALBUM SET description = 'Updated description' WHERE album_id = 1;
UPDATE ALBUM SET album_name = 'not vacation but party' WHERE album_id = 1;
--get album list of a profile
SELECT * FROM ALBUM WHERE profile_id = 1;
--view content of an especific album
SELECT * FROM POST WHERE album_id = 8;


--COLLABORATOR, ALBUM AND PROFILE TABLES USED   
--create a collaboration on an album
INSERT INTO COLLABORATORS (profile_id, album_id) VALUES (2, 8);
--delete a album collaborator  album
DELETE FROM COLLABORATORS WHERE profile_id = 2 AND album_id = 8;
--list of collaborators of an album
SELECT * FROM COLLABORATORS WHERE album_id = 8;


--COLLECTION AND PROFILE TABLES USED
--create a collection
INSERT INTO COLLECTION (profile_id, collection_name) VALUES (1, 'Favorites');
--get records list of a collection
SELECT * FROM COLLECTION WHERE profile_id = 1;
--update name
UPDATE COLLECTION SET collection_name = 'Best of 2023' WHERE collection_id = 3;
--delete a collection
DELETE FROM COLLECTION WHERE collection_id = 3;


--SAVED, POST, COLLECTION AND PROFILE TABLES USED
--save a post in a collection created
INSERT INTO SAVED (profile_id, post_id, collection_id) VALUES (1, 10, 3);
--get list of post saved in a collection
SELECT * FROM SAVED WHERE collection_id = 3;
--erase a post from a collection
DELETE FROM SAVED WHERE profile_id = 1 AND post_id = 10;


--VIEWS, POST AND PROFILE TABLES USED
--create a record
INSERT INTO VIEWS (post_id, profile_id, datetime) VALUES (10, 1, NOW());
--get records list of an post
SELECT * FROM VIEWS WHERE post_id = 10;
--delete a record
DELETE FROM VIEWS WHERE post_id = 10 AND profile_id = 1;

------------------------------------------------------------------  


--POST ENDPOINTS
--POST TABLE USED AND PROFILE TABLE
--create a post(done)
--detele a post and its tags
--...

--REACTION, POST, COMMENT AND PROFILE TABLES USED
--react a post or comment
--unreact a post
--...

--COMMENT, POST AND PROFILE TABLES USED
--create a comment on a post
--create a comment on a comment
--delete comment and its list of comments
--rewrite comment
--get list of post comments
--get list of comments of a comment


--MEDIA ...
--...

--
------------------------------------------------------------------------------------------------

--NOTIFICATION, REACTION, COMMENT, RATE_ME, FOLLOWING, AND PROFILE TABLES USED
--

--history
--get a list of my activity
--