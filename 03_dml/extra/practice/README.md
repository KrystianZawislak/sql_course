# Data Manipulation (DML) · Extra — Step-by-step DML practice

> Course: SQL
> Date: 2026-11-12

[← Data Manipulation (DML)](../../README.md)

> **Note:** these are additional, self-made practice exercises (prepared with Claude) to learn DML gradually before tasks T2/A and T2/B. They are **not** part of the lecturer's (T. Potempa) course materials.

## Task

### 🇵🇱 Treść zadania (PL)

> **Uwaga:** ćwiczenia dodatkowe, ułożone samodzielnie (z pomocą Claude) do stopniowej nauki DML przed zadaniami T2/A i T2/B. **Nie pochodzą** z materiałów prowadzącego (T. Potempa).

Najpierw uruchom [`setup.sql`](setup.sql) – tworzy tabele `exploratory.fruit`, `exploratory.number` oraz tymczasową tabelę `digit`. Po każdym ćwiczeniu sprawdź zawartość tabeli poleceniem `SELECT * FROM …`. Ćwiczenia korzystają z wyników poprzednich, więc wykonuj je po kolei.

### 🇬🇧 Task description (EN)

> **Note:** additional, self-made exercises (prepared with Claude) to learn DML gradually before tasks T2/A and T2/B. They are **not** from the lecturer's (T. Potempa) materials.

First run [`setup.sql`](setup.sql) – it creates the tables `exploratory.fruit`, `exploratory.number` and the temporary table `digit`. After every exercise, check the table contents with `SELECT * FROM …`. The exercises build on the previous ones, so do them in order.

## Exercises

### Part A – adding rows (`INSERT`)

| #   | Title | Status |
| --- | ----- | ------ |
| [1](ex_01/) | Insert one fruit | ✅ |
| [2](ex_02/) | Insert only some columns | ✅ |
| [3](ex_03/) | Insert three rows in one statement | ✅ |
| [4](ex_04/) | Duplicate primary key | ✅ |

### Part B – calculations in `SELECT`

| #   | Title | Status |
| --- | ----- | ------ |
| [5](ex_05/) | Calculated column: stock value | ✅ |
| [6](ex_06/) | Arithmetic on digits | ✅ |
| [7](ex_07/) | Even or odd with CASE | ✅ |
| [8](ex_08/) | Stars with REPEAT and concatenation | ✅ |

### Part C – changing and removing rows (`UPDATE`, `DELETE`)

| #   | Title | Status |
| --- | ----- | ------ |
| [9](ex_09/) | Raise all prices by 10% | ✅ |
| [10](ex_10/) | Fill in missing quantities | ✅ |
| [11](ex_11/) | Mark expensive fruits | ✅ |
| [12](ex_12/) | Delete rows | ✅ |

### Part D – generating numbers (warm-up before T2/A)

| #   | Title | Status |
| --- | ----- | ------ |
| [13](ex_13/) | CROSS JOIN of digit with itself | ✅ |
| [14](ex_14/) | Generate the numbers 10–19 | ✅ |
| [15](ex_15/) | INSERT … SELECT the numbers 1–9 | ✅ |
| [16](ex_16/) | Roman numerals 1–9 with UPDATE and CASE | ✅ |

## Files

| File        | Description |
| ----------- | ----------- |
| `setup.sql` | Practice tables: `exploratory.fruit`, `exploratory.number` and the temporary `digit` table |
| `ex_NN/`    | One folder per exercise: task (`README.md`) and `solution.sql` |
