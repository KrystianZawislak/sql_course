SQL (using PostgreSQL as an example) is a **strongly** and **statically** typed language.

## Terms

- **Strong / weak typing** – whether the language silently converts data of one type into another on its own. A weakly typed language guesses and converts (in JavaScript `"5" + 1` gives `"51"`). A strongly typed language does not guess: when types don't match, it raises an error, and the conversion has to be written explicitly.
- **Static / dynamic typing** – when the type is determined. With static typing the type is known before execution and does not change (an `integer` column always stores whole numbers). With dynamic typing the type is determined only at run time, and the same variable can hold a number once and text another time (in Python `x = 5`, then `x = "abc"`).

## Analysis of the examples

**`pg_typeof`** – every value has a definite type: `13` is `integer`, `3.14` is `numeric`, `FALSE` is `boolean`. `NULL` and all quoted strings have the type `unknown` – PostgreSQL does not guess that `'1878-12-21'` is a date or that `'100 zł'` is an amount of money. Such a constant waits without a type until the context says what it should be.

**`5 = '5'`, `46 < '5'` etc.** – these work, but this is not a forced type conversion. The constant `'5'` has no type yet (`unknown`), so it takes the type of the other side of the comparison, i.e. `integer`. The proof is `46 < '5'`, which gives FALSE: `'5'` became the number 5. If texts were compared, the result would be TRUE, because the character `'4'` comes before `'5'`.

**Coercion (`5 = text '5'` etc.)** – all queries end with the error `operator does not exist` (e.g. `integer = text`, `boolean = money`, `date > text`). Once a value has a fixed type, PostgreSQL will not silently convert it to another one – a feature of strong typing.

**Casting (`CAST`)** – all queries work, because the conversion is written explicitly. The `money` example shows there is no direct conversion from `money` to `boolean` – you have to go through intermediate types: `money` → `numeric` → `integer` → `boolean`.

**Tables `athlete` and `result`:**

- every column has a type declared in `CREATE TABLE` and cannot change it – static typing;
- the `INSERT` with the value `'99:99:99'` into an `interval` column ends with an error, because 99 minutes and 99 seconds is not a valid value of that type – the database will not accept data that doesn't match the type;
- `NATURAL JOIN` joins the tables on the common column `number`, which is `character varying(4)` in `athlete` and `integer` in `result`. The join ends with the error `operator does not exist: character varying = integer`, even though the values `'1'` and `1` look the same. The error appears before any row is processed – types are checked up front (static) and are not converted automatically (strong).

## Additional examples

Strong typing:

```sql
SELECT 1 + text '1';        -- error: operator does not exist: integer + text
SELECT length(123);         -- error: function length(integer) does not exist
SELECT 'abc'::integer;      -- error: invalid input syntax for type integer
SELECT '2026-02-30'::date;  -- error: date/time field value out of range
SELECT 32768::smallint;     -- error: smallint out of range
SELECT 1 + CAST(text '1' AS integer);  -- works: 2 (explicit cast)
```

Static typing:

```sql
CREATE TEMPORARY TABLE t (x integer);
INSERT INTO t VALUES ('abc');  -- error: column x only accepts integer
SELECT x + text '1' FROM t;    -- error, even though the table is empty – types are checked before execution
```

## Notes

- PostgreSQL silently performs only safe conversions that lose no information, e.g. `integer` → `numeric`: `SELECT 1 + 1.5` gives 2.5. This is widening a type, not guessing.
- How strict it is depends on the database system. In MySQL `SELECT 5 = '5abc'` is true (the text is truncated to the number 5), and SQLite lets you store text in an `INTEGER` column. PostgreSQL raises an error in both cases.

## Conclusion

SQL in PostgreSQL is **strongly typed**, because it does not silently convert values of one type into another – it requires an explicit cast (`CAST`) and rejects data that doesn't match the type. It is also **statically typed**, because the type of every column and every expression is fixed before the query is executed and does not change while it runs.
