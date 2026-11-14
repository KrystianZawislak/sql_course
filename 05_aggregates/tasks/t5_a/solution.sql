-- Aggregates & Grouping · T5/A — Ranking of students by average grade

SELECT nr_albumu, imie, nazwisko, AVG(ocena), rank() OVER (ORDER BY AVG(ocena) DESC)
FROM dziekanat.oceny o
     NATURAL JOIN dziekanat.studenci s
     INNER JOIN dziekanat.kierunki_studiow ks ON o.id_kierunku_studiow = ks.id_kierunku
GROUP BY nr_albumu, id_kierunku, imie, nazwisko;
