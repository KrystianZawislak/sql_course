# Aggregates & Grouping · Problem task — #Cyclists — Task 2: Average weight, height and BMI

> Course: SQL
> Date: 2026-11-06

[← Problem task — #Cyclists](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Zadanie należy zrealizować z wykorzystaniem schematu bazy danych Cycling.

Zdefiniuj zapytania obliczjące średnią masę ciała, średni wzrost, średnie BMI:
- W grupie wszystkich zawodników;
- W grupach zdefiniowanych wg roku urodzenia zawodników;
- W grupach zdefiniowanych wg roku urodzenia zawodników oraz płci;

Każde z w/w zapytań powinno zwrócić 3 agregaty/wartości.

« Wskazówka » Odczytanie roku na podstawie daty kalendarzowej:

```sql
SELECT EXTRACT('year' FROM CURRENT_DATE);
```

### 🇬🇧 Task description (EN)

The task should be completed using the Cycling database schema.

Define queries calculating the average body weight, average height and average BMI:
- Across all athletes;
- In groups defined by the athletes' year of birth;
- In groups defined by the athletes' year of birth and sex;

Each of the above queries should return 3 aggregates/values.

« Hint » Reading the year from a calendar date:

```sql
SELECT EXTRACT('year' FROM CURRENT_DATE);
```

## Files

| File           | Description |
| -------------- | ----------- |
| `solution.sql` | Query on the `cycling` schema |
