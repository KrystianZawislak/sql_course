-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 5: Calculated column: stock value
-- (run ../setup.sql first)

SELECT f.name, f.price * f.quantity AS value
FROM exploratory.fruit f;
-- pear and kiwi get NULL, because anything times NULL is NULL
