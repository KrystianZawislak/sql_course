-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 6: Arithmetic on digits
-- (run ../setup.sql first)

SELECT d.arab, d.arab * 10, d.arab % 2, d.arab / 3
FROM digit d
WHERE arab BETWEEN 0 AND 9;
