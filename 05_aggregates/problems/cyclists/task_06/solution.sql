-- Aggregates & Grouping · Problem task — #Cyclists — Task 6: Athletes, women and men per team
-- (run ../setup.sql first)

SELECT
    t.team_name,
    COUNT(a.athlete_id) AS number_of_players,
    COUNT(a.athlete_id) FILTER (WHERE a.sex = 'male') AS number_of_male_players,
    COUNT(a.athlete_id) FILTER (WHERE a.sex NOT IN ('male')) AS number_of_female_players
FROM cycling.athlete a RIGHT JOIN cycling.team t USING(team_uci_code)
GROUP BY t.team_name;
