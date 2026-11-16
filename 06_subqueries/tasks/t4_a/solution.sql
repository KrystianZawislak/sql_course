-- Subqueries · T4/A — Lecturers without any elective enrollments in 2012

SELECT kp1.tytul, kp1.imie, kp1.nazwisko, kp1.stanowisko
FROM kadry.prowadzacy kp1
WHERE NOT EXISTS
     (SELECT id_prowadzacego
      FROM kadry.prowadzacy LEFT JOIN dziekanat.fakultety USING(id_prowadzacego)
                              NATURAL LEFT JOIN dziekanat.zapisy
      WHERE EXTRACT('year' FROM data_czas_zapisu) = 2012 AND kp1.id_prowadzacego = id_prowadzacego);
