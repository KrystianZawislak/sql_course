-- Aggregates & Grouping · T4/A — Students with a disability per field of study

SELECT nazwa_kierunku AS "NAZWA KIERUNKU", COUNT(stopien_niepelnosprawnosci) AS "LICZBA STUDENTOW"
FROM dziekanat.studenci_kierunkow sk
     INNER JOIN dziekanat.kierunki_studiow ks ON sk.id_kierunku_studiow = ks.id_kierunku
     NATURAL JOIN dziekanat.osobiste
GROUP BY nazwa_kierunku;
