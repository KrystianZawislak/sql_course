-- Joins · T1/A — Theta join: Mathematics grades in semester I

SELECT s.nr_albumu, s.imie, s.nazwisko, p.nazwa_przedmiotu, o.data_zaliczenia, o.ocena
FROM dziekanat.studenci s, dziekanat.przedmioty p, dziekanat.oceny o,
     dziekanat.kierunki_studiow ks
WHERE s.nr_albumu = o.nr_albumu AND o.id_przedmiotu = p.id_przedmiotu
      AND o.id_kierunku_studiow = ks.id_kierunku AND ks.nazwa_kierunku = 'Matematyka'
      AND p.nr_semestru = 1;
