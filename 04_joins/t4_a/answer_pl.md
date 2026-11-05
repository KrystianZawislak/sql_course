Zapytanie:

```sql
SELECT count(*)
FROM dziekanat.oceny CROSS JOIN dziekanat.przedmioty CROSS JOIN kadry.prowadzacy
```

Liczba rekordów: prowadzacy – 55, przedmioty – 37, oceny – 189.

Iloczyn rekordów z każdej tabeli zwróci nam ilość rekordów złączenia krzyżowego według trzech tabel. Wynik to 384615 = 55 * 37 * 189.
