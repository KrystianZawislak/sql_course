-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 10: Fill in missing quantities
-- Self-made extra exercise (prepared with Claude), not from the lecturer's (T. Potempa) materials
-- (run ../setup.sql first)

UPDATE exploratory.fruit
SET quantity = COALESCE(quantity, 0);
