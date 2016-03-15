DROP TABLE Stocked;
DROP TABLE Albums CASCADE;
DROP TABLE Artists CASCADE;

CREATE TABLE Artists (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE Albums (
  id serial4 primary key,
  title VARCHAR(255),
  artist_id int4 references Artists(id) NOT NULL,
  stock_level int4,
  buy_price int2,
  sell_price int2
);

-- CREATE TABLE Stocked (
--   id serial8 primary key,
--   album_id int4 references Albums(id) NOT NULL,
--   stock int2,
--   buy_price int2,
--   sell_price int2
-- );  