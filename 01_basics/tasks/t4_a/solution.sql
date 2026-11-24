-- SQL Basics · T4/A — rows, width and loops in EXPLAIN ANALYZE


-- Example: execution plan of the T3/C query
EXPLAIN ANALYZE
SELECT *
FROM dziekanat.fakultety
WHERE id_fakultetu % 2 = 0;
