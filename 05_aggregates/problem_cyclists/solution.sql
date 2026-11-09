-- Aggregates & Grouping · Problem task — #Cyclists

-- Task 1
SELECT COUNT(*) AS "Number of athletes",
       COUNT(*)  FILTER (WHERE height IS NULL) AS "Missing height",
       COUNT(*)  FILTER (WHERE weight IS NULL) AS "Missing weight",
       COUNT(*)  FILTER (WHERE weight IS NULL OR height IS NULL) AS "Missing weight or height",
       COUNT(*)  FILTER (WHERE weight IS NULL AND height IS NULL) AS "Missing weight and height"
FROM cycling.athlete;

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

-- Task 4 – Z-SCORE of each athlete's BMI relative to their team
SELECT  a.first_name, a.last_name, a.team_uci_code,
        ROUND((((weight/((height/100.0)*(height/100.0))) - AVG(weight/((height/100.0)*(height/100.0)))
        OVER (PARTITION BY team_uci_code)) / STDDEV(weight/((height/100.0)*(height/100.0)))
        OVER (PARTITION BY team_uci_code)), 2) AS "Z-SCORE",
        ROUND((weight/((height/100.0)*(height/100.0))), 2) AS "BMI"
FROM cycling.athlete a
ORDER BY 3;
-- Interpretation:
-- 1. A Z-SCORE close to 0 means the athlete practically doesn't differ from the rest of the team.
-- 2. The sign shows the direction: + means heavier than the team average, - means lighter.
--    An athlete clearly stands out at about +/-2.
-- 3. In COF, Hugo Toumire and Stanisław Aniołkowski deviate by the same amount; in EFE, Georg Steinhauser
--    deviates the most (about -1.6, lighter than the rest of the team), but still below the +/-2 threshold.
-- 4. NULL – the athletes may not have their data entered, or the team has only one athlete,
--    so there is nobody to compare with (STDDEV of a single value is NULL).

-- Task 5 – number of teams without any athlete
SELECT COUNT(t.team_name) AS "TEAMS"
FROM cycling.team t
     LEFT JOIN cycling.athlete a USING (team_uci_code)
WHERE a.first_name IS NULL;

-- Task 6 – total number of athletes, women and men in each team
SELECT
    t.team_name,
    COUNT(a.athlete_id) AS number_of_players,
    COUNT(a.athlete_id) FILTER (WHERE a.sex = 'male') AS number_of_male_players,
    COUNT(a.athlete_id) FILTER (WHERE a.sex NOT IN ('male')) AS number_of_female_players
FROM cycling.athlete a RIGHT JOIN cycling.team t USING(team_uci_code)
GROUP BY t.team_name;

-- Task 7 – time gap of each athlete to the winner of stage 20 of the Tour de France '24
-- (the stage results are in cycling.stage_result, not cycling.result as the task says)
SELECT first_name, last_name, result,
       result - MIN(result) OVER() AS "loss"
FROM cycling.stage_result sr NATURAL JOIN cycling.athlete a
ORDER BY result ASC;

-- Task 8 – did UAE Team Emirates dominate Team Visma in the 2024 season?
-- Metric 1 – sum of UCI points (points depend on the race scale and the rank)
SELECT t.team_name, SUM(points) AS uci_points
FROM cycling.athlete a NATURAL JOIN cycling.result r
INNER JOIN cycling.team t USING (team_uci_code)
INNER JOIN cycling.competition c USING (competition_id)
INNER JOIN cycling.scale s USING (scale_code)
INNER JOIN cycling.point p USING (scale_id, rank)
WHERE t.team_name IN ('UAE Team Emirates', 'Team Visma - Lease a Bike')
GROUP BY t.team_name;

-- Metric 2 – number of race wins (rank = 1)
SELECT t.team_name, COUNT(rank) FILTER (WHERE rank = 1) AS wins
FROM cycling.athlete a NATURAL LEFT JOIN cycling.result r
INNER JOIN cycling.team t USING (team_uci_code)
WHERE t.team_name IN ('UAE Team Emirates', 'Team Visma - Lease a Bike')
GROUP BY t.team_name;

-- Metric 3 – average time on stage 20 of the Tour de France '24
SELECT t.team_name, AVG(result) AS avg_time, COUNT(sr.athlete_id) AS athletes
FROM cycling.athlete a NATURAL LEFT JOIN cycling.stage_result sr
INNER JOIN cycling.team t USING (team_uci_code)
WHERE t.team_name IN ('UAE Team Emirates', 'Team Visma - Lease a Bike')
GROUP BY t.team_name;
-- Why this metric is misleading:
-- The average is misleading because UAE, even though it is the better team, has a worse average time,
-- since it has one slower rider in its ranks (Yates, 9th) – Visma has no third rider in the top 10,
-- so nothing makes its average worse.

-- Conclusion:
-- UAE dominated Visma in terms of UCI points and race wins, but not in terms of the team's average time.
-- The claim is confirmed – the average time is the misleading metric, so it doesn't disprove it.
