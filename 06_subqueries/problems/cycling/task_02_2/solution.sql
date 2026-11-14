-- Subqueries · Problem task — #cycling — Task 2.2: Per team: athletes younger than the overall average
-- (run ../setup.sql first)

SELECT COUNT(a.athlete_id), a.team_uci_code
    FROM cycling.athlete a
    WHERE age(a.birthdate) < (SELECT AVG(age(birthdate)) FROM cycling.athlete)
    GROUP BY a.team_uci_code;
