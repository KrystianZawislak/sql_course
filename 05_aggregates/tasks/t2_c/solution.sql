-- Aggregates & Grouping · T2/C — Average grade of each student per field of study

SELECT sk.nr_albumu, ks.nazwa_kierunku, AVG(ocena)
FROM dziekanat.studenci_kierunkow sk
     INNER JOIN dziekanat.kierunki_studiow ks ON (sk.id_kierunku_studiow = ks.id_kierunku)
     INNER JOIN dziekanat.oceny o USING (nr_albumu, id_kierunku_studiow)
GROUP BY sk.nr_albumu, ks.id_kierunku;
