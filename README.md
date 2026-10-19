# SQL

Assignments from the *SQL* course.

## Structure

```
.
├── _template/          # README template for new exercises
├── new_exercise.sh     # script that creates the next exercise folder
├── ex1/
│   ├── README.md       # task (PL + EN), files, how to run
│   └── solution.sql
├── ex2/
└── ...
```

## Adding a new exercise

```bash
./new_exercise.sh                        # next free number, e.g. ex1
./new_exercise.sh "SELECT basics"        # next number + title
./new_exercise.sh 5 "Joins"              # specific number + title
```

Then paste the task description into the new `README.md` — the Polish original
under **Treść zadania (PL)** and the English version under **Task description (EN)**.

## Exercises

| #   | Title | Status |
| --- | ----- | ------ |
