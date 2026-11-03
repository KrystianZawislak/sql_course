Zapytanie:

```sql
SELECT s.nr_albumu, s.imie, s.nazwisko, w.wku
	FROM dziekanat.studenci s INNER JOIN dziekanat.wojsko w
	ON s.nr_albumu = w.nr_albumu
	WHERE w.wku <> 'WKU w Tarnowie'
	ORDER BY s.nr_albumu::integer;
```

Należy zastosować złączenie **wewnętrzne** (INNER JOIN) tabel `studenci` i `wojsko`.

Informację o WKU ma tylko student, który ma wpis w tabeli `wojsko`. Złączenie wewnętrzne zwraca wyłącznie studentów, dla których taki wpis istnieje, więc dokładnie tych, którzy przynależą do jakiegoś WKU. Pozostaje odfiltrować WKU w Tarnowie warunkiem `wku <> 'WKU w Tarnowie'`.

Złączenie zewnętrzne (LEFT JOIN) dołączyłoby także studentów bez wpisu w tabeli `wojsko`, z wartością NULL w kolumnie `wku`. Tacy studenci nie przynależą do żadnego WKU, więc nie powinni być brani pod uwagę. W tym zapytaniu i tak zostaliby odrzuceni, bo `NULL <> 'WKU w Tarnowie'` daje NULL, a nie TRUE, ale byłoby to przypadkowe – złączenie zewnętrzne nie oddaje sensu pytania.

Wynik: 4 studentów (WKU w Nowym Sączu, w Mielcu – 2 osoby, w Dębicy).
