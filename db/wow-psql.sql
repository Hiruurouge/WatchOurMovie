CREATE DATABASE IF NOT EXISTS wom;

USE wom;
CREATE TABLE IF NOT EXISTS wom_user(
    uid SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    genre CHAR(1) NOT NULL,
    password TEXT NOT NULL
    
);
CREATE TABLE IF NOT EXISTS wom_group(
    uid SERIAL PRIMARY KEY,
    owner INT NOT NULL,
    creator INT NOT NULL,
    group_name VARCHAR(100),
    FOREIGN KEY (owner) REFERENCES wom_user(uid),
    FOREIGN KEY (creator) REFERENCES wom_user(uid)
);
CREATE TABLE IF NOT EXISTS production(
    uid SERIAL PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS staff(
    uid SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    job VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS genre(
    uid SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS movie(
    uid SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    overview TEXT,
    poster TEXT,
    popularity FLOAT
);

CREATE TABLE IF NOT EXISTS belong(
    id_user INT NOT NULL,
    id_group INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES  wom_user(uid),
    FOREIGN KEY (id_group) REFERENCES wom_group(uid)
);
CREATE TABLE IF NOT EXISTS visualize(
    id_user INT NOT NULL,
    id_movie INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES wom_user(uid),
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

