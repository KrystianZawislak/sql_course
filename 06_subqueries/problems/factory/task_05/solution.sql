-- Subqueries · Problem task — Factory (bill of materials) — Task 5: Cycle detection
-- (run ../setup.sql first)

-- Adding a row that creates a cycle: the wheel contains the MTB bike (MTB bike -> Wheel -> MTB bike -> …)
INSERT INTO factory.assemblage VALUES (6, 1, 1);

-- Tests of the earlier queries (with the cycle in the database):
-- task 2 (bike composition with quantities): after a few seconds "ERROR: integer out of range" (SQL state 22003).
--   The recursion never ends and the quantity is multiplied on every loop (the bike has 2 wheels, so ×2 per loop),
--   so after a few dozen loops the quantities (spokes the fastest: 24 × 2 × 2 × …) exceed the integer range (~2.1 billion).
-- task 3 (assembly paths) and task 4 (parts that need a bearing, up the tree): they loop, stopped manually after ~10 s (Stop).
--   Nothing is multiplied here, so there is no overflow to stop them: the recursion goes on forever
--   (task 3 keeps appending "MTB bike -> Wheel -> …" to the path, task 4 circles upwards Wheel -> MTB bike -> Wheel -> …).

-- Cycle detection: for every part — can it get from itself back to itself (does it lie on a cycle)
-- visited = list of visited parts; when the new child is already on the list -> is_cycle = true and stop
WITH RECURSIVE child AS (
    SELECT p.part_id, FALSE AS "is_cycle", ARRAY[part_id] AS "visited"
    FROM factory.part p

    UNION ALL

    SELECT a.child_id, a.child_id = ANY(visited), visited || a.child_id
    FROM child c INNER JOIN factory.assemblage a ON a.parent_id = c.part_id
    WHERE NOT c.is_cycle
)

-- visited[1] = the starting part; BOOL_OR = true if any path came back to the start
SELECT visited[1] AS part_id, BOOL_OR(is_cycle AND part_id = visited[1]) AS is_cycle
FROM child
GROUP BY visited[1]
ORDER BY part_id;
