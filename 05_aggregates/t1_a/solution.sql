-- Aggregates & Grouping · T1/A — Number of Computer Science students

SELECT COUNT(sk.nr_albumu) AS "Liczba studentów kierunku INFORMATYKA"
FROM dziekanat.studenci_kierunkow sk
     INNER JOIN dziekanat.kierunki_studiow ks ON ks.id_kierunku = sk.id_kierunku_studiow
WHERE nazwa_kierunku = 'Informatyka'
