-- WHERE Clause & Set Operators · T1/E — Available faculties

SELECT id_fakultetu, nazwa_fakultetu, id_prowadzacego
FROM dziekanat.fakultety
WHERE dostepny IS TRUE
ORDER BY id_prowadzacego;
