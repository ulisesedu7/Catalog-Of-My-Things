CREATE DATABASE IF NOT EXISTS catalog_of_my_things;

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