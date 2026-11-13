# Data Manipulation (DML) · T2/B — Odd Arabic and Roman numbers up to 999

> Course: SQL
> Date: 2026-11-11

[← Data Manipulation (DML)](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Zmodyfikuj kod SQL powyższego zadania, tak, aby tabela liczba uzupełniana była tylko wartościami nieparzystymi 1, 3, 5,... 999 oraz I, III, V,..., CMXCIX.

**.:: Operator MODULO ::.** W kryterium selekcji rekordów zapytania, do wyboru wartości nieparzystych można wykorzystać operator reszty z dzielenia MODULO (%):

```sql
SELECT *
FROM digit
WHERE arab % 2 = 1;
```

### 🇬🇧 Task description (EN)

Modify the SQL code of the previous task (T2/A) so that the table liczba (number) is filled only with the odd values 1, 3, 5, ... 999 and I, III, V, ..., CMXCIX.

**.:: The MODULO operator ::.** In the query's selection criterion, the remainder operator MODULO (%) can be used to pick odd values:

```sql
SELECT *
FROM digit
WHERE arab % 2 = 1;
```

## Files

| File           | Description |
| -------------- | ----------- |
| `setup.sql`    | Lecturer's script: `exploratory` schema, `number` table and the temporary `digit` table |
| `solution.sql` | Code filling `exploratory.number` with odd numbers |
