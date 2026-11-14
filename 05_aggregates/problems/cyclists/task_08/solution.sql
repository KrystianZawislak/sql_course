-- Aggregates & Grouping · Problem task — #Cyclists — Task 8: UAE Team Emirates vs Team Visma in 2024
-- (run ../setup.sql first)

-- Metric 1 – sum of UCI points (points depend on the race scale and the rank)
SELECT t.team_name, SUM(points) AS uci_points
FROM cycling.athlete a NATURAL JOIN cycling.result r
INNER JOIN cycling.team t USING (team_uci_code)
INNER JOIN cycling.competition c USING (competition_id)
INNER JOIN cycling.scale s USING (scale_code)
INNER JOIN cycling.point p USING (scale_id, rank)
WHERE t.team_name IN ('UAE Team Emirates', 'Team Visma - Lease a Bike')
GROUP BY t.team_name;

-- Metric 2 – number of race wins (rank = 1)
SELECT t.team_name, COUNT(rank) FILTER (WHERE rank = 1) AS wins
FROM cycling.athlete a NATURAL LEFT JOIN cycling.result r
INNER JOIN cycling.team t USING (team_uci_code)
WHERE t.team_name IN ('UAE Team Emirates', 'Team Visma - Lease a Bike')
GROUP BY t.team_name;

-- Metric 3 – average time on stage 20 of the Tour de France '24
SELECT t.team_name, AVG(result) AS avg_time, COUNT(sr.athlete_id) AS athletes
FROM cycling.athlete a NATURAL LEFT JOIN cycling.stage_result sr
INNER JOIN cycling.team t USING (team_uci_code)
WHERE t.team_name IN ('UAE Team Emirates', 'Team Visma - Lease a Bike')
GROUP BY t.team_name;
-- Why this metric is misleading:
-- The average is misleading because UAE, even though it is the better team, has a worse average time,
-- since it has one slower rider in its ranks (Yates, 9th) – Visma has no third rider in the top 10,
-- so nothing makes its average worse.

-- Conclusion:
-- UAE dominated Visma in terms of UCI points and race wins, but not in terms of the team's average time.
-- The claim is confirmed – the average time is the misleading metric, so it doesn't disprove it.
