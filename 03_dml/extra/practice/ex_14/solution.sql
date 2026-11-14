-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 14: Generate the numbers 10–19
-- (run ../setup.sql first)

SELECT t.arab * 10 + u.arab
FROM digit u CROSS JOIN digit t
WHERE u.arab < 10 AND t.arab = 1;
