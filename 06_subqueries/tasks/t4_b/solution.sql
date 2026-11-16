-- Subqueries · T4/B — Students without a failing grade in semester I

-- Variant 1: the student as a whole (a failing grade in semester I of any field of study excludes the student)
SELECT s.imie, s.nazwisko, s.nr_albumu
FROM dziekanat.studenci s
WHERE NOT EXISTS (SELECT o.nr_albumu
                  FROM dziekanat.oceny o NATURAL JOIN dziekanat.przedmioty p
                  WHERE s.nr_albumu = o.nr_albumu AND p.nr_semestru = 1 AND o.ocena = 2)
      AND EXISTS (SELECT nr_albumu
                    FROM dziekanat.oceny o NATURAL JOIN dziekanat.przedmioty p
                  WHERE nr_semestru = 1 AND s.nr_albumu = nr_albumu);

-- Variant 2: separately for each field of study (student 8 passes on field 5 despite a failing grade on field 1)
SELECT s.imie, s.nazwisko, s.nr_albumu, sk.id_kierunku_studiow
FROM dziekanat.studenci s NATURAL JOIN dziekanat.studenci_kierunkow sk
WHERE NOT EXISTS (SELECT o.nr_albumu
                  FROM dziekanat.oceny o NATURAL JOIN dziekanat.przedmioty p
                  WHERE s.nr_albumu = o.nr_albumu AND p.nr_semestru = 1 AND o.ocena = 2
                  AND sk.id_kierunku_studiow = o.id_kierunku_studiow)
      AND EXISTS (SELECT nr_albumu
                    FROM dziekanat.oceny o NATURAL JOIN dziekanat.przedmioty p
                  WHERE nr_semestru = 1 AND s.nr_albumu = nr_albumu
                  AND sk.id_kierunku_studiow = o.id_kierunku_studiow);
