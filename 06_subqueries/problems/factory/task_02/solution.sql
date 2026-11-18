-- Subqueries · Problem task — Factory (bill of materials) — Task 2: Full composition of the MTB bike
-- (run ../setup.sql first)

-- Full composition of the MTB bike (recursion down the tree) with the number of pieces of each element
WITH RECURSIVE bike_composition AS (
    SELECT child_id, quantity
    FROM factory.assemblage
    WHERE parent_id = 1

    UNION ALL

    SELECT a.child_id, a.quantity * bc.quantity
    FROM factory.assemblage a INNER JOIN bike_composition bc ON bc.child_id = a.parent_id
)

SELECT part_name, part_type, COUNT(part_type) OVER (PARTITION BY part_type) AS "Number of elements of this type",
       SUM(quantity) OVER () AS "Total pieces", quantity AS "Quantity"
FROM bike_composition bc INNER JOIN factory.part p ON bc.child_id = p.part_id;
