# Data Manipulation (DML) · T2/A — Arabic and Roman numbers from 1 to 30

> Course: SQL
> Date: 2026-11-11

[← Data Manipulation (DML)](../../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Skonstruuj kod SQL, który pozwoli uzupełnić tabelę liczba wartościami od 1 do 30 tj. liczbami w systemie arabskim oraz wartościami od I do XXX tj. liczbami w systemie rzymskim. Wartości powinny być dodane w porządku rosnącym. Najlepiej rozpocząć od uzupełnienia tabeli liczba wartościami w systemie arabskim.

**.:: Uzupełnienie tabeli wartościami o określonym porządku ::.**

- Utwórzmy warunkowo schemat `exploratory`.
- Załóżmy, że dana jest tabela `number` o następującym schemacie tj. strukturze – zob. [`setup.sql`](setup.sql).
- Aby wygenerować ciąg wartości tworzymy dodatkową tabelę `digit` (wariant uproszczony / łatwy lub klasyczny / trudny).
- Następnie uzupełniamy tabelę `digit` wartościami cyfr (wariant uproszczony / łatwy lub klasyczny / trudny).
- W kolejnym kroku uzupełniamy tabelę `number`. W jaki sposób?

\*) Klauzula TEMPORARY w definicji tabeli oznacza, że obiekt jest tabelą tymczasową, w związku z tym będzie istnieć tylko w obrębie aktualnej sesji a po zakończeniu zostanie usunięty.

### 🇬🇧 Task description (EN)

Write SQL code that fills the table liczba (number) with the values 1 to 30, i.e. Arabic numerals, and the values I to XXX, i.e. Roman numerals. The values should be added in ascending order. It is best to start by filling the table with the Arabic numerals.

**.:: Filling a table with values in a given order ::.**

- Conditionally create the `exploratory` schema.
- Assume there is a table `number` with the following schema, i.e. structure – see [`setup.sql`](setup.sql).
- To generate a sequence of values, create an auxiliary table `digit` (simple / easy or classic / hard variant).
- Then fill the `digit` table with the digit values (simple / easy or classic / hard variant).
- In the next step, fill the `number` table. How?

\*) The TEMPORARY clause in a table definition means the object is a temporary table, so it exists only within the current session and is dropped when the session ends.

## Files

| File           | Description |
| -------------- | ----------- |
| `setup.sql`    | Lecturer's script: `exploratory` schema, `number` table and the temporary `digit` table |
| `solution.sql` | Code filling `exploratory.number` |
