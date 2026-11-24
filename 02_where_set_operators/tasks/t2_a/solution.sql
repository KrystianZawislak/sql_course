-- WHERE Clause & Set Operators · T2/A — Addresses not assigned to any student

SELECT a.id_adresu
FROM dziekanat.adresy a

EXCEPT

(
SELECT adres_zamieszkania
FROM dziekanat.studenci

UNION

SELECT adres_korespondencyjny
FROM dziekanat.studenci
);
