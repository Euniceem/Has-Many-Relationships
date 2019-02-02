\c 'euniceem1007';
DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;
CREATE DATABASE has_many_blogs OWNER has_many_user;
\c 'has_many_blogs';

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) NULL default NULL,
  last_name VARCHAR(90) NULL default NULL,
  created_at timestamp with time zone NOT NULL default now(),
  updated_at timestamp with time zone NOT NULL default now()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users (id) NOT NULL,
  title VARCHAR(180) NULL default NULL,
  url VARCHAR(510) NULL default NULL,
  content text NULL default NULL,
  created_at timestamp with time zone NOT NULL default now(),
  updated_at timestamp with time zone NOT NULL default now()
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users (id),
  posts_id INTEGER REFERENCES posts (id),
  body VARCHAR(510) NULL default NULL,
  created_at timestamp with time zone NOT NULL default now(),
  updated_at timestamp with time zone NOT NULL default now()
);

