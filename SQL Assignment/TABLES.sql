create table songs
(
id int primary key,
name varchar(30) not null,
length float not null,
album_id int not null
)




CREATE TABLE bands (
  id INT NOT NULL primary key,
  name VARCHAR(255) NOT NULL,
)

CREATE TABLE albums (
  id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  release_year INT,
  band_id INT NOT NULL,
  FOREIGN KEY (band_id) REFERENCES bands(id)
)
