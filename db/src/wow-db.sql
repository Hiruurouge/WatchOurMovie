CREATE DATABASE IF NOT EXISTS wow;

USE wow;

CREATE TABLE IF NOT EXISTS auth(
    uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS wow_user(
    uid INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    genre CHAR(1) NOT NULL,
    FOREIGN KEY (uid) REFERENCES auth(uid) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS wow_group(
    uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    owner INT NOT NULL,
    group_name VARCHAR(100),
    FOREIGN KEY (owner) REFERENCES wow_user(uid) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS production(
    uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS staff(
    uid INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    job VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS genre(
    uid INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS movie(
    uid INT PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    overview TEXT,
    poster TEXT,
    popularity FLOAT
);

CREATE TABLE IF NOT EXISTS belong(
    id_user INT NOT NULL,
    id_group INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES  wow_user(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_group) REFERENCES wow_group(uid) ON DELETE CASCADE,
    CONSTRAINT uid PRIMARY KEY (id_user,id_group)
);
CREATE TABLE IF NOT EXISTS visualize(
    id_user INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES wow_user(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_movie) REFERENCES movie(uid) ON DELETE CASCADE,
    CONSTRAINT uid PRIMARY KEY (id_user,id_movie)
);


CREATE TABLE IF NOT EXISTS work(
    id_staff INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_staff) REFERENCES staff(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_movie) REFERENCES movie(uid) ON DELETE CASCADE,
    CONSTRAINT uid PRIMARY KEY (id_staff,id_movie)
);

CREATE TABLE IF NOT EXISTS be (
    id_genre INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_genre) REFERENCES genre(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_movie) REFERENCES movie(uid) ON DELETE CASCADE,
    CONSTRAINT uid PRIMARY KEY (id_genre,id_movie)
);

CREATE TABLE IF NOT EXISTS product(
    id_production INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_production) REFERENCES production(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_movie) REFERENCES movie(uid) ON DELETE CASCADE,
    CONSTRAINT uid PRIMARY KEY (id_production,id_movie)
);

CREATE TABLE IF NOT EXISTS preferences(
    id_user INT NOT NULL,
    id_genre INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES wow_user(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_genre) REFERENCES genre(uid) ON DELETE CASCADE,
    CONSTRAINT uid PRIMARY KEY (id_user,id_genre)
);

CREATE TABLE IF NOT EXISTS like_production(
    id_production INT NOT NULL,
    id_user INT NOT NULL, 
    FOREIGN KEY (id_user) REFERENCES wow_user(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_production) REFERENCES movie(uid) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS like_staff(
    id_staff INT NOT NULL,
    id_user INT NOT NULL, 
    FOREIGN KEY (id_user) REFERENCES wow_user(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_staff) REFERENCES staff(uid) ON DELETE CASCADE
)


