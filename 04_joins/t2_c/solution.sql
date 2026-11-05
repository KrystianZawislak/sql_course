-- Joins · T2/C — Computer Science students without a semester I grade

SELECT s.imie, s.nazwisko, s.nr_albumu, ks.nazwa_kierunku
FROM dziekanat.studenci s
     INNER JOIN dziekanat.studenci_kierunkow sk ON s.nr_albumu = sk.nr_albumu
     INNER JOIN dziekanat.kierunki_studiow ks ON sk.id_kierunku_studiow = ks.id_kierunku
     LEFT JOIN (dziekanat.oceny o INNER JOIN dziekanat.przedmioty p ON
     o.id_przedmiotu = p.id_przedmiotu AND p.nr_semestru = 1) ON
     s.nr_albumu = o.nr_albumu AND o.id_kierunku_studiow = sk.id_kierunku_studiow
WHERE ks.nazwa_kierunku = 'Informatyka' AND o.ocena IS NULL
