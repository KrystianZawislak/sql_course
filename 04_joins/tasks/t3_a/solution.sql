-- Joins · T3/A — Natural join: grades in semester II

SELECT s.nr_albumu, s.imie, s.nazwisko, p.nazwa_przedmiotu, o.data_zaliczenia, o.ocena
FROM dziekanat.studenci s
     NATURAL JOIN dziekanat.oceny o
     NATURAL JOIN dziekanat.przedmioty p
WHERE p.nr_semestru = 2
