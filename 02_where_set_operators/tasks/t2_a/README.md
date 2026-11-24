# WHERE Clause & Set Operators · T2/A — Addresses not assigned to any student

> Course: SQL
> Date: 2026-11-24

[← WHERE Clause & Set Operators](../../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Utwórz zapytanie wyszukujące wszystkie adresy, które nie są przypisane do żadnego studenta tzn. wartość pola **id_adresu** tabeli **adresy** nie występuje zarówno w polu **adres_zamieszkania** jak i polu **adres_korespondencyjny** tabeli **studenci**.

### 🇬🇧 Task description (EN)

Write a query that finds all addresses that are not assigned to any student, i.e. the value of the **id_adresu** field of the **adresy** (addresses) table appears neither in the **adres_zamieszkania** (home address) field nor in the **adres_korespondencyjny** (correspondence address) field of the **studenci** (students) table.

## Files

| File           | Description |
| -------------- | ----------- |
| `solution.sql` | Address IDs not used by any student (`EXCEPT` + `UNION`) |
