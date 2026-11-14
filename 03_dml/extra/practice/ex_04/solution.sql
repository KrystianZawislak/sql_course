-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 4: Duplicate primary key
-- (run ../setup.sql first)

-- INSERT INTO exploratory.fruit VALUES (1, 'example', 2.50, 10);
-- Error: Key (id)=(1) already exists – id is the primary key (PRIMARY KEY),
-- so each id value can appear in the table only once, and the fruit with id 1 is already there.
-- (the statement is commented out so running the whole file doesn't stop on the error)
