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
├── _template/                # templates for new sections and tasks
├── new_section.sh            # creates the next section folder
├── new_exercise.sh           # creates the next task folder in a section
├── 01_basics/
│   ├── README.md             # section title + tables: tasks, problem tasks, extra
│   ├── tasks/                # lecturer's tasks, one folder per task ID (T1/A -> t1_a, T2/B/1 -> t2_b_1)
│   │   ├── t1_a/
│   │   │   ├── README.md     # task (PL + EN), files
│   │   │   └── solution.sql
│   │   └── ...
│   ├── problems/             # lecturer's problem tasks (#Cyclists, #VehicleTrackingSystem, ...)
│   │   └── cyclists/
│   │       ├── README.md     # common intro + list of tasks
│   │       ├── setup.sql     # shared data script
│   │       ├── task_01/      # one folder per task: README.md + solution.sql
│   │       └── ...
│   └── extra/                # self-made practice, not from the course
│       └── practice/
│           ├── ex_01/
│           └── ...
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
./new_exercise.sh joins T2/B/1 "Title"        # task ID -> 04_joins/tasks/t2_b_1
```

Then paste the task description into the new `README.md` — the Polish original
under **Treść zadania (PL)** and the English version under **Task description (EN)**.
The script also adds the task to the section's **Tasks** table (status ⏳, change to ✅ when done).
Problem tasks (`problems/`) and extra practice (`extra/`) are created by hand: one folder per set
with a shared `README.md` and `setup.sql`, and one numbered subfolder per task.

## Sections

| #   | Section |
| --- | ------- |
| 01 | [SQL Basics](01_basics/) |
| 02 | [WHERE Clause & Set Operators](02_where_set_operators/) |
| 03 | [Data Manipulation (DML)](03_dml/) |
| 04 | [Joins](04_joins/) |
| 05 | [Aggregates & Grouping](05_aggregates/) |
| 06 | [Subqueries](06_subqueries/) |
