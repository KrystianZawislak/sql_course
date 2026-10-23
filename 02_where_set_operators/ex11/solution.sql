-- WHERE Clause & Set Operators · Exercise 11 — Discus throw: Olympic final winner
WITH discus AS(
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
	 	(3, 'Kristjan', 'Čeh', 5, 70.23)) AS discus (athlete_no, first_name, last_name, attempt, result) 	  
), 

best_qualifying AS (
SELECT DISTINCT ON (athlete_no) *
FROM discus
WHERE attempt <= 2
ORDER BY athlete_no, result DESC),

finalists AS (
SELECT *
FROM best_qualifying
ORDER BY result DESC
LIMIT 2)

SELECT first_name, last_name, result, attempt FROM discus
WHERE attempt >= 3 AND attempt <= 5
AND athlete_no IN (SELECT athlete_no FROM finalists)
ORDER BY result DESC NULLS LAST
LIMIT 1;



