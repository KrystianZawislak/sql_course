-- WHERE Clause & Set Operators · T2/B — Students and employees with surnames starting with K

SELECT imie, nazwisko, 'STUDENT' AS "Category"
FROM dziekanat.studenci
WHERE nazwisko LIKE 'K%'

UNION ALL

SELECT imie, nazwisko, 'PRACOWNIK'
FROM kadry.prowadzacy
WHERE nazwisko LIKE 'K%';
