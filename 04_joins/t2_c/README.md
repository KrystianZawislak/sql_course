# Joins · T2/C — Computer Science students without a semester I grade

> Course: SQL
> Date: 2026-11-03

[← Joins](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Wykorzystując złączenia wewnętrzne/zewnętrzne określ kwerendę pozwalającą wyświetlić studentów kierunku Informatyka którzy w semestrze I nie uzyskali żadnej oceny. Spośród wszystkich kolumn wybierz Nr albumu, Imię, Nazwisko oraz Kierunek studiów.

### 🇬🇧 Task description (EN)

Using inner/outer joins, define a query that displays the Computer Science (Informatyka) students who did not receive any grade in semester I. Of all columns, select Album number, First name, Last name and Course of study.

## Files

| File           | Description                                            |
| -------------- | ------------------------------------------------------ |
| `solution.sql` | Left join to semester I grades + `IS NULL` (anti-join) |
