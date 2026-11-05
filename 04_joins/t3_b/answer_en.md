Query:

```sql
SELECT s.nr_albumu, s.imie, s.nazwisko, ks.nazwa_kierunku
FROM dziekanat.studenci s
     NATURAL JOIN (dziekanat.studenci_kierunkow sk INNER JOIN dziekanat.kierunki_studiow ks ON
     sk.id_kierunku_studiow = ks.id_kierunku)
     NATURAL LEFT JOIN (dziekanat.oceny o INNER JOIN dziekanat.przedmioty p ON
     o.id_przedmiotu = p.id_przedmiotu AND p.nr_semestru = 1)
WHERE o.ocena IS NULL
```

Conclusions:

- NATURAL JOIN doesn't work when trying to join studenci_kierunkow with kierunki_studiow, because the column has a different name: `id_kierunku` vs `id_kierunku_studiow`.
- When I used NATURAL JOIN anyway, a Cartesian product was created and a lot of duplicate rows appeared.
- NATURAL JOIN joined the combined sk and ks for me on the album number, and NATURAL LEFT JOIN attached the combined subject and grade for me. LEFT JOIN, so that the NULLs from the grades stay. It joined on `nr_albumu` and `id_kierunku_studiow` at once – it actually joined on the album number and on the field of study too, because the same column is in sk.
