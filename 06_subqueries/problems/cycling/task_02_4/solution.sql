-- Subqueries · Problem task — #cycling — Task 2.4: Both counts in one query
-- (run ../setup.sql first)

SELECT a.team_uci_code,
       COUNT(*) FILTER (WHERE age(a.birthdate) < (SELECT AVG(age(birthdate))
                        FROM cycling.athlete
                           WHERE team_uci_code = a.team_uci_code)),
       COUNT(*) FILTER (WHERE age(a.birthdate) < (SELECT AVG(age(birthdate))
                           FROM cycling.athlete))
    FROM cycling.athlete a
    GROUP BY a.team_uci_code;

-- How?
-- The subqueries go directly into the FILTER (WHERE …) clause of the COUNT function in the outer SELECT.
