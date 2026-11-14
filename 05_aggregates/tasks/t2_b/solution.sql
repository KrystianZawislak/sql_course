-- Aggregates & Grouping · T2/B — Students per recruitment office, including those without one

SELECT COALESCE(wku, 'NIE NALEZA') AS "WKU", COUNT(nr_albumu) AS "NUMBER OF STUDENTS"
FROM dziekanat.wojsko NATURAL RIGHT JOIN dziekanat.studenci
GROUP BY wku;
