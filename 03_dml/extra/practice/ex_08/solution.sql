-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 8: Stars with REPEAT and concatenation
-- (run ../setup.sql first)

SELECT d.arab, 'digit: ' || REPEAT('*', d.arab)
FROM digit d
WHERE d.arab BETWEEN 1 AND 5;
