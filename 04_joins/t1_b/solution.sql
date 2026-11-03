-- Joins · T1/B — Theta join: subjects taught for at least two semesters

SELECT DISTINCT p1.nazwa_przedmiotu
FROM dziekanat.przedmioty p1, dziekanat.przedmioty p2
WHERE p1.nazwa_przedmiotu = p2.nazwa_przedmiotu AND p1.nr_semestru != p2.nr_semestru;
