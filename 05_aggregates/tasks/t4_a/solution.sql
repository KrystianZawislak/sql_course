-- Aggregates & Grouping · T4/A — Students with a disability per field of study

SELECT nazwa_kierunku AS "FIELD OF STUDY", COUNT(stopien_niepelnosprawnosci) AS "NUMBER OF STUDENTS"
FROM dziekanat.studenci_kierunkow sk
     INNER JOIN dziekanat.kierunki_studiow ks ON sk.id_kierunku_studiow = ks.id_kierunku
     NATURAL JOIN dziekanat.osobiste
GROUP BY nazwa_kierunku;
