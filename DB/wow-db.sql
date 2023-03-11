CREATE DATABASE IF NOT EXISTS wow;

USE wow;
CREATE TABLE IF NOT EXISTS wow_user(
    uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    genre CHAR(1) NOT NULL,
    password TEXT NOT NULL
    
);
CREATE TABLE IF NOT EXISTS wow_group(
    uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    owner INT NOT NULL,
    creator INT NOT NULL,
    group_name VARCHAR(100),
    FOREIGN KEY (owner) REFERENCES wow_user(uid),
    FOREIGN KEY (creator) REFERENCES wow_user(uid)
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
    uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS movie(
    uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    overview TEXT,
    poster TEXT,
    popularity FLOAT
);

CREATE TABLE IF NOT EXISTS belong(
    id_user INT NOT NULL,
    id_group INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES  wow_user(uid),
    FOREIGN KEY (id_group) REFERENCES wow_group(uid)
);
CREATE TABLE IF NOT EXISTS visualize(
    id_user INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES wow_user(uid),
    FOREIGN KEY (id_movie) REFERENCES movie(uid)
);


CREATE TABLE IF NOT EXISTS work(
    id_staff INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_staff) REFERENCES staff(uid),
    FOREIGN KEY (id_movie) REFERENCES movie(uid)
);

CREATE TABLE IF NOT EXISTS be (
    id_genre INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_genre) REFERENCES genre(uid),
    FOREIGN KEY (id_movie) REFERENCES movie(uid)
);

CREATE TABLE IF NOT EXISTS product(
    id_production INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_production) REFERENCES production(uid),
    FOREIGN KEY (id_movie) REFERENCES movie(uid)
);
