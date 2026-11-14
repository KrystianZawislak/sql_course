# Subqueries · Problem task — #cycling — Task 2.1: Athletes younger than the average age

> Course: SQL
> Date: 2026-11-13

[← Problem task — #cycling](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Zadania należy zrealizować z wykorzystaniem schematu bazy danych Cycling.

Oblicz liczbę zawodników, młodszych niż średni wiek wszystkich zawodników.

« Wskazówka » Obliczanie wieku osoby urodzonej w dniu 1918-11-11:

```sql
SELECT age('1918-11-11'::date);
```

### 🇬🇧 Task description (EN)

The tasks are to be done on the Cycling database schema.

Count the athletes younger than the average age of all athletes.

« Hint » Calculating the age of a person born on 1918-11-11:

```sql
SELECT age('1918-11-11'::date);
```

## Files

| File           | Description |
| -------------- | ----------- |
| `solution.sql` | Query on the `cycling` schema |
