-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 15: INSERT … SELECT the numbers 1–9
-- (run ../setup.sql first)

INSERT INTO exploratory.number (arabic)
SELECT d.arab
FROM digit d
WHERE d.arab BETWEEN 1 AND 9;
