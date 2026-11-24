-- Data Manipulation (DML) · T2/C — Graduates table

DROP TABLE IF EXISTS dziekanat.absolwenci;

SELECT * INTO dziekanat.absolwenci
FROM dziekanat.studenci_kierunkow
WHERE FALSE;

INSERT INTO dziekanat.absolwenci (nr_albumu, id_kierunku_studiow, data_rozpoczecia, data_ukonczenia)
(SELECT * FROM dziekanat.studenci_kierunkow sk WHERE sk.data_ukonczenia IS NOT NULL);
