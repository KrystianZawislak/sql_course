-- Joins · Problem task — #Cycling — T2/D/3: Athletes who took part in no competition
-- (run ../setup.sql first)

SELECT a.athlete_id, a.first_name, a.last_name
       FROM cycling.athlete a LEFT JOIN cycling.result r ON a.athlete_id = r.athlete_id
WHERE r.competition_id IS NULL;
