-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 13: CROSS JOIN of digit with itself
-- (run ../setup.sql first)

SELECT u.arab, t.arab
FROM digit u CROSS JOIN digit t
WHERE u.arab BETWEEN 0 AND 2 AND t.arab BETWEEN 0 AND 2;
-- 9 rows: CROSS JOIN pairs each of the 3 digits of the first copy with each of the 3 digits of the second (3 × 3)
