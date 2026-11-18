-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 12: Delete rows
-- Self-made extra exercise (prepared with Claude), not from the lecturer's (T. Potempa) materials
-- (run ../setup.sql first)

DELETE FROM exploratory.fruit
WHERE quantity = 0;

DELETE FROM exploratory.fruit;
