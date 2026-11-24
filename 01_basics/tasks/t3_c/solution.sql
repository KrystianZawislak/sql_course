-- SQL Basics · T3/C — Even records of faculties

SELECT *
FROM dziekanat.fakultety
WHERE id_fakultetu % 2 = 0;
