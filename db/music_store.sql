DROP TABLE Artists;
DROP TABLE Albums;
DROP TABLE Stock;

CREATE TABLE Artists (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE Albums (
  id serial4 primary key,
  title VARCHAR(255),
  artist_id int4 references Artists(id) NOT NULL
);

CREATE TABLE Stocked (
  id serial8 primary key,
  album_id int4 references Albums(id) NOT NULL,
  quantity int2
);  