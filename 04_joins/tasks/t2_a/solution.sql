-- Joins · T2/A — Students from a WKU other than Tarnów

SELECT s.nr_albumu, s.imie, s.nazwisko, w.wku
FROM dziekanat.studenci s INNER JOIN dziekanat.wojsko w
ON s.nr_albumu = w.nr_albumu
WHERE w.wku <> 'WKU w Tarnowie';
