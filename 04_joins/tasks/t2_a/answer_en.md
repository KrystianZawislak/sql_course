Query:

```sql
SELECT s.nr_albumu, s.imie, s.nazwisko, w.wku
	FROM dziekanat.studenci s INNER JOIN dziekanat.wojsko w
	ON s.nr_albumu = w.nr_albumu
	WHERE w.wku <> 'WKU w Tarnowie'
	ORDER BY s.nr_albumu::integer;
```

An **inner** join (INNER JOIN) of the `studenci` and `wojsko` tables should be used.

Only a student who has a row in the `wojsko` table has WKU information. An inner join returns only the students for whom such a row exists, so exactly those who belong to some WKU. What remains is to filter out the WKU in Tarnów with the condition `wku <> 'WKU w Tarnowie'`.

An outer join (LEFT JOIN) would also include students without a row in `wojsko`, with NULL in the `wku` column. Such students don't belong to any WKU, so they shouldn't be considered. In this query they would be rejected anyway, because `NULL <> 'WKU w Tarnowie'` gives NULL, not TRUE, but that would be accidental – an outer join does not reflect the meaning of the question.

Result: 4 students (WKU in Nowy Sącz, in Mielec – 2 people, in Dębica).
