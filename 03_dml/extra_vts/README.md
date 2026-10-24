# Data Manipulation (DML) · Extra — Problem task #VehicleTrackingSystem

> Course: SQL
> Date: 2026-10-23

[← Data Manipulation (DML)](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

ZADANIE PROBLEMOWE #VehicleTrackingSystem

Tworzenie obiektów, uzupełnienie tabel danymi i wyświetlenie danych tabel – zob. [`setup.sql`](setup.sql).

**Wymagania:**

- Jeżeli pojazd się przemieszcza, zbierane są wszystkie napływające dane o lokalizacji, z częstością np. co sekundę albo częściej.
- Jeżeli pojazd się nie przemieszcza, dane o lokalizacji są zbierane co 1 minutę.
- Pojazd się nie przemieszcza, jeżeli nie opuścił okręgo o średnicy 10 m.

**Przypadki testowe:**

```sql
-- Pojazd się przemieszcza tj. lokalizacja się zmienia 
INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.061422, 19.958244, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.061488, 19.958277, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.0614520, 19.959231, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

-- Pojazd się zatrzymuje i nie przemieszcza tj. lokalizacja przestaje się zmieniać
INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.0614520, 19.959231, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.0614520, 19.959231, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.0614520, 19.959231, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED
```

### 🇬🇧 Task description (EN)

PROBLEM TASK #VehicleTrackingSystem

Creating the objects, filling the tables with data and displaying the table data – see [`setup.sql`](setup.sql).

**Requirements:**

- If the vehicle is moving, all incoming location data is collected, at a rate of e.g. once per second or more often.
- If the vehicle is not moving, location data is collected once per minute.
- The vehicle is not moving if it has not left a circle with a diameter of 10 m.

**Test cases:**

```sql
-- The vehicle is moving, i.e. the location changes
INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.061422, 19.958244, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.061488, 19.958277, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.0614520, 19.959231, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

-- The vehicle stops and does not move, i.e. the location stops changing
INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.0614520, 19.959231, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.0614520, 19.959231, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED

INSERT INTO vts.location
VALUES (DEFAULT, 1, 50.0614520, 19.959231, CURRENT_TIMESTAMP)
-- ... TO BE IMPLEMENTED
```

## Files

| File           | Description                                                              |
| -------------- | ------------------------------------------------------------------------ |
| `setup.sql`    | Lecturer's script: `vts` schema, `vehicle` and `location` tables, data   |
| `solution.sql` | Inserting locations according to the requirements                        |
