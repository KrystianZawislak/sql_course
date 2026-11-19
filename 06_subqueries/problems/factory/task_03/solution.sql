-- Subqueries · Problem task — Factory (bill of materials) — Task 3: Assembly paths
-- (run ../setup.sql first)

-- Assembly paths of the MTB bike, e.g. MTB bike -> Wheel -> Spoke
WITH RECURSIVE assembly_paths AS (
    SELECT p.part_name || ' -> ' || pc.part_name AS "path", a.child_id
    FROM factory.part p INNER JOIN factory.assemblage a ON p.part_id = a.parent_id
                        INNER JOIN factory.part pc ON pc.part_id = child_id
    WHERE p.part_name = 'MTB bike'

    UNION ALL

    SELECT ap.path || ' -> ' || p.part_name AS "path", a.child_id
    FROM factory.assemblage a INNER JOIN assembly_paths ap ON ap.child_id = a.parent_id
                              INNER JOIN factory.part p ON p.part_id = a.child_id
)

SELECT path FROM assembly_paths;
