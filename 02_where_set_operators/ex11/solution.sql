-- WHERE Clause & Set Operators · Exercise 11 — Discus throw: Olympic final winner
WITH dyskobol AS(
SELECT *
	FROM (VALUES
	 	(1, 'Piotr', 'Małachowski', 1, 69.88),
	 	(2, 'Gerd', 'Kanter', 1, 67.22),
	 	(3, 'Kristjan', 'Čeh', 1, 68.37), 	  
	 	(1, 'Piotr', 'Małachowski', 2, 70.22),
	 	(2, 'Gerd', 'Kanter', 2, 65.92),
	 	(3, 'Kristjan', 'Čeh', 2, 44.23), 	  
	 	(1, 'Piotr', 'Małachowski', 3, 65.10),
	 	(2, 'Gerd', 'Kanter', 3, 55.12),
	 	(3, 'Kristjan', 'Čeh', 3, NULL), 	  
	 	(1, 'Piotr', 'Małachowski', 4, 71.88),
	 	(2, 'Gerd', 'Kanter', 4, 64.99),
	 	(3, 'Kristjan', 'Čeh', 4, 64.72), 	  
	 	(1, 'Piotr', 'Małachowski', 5, 68.21),
	 	(2, 'Gerd', 'Kanter', 5, 67.22),
	 	(3, 'Kristjan', 'Čeh', 5, 70.23)) AS dyskobol (numer, imie, nazwisko, proba, rezultat) 	  
), 

najlepsze_kwalifikacje AS (
SELECT DISTINCT ON (numer) *
FROM dyskobol
WHERE proba <= 2
ORDER BY numer, rezultat DESC),

finalisci AS (
SELECT *
FROM najlepsze_kwalifikacje
ORDER BY rezultat DESC
LIMIT 2)

SELECT imie, nazwisko, rezultat, proba FROM dyskobol
WHERE proba >= 3 AND proba <= 5
AND numer IN (SELECT numer FROM finalisci)
ORDER BY rezultat DESC NULLS LAST
LIMIT 1;



