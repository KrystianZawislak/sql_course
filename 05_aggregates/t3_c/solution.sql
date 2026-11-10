-- Aggregates & Grouping · T3/C — Electives with at least 5 enrollments per year

SELECT nazwa_fakultetu, EXTRACT(YEAR FROM data_czas_zapisu) AS year, COUNT(nr_albumu)
FROM dziekanat.fakultety
     NATURAL JOIN dziekanat.zapisy
GROUP BY id_fakultetu, year
HAVING COUNT(nr_albumu) >= 5
ORDER BY year;
