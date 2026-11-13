-- Data Manipulation (DML) · T2/B — Odd Arabic and Roman numbers up to 999
-- (run setup.sql first)

INSERT INTO exploratory.number (arabic)
    SELECT hundreds.arab * 100 + tens.arab * 10 + units.arab
        FROM digit tens CROSS JOIN digit units CROSS JOIN digit hundreds
    WHERE tens.arab <= 9 AND units.arab <= 9 AND hundreds.arab <= 9
    AND hundreds.arab * 100 + tens.arab * 10 + units.arab BETWEEN 1 AND 999
    AND units.arab % 2 = 1
    ORDER by 1;

ALTER TABLE exploratory.number
ALTER COLUMN roman TYPE varchar(15);

UPDATE exploratory.number n
SET roman = (CASE
                WHEN (n.arabic % 1000) / 100 BETWEEN 1 AND 3 THEN REPEAT('C', n.arabic / 100)
                WHEN (n.arabic % 1000) / 100 = 4 THEN ('CD')
                WHEN (n.arabic % 1000) / 100 BETWEEN 5 AND 8 THEN 'D' || REPEAT('C', ((n.arabic / 100) - 5))
                WHEN (n.arabic % 1000) / 100 = 9 THEN 'CM'
                ELSE ''
             END
            ) ||

            (CASE
                WHEN (n.arabic % 100) / 10 BETWEEN 1 AND 3 THEN REPEAT('X', (n.arabic % 100) / 10)
                WHEN (n.arabic % 100) / 10 = 4 THEN ('XL')
                WHEN (n.arabic % 100) / 10 BETWEEN 5 AND 8 THEN 'L' || REPEAT('X', ((n.arabic % 100) / 10) - 5)
                WHEN (n.arabic % 100) / 10 = 9 THEN ('XC')
                ELSE ''
             END
            ) ||

            (CASE
                WHEN n.arabic % 10 BETWEEN 1 AND 3 THEN REPEAT('I', n.arabic % 10)
                WHEN n.arabic % 10 = 4 THEN 'IV'
                WHEN n.arabic % 10 BETWEEN 5 AND 8 THEN 'V' || REPEAT('I', n.arabic % 10 - 5)
                WHEN n.arabic % 10 = 9 THEN REPEAT('I', 10 - n.arabic % 10) || 'X'
                ELSE ''
             END
            );
