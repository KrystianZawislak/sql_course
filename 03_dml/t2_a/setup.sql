-- Conditionally create the schema
CREATE SCHEMA IF NOT EXISTS exploratory;

DROP TABLE IF EXISTS exploratory.number;

CREATE TABLE exploratory.number (
	arabic integer PRIMARY KEY,
	roman character varying(10) UNIQUE
);

-- Auxiliary digit table – simple / easy variant
DROP TABLE IF EXISTS digit;

CREATE TEMPORARY TABLE digit (
	arab integer PRIMARY KEY,
	roman character varying(4) UNIQUE
);

DELETE FROM digit;

INSERT INTO digit
VALUES (0, NULL),
	   (1, 'I'),
	   (2, 'II'),
	   (3, 'III'),
	   (4, 'IV'),
	   (5, 'V'),
	   (6, 'VI'),
	   (7, 'VII'),
	   (8, 'VIII'),
	   (9, 'IX'),
	   (10, 'X');

/*
-- Auxiliary digit table – classic / hard variant (instead of the one above)
DROP TABLE IF EXISTS digit;

CREATE TEMPORARY TABLE digit (
	arab integer PRIMARY KEY,
	roman character varying(1) UNIQUE
);

DELETE FROM digit;

INSERT INTO digit
VALUES (0, NULL),
	   (1, 'I'),
	   (2, NULL),
	   (3, NULL),
	   (4, NULL),
	   (5, 'V'),
	   (6, NULL),
	   (7, NULL),
	   (8, NULL),
	   (9, NULL),
	   (10, 'X'),
	   (50, 'L'),
	   (100, 'C'),
	   (500, 'D'),
	   (1000, 'M');
*/
