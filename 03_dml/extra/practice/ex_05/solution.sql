-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 5: Calculated column: stock value
-- Self-made extra exercise (prepared with Claude), not from the lecturer's (T. Potempa) materials
-- (run ../setup.sql first)

SELECT f.name, f.price * f.quantity AS value
FROM exploratory.fruit f;
-- pear and kiwi get NULL, because anything times NULL is NULL
