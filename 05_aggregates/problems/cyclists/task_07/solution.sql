-- Aggregates & Grouping · Problem task — #Cyclists — Task 7: Time gaps on stage 20 of the Tour de France '24
-- (run ../setup.sql first)

-- (the stage results are in cycling.stage_result, not cycling.result as the task says)
SELECT first_name, last_name, result,
       result - MIN(result) OVER() AS "loss"
FROM cycling.stage_result sr NATURAL JOIN cycling.athlete a
ORDER BY result ASC;
