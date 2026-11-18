-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 6: Arithmetic on digits
-- Self-made extra exercise (prepared with Claude), not from the lecturer's (T. Potempa) materials
-- (run ../setup.sql first)

SELECT d.arab, d.arab * 10, d.arab % 2, d.arab / 3
FROM digit d
WHERE arab BETWEEN 0 AND 9;
