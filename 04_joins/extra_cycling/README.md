# Joins · Extra — Problem task #Cycling (T2/D/0 – T2/D/3)

> Course: SQL
> Date: 2026-11-03

[← Joins](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

W schemacie cycling:

- **T2/D/0** – utwórz zapytanie klasyfikujące zawodników do określonych kategorii na podstawie obliczonego BMI. W rozwiązaniu wykorzystaj dodatkową tymczasową tabelę bmi z kategoriami (zob. [`setup.sql`](setup.sql)).
- **T2/D/1** – Wyszukaj informacje o zawodnikach którzy brali udział w jakichkolwiek zawodach. W przypadku, gdy zawodnik brał udział w wielu zawodach powinien w wyniku pojawić się wielokrotnie. W rezultacie należy uwzględnić informacje o zawodniku, zespole, zawodach oraz uzyskanym wyniku w postaci athlete_id, first_name, last_name, team_name, competition_name, rank. Przekształć zapytanie z w/w zadania do postaci wykorzystującej złączenia naturalne.
- **T2/D/2** – Utwórz klasyfikację zawodników wg następujących reguł: 1 miejsce = 100 pkt, 2 miejsce = 75 pkt, 3 miejsce = 50 pkt. W rezultacie należy uwzględnić informacje o zawodniku, zespole oraz łącznej liczbie punktów w postaci athlete_id, first_name, last_name, team_name, point. Przekształć zapytanie z w/w zadania tak, aby w klasyfikacja uwzlędniała także zawodników którzy w dotychczasowych zawodach nie uzyskali żadnych punktów.
- **T2/D/3** (w oryginale drugi raz „T2/D/2”) – Wyszukaj informacje o zawodnikach którzy nie brali udziału w żadnych zawodach.

### 🇬🇧 Task description (EN)

In the `cycling` schema:

- **T2/D/0** – create a query that classifies athletes into categories based on their calculated BMI. In the solution, use an additional temporary table `bmi` with the categories (see [`setup.sql`](setup.sql)).
- **T2/D/1** – Find information about the athletes who took part in any competition. If an athlete took part in many competitions, they should appear in the result many times. The result should include information about the athlete, team, competition and the result achieved, as athlete_id, first_name, last_name, team_name, competition_name, rank. Rewrite the query to use natural joins.
- **T2/D/2** – Create a classification of athletes using the rules: 1st place = 100 pts, 2nd place = 75 pts, 3rd place = 50 pts. The result should include information about the athlete, team and total points, as athlete_id, first_name, last_name, team_name, point. Rewrite the query so that the classification also includes athletes who have not scored any points in the competitions so far.
- **T2/D/3** (labelled "T2/D/2" a second time in the original) – Find information about the athletes who did not take part in any competition.

## Files

| File           | Description                                                                 |
| -------------- | --------------------------------------------------------------------------- |
| `setup.sql`    | Lecturer's `cycling` schema (Cycling 5.00) + temporary `bmi` table (T2/D/0) |
| `solution.sql` | T2/D/0 – T2/D/3 queries on the `cycling` schema                             |
