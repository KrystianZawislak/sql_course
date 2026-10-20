-- SQL Basics · Exercise 3 — T1/C: 0.1 + 0.2 = 0.3 is false
SELECT CAST(0.1 AS double precision) + CAST(0.2 AS double precision) = CAST(0.3 AS double precision) AS "Is equal [double precision]?";
SELECT CAST(0.1 AS numeric) + CAST(0.2 AS numeric) = CAST(0.3 AS numeric) AS "Is equal [numeric]?";

SELECT CAST(0.1 AS double precision) + CAST(0.2 AS double precision) AS "Sum [double precision]",
       CAST(0.1 AS numeric) + CAST(0.2 AS numeric) AS "Sum [numeric]";
