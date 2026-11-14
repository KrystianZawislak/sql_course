-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 10: Fill in missing quantities
-- (run ../setup.sql first)

UPDATE exploratory.fruit
SET quantity = COALESCE(quantity, 0);
