Zapytanie:

```sql
SELECT s.nr_albumu, s.imie, s.nazwisko, ks.nazwa_kierunku
FROM dziekanat.studenci s
     NATURAL JOIN (dziekanat.studenci_kierunkow sk INNER JOIN dziekanat.kierunki_studiow ks ON
     sk.id_kierunku_studiow = ks.id_kierunku)
     NATURAL LEFT JOIN (dziekanat.oceny o INNER JOIN dziekanat.przedmioty p ON
     o.id_przedmiotu = p.id_przedmiotu AND p.nr_semestru = 1)
WHERE o.ocena IS NULL
```

Wnioski:

- NATURAL JOIN nie działa przy próbie połączenia studentów kierunków a kierunków studiów, ponieważ kolumna różni się nazwą: `id_kierunku` a `id_kierunku_studiow`.
- Gdy mimo wszystko dałem NATURAL JOIN, powstał iloczyn kartezjański i pojawiło się dużo duplikatów wierszy.
- NATURAL JOIN za mnie dołączył połączone sk i ks po numerze albumu, oraz NATURAL LEFT JOIN wrzucił za mnie połączony przedmiot z oceną. LEFT JOIN, żeby zostały NULL-e z ocen. Łączył po `nr_albumu` i `id_kierunku_studiow` naraz – w sumie łączył po numerze albumu i po kierunku studiów też, bo ta sama kolumna jest w sk.
