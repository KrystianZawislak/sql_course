-- Aggregates & Grouping · T2/E — ECTS points of each student in semester 1

SELECT sk.nr_albumu, s.imie, s.nazwisko, ks.nazwa_kierunku,
       COALESCE(SUM(ects) FILTER (WHERE o.ocena > 2), 0) AS "SUMA ECTS"
FROM dziekanat.studenci_kierunkow sk
     INNER JOIN dziekanat.kierunki_studiow ks ON sk.id_kierunku_studiow = ks.id_kierunku
     INNER JOIN dziekanat.studenci s USING (nr_albumu)
     LEFT JOIN dziekanat.oceny o USING (nr_albumu, id_kierunku_studiow)
     LEFT JOIN dziekanat.przedmioty p ON p.id_przedmiotu = o.id_przedmiotu AND nr_semestru = 1
GROUP BY sk.nr_albumu, ks.id_kierunku, s.imie, s.nazwisko
ORDER BY sk.nr_albumu::integer;
