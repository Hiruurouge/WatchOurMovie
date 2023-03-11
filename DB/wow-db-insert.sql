USE wow;

/*Create user*/

INSERT INTO wow_user (first_name,last_name,email,age,genre,password) VALUES ("Alice","Bertrand",'alice.bertrand@gmail.com',18,'F','aVkjfeFtgyio89.');
INSERT INTO wow_user (first_name,last_name,email,age,genre,password) VALUES ("Bob","Dylan",'bob.dylan@gmail.com',52,'H','dtfghUf8k7lzS.OUbct');
INSERT INTO wow_user (first_name,last_name,email,age,genre,password) VALUES ("Charlie","Durand",'charlie.durand@gmail.com',52,'A','zeljzef83dDQEjc7.');

/*Create groups*/
INSERT INTO wow_group (group_name,owner,creator) VALUES ("Mon super pote",1,1);
INSERT INTO wow_group (group_name,owner,creator) VALUES ("La Famille",2,3);

/*Attribute people to group*/
INSERT INTO belong (id_user, id_group) VALUES (1,1);
INSERT INTO belong (id_user, id_group) VALUES (2,1);
INSERT INTO belong (id_user, id_group) VALUES (3,2);
INSERT INTO belong (id_user, id_group) VALUES (2,2);

/*Create genre*/
INSERT INTO genre (name) VALUES ("Drame");
INSERT INTO genre (name) VALUES ("Action");
INSERT INTO genre (name) VALUES ("Aventure");
INSERT INTO genre (name) VALUES ("Romance");
INSERT INTO genre (name) VALUES ("Comédie Musicale");
INSERT INTO genre (name) VALUES ("Thriller");
INSERT INTO genre (name) VALUES ("Sci-Fi");

/*Create Staff*/
INSERT INTO staff (name, job) VALUES ("Damien Chazelle","Director");
INSERT INTO staff (name, job) VALUES ("Christopher Nolan","Director");
INSERT INTO staff (name,job) VALUES ("Steven Spielberg","Director");
INSERT INTO staff (name,job) VALUES ("James Cameron","Director");

/*Create Production*/
INSERT INTO production (name) VALUES ("Universal Pictures");
INSERT INTO production (name) VALUES ("Warner Bros. Pictures");
INSERT INTO production (name) VALUES ("Summit Entertainment");
INSERT INTO production (name) VALUES ("Paramount Pictures");
INSERT INTO production (name) VALUES ("20th Century Fox");
INSERT INTO production (name) VALUES ("Amblin Entertainment");
INSERT INTO production (name) VALUES ("Legendary Entertainment");
INSERT INTO production (name) VALUES ("Black Label Media");
INSERT INTO production (name) VALUES ("Syncopy");


/*Create movie*/
INSERT INTO movie (title) VALUES ("La La Land");
INSERT INTO movie (title) VALUES ("The Dark Knight");
INSERT INTO movie (title) VALUES ("Inception");
INSERT INTO movie (title) VALUES ("Jurassic Park");
INSERT INTO movie (title) VALUES ("Titanic");

/*Associate a movie to its directors*/
INSERT INTO work (id_director, id_movie) VALUES (1,1);
INSERT INTO work (id_director, id_movie) VALUES (2,2);
INSERT INTO work (id_director, id_movie) VALUES (2,3);
INSERT INTO work (id_director, id_movie) VALUES (3,4);
INSERT INTO work (id_director, id_movie) VALUES (4,5);

/*Associate movie to its producer*/
INSERT INTO product (id_production,id_movie) VALUE(3,1);
INSERT INTO product (id_production,id_movie) VALUE(8,1);
INSERT INTO product (id_production,id_movie) VALUE(2,2);
INSERT INTO product (id_production,id_movie) VALUE(7,2);
INSERT INTO product (id_production,id_movie) VALUE(2,3);
INSERT INTO product (id_production,id_movie) VALUE(9,3);
INSERT INTO product (id_production,id_movie) VALUE(1,4);
INSERT INTO product (id_production,id_movie) VALUE(6,4);
INSERT INTO product (id_production,id_movie) VALUE(5,5);
INSERT INTO product (id_production,id_movie) VALUE(4,5);




