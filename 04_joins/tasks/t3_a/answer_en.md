Query:

```sql
SELECT s.nr_albumu, s.imie, s.nazwisko, p.nazwa_przedmiotu, o.data_zaliczenia, o.ocena
FROM dziekanat.studenci s
     NATURAL JOIN dziekanat.oceny o
     NATURAL JOIN dziekanat.przedmioty p
WHERE p.nr_semestru = 2
```

Conclusions:

- Using NATURAL JOINs is the shortest way to write it. You can't see right away what the tables are joined on, but it is more readable and clear.
- The result is the same.
- NATURAL JOIN works correctly when the tables share only the column names we really want to join on. If there are more of them, it joins on all of them and loses rows without any warning.
