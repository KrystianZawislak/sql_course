# Joins · T2/B/2 — Computer Science grades (all students)

> Course: SQL
> Date: 2026-11-03

[← Joins](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Utwórz zapytanie wybierające informacje o ocenach uzyskanych przez studentów kierunku Informatyka. Wyświetl następujące atrybuty: Nr albumu, Imię, Nazwisko, Nazwę przedmiotu, Nr semestru, Datę zaliczenia oraz Ocenę posortowane alfabetycznie wg Nazwiska.

W wyniku działania zapytania powinni zostać wyświetleni:

- wszyscy studenci, także ci, którzy nie uzyskali podczas przebiegu studiów żadnych ocen np. studenci pierwszego semestru.

### 🇬🇧 Task description (EN)

Create a query selecting information about the grades obtained by Computer Science (Informatyka) students. Display the following attributes: Album number, First name, Last name, Subject name, Semester number, Pass date and Grade, sorted alphabetically by Last name.

The query should display:

- all students, including those who did not receive any grades during their studies, e.g. first-semester students.

## Files

| File           | Description                                                        |
| -------------- | ------------------------------------------------------------------ |
| `solution.sql` | Left outer joins – all students, NULL grades for those without any |
