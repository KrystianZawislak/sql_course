-- Data Manipulation (DML) · T2/A — Arabic and Roman numbers from 1 to 30
-- (run setup.sql first)

INSERT INTO exploratory.number (arabic)
SELECT tens.arab * 10 + units.arab
FROM digit tens CROSS JOIN digit units
WHERE tens.arab <= 3 AND units.arab <= 9 AND tens.arab * 10 + units.arab BETWEEN 1 AND 30
ORDER BY 1;

UPDATE exploratory.number n
SET roman = REPEAT('X', n.arabic / 10) ||
            (CASE
                WHEN n.arabic % 10 BETWEEN 1 AND 3 THEN REPEAT('I', n.arabic % 10)
                WHEN n.arabic % 10 = 4 THEN 'IV'
                WHEN n.arabic % 10 BETWEEN 5 AND 8 THEN 'V' || REPEAT('I', n.arabic % 10 - 5)
                WHEN n.arabic % 10 = 9 THEN REPEAT('I', 10 - n.arabic % 10) || 'X'
                ELSE ''
             END
            );
