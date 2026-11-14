-- Subqueries · Problem task — #cycling — Task 2.1: Athletes younger than the average age
-- (run ../setup.sql first)

SELECT COUNT(a.athlete_id)
    FROM cycling.athlete a
    WHERE age(a.birthdate) < (SELECT AVG(age(birthdate)) FROM cycling.athlete);
