CREATE DATABASE IF NOT EXISTS catalog_of_my_things;

-- games table
CREATE TABLE IF NOT EXISTS games (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    author_id INTEGER, CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE
    source VARCHAR(255) NOT NULL,
    label VARCHAR(255) NOT NULL,
    published_date DATE,
    archived boolean,
    multiplayer boolean,
    last_played_at DATE
);

-- authors table
CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    fist_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

-- Book's table
CREATE TABLE IF NOT EXISTS books (
  id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(255) NOT NULL,
  archived BOOLEAN,
  publish_date DATE NOT NULL,
  label VARCHAR(255) NOT NULL,
  genre VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  source VARCHAR(255) NOT NULL,
  PRIMARY KEY(id)
);

-- Label's table
CREATE TABLE IF NOT EXISTS labels (
  id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL,  
  items TEXT[] NOT NULL
);