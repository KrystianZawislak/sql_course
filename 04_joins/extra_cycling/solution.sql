-- Joins · Extra — Problem task #Cycling (T2/D/0 – T2/D/3)

-- T2/D/0 – BMI classification (run setup.sql first)

SELECT first_name, last_name,
       weight / ((height / 100.0) * (height / 100.0)) AS bmi_value,
       b.category
FROM cycling.athlete a, bmi b
WHERE weight / ((height / 100.0) * (height / 100.0)) < b.upper
      AND weight / ((height / 100.0) * (height / 100.0)) >= b.lower;

-- T2/D/1 – athletes who took part in competitions (an athlete in many competitions appears many times)
SELECT a.athlete_id, a.first_name, a.last_name, t.team_name, c.competition_name, r.rank
FROM cycling.athlete a
     INNER JOIN cycling.result r ON r.athlete_id = a.athlete_id
     INNER JOIN cycling.competition c ON c.competition_id = r.competition_id
     INNER JOIN cycling.team t ON t.team_uci_code = a.team_uci_code;

-- T2/D/1 – the same with natural joins
-- athlete and team share two columns (team_uci_code, country_code), so team is joined with ON
SELECT a.athlete_id, a.first_name, a.last_name, t.team_name, c.competition_name, r.rank
FROM cycling.athlete a
     NATURAL JOIN cycling.result r
     NATURAL JOIN cycling.competition c
     INNER JOIN cycling.team t ON t.team_uci_code = a.team_uci_code;

-- T2/D/2 – points classification: 1st place = 100 pts, 2nd place = 75 pts, 3rd place = 50 pts
DROP TABLE IF EXISTS points;
CREATE TEMPORARY TABLE points (
    rank integer,
    points integer
);

INSERT INTO points VALUES
    (1, 100),
    (2, 75),
    (3, 50);

SELECT a.athlete_id, a.first_name, a.last_name, t.team_name, SUM(p.points) AS point
       FROM cycling.athlete a NATURAL JOIN cycling.result r
       NATURAL JOIN points p INNER JOIN cycling.team t ON a.team_uci_code = t.team_uci_code
GROUP BY a.athlete_id, t.team_name;

-- T2/D/2 – classification that also includes athletes without points
SELECT a.athlete_id, a.first_name, a.last_name, t.team_name, COALESCE(SUM(p.points), 0) AS point
       FROM cycling.athlete a NATURAL LEFT JOIN cycling.result r
       NATURAL LEFT JOIN points p INNER JOIN cycling.team t ON a.team_uci_code = t.team_uci_code
GROUP BY a.athlete_id, t.team_name
ORDER BY point DESC;

-- T2/D/3 – athletes who did not take part in any competition
SELECT a.athlete_id, a.first_name, a.last_name
       FROM cycling.athlete a LEFT JOIN cycling.result r ON a.athlete_id = r.athlete_id
WHERE r.competition_id IS NULL;
