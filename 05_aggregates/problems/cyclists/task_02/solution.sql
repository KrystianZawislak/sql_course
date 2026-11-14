-- Aggregates & Grouping · Problem task — #Cyclists — Task 2: Average weight, height and BMI
-- (run ../setup.sql first)

-- Task 2a – all athletes
SELECT AVG(weight) AS "AVG WEIGHT", AVG (height) AS "AVG HEIGHT",
       AVG(weight/((height/100.0)*(height/100.0))) AS  "AVG BMI"
FROM cycling.athlete;

-- Task 2b – groups by year of birth
SELECT AVG(weight) AS "AVG WEIGHT", AVG (height) AS "AVG HEIGHT",
       AVG(weight/((height/100.0)*(height/100.0))) AS  "AVG BMI",
       EXTRACT('year' FROM athlete.birthdate) AS year
FROM cycling.athlete
GROUP BY year;

-- Task 2c – groups by year of birth and sex
SELECT AVG(weight) AS "AVG WEIGHT", AVG (height) AS "AVG HEIGHT",
       AVG(weight/((height/100.0)*(height/100.0))) AS  "AVG BMI",
       EXTRACT('year' FROM athlete.birthdate) AS year, athlete.sex AS sex
FROM cycling.athlete
GROUP BY year, sex
ORDER BY year;
