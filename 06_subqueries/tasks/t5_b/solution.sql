-- Subqueries · T5/B — Computer Science students with a higher average than Mathematics students

SELECT s.nr_albumu, s.imie, s.nazwisko
FROM dziekanat.studenci s
WHERE (SELECT AVG(ocena)
       FROM dziekanat.oceny o
       INNER JOIN dziekanat.kierunki_studiow ks ON ks.id_kierunku = o.id_kierunku_studiow
       WHERE ks.nazwa_kierunku = 'Informatyka' AND s.nr_albumu = o.nr_albumu
       GROUP BY nr_albumu)

       > ANY

      (SELECT AVG(ocena)
       FROM dziekanat.oceny o
       INNER JOIN dziekanat.kierunki_studiow ks ON ks.id_kierunku = o.id_kierunku_studiow
       WHERE ks.nazwa_kierunku = 'Matematyka'
       GROUP BY nr_albumu)

ORDER BY 3, 2;
