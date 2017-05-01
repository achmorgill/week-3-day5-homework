DROP TABLE tickets;
DROP TABLE customer;
DROP TABLE films;

CREATE TABLE customers (
name VARCHAR(255),
funds INT2,
id SERIAL4 PRIMARY KEY
);

CREATE TABLE films (
title VARCHAR(255),
price INT2,
id SERIAL4 PRIMARY KEY
);

CREATE TABLE tickets (
customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
id SERIAL4 PRIMARY KEY
);

-- CREATE TABLE screenings(
-- film_id INT4 REFERENCES film(id) ON DELETE CASCADE,
-- screening_time ,
-- capacity INT2
-- );