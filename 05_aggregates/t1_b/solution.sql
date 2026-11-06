-- Aggregates & Grouping · T1/B — Average grade in Mathematical Analysis

SELECT ROUND(AVG(o.ocena), 2) AS "Average grade"
FROM dziekanat.oceny o
     INNER JOIN dziekanat.kierunki_studiow ks ON ks.id_kierunku = o.id_kierunku_studiow
     INNER JOIN dziekanat.przedmioty p ON p.id_przedmiotu = o.id_przedmiotu AND
     nr_semestru = 1
WHERE p.nazwa_przedmiotu = 'Analiza matematyczna' AND ks.nazwa_kierunku = 'Matematyka'
