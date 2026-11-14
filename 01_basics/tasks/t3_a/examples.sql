-- Example 1

-- Do the values below have a definite type?
SELECT pg_typeof(13);
SELECT pg_typeof(3.14);
SELECT pg_typeof(FALSE);

-- Do the values below have a definite type?
SELECT pg_typeof(NULL);
SELECT pg_typeof('Jan Łukasiewicz');
SELECT pg_typeof('1878-12-21');
SELECT pg_typeof('77 years');
SELECT pg_typeof('12:00:00');
SELECT pg_typeof('12:00:00+1');
SELECT pg_typeof('100 zł');
SELECT pg_typeof('\xDEADBEEF');
SELECT pg_typeof('{"product": "Red Bull", "price": 9.99, "age": true}')

-- Is a type conversion performed in the examples below?
SELECT 5 = '5';
SELECT 5.0 > '4.1';
SELECT 46 < '5';
SELECT TRUE = '1';
SELECT TRUE = 'TRUE';
SELECT CURRENT_DATE > '2025-12-31';
SELECT CURRENT_TIME < '12:00:00';

-- Implicit type conversion, i.e. coercion. Is it performed without errors?
SELECT 5 = text '5';
SELECT 5.0 > text '4.1';
SELECT 46 < character '5';
SELECT TRUE = money '1';
SELECT TRUE = text 'TRUE';
SELECT CURRENT_DATE > text '2025-12-31';
SELECT CURRENT_TIME < interval '12:00:00'

-- Explicit type conversion, i.e. casting. Is it performed without errors?
SELECT 5 = CAST(text '5' AS integer);
SELECT 5.0 > CAST(text '4.1' AS numeric);
SELECT 46 < CAST(character '5' AS integer);
SELECT TRUE = CAST(CAST(CAST(money '1' AS numeric) AS integer) AS boolean);
SELECT TRUE = CAST(text 'TRUE' AS boolean);
SELECT CURRENT_DATE > CAST(text '2025-12-31' AS date);
SELECT CURRENT_TIME < CAST(interval '12:00:00' AS time);

-- Example 2

-- Conditionally drop and create a temporary table, i.e. one that exists only within the database connection session.
DROP TABLE IF EXISTS athlete;
CREATE TEMPORARY TABLE athlete (
	number character varying(4) PRIMARY KEY,
	first_name character varying(50) NOT NULL,
	last_name character varying(50) NOT NULL,
	country character varying(3),
	birthdate date
);

-- Fill the table with data.
INSERT INTO athlete
VALUES ('1', 'Tamirat', 'Tola', 'ETH', '1991-08-11'),
	   ('2', 'Bashir', 'Abdi', 'BEL', '1989-02-10'),
	   ('3', 'Benson', 'Kipruto', 'KEN', NULL),
	   ('4', 'Emile', 'Cairess', 'GBR', NULL),
	   ('5', 'Deresa', 'Geleta', 'ETH', '1996-01-14'),
	   ('6', 'Abdi', 'Nageeye', 'NLD', NULL),
	   ('7', 'Akira', 'Akasaki', 'JPN', NULL),
	   ('8', 'Tebello', 'Ramakongoana', 'LSO', NULL),
	   ('9', 'Clayton', 'Young', 'USA', NULL),
	   ('10', 'Adam', 'Nowicki', 'POL', '1990-08-24');

-- Conditionally drop and create a temporary table, i.e. one that exists only within the database connection session.
DROP TABLE IF EXISTS result;
CREATE TEMPORARY TABLE result (
	number integer PRIMARY KEY,
	time interval CHECK (time >= '00:00:00'),
	record character(3)
);

-- Fill the table with data.
INSERT INTO result
VALUES (1, '02:06:26', 'OR'),
	   (2, '99:99:99', NULL),
	   (3, '02:22:35', 'SB'),
	   (4, NULL, NULL),
	   (5, NULL, NULL),
	   (6, '02:17:56', 'PB'),
	   (7, '02:13:45', NULL),
	   (8, '02:15:23', NULL),
	   (9, NULL, NULL),
	   (10, '02:20:33', 'PB');

-- Joining the tables. Is it possible?
SELECT *
FROM athlete NATURAL JOIN result;
