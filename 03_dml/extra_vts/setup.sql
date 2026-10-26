/* 	
	Model: Vehicle Tracking System
	Version: 1.00
	Date: 2026-10-22
	Author: Tomasz Potempa / Department of Computer Science
	Company: University of Applied Sciences in Tarnów
*/

-- Conditionally create the vts schema
CREATE SCHEMA IF NOT EXISTS vts;

-- Conditionally drop and create the tables
DROP TABLE IF EXISTS vts.location;
DROP TABLE IF EXISTS vts.vehicle;

CREATE TABLE vts.vehicle (
    vehicle_id integer PRIMARY KEY,
    vin character varying(17) UNIQUE,
    registration_number character varying(10) UNIQUE,
    manufacturer character varying(50) NOT NULL,
    model character varying(50)
);

CREATE TABLE vts.location (
    location_id bigserial PRIMARY KEY,
    vehicle_id  integer NOT NULL REFERENCES vts.vehicle,
    latitude numeric(9, 6) NOT NULL,
    longitude numeric(9, 6) NOT NULL,
    recorded_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX vehicle_location_ukey 
ON vts.location (vehicle_id, latitude, longitude, date_trunc('minute', recorded_at));

-- Alternative covering the 10 m requirement: coordinates rounded to 4 decimal places
-- (≈ 11 m x 7 m grid around 50°N), so GPS drift within a cell counts as standing still
-- CREATE UNIQUE INDEX vehicle_location_ukey
-- ON vts.location (vehicle_id, round(latitude, 4), round(longitude, 4), date_trunc('minute', recorded_at));

-- Fill the tables with data
INSERT INTO vts.vehicle
VALUES (1, '1HGCM82633A004352', 'KR12345', 'Toyota', 'Corolla'),
       (2, 'WVWZZZ1JZXW000001', 'WA98765', 'Volkswagen', 'Crafter'),
       (3, 'YV2A4DBA9KB123456', 'GD4321', 'Volvo', 'FH')
RETURNING *;	   

INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.061430, 19.936580, CURRENT_TIMESTAMP - interval '5 minute' + random() * interval '1 second'),
       (DEFAULT, 1, 50.061430, 19.936580, CURRENT_TIMESTAMP - interval '4 minute' + random() * interval '1 second'),
       (DEFAULT, 1, 50.061430, 19.936580, CURRENT_TIMESTAMP - interval '3 minute' + random() * interval '1 second'),
       (DEFAULT, 1, 50.061430, 19.936580, CURRENT_TIMESTAMP - interval '2 minute' + random() * interval '1 second'),
       (DEFAULT, 1, 50.061430, 19.936580, CURRENT_TIMESTAMP - interval '1 minute' + random() * interval '1 second'),
       (DEFAULT, 1, 50.067200, 19.952100, CURRENT_TIMESTAMP - interval '3 second' + random() * interval '1 second'),
       (DEFAULT, 1, 50.069333, 19.951022, CURRENT_TIMESTAMP - interval '2 second' + random() * interval '1 second'),
       (DEFAULT, 1, 50.070211, 19.958244, CURRENT_TIMESTAMP - interval '1 second' + random() * interval '1 second')
RETURNING *;

-- Display the table data
SELECT * FROM vts.vehicle;
SELECT * FROM vts.location;
