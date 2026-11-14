-- Joins · T4/A — Cross join of three tables

SELECT count(*)
FROM dziekanat.oceny CROSS JOIN dziekanat.przedmioty CROSS JOIN kadry.prowadzacy
