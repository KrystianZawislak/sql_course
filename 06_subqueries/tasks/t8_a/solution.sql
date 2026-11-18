-- Subqueries · T8/A — Students with an average higher than their field of study's average (WITH)

WITH student_average AS (
    SELECT AVG(ocena) AS average, imie, nazwisko, nr_albumu, id_kierunku
    FROM dziekanat.studenci s
    INNER JOIN dziekanat.studenci_kierunkow sk USING(nr_albumu)
    INNER JOIN dziekanat.kierunki_studiow ks ON ks.id_kierunku = sk.id_kierunku_studiow
    INNER JOIN dziekanat.oceny o USING(nr_albumu, id_kierunku_studiow)
    GROUP BY id_kierunku, nr_albumu, imie, nazwisko
),
     field_average AS (
    SELECT AVG(ocena) AS average, id_kierunku_studiow
    FROM dziekanat.oceny o
    GROUP BY id_kierunku_studiow
)

SELECT sa.nazwisko, sa.imie
FROM student_average sa, field_average fa
WHERE sa.average > fa.average AND sa.id_kierunku = fa.id_kierunku_studiow
ORDER BY nazwisko, imie ASC;
