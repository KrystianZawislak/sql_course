-- Subqueries · T2/A — Students registered with a WKU in Lesser Poland


SELECT s.nr_albumu, s.imie, s.nazwisko
    FROM dziekanat.studenci s
    WHERE s.nr_albumu IN (SELECT w.nr_albumu
                            FROM dziekanat.wojsko w
                        WHERE w.wku LIKE '%Tarnowie' OR w.wku LIKE '%Nowym Sączu' OR w.wku LIKE '%Krakowie');
