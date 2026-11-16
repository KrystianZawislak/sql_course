-- Subqueries · T5/A — Students with the most failing grades

SELECT s.imie, s.nazwisko, s.nr_albumu
FROM dziekanat.studenci s
WHERE (SELECT COUNT(*)
       FROM dziekanat.oceny o1 NATURAL JOIN dziekanat.przedmioty p1
       WHERE o1.ocena = 2 AND s.nr_albumu = o1.nr_albumu)

       >= ALL

       (SELECT COUNT(*)
       FROM dziekanat.oceny o1 NATURAL JOIN dziekanat.przedmioty p1
       WHERE o1.ocena = 2 AND s.nr_albumu <> o1.nr_albumu GROUP BY nr_albumu);
