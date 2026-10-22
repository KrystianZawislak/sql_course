NOT a IS NULL jest równoważny warunkowi a IS NOT NULL, ponieważ dla zapytania:

SELECT a, NOT a IS NULL as "NOT A IS NULL", a IS NOT NULL as "A IS NOT NULL"
FROM (VALUES(TRUE), (FALSE), (NULL)) as t(a)

zwracają to samo.

Wynika to z tego, że IS NULL wykonuje się przed NOT, więc NOT a IS NULL to negacja (a IS NULL), a warunek IS NULL zawsze zwraca TRUE albo FALSE, nigdy NULL.