-- Aggregates & Grouping · Problem task — #Cyclists — Task 3: Averages with group filtering
-- (run ../setup.sql first)

-- Task 3a – groups by year of birth with an average BMI of at least 20
SELECT AVG(weight) AS "AVG WEIGHT", AVG (height) AS "AVG HEIGHT",
       AVG(weight/((height/100.0)*(height/100.0))) AS  "AVG BMI",
       EXTRACT('year' FROM athlete.birthdate) AS year
FROM cycling.athlete
GROUP BY year
HAVING  AVG(weight/((height/100.0)*(height/100.0))) >= 20
ORDER BY year;

-- Task 3b – groups by year of birth, juniors only (at most 21 by year of birth this season)
SELECT AVG(weight) AS "AVG WEIGHT", AVG (height) AS "AVG HEIGHT",
       AVG(weight/((height/100.0)*(height/100.0))) AS  "AVG BMI",
       EXTRACT('year' FROM athlete.birthdate) AS year
FROM cycling.athlete
WHERE EXTRACT('year' FROM CURRENT_DATE) - EXTRACT('year' FROM athlete.birthdate) <= 21
GROUP BY year
ORDER BY year;
