# SQL

Assignments from the *SQL* course, grouped into sections by topic.

## Structure

```
.
├── _template/            # templates for new sections and exercises
├── new_section.sh        # creates the next section folder
├── new_exercise.sh       # creates the next exercise folder in a section
├── 01_basics/
│   ├── README.md         # section title + list of its exercises
│   ├── ex01/
│   │   ├── README.md     # task (PL + EN), files
│   │   └── solution.sql
│   ├── ex02/
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
./new_exercise.sh basics                       # next free number in 01_basics
./new_exercise.sh basics "SELECT everything"   # next number + title
./new_exercise.sh 1 5 "Aliases"                # section 01, exercise 5 + title
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
