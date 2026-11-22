# Data Definition (DDL) · Problem task — Volleyball — Task 3: Matches, line-ups and statistics

> Course: SQL
> Date: 2026-11-20

[← Problem task — Volleyball](../README.md)

## Task

### 🇵🇱 Treść zadania (PL)

Zmodyfikuj utworzony oraz uzupełniony danymi schemat wg n/w wymagań:

Zdefiniuj tabelę/tabele umożliwiające:

1. Zapis oraz kontrolę informacji o wynikach meczów pomiędzy reprezentacjami, w tym:
   - informacji o reprezentacjach rywalizujących w meczu;
   - liczbie zdobytych setów przez każdą z reprezentacji;
   - liczbę małych punktów uzyskanych łącznie we wszystkich setach przez każdą z reprezentacji;
   - kontrolę poprawności wyniku meczu (3:0, 3:1, 3:2, 0:3, 1:2, 2:3);
   - kontrolę czy reprezentacja nie rozgrywa meczu sama ze sobą;
   - kontrolę występowania powtórzeń meczów pomiędzy dwoma reprezentacjami.
2. Zapis oraz kontrolę informacji o składzie każdej reprezentacji na parkiecie, w tym:
   - informacji o zawodniku oraz pozycji na jakiej gra;
   - kontrolę poprawności składu na parkiecie (Rysunek 1. Schemat ustawienia drużyny wg pozycji).
3. Zapis oraz kontrolę informacji o statystykach zawodników oraz reprezentacji w meczu oraz setach, w tym:
   - liczbę małych punktów uzyskanych w każdym secie przez każdą z reprezentacji;
   - liczbie zdobytych punktów przez zawodnika w każdym secie z rozróżnieniem punktów zdobytych zagrywką, w ataku oraz w obronie (Rysunek 2. Raport meczowy).

W ramach testów, uzupełnij utworzone tabele danymi.

### 🇬🇧 Task description (EN)

Modify the created and data-filled schema according to the requirements below:

Define the table(s) that make it possible to:

1. Store and check information about the results of matches between national teams, including:
   - the national teams competing in the match;
   - the number of sets won by each team;
   - the number of points scored in total in all sets by each team;
   - checking that the match result is valid (3:0, 3:1, 3:2, 0:3, 1:2, 2:3);
   - checking that a team does not play a match against itself;
   - checking for repeated matches between the same two teams.
2. Store and check information about each team's line-up on the court, including:
   - the athlete and the position they play;
   - checking that the line-up on the court is valid (Figure 1. Team positions on the court).
3. Store and check statistics of athletes and teams in a match and in sets, including:
   - the points scored in each set by each team;
   - the points scored by an athlete in each set, split into points from serve, attack and block (Figure 2. Match report).

As a test, fill the created tables with data.

## Files

| File           | Description |
| -------------- | ----------- |
| `solution.sql` | New tables with their constraints, plus test data |
