-- Subqueries · Problem task — #cycling — Task 2.3: Per team: athletes younger than the team average
-- (run ../setup.sql first)

SELECT a.team_uci_code, COUNT(*)
    FROM cycling.athlete a
    WHERE age(a.birthdate) < (SELECT AVG(age(birthdate)) FROM cycling.athlete
           WHERE team_uci_code = a.team_uci_code)
    GROUP BY a.team_uci_code;
