Query:

```sql
SELECT count(*)
FROM dziekanat.oceny CROSS JOIN dziekanat.przedmioty CROSS JOIN kadry.prowadzacy
```

Number of records: prowadzacy – 55, przedmioty – 37, oceny – 189.

The product of the records from each table gives us the number of records of the cross join of the three tables. The result is 384615 = 55 * 37 * 189.
