Zapytanie:

```sql
SELECT s.nr_albumu, s.imie, s.nazwisko, p.nazwa_przedmiotu, o.data_zaliczenia, o.ocena
FROM dziekanat.studenci s
     NATURAL JOIN dziekanat.oceny o
     NATURAL JOIN dziekanat.przedmioty p
WHERE p.nr_semestru = 2
```

Wnioski:

- Najkrótszym zapisem jest użycie NATURAL JOIN-ów. Nie widać od razu, po czym tabele się łączą, ale jest to czytelniejsze i przejrzyste.
- Wynik jest taki sam.
- NATURAL JOIN działa poprawnie, gdy tabele mają tylko te wspólne nazwy kolumn, po których naprawdę chcemy łączyć. Jeśli jest ich więcej, to łączy po wszystkich i gubi wiersze bez ostrzeżenia.
