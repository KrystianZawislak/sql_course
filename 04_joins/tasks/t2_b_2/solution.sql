-- Joins · T2/B/2 — Computer Science grades (all students)

SELECT s.nr_albumu, s.imie, s.nazwisko, p.nazwa_przedmiotu, p.nr_semestru, o.data_zaliczenia, o.ocena
FROM dziekanat.studenci s
     INNER JOIN dziekanat.studenci_kierunkow sk ON s.nr_albumu = sk.nr_albumu
     LEFT JOIN dziekanat.oceny o ON s.nr_albumu = o.nr_albumu AND sk.id_kierunku_studiow = o.id_kierunku_studiow
     LEFT JOIN dziekanat.przedmioty p ON o.id_przedmiotu = p.id_przedmiotu
     LEFT JOIN dziekanat.kierunki_studiow ks ON ks.id_kierunku = sk.id_kierunku_studiow
WHERE ks.nazwa_kierunku = 'Informatyka'
ORDER BY nazwisko
