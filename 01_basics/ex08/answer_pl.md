SQL (na przykładzie PostgreSQL) jest językiem **silnie** i **statycznie** typowanym.

## Pojęcia

- **Typowanie silne / słabe** – czy język sam, po cichu zamienia dane jednego typu na inny. Język słabo typowany zgaduje i zamienia (w JavaScript `"5" + 1` daje `"51"`). Język silnie typowany nie zgaduje: gdy typy nie pasują, zgłasza błąd, a zamianę trzeba zapisać jawnie.
- **Typowanie statyczne / dynamiczne** – kiedy typ jest ustalony. Przy typowaniu statycznym typ jest znany przed wykonaniem i się nie zmienia (kolumna `integer` zawsze przechowuje liczby całkowite). Przy typowaniu dynamicznym typ ustala się dopiero w trakcie działania, a ta sama zmienna może raz przechowywać liczbę, a raz tekst (w Pythonie `x = 5`, potem `x = "abc"`).

## Analiza przykładów

**`pg_typeof`** – każda wartość ma określony typ: `13` to `integer`, `3.14` to `numeric`, `FALSE` to `boolean`. `NULL` i wszystkie teksty w apostrofach mają typ `unknown` – PostgreSQL nie zgaduje, że `'1878-12-21'` to data, a `'100 zł'` to kwota. Taka stała czeka bez typu, aż kontekst powie, czym ma być.

**`5 = '5'`, `46 < '5'` itd.** – działają, ale nie jest to zamiana typów na siłę. Stała `'5'` nie ma jeszcze typu (`unknown`), więc przyjmuje typ drugiej strony porównania, czyli `integer`. Dowodem jest `46 < '5'`, które daje FALSE: `'5'` stało się liczbą 5. Gdyby porównywano teksty, wynik byłby TRUE, bo znak `'4'` jest przed `'5'`.

**Koersja (`5 = text '5'` itd.)** – wszystkie zapytania kończą się błędem `operator does not exist` (np. `integer = text`, `boolean = money`, `date > text`). Gdy wartość ma już ustalony typ, PostgreSQL nie zamieni go po cichu na inny – to cecha typowania silnego.

**Rzutowanie (`CAST`)** – wszystkie zapytania działają, bo konwersja jest zapisana jawnie. Przykład z `money` pokazuje, że nie ma bezpośredniej zamiany `money` na `boolean` – trzeba przejść przez kolejne typy: `money` → `numeric` → `integer` → `boolean`.

**Tabele `athlete` i `result`:**

- każda kolumna ma typ zadeklarowany w `CREATE TABLE` i nie może go zmienić – typowanie statyczne;
- `INSERT` z wartością `'99:99:99'` do kolumny typu `interval` kończy się błędem, bo 99 minut i 99 sekund nie jest poprawną wartością tego typu – baza nie przyjmie danych niezgodnych z typem;
- `NATURAL JOIN` łączy tabele po wspólnej kolumnie `number`, która w `athlete` jest typu `character varying(4)`, a w `result` typu `integer`. Złączenie kończy się błędem `operator does not exist: character varying = integer`, choć wartości `'1'` i `1` wyglądają tak samo. Błąd pojawia się, zanim zostanie przetworzony jakikolwiek wiersz – typy są sprawdzane z góry (statyczne) i nie są zamieniane automatycznie (silne).

## Dodatkowe przykłady

Typowanie silne:

```sql
SELECT 1 + text '1';        -- błąd: operator does not exist: integer + text
SELECT length(123);         -- błąd: function length(integer) does not exist
SELECT 'abc'::integer;      -- błąd: invalid input syntax for type integer
SELECT '2026-02-30'::date;  -- błąd: date/time field value out of range
SELECT 32768::smallint;     -- błąd: smallint out of range
SELECT 1 + CAST(text '1' AS integer);  -- działa: 2 (jawne rzutowanie)
```

Typowanie statyczne:

```sql
CREATE TEMPORARY TABLE t (x integer);
INSERT INTO t VALUES ('abc');  -- błąd: kolumna x przyjmuje tylko integer
SELECT x + text '1' FROM t;    -- błąd, choć tabela jest pusta – typy są sprawdzane przed wykonaniem
```

## Uwagi

- PostgreSQL wykonuje po cichu tylko bezpieczne konwersje, które nie gubią informacji, np. `integer` → `numeric`: `SELECT 1 + 1.5` daje 2.5. To rozszerzenie typu, a nie zgadywanie.
- Stopień ścisłości zależy od systemu bazodanowego. W MySQL `SELECT 5 = '5abc'` daje prawdę (tekst jest obcinany do liczby 5), a SQLite pozwala zapisać tekst w kolumnie `INTEGER`. PostgreSQL w obu przypadkach zgłasza błąd.

## Wniosek

SQL w PostgreSQL jest językiem **silnie typowanym**, bo nie zamienia po cichu wartości jednego typu na inny – wymaga jawnego rzutowania (`CAST`), a dane niezgodne z typem odrzuca. Jest też językiem **statycznie typowanym**, bo typ każdej kolumny i każdego wyrażenia jest ustalony przed wykonaniem zapytania i nie zmienia się w trakcie.
