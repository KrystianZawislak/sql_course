-- Aggregates & Grouping · Problem task — #Cyclists — Task 4: Z-SCORE of BMI within the team
-- (run ../setup.sql first)

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
