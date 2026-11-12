# Data Manipulation (DML) · Extra — Step-by-step DML practice

> Course: SQL
> Date: 2026-11-12

[← Data Manipulation (DML)](../README.md)

> **Note:** these are additional, self-made practice exercises (prepared with Claude) to learn DML gradually before tasks T2/A and T2/B. They are **not** part of the lecturer's (T. Potempa) course materials.

## Task

### 🇵🇱 Treść zadania (PL)

> **Uwaga:** ćwiczenia dodatkowe, ułożone samodzielnie (z pomocą Claude) do stopniowej nauki DML przed zadaniami T2/A i T2/B. **Nie pochodzą** z materiałów prowadzącego (T. Potempa).

Najpierw uruchom [`setup.sql`](setup.sql) – tworzy tabele `exploratory.fruit`, `exploratory.number` oraz tymczasową tabelę `digit`. Po każdym ćwiczeniu sprawdź zawartość tabeli poleceniem `SELECT * FROM …`.

**Część A – dodawanie wierszy (`INSERT`)**

1. Dodaj do tabeli `exploratory.fruit` jeden owoc: id `1`, nazwa `'apple'`, cena `2.50`, ilość `10`.
2. Dodaj owoc, podając **tylko** id i nazwę: `2`, `'pear'`. Co znajduje się w kolumnach `price` i `quantity`?
3. Dodaj **jednym poleceniem** trzy owoce: `(3, 'banana', 4.20, 6)`, `(4, 'prune', 1.10, 25)`, `(5, 'kiwi', 1.80, NULL)`.
4. Spróbuj dodać jeszcze raz owoc o id `1`. Jaki błąd dostajesz i dlaczego? Odpowiedz w komentarzu.

**Część B – wyliczenia w `SELECT`**

5. Wyświetl nazwę owocu oraz wartość towaru (cena × ilość) jako kolumnę `value`. Co wyszło dla gruszki i kiwi i dlaczego?
6. Z tabeli `digit` wyświetl dla cyfr 0–9: `arab`, `arab * 10`, `arab % 2`, `arab / 3`. Sprawdź, czy rozumiesz każdą kolumnę.
7. Z tabeli `digit` wyświetl cyfry 0–9, a obok tekst `'even'` (parzysta) albo `'odd'` (nieparzysta) (użyj `CASE` i `%`).
8. Z tabeli `digit` wyświetl cyfry 1–5, a obok tyle gwiazdek `*`, ile wynosi cyfra (`REPEAT`). Następnie doklej przed gwiazdkami tekst `'digit: '` (`||`).

**Część C – zmiana i usuwanie wierszy (`UPDATE`, `DELETE`)**

9. Podnieś cenę **wszystkich** owoców o 10%.
10. Ustaw ilość `0` **tylko** tym owocom, które nie mają podanej ilości.
11. Owocom kosztującym więcej niż 3 zł dopisz do nazwy tekst `' (expensive)'`.
12. Usuń owoce, których ilość wynosi `0`. Następnie usuń wszystkie pozostałe owoce i sprawdź, że tabela jest pusta.

**Część D – generowanie liczb (rozgrzewka przed T2/A)**

13. Połącz tabelę `digit` samą ze sobą (`CROSS JOIN`, aliasy `d` i `j`) i wyświetl wszystkie pary dla cyfr 0–2 w obu kopiach. Ile wierszy wychodzi i dlaczego?
14. Na tej podstawie wygeneruj liczby od 10 do 19, licząc `d.arab * 10 + j.arab`.
15. Wstaw do `exploratory.number` (tylko kolumna `arabic`) liczby 1–9, używając `INSERT … SELECT` z tabeli `digit`.
16. Uzupełnij kolumnę `roman` w `exploratory.number` dla liczb 1–9 jednym poleceniem `UPDATE` z `CASE`, korzystając z liter I, V, X.

### 🇬🇧 Task description (EN)

> **Note:** additional, self-made exercises (prepared with Claude) to learn DML gradually before tasks T2/A and T2/B. They are **not** from the lecturer's (T. Potempa) materials.

First run [`setup.sql`](setup.sql) – it creates the tables `exploratory.fruit`, `exploratory.number` and the temporary table `digit`. After every exercise, check the table contents with `SELECT * FROM …`.

**Part A – adding rows (`INSERT`)**

1. Add one fruit to `exploratory.fruit`: id `1`, name `'apple'`, price `2.50`, quantity `10`.
2. Add a fruit giving **only** the id and name: `2`, `'pear'`. What is in the `price` and `quantity` columns?
3. Add three fruits **in one statement**: `(3, 'banana', 4.20, 6)`, `(4, 'prune', 1.10, 25)`, `(5, 'kiwi', 1.80, NULL)`.
4. Try to add the fruit with id `1` again. What error do you get and why? Answer in a comment.

**Part B – calculations in `SELECT`**

5. Show the fruit name and the stock value (price × quantity) as a column `value`. What do you get for the pear and the kiwi, and why?
6. From `digit`, show for the digits 0–9: `arab`, `arab * 10`, `arab % 2`, `arab / 3`. Make sure you understand every column.
7. From `digit`, show the digits 0–9 with the text `'even'` or `'odd'` next to them (use `CASE` and `%`).
8. From `digit`, show the digits 1–5 with as many `*` stars as the digit's value (`REPEAT`). Then put the text `'digit: '` in front of the stars (`||`).

**Part C – changing and removing rows (`UPDATE`, `DELETE`)**

9. Raise the price of **all** fruits by 10%.
10. Set the quantity to `0` **only** for fruits with no quantity given.
11. Append the text `' (expensive)'` to the name of fruits that cost more than 3 zł.
12. Delete the fruits whose quantity is `0`. Then delete all the remaining fruits and check that the table is empty.

**Part D – generating numbers (warm-up before T2/A)**

13. Join `digit` with itself (`CROSS JOIN`, aliases `d` and `j`) and show all pairs for the digits 0–2 in both copies. How many rows do you get and why?
14. Based on that, generate the numbers 10 to 19 by calculating `d.arab * 10 + j.arab`.
15. Insert the numbers 1–9 into `exploratory.number` (only the `arabic` column) using `INSERT … SELECT` from `digit`.
16. Fill the `roman` column of `exploratory.number` for the numbers 1–9 with a single `UPDATE` with `CASE`, using the letters I, V, X.

## Files

| File           | Description |
| -------------- | ----------- |
| `setup.sql`    | Practice tables: `exploratory.fruit`, `exploratory.number` and the temporary `digit` table |
| `solution.sql` | Solutions of the exercises |
