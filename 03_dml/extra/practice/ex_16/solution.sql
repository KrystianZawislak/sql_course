-- Data Manipulation (DML) · Extra — Step-by-step DML practice — Ex. 16: Roman numerals 1–9 with UPDATE and CASE
-- (run ../setup.sql first)

UPDATE exploratory.number n
SET roman = (CASE
                 WHEN n.arabic BETWEEN 1 AND 3 THEN REPEAT('I', n.arabic)
                 WHEN n.arabic = 4 THEN 'IV'
                 WHEN n.arabic BETWEEN 5 AND 8 THEN 'V' || REPEAT('I', n.arabic - 5)
                 WHEN n.arabic BETWEEN 9 AND 10 THEN REPEAT('I', 10 - n.arabic) || 'X'
             END);

SELECT * FROM exploratory.number ORDER BY arabic;
