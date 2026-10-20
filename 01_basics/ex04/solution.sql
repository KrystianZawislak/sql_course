-- SQL Basics · Exercise 4 — T2/A: p OR NOT p in 3VL
SELECT p,
       NOT p AS "NOT p",
       p OR NOT p AS "p OR NOT p"
FROM (VALUES (TRUE), (FALSE), (NULL)) AS t(p);
