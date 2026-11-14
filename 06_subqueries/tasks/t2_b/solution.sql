-- Subqueries · T2/B — Students who signed up for at least 4 electives


SELECT s.imie, s.nazwisko, s.nr_albumu
    FROM dziekanat.studenci s
    WHERE s.nr_albumu = ANY (SELECT z.nr_albumu
           FROM dziekanat.zapisy z
           GROUP BY z.nr_albumu
           HAVING COUNT(z.nr_albumu) >= 4);
