DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL

);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    fav_region_id INTEGER REFERENCES regions NOT NULL
    
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL, 
    user_id INTEGER REFERENCES users, 
    location TEXT NOT NULL, 
    region_id INTEGER REFERENCES regions NOT NULL,
    category_id INTEGER REFERENCES categories
    
);

INSERT INTO regions (region) VALUES
('Seattle'),
('Portland'),
('Houston'),
('LA');

INSERT INTO users (username, fav_region_id) VALUES
('superseller', 1),
('badseller', 2),
('newseller', 4);

INSERT INTO categories (name) VALUES
('selling'),
('looking for'),
('free');

INSERT INTO posts (title, content, user_id, location, region_id, category_id) VALUES
('puppies for sale', 'i am selling puppies! $50', 2, 'beaverton', 2, 1);
