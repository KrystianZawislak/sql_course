-- Subqueries · T3/A — Computer Science students with an average between 3.75 and 4.00


SELECT s.imie, s.nazwisko, sk.nr_albumu, ks.nazwa_kierunku
    FROM dziekanat.studenci_kierunkow sk
         INNER JOIN dziekanat.kierunki_studiow ks ON sk.id_kierunku_studiow = ks.id_kierunku
         INNER JOIN dziekanat.studenci s USING (nr_albumu)
    WHERE (SELECT AVG(o.ocena) FROM dziekanat.oceny o WHERE s.nr_albumu = o.nr_albumu
           AND o.id_kierunku_studiow = sk.id_kierunku_studiow)
           BETWEEN 3.75 AND 4.0 AND ks.nazwa_kierunku = 'Informatyka';
