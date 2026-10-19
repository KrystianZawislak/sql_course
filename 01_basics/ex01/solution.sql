-- SQL Basics · Exercise 1 — T1/A: rounding numeric vs double
SELECT i,
       round(CAST(i AS double precision)) AS "Rounded floating-point number",
       round(CAST(i AS numeric)) AS "Rounded fixed-point number"
FROM generate_series(-2.5, 2.5, 1) AS i;
