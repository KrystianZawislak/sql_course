-- SQL Basics · Exercise 5 — T2/B: p >= 10 OR p < 10 as a tautology
SELECT p, p >= 10 AS "p >= 10", p < 10 AS "p < 10", p >= 10 OR p < 10 AS "p >= 10 OR p < 10"
FROM (VALUES (-6), (14), (32), (10), (NULL)) as t(p);
