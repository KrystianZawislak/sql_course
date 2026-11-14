-- Aggregates & Grouping · Problem task — #Cyclists — Task 5: Teams without athletes
-- (run ../setup.sql first)

SELECT COUNT(t.team_name) AS "TEAMS"
FROM cycling.team t
     LEFT JOIN cycling.athlete a USING (team_uci_code)
WHERE a.first_name IS NULL;
