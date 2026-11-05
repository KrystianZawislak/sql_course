-- Joins · T3/B — Natural join: students without a semester I grade

SELECT s.nr_albumu, s.imie, s.nazwisko, ks.nazwa_kierunku
FROM dziekanat.studenci s
     NATURAL JOIN (dziekanat.studenci_kierunkow sk INNER JOIN dziekanat.kierunki_studiow ks ON
     sk.id_kierunku_studiow = ks.id_kierunku)
     NATURAL LEFT JOIN (dziekanat.oceny o INNER JOIN dziekanat.przedmioty p ON
     o.id_przedmiotu = p.id_przedmiotu AND p.nr_semestru = 1)
WHERE o.ocena IS NULL
