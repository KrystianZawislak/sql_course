-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 11: Mark expensive fruits
-- Self-made extra exercise (prepared with Claude), not from the lecturer's (T. Potempa) materials
-- (run ../setup.sql first)

UPDATE exploratory.fruit
SET name = name || ' (expensive)'
WHERE price > 3;
