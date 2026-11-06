# SQL

Assignments from the *SQL* course, grouped into sections by topic.

The course — lectures, instructions, task descriptions and the lecturer's
database scripts (UCZELNIA, Cycling, VTS, …) — was created by
[Tomasz Potempa](https://scholar.google.com/citations?user=8a0ue44AAAAJ&hl=pl)
(Department of Computer Science, Akademia Tarnowska).
The solutions are my own.

## Structure

```
.
├── _template/            # templates for new sections and exercises
├── new_section.sh        # creates the next section folder
├── new_exercise.sh       # creates the next exercise folder in a section
├── 01_basics/
│   ├── README.md         # section title + list of its exercises
│   ├── t1_a/             # one folder per Moodle task (T1/A -> t1_a, T2/B/1 -> t2_b_1)
│   │   ├── README.md     # task (PL + EN), files
│   │   └── solution.sql
│   ├── t1_b/
│   └── ...
├── 02_where_set_operators/
└── ...
```

## Adding a new section

```bash
./new_section.sh "SQL Basics" basics     # -> 01_basics (slug given explicitly)
./new_section.sh "WHERE"                 # -> 02_where (slug from the title)
```

## Adding a new exercise

```bash
./new_exercise.sh joins T2/B/1 "Title"        # Moodle task ID -> 04_joins/t2_b_1
./new_exercise.sh basics "SELECT everything"   # no ID: next free number (exNN) + title
./new_exercise.sh 1 5 "Aliases"                # section 01, exercise ex05 + title
```

Then paste the task description into the new `README.md` — the Polish original
under **Treść zadania (PL)** and the English version under **Task description (EN)**.
The script also adds the exercise to the section's table (status ⏳, change to ✅ when done).

## Sections

| #   | Section |
| --- | ------- |
| 01 | [SQL Basics](01_basics/) |
| 02 | [WHERE Clause & Set Operators](02_where_set_operators/) |
| 03 | [Data Manipulation (DML)](03_dml/) |
| 04 | [Joins](04_joins/) |
| 05 | [Aggregates & Grouping](05_aggregates/) |
