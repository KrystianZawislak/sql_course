-- Joins · T2/D — Cycling: teams without a female athlete

SELECT DISTINCT t.team_name
FROM cycling.athlete a
     RIGHT JOIN cycling.team t ON a.team_uci_code = t.team_uci_code AND a.sex = 'female'
WHERE a.sex IS NULL
