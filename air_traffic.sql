-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT,
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT,
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country INT NOT NULL REFERENCES countries
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INT NOT NULL REFERENCES airlines,
  from_city INT NOT NULL REFERENCES cities,
  to_city INT NOT NULL REFERENCES cities,
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INT NOT NULL REFERENCES passengers ON DELETE CASCADE,
  flight INT NOT NULL REFERENCES flights ON DELETE CASCADE,
  seat TEXT NOT NULL,
);

INSERT INTO airlines
  (name)
VALUES
  ('United'), ('British Airways'), ('Delta'), ('IUI Fly Belgium'),
  ('Air China'), ('American Airlines'), ('Avianca Brasil');
  
INSERT INTO countries
  (name)
VALUES
  ('United States'), ('Japan'), ('United Kingdom'), ('Mexico'), ('France'),
  ('Morocco'), ('UAE'), ('China'), ('Brazil'), ('Chile');
  
INSERT INTO cities
  (name, country)
VALUES
  ('Washington DC', 1), ('Seattle', 1), ('Tokyo', 2), ('London', 3), ('Los Angeles', 1)
  ('Las Vegas', 1), ('Mexico City', 4), ('Paris', 5), ('Casablanca', 6), ('Dubai', 7)
  ('Beijing', 8), ('New York', 1), ('Charlotte', 1), ('Cedar Rapids', 1), ('Chicago', 1)
  ('New Orleans', 1), ('Sao Paolo', 9), ('Santiago', 10);

INSERT INTO flights
  (departure, arrival, airline, from_city, to_city)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1,   1,   2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2,   3,   4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3,   5,   6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3,   1,   7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4,   8,   9),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5,   10,  11),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1,   12,  13),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6,   14,  15),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6,   13,  16),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7,   17,  18);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'), ('Berkie', 'Wycliff'), ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO tickets
  (passenger, seat, flight)
VALUES
  (1, '33B', 1),
  (2, '8A', 2),
  (3, '12F', 3),
  (1, '20A', 4),
  (4, '23D', 5),
  (2, '18C', 6),
  (5, '9E', 7),
  (6, '1A', 8),
  (5, '32B', 9),
  (7, '10D', 10);