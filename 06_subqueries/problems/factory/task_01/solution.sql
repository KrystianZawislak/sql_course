-- Subqueries · Problem task — Factory (bill of materials) — Task 1: Model inconsistencies
-- (run ../setup.sql first)

-- Products and components that have no children
SELECT *
FROM factory.assemblage RIGHT JOIN factory.part ON part_id = parent_id
WHERE parent_id IS NULL AND (part_type = 'component' OR part_type = 'product');

-- The same with a subquery
SELECT *
FROM factory.part
WHERE part_type IN ('component', 'product')
      AND part_id NOT IN (SELECT parent_id FROM factory.assemblage);

-- Parts that have children although they should not
SELECT *
FROM factory.assemblage RIGHT JOIN factory.part ON part_id = parent_id
WHERE part_type = 'part' AND child_id IS NOT NULL;

-- The same with a subquery
SELECT *
FROM factory.part
WHERE part_type = 'part'
      AND part_id IN (SELECT parent_id FROM factory.assemblage);
