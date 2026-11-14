-- Subqueries · Problem task — #cycling — Task 1: Teams with at least 5 athletes
-- (run ../setup.sql first)

-- Subproblem: number of athletes in each team, only teams with at least 5 athletes
SELECT a.team_uci_code, COUNT(a.team_uci_code)
FROM cycling.athlete a
GROUP BY a.team_uci_code
HAVING COUNT(a.team_uci_code) >= 5;

-- Solution
SELECT t.team_uci_code, t.team_name
FROM cycling.team t
WHERE t.team_uci_code = ANY (SELECT team_uci_code
                             FROM cycling.athlete
                             GROUP BY team_uci_code
                             HAVING COUNT(*) >= 5);
