/*
    Extra exercises – DML step by step
    Practice tables, NOT taken from the lecturer's materials.
    The digit and exploratory.number tables have the same structure as in task T2/A.
*/

CREATE SCHEMA IF NOT EXISTS exploratory;

-- Table for exercises 1–12
DROP TABLE IF EXISTS exploratory.fruit;

CREATE TABLE exploratory.fruit (
    id integer PRIMARY KEY,
    name character varying(30) NOT NULL,
    price numeric(5,2),
    quantity integer
);

-- Table for exercises 15–16 (the same as in T2/A)
DROP TABLE IF EXISTS exploratory.number;

CREATE TABLE exploratory.number (
    arabic integer PRIMARY KEY,
    roman character varying(10) UNIQUE
);

-- Auxiliary digit table (classic / hard variant from T2/A)
DROP TABLE IF EXISTS digit;

CREATE TEMPORARY TABLE digit (
    arab integer PRIMARY KEY,
    roman character varying(1) UNIQUE
);

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
