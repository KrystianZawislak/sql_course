-- Subqueries · T6/A — Students' personal data with their field of study (multi-level subqueries)

SELECT o.nr_albumu,

      (SELECT (s.imie || ' ' || s.nazwisko) AS "FULL NAME"
       FROM dziekanat.studenci s
       WHERE o.nr_albumu = s.nr_albumu),

       o.email, o.telefon_stacjonarny, o.telefon_komorkowy,

      (SELECT STRING_AGG((SELECT ks.nazwa_kierunku FROM dziekanat.kierunki_studiow ks WHERE ks.id_kierunku = sk.id_kierunku_studiow), ', ')
       AS "FIELD OF STUDY"
       FROM dziekanat.studenci_kierunkow sk
       WHERE o.nr_albumu = sk.nr_albumu)

FROM dziekanat.osobiste o;
