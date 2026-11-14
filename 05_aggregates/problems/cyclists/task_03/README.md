# Aggregates & Grouping · Problem task — #Cyclists — Task 3: Averages with group filtering

> Course: SQL
> Date: 2026-11-06

[← Problem task — #Cyclists](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Zadanie należy zrealizować z wykorzystaniem schematu bazy danych Cycling.

Zdefiniuj zapytania obliczjące średnią masę ciała, średni wzrost, średnie BMI:
- W grupach zdefiniowanych wg roku urodzenia zawodników wraz z selekcjonowaniem tych grup, dla których BMI ≥ 20;
- W grupach zdefiniowanych wg roku urodzenia zawodników, biorąc pod uwagę tylko juniorów tj. zawodników którzy w bieżącym sezonie rocznikowo mają nie więcej niż 21 lat.

Każde z w/w zapytań powinno zwrócić 3 agregaty/wartości.

### 🇬🇧 Task description (EN)

The task should be completed using the Cycling database schema.

Define queries calculating the average body weight, average height and average BMI:
- In groups defined by the athletes' year of birth, selecting only the groups with BMI ≥ 20;
- In groups defined by the athletes' year of birth, taking only juniors into account, i.e. athletes who are at most 21 by year of birth in the current season.

Each of the above queries should return 3 aggregates/values.

## Files

| File           | Description |
| -------------- | ----------- |
| `solution.sql` | Query on the `cycling` schema |
