-- Joins · Problem task — #Cycling — T2/D/2: Points classification
-- (run ../setup.sql first)

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
