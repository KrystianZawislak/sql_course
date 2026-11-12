-- Data Manipulation (DML) · Extra — Step-by-step DML practice
-- (self-made extra exercises, not from the lecturer; run setup.sql first)

-- Ex. 1
INSERT INTO exploratory.fruit VALUES (1, 'apple', 2.50, 10);

-- Ex. 2
INSERT INTO exploratory.fruit (id, name) VALUES (2, 'pear');
-- price and quantity get NULL, because no values were given and the table has no defaults

-- Ex. 3
INSERT INTO exploratory.fruit VALUES (3, 'banana', 4.20, 6),
                                     (4, 'prune', 1.10, 25),
                                     (5, 'kiwi', 1.80, NULL);

-- Ex. 4
-- INSERT INTO exploratory.fruit VALUES (1, 'example', 2.50, 10);
-- Error: Key (id)=(1) already exists – id is the primary key (PRIMARY KEY),
-- so each id value can appear in the table only once, and the fruit with id 1 is already there.
-- (the statement is commented out so running the whole file doesn't stop on the error)

-- Ex. 5
SELECT f.name, f.price * f.quantity AS value
FROM exploratory.fruit f;
-- pear and kiwi get NULL, because anything times NULL is NULL

-- Ex. 6
SELECT d.arab, d.arab * 10, d.arab % 2, d.arab / 3
FROM digit d
WHERE arab BETWEEN 0 AND 9;

-- Ex. 7
SELECT d.arab, (CASE
                   WHEN d.arab % 2 = 0 THEN 'even'
                   ELSE 'odd'
               END) AS parity
FROM digit d
WHERE d.arab BETWEEN 0 AND 9;

-- Ex. 8
SELECT d.arab, 'digit: ' || REPEAT('*', d.arab)
FROM digit d
WHERE d.arab BETWEEN 1 AND 5;

-- Ex. 9
UPDATE exploratory.fruit
SET price = price * 1.1;

-- Ex. 10
UPDATE exploratory.fruit
SET quantity = COALESCE(quantity, 0);

-- Ex. 11
UPDATE exploratory.fruit
SET name = name || ' (expensive)'
WHERE price > 3;

-- Ex. 12
DELETE FROM exploratory.fruit
WHERE quantity = 0;

DELETE FROM exploratory.fruit;

-- Ex. 13
SELECT u.arab, t.arab
FROM digit u CROSS JOIN digit t
WHERE u.arab BETWEEN 0 AND 2 AND t.arab BETWEEN 0 AND 2;
-- 9 rows: CROSS JOIN pairs each of the 3 digits of the first copy with each of the 3 digits of the second (3 × 3)

-- Ex. 14
SELECT t.arab * 10 + u.arab
FROM digit u CROSS JOIN digit t
WHERE u.arab < 10 AND t.arab = 1;

-- Ex. 15
INSERT INTO exploratory.number (arabic)
SELECT d.arab
FROM digit d
WHERE d.arab BETWEEN 1 AND 9;

-- Ex. 16
UPDATE exploratory.number n
SET roman = (CASE
                 WHEN n.arabic BETWEEN 1 AND 3 THEN REPEAT('I', n.arabic)
                 WHEN n.arabic = 4 THEN 'IV'
                 WHEN n.arabic BETWEEN 5 AND 8 THEN 'V' || REPEAT('I', n.arabic - 5)
                 WHEN n.arabic BETWEEN 9 AND 10 THEN REPEAT('I', 10 - n.arabic) || 'X'
             END);

SELECT * FROM exploratory.number ORDER BY arabic;
