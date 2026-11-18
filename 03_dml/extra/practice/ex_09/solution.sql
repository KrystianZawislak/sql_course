-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 9: Raise all prices by 10%
-- Self-made extra exercise (prepared with Claude), not from the lecturer's (T. Potempa) materials
-- (run ../setup.sql first)

UPDATE exploratory.fruit
SET price = price * 1.1;
