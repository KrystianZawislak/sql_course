-- Aggregates & Grouping · T3/A — Computer Science students with an average between 3.50 and 4.00

SELECT sk.nr_albumu, ROUND(AVG(ocena), 2)
FROM dziekanat.studenci_kierunkow sk
     INNER JOIN dziekanat.kierunki_studiow ks ON sk.id_kierunku_studiow = ks.id_kierunku
     AND ks.nazwa_kierunku = 'Informatyka'
     INNER JOIN dziekanat.oceny o USING (id_kierunku_studiow, nr_albumu)
GROUP BY sk.nr_albumu
HAVING ROUND(AVG(ocena), 2) BETWEEN 3.5 AND 4.0;
