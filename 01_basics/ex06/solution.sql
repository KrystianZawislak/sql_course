-- SQL Basics · Exercise 6 — T2/C: NOT a IS NULL vs a IS NOT NULL
SELECT a, NOT a IS NULL as "NOT A IS NULL", a IS NOT NULL as "A IS NOT NULL"
FROM (VALUES(TRUE), (FALSE), (NULL)) as t(a);
