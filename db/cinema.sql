DROP TABLE customers;
DROP TABLE tickets;
DROP TABLE films;
DROP TABLE screenings;

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price VARCHAR(255)
);

CREATE TABLE tickets (
  id SERIAL4 primary key,
  film_id INT4 references films(id) ON DELETE CASCADE,
  customer_id INT4 references customers(id) ON DELETE CASCADE
);

CREATE TABLE screenings (
  id SERIAL4 primary key,
  film_time VARCHAR(255),
  film_id INT4 references films(id) ON DELETE CASCADE
);

