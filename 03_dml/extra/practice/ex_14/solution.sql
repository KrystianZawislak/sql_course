-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 14: Generate the numbers 10–19
-- Self-made extra exercise (prepared with Claude), not from the lecturer's (T. Potempa) materials
-- (run ../setup.sql first)

SELECT t.arab * 10 + u.arab
FROM digit u CROSS JOIN digit t
WHERE u.arab < 10 AND t.arab = 1;
