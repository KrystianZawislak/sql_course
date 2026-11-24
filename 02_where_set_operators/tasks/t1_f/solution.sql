-- WHERE Clause & Set Operators · T1/F — Lecturers by base salary range

SELECT imie, nazwisko, tytul, stanowisko, placa_zasadnicza::money
FROM kadry.prowadzacy
WHERE (placa_zasadnicza BETWEEN 4000 AND 6000) OR (placa_zasadnicza IS NULL)
ORDER BY placa_zasadnicza NULLS FIRST;
