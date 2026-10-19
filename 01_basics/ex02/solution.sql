-- SQL Basics · Exercise 2 — T1/B: negative zero
SELECT i,
       round(CAST(i AS double precision)) AS "Rounded floating-point number",
       trunc(CAST(i AS double precision)) AS "Truncated floating-point number",
       round(CAST(i AS numeric)) AS "Rounded fixed-point number",
       trunc(CAST(i AS numeric)) AS "Truncated fixed-point number"
FROM generate_series(-2.5, 2.5, 1) AS i;

SELECT CAST('-0' AS double precision) = CAST(0 AS double precision) AS "Is -0 equal to 0?";
