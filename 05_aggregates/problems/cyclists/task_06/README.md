# Aggregates & Grouping · Problem task — #Cyclists — Task 6: Athletes, women and men per team

> Course: SQL
> Date: 2026-11-06

[← Problem task — #Cyclists](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Zadanie należy zrealizować z wykorzystaniem schematu bazy danych Cycling.

Dla każdego zespołu oblicz łączną liczbę zawodników, liczbę kobiet oraz liczbę mężczyzn.

« Wskazówka » Obliczenie liczby zespołów w poszczególnych kategoriach UCI:

```sql
SELECT
    COUNT(*) AS team_count,
    COUNT(*) FILTER (WHERE team_uci_category = 'UCI WorldTeams') AS world_team_count,
    COUNT(*) FILTER (WHERE team_uci_category = 'UCI Women''s WorldTeam') AS womens_world_team_count,
    COUNT(*) FILTER (WHERE team_uci_category NOT IN ('UCI WorldTeams', 'UCI Women''s WorldTeam')) AS other_team_count
FROM cycling.team;
```

### 🇬🇧 Task description (EN)

The task should be completed using the Cycling database schema.

For each team calculate the total number of athletes, the number of women and the number of men.

« Hint » Calculating the number of teams in each UCI category:

```sql
SELECT
    COUNT(*) AS team_count,
    COUNT(*) FILTER (WHERE team_uci_category = 'UCI WorldTeams') AS world_team_count,
    COUNT(*) FILTER (WHERE team_uci_category = 'UCI Women''s WorldTeam') AS womens_world_team_count,
    COUNT(*) FILTER (WHERE team_uci_category NOT IN ('UCI WorldTeams', 'UCI Women''s WorldTeam')) AS other_team_count
FROM cycling.team;
```

## Files

| File           | Description |
| -------------- | ----------- |
| `solution.sql` | Query on the `cycling` schema |
