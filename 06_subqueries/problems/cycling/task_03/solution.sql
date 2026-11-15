-- Subqueries · Problem task — #cycling — Task 3: Teams whose athletes are all from the team's country
-- (run ../setup.sql first)

SELECT t1.team_uci_code
FROM cycling.team t1
WHERE t1.team_uci_code NOT IN (SELECT team_uci_code
                             FROM cycling.team t2 INNER JOIN cycling.athlete a USING(team_uci_code)
                             WHERE t2.country_code <> a.country_code) AND t1.team_uci_code IN (SELECT team_uci_code
                                                                            FROM cycling.athlete);
