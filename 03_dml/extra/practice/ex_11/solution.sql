-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 11: Mark expensive fruits
-- (run ../setup.sql first)

UPDATE exploratory.fruit
SET name = name || ' (expensive)'
WHERE price > 3;
