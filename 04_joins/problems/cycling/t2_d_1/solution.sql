-- Joins · Problem task — #Cycling — T2/D/1: Athletes who took part in competitions
-- (run ../setup.sql first)

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
