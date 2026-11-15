-- Subqueries · T3/B — Students with a lower average in semester I than in semester II

SELECT nr_albumu
FROM dziekanat.studenci s
WHERE ((SELECT AVG(ocena)
       FROM dziekanat.oceny o2 NATURAL JOIN dziekanat.przedmioty p2
       WHERE p2.nr_semestru = 1 AND s.nr_albumu = o2.nr_albumu)

       <

       (SELECT AVG(ocena)
       FROM dziekanat.oceny o3 NATURAL JOIN dziekanat.przedmioty p3
       WHERE p3.nr_semestru = 2 AND s.nr_albumu = o3.nr_albumu));
