# Data Definition (DDL) · Problem task — Volleyball — Task 2: Why deferring the checks did not help

> Course: SQL
> Date: 2026-11-22

[← Problem task — Volleyball](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Modyfikacja momentu sprawdzania spełniania przez dane ograniczeń:

```sql
SET CONSTRAINTS ALL DEFERRED;
```

Ponowne uzupełnienie danymi z [`../setup.sql`](../setup.sql).

« Pytania »

- Dlaczego odroczenie momentu sprawdzania spełniania przez dane ograniczeń nie rozwiązało problemu?
- Jakie zmiany należy wprowadzić w ograniczeniach tabel, aby możliwe było odraczanie ograniczeń?

Modyfikacja obiektów:

```sql
ALTER TABLE IF EXISTS volleyball.national_team
	DROP CONSTRAINT IF EXISTS "national_team_captain_national_team_id_fkey";
ALTER TABLE IF EXISTS volleyball.athlete
	DROP CONSTRAINT IF EXISTS "athlete_national_team_id_fkey";

ALTER TABLE volleyball.national_team
	ADD CONSTRAINT "national_team_captain_national_team_id_fkey"
	FOREIGN KEY (captain, national_team_id)
	REFERENCES volleyball.athlete (athlete_id, national_team_id)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
	DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE volleyball.athlete
	ADD CONSTRAINT "athlete_national_team_id_fkey"
	FOREIGN KEY (national_team_id)
	REFERENCES volleyball.national_team
	ON UPDATE CASCADE
	ON DELETE CASCADE
	DEFERRABLE INITIALLY DEFERRED;
```

Ponowne uzupełnienie danymi z [`../setup.sql`](../setup.sql).

### 🇬🇧 Task description (EN)

Changing the moment when the data is checked against the constraints:

```sql
SET CONSTRAINTS ALL DEFERRED;
```

Fill in the data from [`../setup.sql`](../setup.sql) again.

« Questions »

- Why did deferring the moment of checking the constraints not solve the problem?
- What changes have to be made to the table constraints so that the constraints can be deferred?

Modifying the objects: the script above (both foreign keys recreated with `DEFERRABLE INITIALLY DEFERRED`).

Fill in the data from [`../setup.sql`](../setup.sql) again.

## Files

| File           | Description |
| -------------- | ----------- |
| `solution.sql` | Test of `SET CONSTRAINTS ALL DEFERRED` with the data |
| `answer_pl.md` | Answer (Polish) |
| `answer_en.md` | Answer (English) |
