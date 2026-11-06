-- Aggregates & Grouping · Problem task — #Cyclists

-- Task 1
SELECT COUNT(*) AS "Number of athletes",
       COUNT(*)  FILTER (WHERE height IS NULL) AS "Missing height",
       COUNT(*)  FILTER (WHERE weight IS NULL) AS "Missing weight",
       COUNT(*)  FILTER (WHERE weight IS NULL OR height IS NULL) AS "Missing weight or height",
       COUNT(*)  FILTER (WHERE weight IS NULL AND height IS NULL) AS "Missing weight and height"
FROM cycling.athlete;
