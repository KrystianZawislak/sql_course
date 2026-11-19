-- Subqueries · Problem task — Factory (bill of materials) — Task 4: Components and products that need a bearing
-- (run ../setup.sql first)

-- Components and products that need a bearing (recursion up the tree, from the bearing to the product)
WITH RECURSIVE contains_bearing AS (
    SELECT p.part_name, part_id
    FROM factory.assemblage a INNER JOIN factory.part p ON p.part_id = a.parent_id
    WHERE a.child_id = 15

    UNION ALL

    SELECT p.part_name, p.part_id
    FROM contains_bearing cb INNER JOIN factory.assemblage a ON cb.part_id = a.child_id
                             INNER JOIN factory.part p ON p.part_id = a.parent_id
)

SELECT part_name FROM contains_bearing;
