
/*
actions a user can be able to do 
1. create (create its actions)
2. read  (get a list of records)
3. update (reupdate its data)
4. delete (delete its actions) 
*/


-- user endpoints and profile endpoits
-- create user
insert into user (email,pass,phone, role) values("userliz@gmail.com","passliz","681207975","1");
-- update user data
update user
set email = "yliz2@gmail.com", pass= "123liz", phone = "68120797", role= "2"
	where user_id= 7;

-- delete user

-- Actualizar el estado del perfil a inactivo
UPDATE USER SET is_active = false WHERE user_id = 7;
-- Desvincular las relaciones en otras tablas
update profile set user_id = null where user_id=6;
-- insert into session (user_id,ip,status,datetime)values(3,"192.168.1.7","active",now());
update session set user_id = null where user_id=3;
-- considera el campo is_active, para obtener usuarios activos
select * from user where is_active = true;
-- consideramos datos relacionados de un usuario
select *  from profile where user_id = 6;
select * from session where user_id =3;

-- list users by role
select * from user where role =2;

-- create a session
insert into session (user_id,ip,status, datetime) values (2,"192.168.1.6","active", now());
-- create a profile
insert into profile (user_id,nick_name, about, privacy, img_path, verified,is_active) values (6,"licha", "amo los gatos","publico","img_liz",1,1);
-- delete a profile
-- Actualizar el estado del perfil a inactivo
UPDATE PROFILE SET is_active = false WHERE profile_id = 1;
-- Desvincular las relaciones en otras tablas
UPDATE ALBUM SET profile_id = NULL WHERE profile_id = 1;
UPDATE COLLABORATORS SET profile_id = NULL WHERE profile_id = 1;
UPDATE blocked SET profile_id_em = NULL WHERE profile_id_em = 1;
UPDATE blocked SET profile_id_rec = NULL WHERE profile_id_rec = 1;
UPDATE collection SET profile_id = NULL WHERE profile_id = 1;
UPDATE COMMENT SET profile_id = NULL WHERE profile_id = 1;
UPDATE following SET profile_id_em = NULL WHERE profile_id_em = 1;
UPDATE following SET profile_id_rec = NULL WHERE profile_id_rec = 1;
UPDATE notification SET profile_id_em = NULL WHERE profile_id_em = 1;
UPDATE notification SET profile_id_rec = NULL WHERE profile_id_rec = 1;
UPDATE rate_me SET profile_id_em = NULL WHERE profile_id_em = 1;
UPDATE rate_me SET profile_id_rec = NULL WHERE profile_id_rec = 1;
UPDATE reaction SET profile_id = NULL WHERE profile_id = 1;
UPDATE saved SET profile_id = NULL WHERE profile_id = 1;
UPDATE searches SET profile_id = NULL WHERE profile_id = 1;
UPDATE tags SET profile_id = NULL WHERE profile_id = 1;
UPDATE views SET profile_id = NULL WHERE profile_id = 1;
-- considera el campo is_active, para obtener perfiles activos
SELECT * FROM PROFILE WHERE is_active = true;
-- consideramos datos relacionados de un perfil
SELECT * FROM ALBUM WHERE profile_id = 1;
SELECT * FROM COLLABORATORS  WHERE profile_id = 1;
SELECT * FROM blocked  WHERE profile_id_em = 1;
SELECT * FROM blocked WHERE profile_id_rec = 1;
SELECT * FROM collection  WHERE profile_id = 1;
SELECT * FROM COMMENT  WHERE profile_id = 1;
SELECT * FROM following WHERE profile_id_em = 1;
SELECT * FROM following WHERE profile_id_rec = 1;
SELECT * FROM notification WHERE profile_id_em = 1;
SELECT * FROM notification WHERE profile_id_rec = 1;
SELECT * FROM rate_me WHERE profile_id_em = 1;
SELECT * FROM rate_me WHERE profile_id_rec = 1;
SELECT * FROM reaction WHERE profile_id = 1;
SELECT * FROM saved  WHERE profile_id = 1;
SELECT * FROM searches  WHERE profile_id = 1;
SELECT * FROM tags   WHERE profile_id = 1;
SELECT * FROM views WHERE profile_id = 1;

-- modify profile content
update profile
set nick_name = "yurix", about= "about yuri", privacy = "private", img_path= "img_pathhyuri",verified=0,is_active=0 
	where profile_id= 7;


/*
TO BE CONSIDERED
--me  =  1, another account = 2 , any post = 10
--any search = 7 , any album = 8, any collection = 3
*/
----------------------------------------------------------------
-- BLOCKED AND PROFILE TABLES USED
-- blocking a profile
INSERT INTO `BLOCKED` (`profile_id_em`, `profile_id_rec`) VALUES
(1, 2);
-- unblocking a profile
DELETE FROM BLOCKED WHERE profile_id_em = 1 AND profile_id_rec = 2;
-- get a list 
SELECT * FROM BLOCKED WHERE profile_id_em = 1;

-- FOLLOWING TABLE USED AND PROFILE TABLE
-- follow a profile
INSERT INTO FOLLOWING (profile_id_em, profile_id_rec) VALUES (1, 2);
-- unfollow a profile
DELETE FROM FOLLOWING WHERE profile_id_rec = 2 and profile_id_em = 1;
-- delete follower
DELETE FROM FOLLOWING WHERE profile_id_em = 2 AND profile_id_rec = 1;
-- get a list of my followers
SELECT * FROM FOLLOWING WHERE profile_id_rec = 1;
-- get a list of profiles I follow
SELECT * FROM FOLLOWING WHERE profile_id_em = 1;


-- RATE AND PROFILES TABLES USED
-- rate a profile
INSERT INTO RATE_ME (profile_id_em, profile_id_rec, datetime, description, rate)
VALUES (1, 2, NOW(), 'Great photographer!', 10.5);
-- unrate a profile
DELETE FROM RATE_ME WHERE profile_id_em = 1 and profile_id_rec = 2;
-- get my rate
SELECT AVG(rate) AS average_rate FROM RATE_ME WHERE profile_id_rec = 1;
-- get a list of profiles I rate
SELECT * FROM RATE_ME WHERE profile_id_em = 1;

-- TAG , POST AND PROFILE TABLES USED
-- create a tag post
INSERT INTO TAGS (post_id, profile_id) VALUES (10, 2);
-- untag a profile of a post
DELETE FROM TAGS WHERE post_id = 10 AND profile_id = 2;
-- tags list of a post
SELECT * FROM TAGS WHERE post_id = 1;


-- SEARCH TABLE USED AND PROFILE
-- create a search
INSERT INTO SEARCHES (profile_id, search_text, datetime) VALUES (1, 'Travel destinations', NOW());
-- searching records (get list)
SELECT * FROM SEARCHES WHERE profile_id = 1;
-- last 6 recent records 
SELECT * FROM SEARCHES ORDER BY datetime DESC LIMIT 6; 
-- delete my records from searching table
DELETE FROM SEARCHES WHERE search_id = 7;


-- ALBUM, POST AND PROFILE TABLES USED
-- create an album
INSERT INTO ALBUM (album_name, profile_id, description) VALUES ('Vacation Album', 1, 'Our amazing trip');
-- delete an album
-- DELETE FROM POST WHERE album_id = 8; --its posts, but ...
DELETE FROM ALBUM WHERE album_id = 8;
-- update album
UPDATE ALBUM SET description = 'Updated description' WHERE album_id = 1;
UPDATE ALBUM SET album_name = 'not vacation but party' WHERE album_id = 1;
-- get album list of a profile
SELECT * FROM ALBUM WHERE profile_id = 1;
-- view content of an especific album
SELECT * FROM POST WHERE album_id = 8;


-- COLLABORATOR, ALBUM AND PROFILE TABLES USED   
-- create a collaboration on an album
INSERT INTO COLLABORATORS (profile_id, album_id) VALUES (2, 8);
-- delete a album collaborator  album
DELETE FROM COLLABORATORS WHERE profile_id = 2 AND album_id = 8;
-- list of collaborators of an album
SELECT * FROM COLLABORATORS WHERE album_id = 8;


-- COLLECTION AND PROFILE TABLES USED
-- create a collection
INSERT INTO COLLECTION (profile_id, collection_name) VALUES (1, 'Favorites');
-- get records list of a collection
SELECT * FROM COLLECTION WHERE profile_id = 1;
-- update name
UPDATE COLLECTION SET collection_name = 'Best of 2023' WHERE collection_id = 3;
-- delete a collection
DELETE FROM COLLECTION WHERE collection_id = 3;


-- SAVED, POST, COLLECTION AND PROFILE TABLES USED
-- save a post in a collection created
INSERT INTO SAVED (profile_id, post_id, collection_id) VALUES (1, 10, 3);
-- get list of post saved in a collection
SELECT * FROM SAVED WHERE collection_id = 3;
-- erase a post from a collection
DELETE FROM SAVED WHERE profile_id = 1 AND post_id = 10;


-- VIEWS, POST AND PROFILE TABLES USED
-- create a record
INSERT INTO VIEWS (post_id, profile_id, datetime) VALUES (10, 1, NOW());
-- get records list of an post
SELECT * FROM VIEWS WHERE post_id = 10;
-- delete a record
DELETE FROM VIEWS WHERE post_id = 10 AND profile_id = 1;

------------------------------------------------------------------  

-- POST ENDPOINTS
-- POST TABLE USED AND PROFILE TABLE
-- create a post(done)
insert into post (album_id,text,data_search,privacy,type,date)values(22,"postliz","data","private","tmp",now());
-- update a post
update post
set text ="postlizedit", data_search= "data",privacy="public", type="ordinary", date= now()
	where post_id= 11;

-- detele a post and its tags
-- Actualizar el estado del post a deshabilitado 1 -> 0 
update post set enabled = false where post_id= 11;
-- Desvincular las relaciones en otras tablas
update media set post_id= null where post_id=1;
update tags set post_id= null where post_id=1;
update views set post_id= null where post_id=1;
update saved set post_id= null where post_id=1;
update comment set post_id= null where post_id=1;
update reaction set post_id= null where post_id=1;
-- considera el campo enabled, para obtener post habilitados
select * from post where enabled = true;
-- consideramos datos relacionados de un post
select * from media where post_id=1;
select * from tags where post_id=1;
select * from views where post_id=1;
select * from saved where post_id=1;
select * from comment where post_id=1;
select * from reaction where post_id=1;

-- REACTION, POST, COMMENT AND PROFILE TABLES USED
-- react a post or comment
 insert into reaction(post_id,profile_id,comment_id,type)values(2,3,2,"like");
 insert into comment(post_id,comment_id_rec,profile_id,comment_text,datetime)values(10,1,3,"bella",now());
-- unreact a post
delete from reaction where post_id=2 and profile_id=3;

-- COMMENT, POST AND PROFILE TABLES USED
-- create a comment on a post
insert into comment(post_id,comment_id_rec,profile_id,comment_text,datetime)values(9,null,4,"bellisima",now());

-- create a comment on a comment // not sure
insert into comment(post_id,comment_id_rec,profile_id,comment_text,datetime)values(9,6,5,"bellisimax2",now());

-- delete comment and its list of comments

-- rewrite comment
update comment set comment_text=" estas lindaji" , datetime= now() where comment_id=5;
-- get list of post comments
select * from comment where post_id=1;

-- get list of comments of a comment

select  comment_text from comment where comment_id_rec =1;

-- MEDIA ...
-- ...

--
------------------------------------------------------------------------------------------------

-- NOTIFICATION, REACTION, COMMENT, RATE_ME, FOLLOWING, AND PROFILE TABLES USED
-- profile_id_em = 1, profile_id_rec = 2, action=(any table)

--create notification

(2, 1, 'Comentó en tu publicación', 'comment', 1, now());
--profile_id_em = 1, profile_id_rec = ?, post_id = 3, album_id _= 4
--to comment

declare @profile_id_rec int;
select A.profile_id into @profile_id_rec
from `POST` P
inner join `ALBUM` A on P.album_id = A.album_id
where A.album_id = 4;
INSERT INTO `NOTIFICATION` (`profile_id_em`, `profile_id_rec`, `actions`, `type`, `id`, `datetime`) VALUES
(1, @profile_id_rec, 'has commented on', 'post', 3, now());
--select *  from post where post_id = 3;


--to tag
'has tagged you in'
INSERT INTO TAGS (post_id, profile_id) VALUES (10, 2);
INSERT INTO `NOTIFICATION` (`profile_id_em` , `profile_id_rec`, `actions`, `type`, `id`, `datetime`) VALUES
(1, 2,'has rated you', 'post', 10, now());

--to rate
INSERT INTO RATE_ME (profile_id_em, profile_id_rec, datetime, description, rate)
VALUES (1, 2, NOW(), 'Great photographer!', 9.5);
INSERT INTO `NOTIFICATION` (`profile_id_em` , `profile_id_rec`, `actions`, `type`, `id`, `datetime`) VALUES
(1, 2,'has rated you', 'profile', 1, now());


--to colaborate
INSERT INTO `COLLABORATORS` (profile_id, album_id) VALUES (2, 8);
declare @profile_id_rec int;
select profile_id into @profile_id_rec
from `ALBUM` where album_id = @album_id;
INSERT INTO `NOTIFICATION` (`profile_id_em` , `profile_id_rec`, `actions`, `type`, `id`, `datetime`) VALUES
(2, @profile_id_rec,'wants you to collaborate in a new album', 'album', 8, now());


--to follow
'wants to follow you'
INSERT INTO FOLLOWING (profile_id_em, profile_id_rec) VALUES 
(1, 2);
INSERT INTO `NOTIFICATION` (`profile_id_em`, `profile_id_rec`, `actions`, `type`, `id`, `datetime`) VALUES
(1, 2, 'wants to follow you', 'profile', 1, now());


--to react
INSERT INTO `REACTION` (`post_id`, `profile_id`, `comment_id`, `type`) VALUES
(1, 1, NULL, 'like');
declare @profile_id_rec int;
SELECT A.profile_id into @profile_id_rec 
FROM REACTION R
INNER JOIN POST P ON R.post_id = P.post_id
INNER JOIN ALBUM A ON P.album_id = A.album_id
WHERE R.post_id = 3;

INSERT INTO `NOTIFICATION` (`profile_id_em`, `profile_id_rec`, `actions`, `type`, `id`, `datetime`) VALUES
(1, @profile_id_rec, 'has reacted to', 'post', 3, now());
--select *  from post where post_id = 3;

--delete notification
DELETE FROM NOTIFICATION WHERE notification_id = 12;
--DELETE FROM TABLE_NAME WHERE column_name IN (value1, value2, value3);


-- my activity
select * from notification where profile_id_em = 1 order by datetime desc limit 10 offset 1;  
--SELECT * FROM TABLE_NAME ORDER BY datetime_column DESC LIMIT 10 OFFSET 10;