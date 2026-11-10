-- Aggregates & Grouping · T3/B — Students who took a subject more than once

SELECT nr_albumu, nazwa_przedmiotu
FROM dziekanat.oceny o
     INNER JOIN dziekanat.przedmioty p USING (id_przedmiotu)
GROUP BY nr_albumu, p.id_przedmiotu
HAVING COUNT(ocena) > 1;
