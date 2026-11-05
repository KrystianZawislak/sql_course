-- Joins · T2/B/1 — Computer Science grades (students with grades)

SELECT s.nr_albumu, s.imie, s.nazwisko, p.nazwa_przedmiotu, p.nr_semestru, o.data_zaliczenia, o.ocena
FROM dziekanat.studenci s
     INNER JOIN dziekanat.oceny o ON s.nr_albumu = o.nr_albumu
     INNER JOIN dziekanat.przedmioty p ON o.id_przedmiotu = p.id_przedmiotu
     INNER JOIN dziekanat.kierunki_studiow ks ON o.id_kierunku_studiow = ks.id_kierunku
     WHERE ks.nazwa_kierunku = 'Informatyka'
ORDER BY s.NAZWISKO ASC
