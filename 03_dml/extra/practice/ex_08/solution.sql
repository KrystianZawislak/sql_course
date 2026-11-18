-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 8: Stars with REPEAT and concatenation
-- Self-made extra exercise (prepared with Claude), not from the lecturer's (T. Potempa) materials
-- (run ../setup.sql first)

SELECT d.arab, 'digit: ' || REPEAT('*', d.arab)
FROM digit d
WHERE d.arab BETWEEN 1 AND 5;
