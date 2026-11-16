Podzapytanie skorelowane odróżniamy po tym, że podzapytanie wewnętrzne odwołuje się do tabeli z zapytania zewnętrznego. Dlatego wykonuje się ono osobno dla każdego wiersza zapytania zewnętrznego. Jedno zapytanie może mieć w środku zarówno podzapytania skorelowane, jak i nieskorelowane.

## Podzapytania skorelowane

1. WKU studenta (T1) – podzapytanie odwołuje się do `s.nr_albumu`:

```sql
SELECT s.imie, s.nazwisko, s.pesel,
    (SELECT wku FROM dziekanat.wojsko w WHERE w.nr_albumu = s.nr_albumu) AS wku
    FROM dziekanat.studenci s
    WHERE s.nr_albumu = '15';
```

2. Studenci ze średnią wyższą od średniej uczelni (T1) – lewe podzapytanie jest skorelowane (`o.nr_albumu = s.nr_albumu`), a prawe nie, bo liczy jedną średnią dla całej uczelni. To przykład zapytania, które ma w środku oba rodzaje podzapytań:

```sql
SELECT s.nr_albumu AS album, s.imie, s.nazwisko
    FROM dziekanat.studenci s
    WHERE (SELECT AVG(o.ocena) FROM dziekanat.oceny o WHERE o.nr_albumu = s.nr_albumu) > (SELECT AVG(ocena) FROM dziekanat.oceny);
```

3. Studenci ze średnią wyższą niż 3.50 (T3):

```sql
SELECT nr_albumu AS "ALBUM", imie AS "IMIĘ", nazwisko AS "NAZWISKO"
    FROM dziekanat.studenci s
    WHERE (SELECT AVG(ocena) FROM dziekanat.oceny o WHERE s.nr_albumu = o.nr_albumu) > 3.50;
```

4. Studenci bez zapisów na fakultety (T4):

```sql
SELECT nr_albumu, imie, nazwisko
    FROM dziekanat.studenci s
    WHERE NOT EXISTS
          (SELECT * FROM dziekanat.zapisy z WHERE z.nr_albumu = s.nr_albumu);
```

5. Studenci, którzy podchodzili trzy razy do zaliczenia przedmiotu (T4) – odwołanie do `s` jest w klauzuli HAVING, a nie w WHERE:

```sql
SELECT nr_albumu AS "ALBUM", imie AS "IMIĘ", nazwisko AS "NAZWISKO"
    FROM dziekanat.studenci s
    WHERE EXISTS
          (SELECT nr_albumu, id_przedmiotu FROM dziekanat.oceny o GROUP BY nr_albumu, id_przedmiotu HAVING COUNT(ocena) = 3 AND o.nr_albumu = s.nr_albumu);
```

6. Student z największą liczbą zapisów (T5) – oba podzapytania są skorelowane; prawe używa operatora `<>`, a nie `=`, ale nadal odwołuje się do `s`:

```sql
SELECT nr_albumu, imie, nazwisko
    FROM dziekanat.studenci s
    WHERE (SELECT COUNT(*) FROM dziekanat.zapisy z WHERE z.nr_albumu = s.nr_albumu)
          >= ALL
          (SELECT COUNT(*) FROM dziekanat.zapisy z WHERE z.nr_albumu <> s.nr_albumu GROUP BY nr_albumu);
```

7. Adres korespondencyjny (T6) – oba poziomy są skorelowane: środkowe podzapytanie odwołuje się do `o`, a najgłębsze do `s`:

```sql
SELECT o.nr_albumu AS "Nr albumu", o.telefon_stacjonarny AS "Telefon stacjonarny", o.telefon_komorkowy AS "Telefon komorkowy", o.email AS "E-mail",
        (SELECT (SELECT a.ulica || ' ' || a.nr_domu || ', ' || a.kod_pocztowy || ' ' || a.miejscowosc
            FROM dziekanat.adresy a WHERE a.id_adresu = s.adres_korespondencyjny)
        FROM dziekanat.studenci s WHERE s.nr_albumu = o.nr_albumu) AS "Adres korespondencyjny"
    FROM dziekanat.osobiste o
    WHERE o.stopien_niepelnosprawnosci IS NOT NULL;
```

## Podzapytania nieskorelowane

Pozostałe przykłady nie odwołują się do tabeli z zapytania zewnętrznego, więc każde z nich wykonuje się raz i zwraca gotową listę albo tabelę:

- fakultety, na które nikt się nie zapisał – `NOT IN (SELECT id_fakultetu FROM dziekanat.zapisy)`;
- fakultety bez zapisów w ostatnich 5 latach – `NOT IN (SELECT id_fakultetu FROM dziekanat.zapisy WHERE data_czas_zapisu > …)`;
- studentki wyszukane na podstawie PESEL-u – podzapytanie w klauzuli FROM;
- studenci z kategorią wojskową B – `IN (SELECT nr_albumu FROM dziekanat.wojsko WHERE kategoria ILIKE 'B')`.

`id_fakultetu` przed `NOT IN` należy do zapytania zewnętrznego, a nie do podzapytania – o korelacji decyduje tylko to, co jest wewnątrz nawiasu.

## Test

Najlepszy test, czy podzapytanie jest skorelowane, to zaznaczenie i uruchomienie samego podzapytania. Jeżeli się wykona, jest nieskorelowane. Jeżeli pojawi się błąd `missing FROM-clause entry for table …`, to znaczy, że jest skorelowane, bo odwołuje się do tabeli z zapytania zewnętrznego. W zapytaniach wielopoziomowych każdy poziom trzeba sprawdzić osobno.
