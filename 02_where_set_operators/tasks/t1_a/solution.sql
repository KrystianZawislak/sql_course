-- WHERE Clause & Set Operators · T1/A — Female students

SELECT s.nr_albumu, s.imie, s.nazwisko, s.pesel
FROM dziekanat.studenci s
WHERE SUBSTR(s.pesel, 10, 1)::integer % 2 = 0
ORDER BY s.nazwisko;
