# WHERE Clause & Set Operators · Exercise 11 — Discus throw: Olympic final winner

> Course: SQL
> Date: 2026-10-23

[← WHERE Clause & Set Operators](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Dana jest tabela `dyskobol` z wynikami pięciu prób rzutu dyskiem trzech zawodników (kolumny: `numer`, `imie`, `nazwisko`, `proba`, `rezultat`; wartość NULL oznacza rzut spalony).

Przyjmij, że dwie pierwsze próby (1 i 2) są kwalifikacyjne – do finału awansuje 2 zawodników z najlepszym rezultatem uzyskanym w tych próbach. Pozostałe trzy próby (3, 4 i 5) są finałowe.

Biorąc pod uwagę wyłącznie próby finałowe zawodników, którzy awansowali do finału, wyłoń zwycięzcę zgodnie z zasadami olimpijskimi: wygrywa zawodnik, który oddał najdłuższy rzut. Wyświetl imię i nazwisko zwycięzcy, jego najlepszy rezultat oraz numer próby, w której go uzyskał.

### 🇬🇧 Task description (EN)

The `dyskobol` table holds the results of five discus throw attempts by three athletes (columns: `numer`, `imie`, `nazwisko`, `proba`, `rezultat`; NULL means a foul throw).

Assume the first two attempts (1 and 2) are qualifying – the 2 athletes with the best result in these attempts advance to the final. The remaining three attempts (3, 4 and 5) are the final.

Taking into account only the final attempts of the athletes who advanced, determine the winner according to Olympic rules: the athlete with the longest throw wins. Show the winner's first and last name, their best result and the number of the attempt in which they achieved it.

## Files

| File           | Description                                                                     |
| -------------- | ------------------------------------------------------------------------------- |
| `solution.sql` | Picks 2 finalists from attempts 1–2, then the winner of attempts 3–5 (CTEs)     |
