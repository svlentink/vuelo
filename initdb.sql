CREATE SCHEMA vuelo;


/*
Locations are use for the destination and arrival,
however, we also save our current location,
from which we perform request,
in this table.
e.g. ip=12.34.56.78, description='my home ip in Amsterdam'
*/
CREATE TABLE IF NOT EXISTS vuelo.location (
  id varchar(255) PRIMARY KEY,
  description varchar(5000),
  longitude real,
  latitude real,
  isip boolean default false
);


CREATE TABLE IF NOT EXISTS vuelo.price (
/* Trip settings */
  ETD timestamp NOT NULL, /* Estimated Time of Departure */
  ETA timestamp NOT NULL, /* Estimated Time of Arrival */
  departure varchar(255) REFERENCES vuelo.location NOT NULL,
  destination varchar(255) REFERENCES vuelo.location NOT NULL,
  roundtrip boolean default false,
/* Site settings */
  language varchar(30),
  currency varchar(6) NOT NULL,
  country varchar(255),
/* Meta data */
  requested_from varchar(255) REFERENCES vuelo.location, /* IP address */
  requested_at timestamp default current_timestamp NOT NULL,
/* Result */
  price decimal NOT NULL
)
