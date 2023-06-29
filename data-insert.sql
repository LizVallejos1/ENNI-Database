/*
INSERT INTO `USER` (`email`, `pass`, `phone`, `role`) VALUES
('usuario1@example.com', 'contraseña1', '1234567890', 'user'),
('usuario2@example.com', 'contraseña2', '9876543210', 'user');

INSERT INTO `PROFILE` (`user_id`, `nick_name`, `about`, `privacy`, `img_path`, `verified`) VALUES
(1, 'Usuario1', 'Acerca de mí', 'público', 'ruta/imagen1.jpg', 1),
(2, 'Usuario2', 'Soy un aficionado a la fotografía', 'privado', 'ruta/imagen2.jpg', 0);

INSERT INTO `ALBUM` (`album_name`, `profile_id`, `description`) VALUES
('Vacaciones 2022', 1, 'Fotos de mis vacaciones en 2022'),
('Paisajes', 2, 'Increíbles paisajes capturados por mí');


INSERT INTO `COLLABORATORS` (`profile_id`, `album_id`) VALUES
(2, 1),
(1, 2);

INSERT INTO `COLLECTION` (`profile_id`, `collection_name`) VALUES
(1, 'Favoritos'),
(2, 'Viajes');

INSERT INTO `POST` (`album_id`, `text`, `data_search`, `privacy`, `type`, `date`) VALUES
(1, '¡Increíble vista desde la playa!', 'playa, vista, vacaciones', 'público', 'foto', '2023-06-20 10:00:00'),
(2, 'Disfrutando de la naturaleza', 'naturaleza, paisaje, viaje', 'privado', 'foto', '2023-06-19 15:30:00');

INSERT INTO `MEDIA` (`post_id`, `type`, `url`, `date`) VALUES
(1, 'imagen', 'ruta/imagen1.jpg', '2023-06-20 10:01:00'),
(2, 'imagen', 'ruta/imagen2.jpg', '2023-06-19 15:31:00');

INSERT INTO `TAGS` (`post_id`, `profile_id`) VALUES
(1, 2),
(2, 1);

INSERT INTO `VIEWS` (`post_id`, `profile_id`, `datetime`) VALUES
(1, 2, '2023-06-20 10:02:00'),
(2, 1, '2023-06-19 15:32:00');

INSERT INTO `SAVED` (`profile_id`, `post_id`, `collection_id`) VALUES
(1, 2, 1),
(2, 1, 2);

INSERT INTO `COMMENT` (`post_id`, `comment_id_rec`, `profile_id`, `comment_text`, `datetime`) VALUES
(1, NULL, 2, 'Hermosa foto', '2023-06-20 10:03:00'),
(1, 1, 1, 'Gracias', '2023-06-20 10:04:00');

INSERT INTO `REACTION` (`post_id`, `profile_id`, `comment_id`, `type`) VALUES
(1, 1, NULL, 'like'),
(1, 2, 1, 'love');

INSERT INTO `RATE_ME` (`profile_id_em`, `profile_id_rec`, `datetime`, `description`, `rate`) VALUES
(1, 2, '2023-06-20 10:05:00', 'Gran fotógrafo', 4.5),
(2, 1, '2023-06-20 10:06:00', 'Muy talentoso', 4.0);

INSERT INTO `FOLLOWING` (`profile_id_em`, `profile_id_rec`) VALUES
(1, 2),
(2, 1);

INSERT INTO `SEARCHES` (`profile_id`, `search_text`, `datetime`) VALUES
(1, 'playa', '2023-06-20 10:07:00'),
(2, 'naturaleza', '2023-06-20 10:08:00');

INSERT INTO `SESSION` (`user_id`, `ip`, `status`, `datetime`) VALUES
(1, '192.168.0.1', 'active', '2023-06-20 10:09:00'),
(2, '192.168.0.2', 'inactive', '2023-06-20 10:10:00');

INSERT INTO `NOTIFICATION` (`profile_id_em`, `profile_id_rec`, `actions`, `type`, `id`, `datetime`) VALUES
(1, 2, 'Te mencionó en un comentario', 'mention', 1, '2023-06-20 10:11:00'),
(2, 1, 'Comentó en tu publicación', 'comment', 2, '2023-06-20 10:12:00');

INSERT INTO `BLOCKED` (`profile_id_em`, `profile_id_rec`) VALUES
(1, 2),
(2, 1);

*/

/*
In caché : user_id , email, role, nick_name, profile_id
*/
-- user (role: user = 2,admin = 1,superadmin = 0)
INSERT INTO `USER` (`email`, `pass`, `phone`, `role`) VALUES
('user1@gmail.com', 'password-1', '1234567890', '2'),
('user2@gmail.com', 'password-2', '9876543210', '2');
('user3@gmail.com', 'password-3', '1234566789', '2');
('user4@gmail.com', 'password-5', '1234567898', '1');
('user5@gmail.com', 'password-6', '1235498777', '1');
('user6@gmail.com', 'password-4', '4564512168', '0');

--select * from user;



--INSERT INTO `USER` (`email`, `pass`, `phone`, `role`) VALUES ('', '', '', '');
-- select id from 'user' where email = (get from caché)

--verified 1=yes, 0=no
INSERT INTO `profile` (user_id, nick_name, about, privacy, img_path, verified)
SELECT user_id, 'nick-1', 'this is an about... 1', 'public', CONCAT('img/users/profile/', user_id, '.jpg'), 1
FROM `user` WHERE email = 'user1@gmail.com';

INSERT INTO `profile`  (user_id, nick_name, about, privacy, img_path, verified)
SELECT user_id, 'nick-2', 'this is an about... 2', 'private', CONCAT('img/users/profile/', user_id , '.jpg'), 1 
FROM `user` WHERE email = 'user2@gmail.com';

INSERT INTO `profile`  (user_id, nick_name, about, privacy, img_path, verified)
SELECT user_id, 'nick-3', 'this is an about... 3', 'public', CONCAT('img/users/profile/', user_id , '.jpg'), 0 
FROM `user` WHERE email = 'user3@gmail.com';

INSERT INTO `profile`  (user_id, nick_name, about, privacy, img_path, verified)
SELECT user_id, 'nick-4', 'this is an about... 4', 'private', CONCAT('img/users/profile/', user_id , '.jpg'), 0 
FROM `user` WHERE email = 'user4@gmail.com';

INSERT INTO `profile`  (user_id, nick_name, about, privacy, img_path, verified)
SELECT user_id, 'nick-5', 'this is an about... 5', 'public', CONCAT('img/users/profile/', user_id , '.jpg'), 1 
FROM `user` WHERE email = 'user5@gmail.com';


-- album insert --necessary id_profile
-- if it have already an account
INSERT INTO `ALBUM` (`album_name`, `profile_id`, `description`) VALUES
('profile', (Select profile_id from `profile` where nick_name = 'nick-1'), 'profile photos'),
('biography', (Select profile_id from `profile` where nick_name = 'nick-1'),'biography photos'),
('stories', (Select profile_id from `profile` where nick_name = 'nick-1'), 'stories photos'),
('cover', (Select profile_id from `profile` where nick_name = 'nick-1'), 'cover photos');


INSERT INTO `ALBUM` (`album_name`, `profile_id`, `description`) VALUES
('profile', (Select profile_id from `profile` where nick_name = 'nick-2'), 'profile photos'),
('biography', (Select profile_id from `profile` where nick_name = 'nick-2'),'biography photos'),
('stories', (Select profile_id from `profile` where nick_name = 'nick-2'), 'stories photos'),
('cover', (Select profile_id from `profile` where nick_name = 'nick-2'), 'cover photos');

INSERT INTO `ALBUM` (`album_name`, `profile_id`, `description`) VALUES
('profile', (Select profile_id from `profile` where nick_name = 'nick-3'), 'profile photos'),
('biography', (Select profile_id from `profile` where nick_name = 'nick-3'),'biography photos'),
('stories', (Select profile_id from `profile` where nick_name = 'nick-3'), 'stories photos'),
('cover', (Select profile_id from `profile` where nick_name = 'nick-3'), 'cover photos');

INSERT INTO `ALBUM` (`album_name`, `profile_id`, `description`) VALUES
('profile', (Select profile_id from `profile` where nick_name = 'nick-4'), 'profile photos'),
('biography', (Select profile_id from `profile` where nick_name = 'nick-4'),'biography photos'),
('stories', (Select profile_id from `profile` where nick_name = 'nick-4'), 'stories photos'),
('cover', (Select profile_id from `profile` where nick_name = 'nick-4'), 'cover photos');

INSERT INTO `ALBUM` (`album_name`, `profile_id`, `description`) VALUES
('profile', (Select profile_id from `profile` where nick_name = 'nick-5'), 'profile photos'),
('biography', (Select profile_id from `profile` where nick_name = 'nick-5'),'biography photos'),
('stories', (Select profile_id from `profile` where nick_name = 'nick-5'), 'stories photos'),
('cover', (Select profile_id from `profile` where nick_name = 'nick-5'), 'cover photos');

INSERT INTO `ALBUM` (`album_name`, `profile_id`, `description`) VALUES
('birthday', (Select profile_id from `profile` where nick_name = 'nick-1'), 'birthday photos');

INSERT INTO `ALBUM` (`album_name`, `profile_id`, `description`) VALUES
('party', (Select profile_id from `profile` where nick_name = 'nick-2'), 'party photos');

select * from album;

--post
--necessary id_album
-- type: ordinary or tmp: tmp 24hrs
-- privacy: public, private, followers
-- typ
--get list of album id from a determinate user
INSERT INTO `POST` (`album_id`, `text`, `data_search`, `privacy`, `type`, `date`) VALUES
(	(SELECT album_id FROM `album` WHERE profile_id = '1' and album_name = 'biography'),	'post a',	'data',	'public',	'ordinary',	now()),
(	(SELECT album_id FROM `album` WHERE profile_id = '1' and album_name = 'biography'),	'post a',	'data',	'public',	'ordinary',	now());

INSERT INTO `POST` (`album_id`, `text`, `data_search`, `privacy`, `type`, `date`) VALUES
(	(SELECT album_id FROM `album` WHERE profile_id = '2' and album_name = 'biography'),	'post b',	'data',	'public',	'ordinary',	now()),
(	(SELECT album_id FROM `album` WHERE profile_id = '2' and album_name = 'biography'),	'post b',	'data',	'public',	'ordinary',	now());

INSERT INTO `POST` (`album_id`, `text`, `data_search`, `privacy`, `type`, `date`) VALUES
(	(SELECT album_id FROM `album` WHERE profile_id = '1' and album_name = 'stories'),	'post c',	'data',	'public',	'tmp',	now()),
(	(SELECT album_id FROM `album` WHERE profile_id = '2' and album_name = 'stories'),	'post c',	'data',	'public',	'tmp',	now());

INSERT INTO `POST` (`album_id`, `text`, `data_search`, `privacy`, `type`, `date`) VALUES
(	(SELECT album_id FROM `album` WHERE profile_id = '3' and album_name = 'biography'),	'post d',	'data',	'public',	'ordinary',	now()),
(	(SELECT album_id FROM `album` WHERE profile_id = '3' and album_name = 'biography'),	'post d',	'data',	'public',	'ordinary',	now());

INSERT INTO `POST` (`album_id`, `text`, `data_search`, `privacy`, `type`, `date`) VALUES
(	(SELECT album_id FROM `album` WHERE profile_id = '2' and album_name = 'party'),	'post e',	'data',	'public',	'ordinary',	now()),
(	(SELECT album_id FROM `album` WHERE profile_id = '2' and album_name = 'party'),	'post e',	'data',	'public',	'ordinary',	now());

select * from  post;



/*

SELECT a.album_id, p.*
FROM `album` a
JOIN `post` p ON a.album_id = p.album_id
WHERE a.profile_id = 1;


*/