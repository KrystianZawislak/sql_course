-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 2: Insert only some columns
-- (run ../setup.sql first)

INSERT INTO exploratory.fruit (id, name) VALUES (2, 'pear');
-- price and quantity get NULL, because no values were given and the table has no defaults
