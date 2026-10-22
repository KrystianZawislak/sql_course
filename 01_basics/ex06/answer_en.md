NOT a IS NULL is equivalent to the condition a IS NOT NULL, because for the query:

SELECT a, NOT a IS NULL as "NOT A IS NULL", a IS NOT NULL as "A IS NOT NULL"
FROM (VALUES(TRUE), (FALSE), (NULL)) as t(a)

they return the same thing.

This is because IS NULL is evaluated before NOT, so NOT a IS NULL is the negation (a IS NULL), and the IS NULL condition always returns TRUE or FALSE, never NULL.
