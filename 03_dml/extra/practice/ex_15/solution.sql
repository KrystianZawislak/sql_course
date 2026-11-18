-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 15: INSERT … SELECT the numbers 1–9
-- Self-made extra exercise (prepared with Claude), not from the lecturer's (T. Potempa) materials
-- (run ../setup.sql first)

INSERT INTO exploratory.number (arabic)
SELECT d.arab
FROM digit d
WHERE d.arab BETWEEN 1 AND 9;
