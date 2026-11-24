-- WHERE Clause & Set Operators · T1/B — Addresses in two voivodeships

SELECT a.ulica, a.nr_domu, a.kod_pocztowy, a.miejscowosc
FROM dziekanat.adresy a
WHERE a.wojewodztwo = 'podkarpackie' OR a.wojewodztwo = 'lubuskie';
