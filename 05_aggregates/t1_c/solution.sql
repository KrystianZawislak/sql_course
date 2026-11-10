-- Aggregates & Grouping · T1/C — Latest enrollment in the Data Warehouses elective

SELECT MAX(z.data_czas_zapisu)::date AS "Latest enrollment date"
FROM dziekanat.fakultety f INNER JOIN dziekanat.zapisy z USING (id_fakultetu)
WHERE f.nazwa_fakultetu = 'Hurtownie danych';
