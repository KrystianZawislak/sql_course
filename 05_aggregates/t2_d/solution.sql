-- Aggregates & Grouping · T2/D — Average grade of each student per semester

SELECT sk.nr_albumu, p.nr_semestru, AVG(ocena)
FROM dziekanat.studenci_kierunkow sk
     INNER JOIN dziekanat.kierunki_studiow ks ON (sk.id_kierunku_studiow = ks.id_kierunku)
     INNER JOIN dziekanat.oceny o USING (nr_albumu, id_kierunku_studiow)
     INNER JOIN dziekanat.przedmioty p USING (id_przedmiotu)
GROUP BY sk.nr_albumu, ks.id_kierunku, p.nr_semestru;
