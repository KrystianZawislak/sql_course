A correlated subquery is recognised by the fact that the inner subquery refers to a table from the outer query. That is why it runs separately for every row of the outer query. One query can contain both correlated and non-correlated subqueries.

## Correlated subqueries

1. A student's WKU (T1) – the subquery refers to `s.nr_albumu`:

```sql
SELECT s.imie, s.nazwisko, s.pesel,
    (SELECT wku FROM dziekanat.wojsko w WHERE w.nr_albumu = s.nr_albumu) AS wku
    FROM dziekanat.studenci s
    WHERE s.nr_albumu = '15';
```

2. Students with an average higher than the university average (T1) – the left subquery is correlated (`o.nr_albumu = s.nr_albumu`), the right one is not, because it calculates one average for the whole university. This is an example of a query that contains both kinds of subqueries:

```sql
SELECT s.nr_albumu AS album, s.imie, s.nazwisko
    FROM dziekanat.studenci s
    WHERE (SELECT AVG(o.ocena) FROM dziekanat.oceny o WHERE o.nr_albumu = s.nr_albumu) > (SELECT AVG(ocena) FROM dziekanat.oceny);
```

3. Students with an average higher than 3.50 (T3):

```sql
SELECT nr_albumu AS "ALBUM", imie AS "IMIĘ", nazwisko AS "NAZWISKO"
    FROM dziekanat.studenci s
    WHERE (SELECT AVG(ocena) FROM dziekanat.oceny o WHERE s.nr_albumu = o.nr_albumu) > 3.50;
```

4. Students without any elective enrollment (T4):

```sql
SELECT nr_albumu, imie, nazwisko
    FROM dziekanat.studenci s
    WHERE NOT EXISTS
          (SELECT * FROM dziekanat.zapisy z WHERE z.nr_albumu = s.nr_albumu);
```

5. Students who took a subject's exam three times (T4) – the reference to `s` is in the HAVING clause, not in WHERE:

```sql
SELECT nr_albumu AS "ALBUM", imie AS "IMIĘ", nazwisko AS "NAZWISKO"
    FROM dziekanat.studenci s
    WHERE EXISTS
          (SELECT nr_albumu, id_przedmiotu FROM dziekanat.oceny o GROUP BY nr_albumu, id_przedmiotu HAVING COUNT(ocena) = 3 AND o.nr_albumu = s.nr_albumu);
```

6. The student with the most enrollments (T5) – both subqueries are correlated; the right one uses the `<>` operator, not `=`, but it still refers to `s`:

```sql
SELECT nr_albumu, imie, nazwisko
    FROM dziekanat.studenci s
    WHERE (SELECT COUNT(*) FROM dziekanat.zapisy z WHERE z.nr_albumu = s.nr_albumu)
          >= ALL
          (SELECT COUNT(*) FROM dziekanat.zapisy z WHERE z.nr_albumu <> s.nr_albumu GROUP BY nr_albumu);
```

7. Correspondence address (T6) – both levels are correlated: the middle subquery refers to `o`, the innermost one to `s`:

```sql
SELECT o.nr_albumu AS "Nr albumu", o.telefon_stacjonarny AS "Telefon stacjonarny", o.telefon_komorkowy AS "Telefon komorkowy", o.email AS "E-mail",
        (SELECT (SELECT a.ulica || ' ' || a.nr_domu || ', ' || a.kod_pocztowy || ' ' || a.miejscowosc
            FROM dziekanat.adresy a WHERE a.id_adresu = s.adres_korespondencyjny)
        FROM dziekanat.studenci s WHERE s.nr_albumu = o.nr_albumu) AS "Adres korespondencyjny"
    FROM dziekanat.osobiste o
    WHERE o.stopien_niepelnosprawnosci IS NOT NULL;
```

## Non-correlated subqueries

The remaining examples do not refer to a table from the outer query, so each of them runs once and returns a ready list or table:

- electives nobody signed up for – `NOT IN (SELECT id_fakultetu FROM dziekanat.zapisy)`;
- electives without enrollments in the last 5 years – `NOT IN (SELECT id_fakultetu FROM dziekanat.zapisy WHERE data_czas_zapisu > …)`;
- female students found by their PESEL – a subquery in the FROM clause;
- students with military category B – `IN (SELECT nr_albumu FROM dziekanat.wojsko WHERE kategoria ILIKE 'B')`.

`id_fakultetu` before `NOT IN` belongs to the outer query, not to the subquery – only what is inside the parentheses decides about correlation.

## Test

The best test of whether a subquery is correlated is to select and run the subquery on its own. If it runs, it is non-correlated. If you get the error `missing FROM-clause entry for table …`, it is correlated, because it refers to a table from the outer query. In multi-level queries every level has to be checked separately.
