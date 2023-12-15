DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT,
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category VARCHAR(15)
)

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    region INT REFERENCES regions,
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    posted_by INT NOT NULL REFERENCES users ON DELETE CASCADE,
    posted_on TIMESTAMP,
    region INT NOT NULL REFERENCES regions,
    location POINT,
    category INT NOT NULL REFERENCES categories,
    title VARCHAR(50),
    body TEXT
);