# Aggregates & Grouping · Problem task — #Cyclists

> Course: SQL
> Date: 2026-11-06

[← Aggregates & Grouping](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Literatura i odniesienia: UCI : Regulations; Wikipedia : Z-SCORE.

Zadania należy zrealizować z wykorzystaniem schematu bazy danych Cycling.

1. Zdefiniuj zapytanie opisujące zbiór danych `cycling.athlete` obliczając n/w agregaty:
   - Łączną liczbę zawodników;
   - Liczbę zawodników, dla których brak informacji o wzroście;
   - Liczbę zawodników, dla których brak informacji o masie ciała;
   - Liczbę zawodników, dla których brak informacji o wzroście lub masie ciała;
   - Liczbę zawodników, dla których brak informacji o wzroście i masie ciała.

   Pojedyncze zapytanie powinno zwrócić 4 agregaty/wartości.
2. Zdefiniuj zapytania obliczjące średnią masę ciała, średni wzrost, średnie BMI:
   - W grupie wszystkich zawodników;
   - W grupach zdefiniowanych wg roku urodzenia zawodników;
   - W grupach zdefiniowanych wg roku urodzenia zawodników oraz płci;

   Każde z w/w zapytań powinno zwrócić 3 agregaty/wartości.

   « Wskazówka » Odczytanie roku na podstawie daty kalendarzowej:

   ```sql
   SELECT EXTRACT('year' FROM CURRENT_DATE);
   ```
3. Zdefiniuj zapytania obliczjące średnią masę ciała, średni wzrost, średnie BMI:
   - W grupach zdefiniowanych wg roku urodzenia zawodników wraz z selekcjonowaniem tych grup, dla których BMI ≥ 20;
   - W grupach zdefiniowanych wg roku urodzenia zawodników, biorąc pod uwagę tylko juniorów tj. zawodników którzy w bieżącym sezonie rocznikowo mają nie więcej niż 21 lat.

   Każde z w/w zapytań powinno zwrócić 3 agregaty/wartości.
4. Oblicz wskaźnik Z-SCORE dla BMI każdego zawodnika w odniesieniu do BMI zespołu, do którego zawodnik należy. Nadaj intepretację otrzymanym rezultatom.
5. Oblicz liczbę zespołów, które nie posiadają zakontraktowanego żadnego zawodnika tj. liczba zawodników w zespole wynosi 0.
6. Dla każdego zespołu oblicz łączną liczbę zawodników, liczbę kobiet oraz liczbę mężczyzn.

   « Wskazówka » Obliczenie liczby zespołów w poszczególnych kategoriach UCI:

   ```sql
   SELECT
       COUNT(*) AS team_count,
       COUNT(*) FILTER (WHERE team_uci_category = 'UCI WorldTeams') AS world_team_count,
       COUNT(*) FILTER (WHERE team_uci_category = 'UCI Women''s WorldTeam') AS womens_world_team_count,
       COUNT(*) FILTER (WHERE team_uci_category NOT IN ('UCI WorldTeams', 'UCI Women''s WorldTeam')) AS other_team_count
   FROM cycling.team;
   ```
7. Dla etapu 20 Tour de France '24, dla oblicz stratę czasową każdego zawodnika do zwycięzcy etapu. Rezultaty etapu znajdują się w tabeli `cycling.result`.

   Zestawienie strata czasowych etapu 20 Tour de France '24: Tadej Pogačar (0:00); Jonas Vingegaard (+0:07); Richard Carapaz (+0:23); Remco Evenepoel (+0:53); Enric Mas (+1:07); João Almeida (+1:28); Matteo Jorgenson (+1:33); Mikel Landa (+1:41); Adam Yates (+1:43); Romain Bardet (+1:52).
8. Sponsor UAE Team Emirates chce dowiedzieć się, czy drużyna dominowała w sezonie 2024 nad drużyną Team Visma. Zdefiniuj trzy różne metryki, aby udowodnić lub zaprzeczyć tej tezie. Zdefiniuj zapytania i wyjaśnij, dlaczego jedna metryka może być myląca.

### 🇬🇧 Task description (EN)

References: UCI : Regulations; Wikipedia : Z-SCORE.

The tasks should be completed using the Cycling database schema.

1. Define a query describing the `cycling.athlete` data set by calculating the following aggregates:
   - The total number of athletes;
   - The number of athletes with no height information;
   - The number of athletes with no body weight information;
   - The number of athletes with no height or body weight information;
   - The number of athletes with no height and body weight information.

   A single query should return 4 aggregates/values.
2. Define queries calculating the average body weight, average height and average BMI:
   - Across all athletes;
   - In groups defined by the athletes' year of birth;
   - In groups defined by the athletes' year of birth and sex;

   Each of the above queries should return 3 aggregates/values.

   « Hint » Reading the year from a calendar date:

   ```sql
   SELECT EXTRACT('year' FROM CURRENT_DATE);
   ```
3. Define queries calculating the average body weight, average height and average BMI:
   - In groups defined by the athletes' year of birth, selecting only the groups with BMI ≥ 20;
   - In groups defined by the athletes' year of birth, taking only juniors into account, i.e. athletes who are at most 21 by year of birth in the current season.

   Each of the above queries should return 3 aggregates/values.
4. Calculate the Z-SCORE of each athlete's BMI relative to the BMI of the team the athlete belongs to. Interpret the results.
5. Calculate the number of teams with no contracted athlete, i.e. the number of athletes in the team is 0.
6. For each team calculate the total number of athletes, the number of women and the number of men.

   « Hint » Calculating the number of teams in each UCI category:

   ```sql
   SELECT
       COUNT(*) AS team_count,
       COUNT(*) FILTER (WHERE team_uci_category = 'UCI WorldTeams') AS world_team_count,
       COUNT(*) FILTER (WHERE team_uci_category = 'UCI Women''s WorldTeam') AS womens_world_team_count,
       COUNT(*) FILTER (WHERE team_uci_category NOT IN ('UCI WorldTeams', 'UCI Women''s WorldTeam')) AS other_team_count
   FROM cycling.team;
   ```
7. For stage 20 of the Tour de France '24, calculate each athlete's time gap to the stage winner. The stage results are in the `cycling.result` table.

   Time gaps of stage 20 of the Tour de France '24: Tadej Pogačar (0:00); Jonas Vingegaard (+0:07); Richard Carapaz (+0:23); Remco Evenepoel (+0:53); Enric Mas (+1:07); João Almeida (+1:28); Matteo Jorgenson (+1:33); Mikel Landa (+1:41); Adam Yates (+1:43); Romain Bardet (+1:52).
8. The sponsor UAE Team Emirates wants to know whether the team dominated Team Visma in the 2024 season. Define three different metrics to prove or disprove this claim. Define the queries and explain why one metric can be misleading.

## Files

| File           | Description |
| -------------- | ----------- |
| `setup.sql`    | Lecturer's `cycling` schema (Cycling 5.00) |
| `solution.sql` | Query on the `cycling` schema |
