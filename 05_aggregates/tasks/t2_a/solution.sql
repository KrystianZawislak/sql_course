-- Aggregates & Grouping · T2/A — Number of students per military recruitment office

SELECT wku AS "WKU", COUNT(nr_albumu) AS "NUMBER OF STUDENTS"
FROM dziekanat.wojsko
GROUP BY wku;
