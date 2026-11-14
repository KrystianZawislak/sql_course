-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 7: Even or odd with CASE
-- (run ../setup.sql first)

SELECT d.arab, (CASE
                   WHEN d.arab % 2 = 0 THEN 'even'
                   ELSE 'odd'
               END) AS parity
FROM digit d
WHERE d.arab BETWEEN 0 AND 9;
